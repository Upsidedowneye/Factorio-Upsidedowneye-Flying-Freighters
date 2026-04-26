return function(env)
  local _ENV = env

  function normalize_freighter_route_signal_key(value)
    return normalize_route_signal_key_or_nil(value)
  end

  function clamp_freighter_departure_load_percent(value)
    local numeric_value = math.floor(tonumber(value) or 100)
    if numeric_value < 1 then
      return 1
    end
    if numeric_value > 100 then
      return 100
    end
    return numeric_value
  end

  function normalize_freighter_schedule_operation(value)
    if value == "load" or value == "unload" or value == "transfer" then
      return value
    end
    return nil
  end

  function freighter_schedule_entry_operation(entry)
    if type(entry) ~= "table" then
      return "load"
    end
    local operation = normalize_freighter_schedule_operation(rawget(entry, "operation") or rawget(entry, "leg_operation"))
    if operation == "load" or operation == "unload" then
      return operation
    end
    if rawget(entry, "to_signal_key") ~= nil or rawget(entry, "to_signal") ~= nil or rawget(entry, "to_name") ~= nil then
      return "unload"
    end
    return "load"
  end

  function freighter_schedule_operation_caption(entry)
    local operation = freighter_schedule_entry_operation(entry)
    if operation == "load" then
      return "Load"
    end
    if operation == "unload" then
      return "Unload"
    end
    return "Load"
  end

  function freighter_schedule_entry_stop_signal_key(entry)
    local operation = freighter_schedule_entry_operation(entry)
    if operation == "unload" then
      return entry and entry.to_signal_key or nil
    end
    return entry and entry.from_signal_key or nil
  end

  function set_freighter_schedule_entry_stop_signal_key(entry, value)
    if type(entry) ~= "table" then
      return
    end

    local normalized_value = normalize_freighter_route_signal_key(value)
    if freighter_schedule_entry_operation(entry) == "unload" then
      entry.from_signal_key = nil
      entry.to_signal_key = normalized_value
      return
    end

    entry.from_signal_key = normalized_value
    entry.to_signal_key = nil
  end

  function freighter_schedule_entry_departure_load_percent(entry)
    if type(entry) ~= "table" then
      return 100
    end
    return clamp_freighter_departure_load_percent(rawget(entry, "departure_min_load_percent"))
  end

  function freighter_schedule_entry_allows_fuel_interrupt(entry)
    return type(entry) ~= "table" or rawget(entry, "allow_fuel_interrupt") ~= false
  end

  function freighter_schedule_entry_allows_ammo_interrupt(entry)
    return type(entry) ~= "table" or rawget(entry, "allow_ammo_interrupt") ~= false
  end

  function freighter_schedule_entry_allows_trash_interrupt(entry)
    return type(entry) ~= "table" or rawget(entry, "allow_trash_interrupt") ~= false
  end

  function freighter_minimum_departure_amount(capacity, entry)
    if (capacity or 0) <= 0 then
      return 0
    end

    local percent = freighter_schedule_entry_departure_load_percent(entry)
    return math.max(1, math.min(capacity, math.ceil(capacity * percent / 100)))
  end

  function freighter_schedule_entry_departure_requirement_text(entry)
    local percent = freighter_schedule_entry_departure_load_percent(entry)
    if percent >= 100 then
      return "full load"
    end
    if percent <= 1 then
      return "any load"
    end
    return tostring(percent) .. "% load"
  end

  function freighter_schedule_entry_interrupt_summary_text(entry)
    local disabled = {}
    if not freighter_schedule_entry_allows_fuel_interrupt(entry) then
      disabled[#disabled + 1] = "fuel"
    end
    if not freighter_schedule_entry_allows_ammo_interrupt(entry) then
      disabled[#disabled + 1] = "ammo"
    end
    if not freighter_schedule_entry_allows_trash_interrupt(entry) then
      disabled[#disabled + 1] = "trash"
    end
    if #disabled == 0 then
      return nil
    end
    return "no " .. table.concat(disabled, "/") .. " interrupts"
  end

  function freighter_schedule_entry_route_summary_text(entry)
    local operation = freighter_schedule_entry_operation(entry)
    if operation == "load" then
      return {"", route_signal_display_text(freighter_schedule_entry_stop_signal_key(entry)), " -> cargo"}
    end
    return {"", "cargo -> ", route_signal_display_text(freighter_schedule_entry_stop_signal_key(entry))}
  end

  function active_freighter_schedule_entry(rec)
    if not rec then
      return normalize_freighter_schedule_entry({})
    end

    sync_freighter_route_signal_fields(rec)
    return freighter_schedule_entry_at(rec.schedule, rec.schedule_current_index) or normalize_freighter_schedule_entry({})
  end

  function normalize_freighter_schedule_entry(entry)
    if type(entry) ~= "table" then
      return nil
    end

    local from_signal_key = normalize_freighter_route_signal_key(
      rawget(entry, "from_signal_key") or rawget(entry, "from_signal") or rawget(entry, "from_name") or rawget(entry, "stop_signal_key") or rawget(entry, "stop_signal")
    )
    local to_signal_key = normalize_freighter_route_signal_key(
      rawget(entry, "to_signal_key") or rawget(entry, "to_signal") or rawget(entry, "to_name") or rawget(entry, "stop_signal_key") or rawget(entry, "stop_signal")
    )
    local operation = normalize_freighter_schedule_operation(rawget(entry, "operation") or rawget(entry, "leg_operation"))

    if operation == "load" then
      from_signal_key = from_signal_key or to_signal_key
      to_signal_key = nil
    elseif operation == "unload" then
      to_signal_key = to_signal_key or from_signal_key
      from_signal_key = nil
    elseif operation ~= "transfer" then
      if from_signal_key and not to_signal_key then
        operation = "load"
      elseif to_signal_key and not from_signal_key then
        operation = "unload"
      elseif from_signal_key and to_signal_key then
        operation = "transfer"
      else
        operation = "load"
        to_signal_key = nil
      end
    end

    return {
      operation = operation,
      from_signal_key = from_signal_key,
      to_signal_key = to_signal_key,
      departure_min_load_percent = clamp_freighter_departure_load_percent(
        rawget(entry, "departure_min_load_percent") or rawget(entry, "min_load_percent") or rawget(entry, "departure_threshold_percent")
      ),
      allow_fuel_interrupt = rawget(entry, "allow_fuel_interrupt") ~= false,
      allow_ammo_interrupt = rawget(entry, "allow_ammo_interrupt") ~= false,
      allow_trash_interrupt = rawget(entry, "allow_trash_interrupt") ~= false,
    }
  end

  function append_normalized_schedule_entry(copy, operation, stop_signal_key, normalized)
    copy[#copy + 1] = {
      operation = operation,
      from_signal_key = operation == "load" and stop_signal_key or nil,
      to_signal_key = operation == "unload" and stop_signal_key or nil,
      departure_min_load_percent = normalized.departure_min_load_percent,
      allow_fuel_interrupt = normalized.allow_fuel_interrupt,
      allow_ammo_interrupt = normalized.allow_ammo_interrupt,
      allow_trash_interrupt = normalized.allow_trash_interrupt,
    }
  end

  function copy_freighter_schedule_entries(schedule)
    local copy = {}
    for _, entry in ipairs(schedule or {}) do
      local normalized = normalize_freighter_schedule_entry(entry)
      if normalized then
        if normalized.operation == "transfer" then
          if normalized.from_signal_key then
            append_normalized_schedule_entry(copy, "load", normalized.from_signal_key, normalized)
          end
          if normalized.to_signal_key then
            append_normalized_schedule_entry(copy, "unload", normalized.to_signal_key, normalized)
          end
        else
          append_normalized_schedule_entry(copy, normalized.operation, freighter_schedule_entry_stop_signal_key(normalized), normalized)
        end
      end
    end

    if #copy == 0 then
      copy[1] = {
        operation = "load",
        from_signal_key = nil,
        to_signal_key = nil,
        departure_min_load_percent = 100,
        allow_fuel_interrupt = true,
        allow_ammo_interrupt = true,
        allow_trash_interrupt = true,
      }
    end

    return copy
  end

  function clamp_freighter_schedule_index(index, schedule)
    local count = type(schedule) == "table" and #schedule or 0
    if count <= 0 then
      return 1
    end

    local numeric_index = math.floor(tonumber(index) or 1)
    if numeric_index < 1 then
      return 1
    end
    if numeric_index > count then
      return count
    end
    return numeric_index
  end

  function freighter_schedule_entry_at(schedule, index)
    if type(schedule) ~= "table" or #schedule == 0 then
      return nil
    end
    return schedule[clamp_freighter_schedule_index(index, schedule)]
  end

  function freighter_schedule_entries(rec)
    if not rec then
      return copy_freighter_schedule_entries(nil)
    end

    sync_freighter_route_signal_fields(rec)
    return rec.schedule
  end

  function freighter_schedule_list_items(schedule)
    local items = {}
    for index, entry in ipairs(copy_freighter_schedule_entries(schedule)) do
      local suffix = " [" .. freighter_schedule_entry_departure_requirement_text(entry)
      local interrupt_summary = freighter_schedule_entry_interrupt_summary_text(entry)
      if interrupt_summary then
        suffix = suffix .. ", " .. interrupt_summary
      end
      suffix = suffix .. "]"
      items[#items + 1] = {
        "",
        tostring(index),
        ". ",
        freighter_schedule_operation_caption(entry),
        ": ",
        freighter_schedule_entry_route_summary_text(entry),
        suffix,
      }
    end
    return items
  end

  function freighter_schedule_summary_label(schedule)
    local normalized_schedule = copy_freighter_schedule_entries(schedule)
    local first_entry = normalized_schedule[1] or {operation = "load", stop_signal_key = nil}
    if #normalized_schedule <= 1 then
      return {"", freighter_schedule_operation_caption(first_entry), ": ", freighter_schedule_entry_route_summary_text(first_entry)}
    end

    return {
      "",
      freighter_schedule_operation_caption(first_entry),
      ": ",
      freighter_schedule_entry_route_summary_text(first_entry),
      " (+",
      tostring(#normalized_schedule - 1),
      " more)",
    }
  end

  function freighter_schedule_row_index_from_name(name, prefix)
    if type(name) ~= "string" or type(prefix) ~= "string" or name:sub(1, #prefix) ~= prefix then
      return nil
    end

    local index = tonumber(name:sub(#prefix + 1))
    if not index or index < 1 then
      return nil
    end

    return math.floor(index)
  end

  function ensure_freighter_schedule_drag_state_store()
    ensure_state()
    global.ff.player_schedule_drag = global.ff.player_schedule_drag or {}
    return global.ff.player_schedule_drag
  end

  function freighter_schedule_drag_state(player_index)
    local store = global and global.ff and global.ff.player_schedule_drag or nil
    return store and store[player_index] or nil
  end

  function clear_freighter_schedule_drag_state(player_index)
    local store = global and global.ff and global.ff.player_schedule_drag or nil
    if store then
      store[player_index] = nil
    end
  end

  function set_freighter_schedule_drag_state(player_index, source_index, hover_index)
    if not source_index then
      clear_freighter_schedule_drag_state(player_index)
      return nil
    end

    local store = ensure_freighter_schedule_drag_state_store()
    store[player_index] = {
      source_index = math.max(1, math.floor(tonumber(source_index) or 1)),
      hover_index = hover_index and math.max(1, math.floor(tonumber(hover_index) or 1)) or nil,
    }
    return store[player_index]
  end

  function normalize_freighter_schedule_drag_state(player_index, schedule)
    local drag_state = freighter_schedule_drag_state(player_index)
    if not drag_state then
      return nil
    end

    local schedule_count = type(schedule) == "table" and #schedule or 0
    if schedule_count <= 0 or not drag_state.source_index or drag_state.source_index > schedule_count then
      clear_freighter_schedule_drag_state(player_index)
      return nil
    end

    if drag_state.hover_index and drag_state.hover_index > schedule_count then
      drag_state.hover_index = nil
    end

    return drag_state
  end

  function move_freighter_schedule_entry(edit, source_index, target_index)
    if not edit or type(edit.schedule) ~= "table" or #edit.schedule <= 0 then
      return false
    end

    local schedule_count = #edit.schedule
    local normalized_source = clamp_freighter_schedule_index(source_index, edit.schedule)
    local normalized_target = clamp_freighter_schedule_index(target_index, edit.schedule)
    if normalized_source == normalized_target then
      edit.selected_schedule_index = normalized_target
      return false
    end

    local moved_entry = table.remove(edit.schedule, normalized_source)
    if not moved_entry then
      return false
    end

    local insert_index = normalized_target
    if normalized_target > normalized_source then
      insert_index = normalized_target - 1
    end
    if insert_index < 1 then
      insert_index = 1
    end
    if insert_index > schedule_count then
      insert_index = schedule_count
    end

    table.insert(edit.schedule, insert_index, moved_entry)
    edit.selected_schedule_index = insert_index
    return true
  end

  function freighter_schedule_drag_status_caption(schedule, drag_state)
    if not drag_state or not drag_state.source_index then
      return ""
    end

    local source_entry = freighter_schedule_entry_at(schedule, drag_state.source_index)
    if not source_entry then
      return ""
    end

    if drag_state.hover_index and drag_state.hover_index ~= drag_state.source_index then
      local hover_entry = freighter_schedule_entry_at(schedule, drag_state.hover_index)
      if hover_entry then
        return {
          "ff.gui_schedule_drag_status_hover",
          tostring(drag_state.source_index),
          tostring(drag_state.hover_index),
        }
      end
    end

    return {"ff.gui_schedule_drag_status", tostring(drag_state.source_index)}
  end

  function rebuild_freighter_schedule_rows(root, player_index, edit)
    local rows = find_child_recursive(root, GUI_SCHEDULE_ROWS)
    if not rows or not rows.valid then
      return false
    end

    rows.clear()
    local drag_state = normalize_freighter_schedule_drag_state(player_index, edit and edit.schedule or nil)
    local items = freighter_schedule_list_items(edit and edit.schedule or nil)
    for index, item_caption in ipairs(items) do
      -- Factorio only allows true drag targets for top-level screen frames, so the
      -- schedule uses a vanilla-ish grab-handle flow: click a handle to arm the
      -- move, hover another row to preview it, then click that row to drop there.
      local row = rows.add{type = "flow", direction = "horizontal"}
      row.style.horizontal_spacing = 8
      row.style.horizontally_stretchable = true

      local handle_caption = "≡"
      if drag_state and drag_state.source_index == index then
        handle_caption = "✕"
      end
      row.add{
        type = "button",
        name = GUI_SCHEDULE_DRAG_PREFIX .. index,
        caption = handle_caption,
        style = "train_schedule_action_button",
        tooltip = {"ff.gui_schedule_drag_tooltip"},
      }

      local row_prefix = ""
      if drag_state and drag_state.source_index == index then
        row_prefix = "↕ "
      elseif drag_state and drag_state.hover_index == index then
        row_prefix = "→ "
      elseif edit.selected_schedule_index == index then
        row_prefix = "• "
      end

      local row_button = row.add{
        type = "button",
        name = GUI_SCHEDULE_SELECT_PREFIX .. index,
        caption = {"", row_prefix, item_caption},
      }
      row_button.style.horizontally_stretchable = true
      row_button.style.horizontal_align = "left"
    end

    return true
  end

  function sync_freighter_route_signal_fields(rec)
    if not rec then
      return nil
    end

    local raw_from = rawget(rec, "from_signal_key")
    if raw_from == nil then
      raw_from = rawget(rec, "from_name")
    end
    local raw_to = rawget(rec, "to_signal_key")
    if raw_to == nil then
      raw_to = rawget(rec, "to_name")
    end

    rec.from_signal_key = normalize_freighter_route_signal_key(raw_from)
    rec.to_signal_key = normalize_freighter_route_signal_key(raw_to)

    local pending_from_signal_key = rawget(rec, "pending_from_signal_key")
    if pending_from_signal_key == nil then
      pending_from_signal_key = rawget(rec, "pending_from_name")
    end
    local pending_to_signal_key = rawget(rec, "pending_to_signal_key")
    if pending_to_signal_key == nil then
      pending_to_signal_key = rawget(rec, "pending_to_name")
    end

    local schedule = {}
    for _, entry in ipairs(rawget(rec, "schedule") or {}) do
      local normalized = normalize_freighter_schedule_entry(entry)
      if normalized then
        schedule[#schedule + 1] = normalized
      end
    end
    if #schedule == 0 then
      schedule[1] = {
        operation = (rec.to_signal_key and not rec.from_signal_key) and "unload" or ((rec.from_signal_key and rec.to_signal_key) and "transfer" or "load"),
        from_signal_key = rec.from_signal_key,
        to_signal_key = rec.to_signal_key,
      }
    end
    rec.schedule = copy_freighter_schedule_entries(schedule)
    rec.schedule_current_index = clamp_freighter_schedule_index(rawget(rec, "schedule_current_index"), rec.schedule)

    local pending_schedule = {}
    for _, entry in ipairs(rawget(rec, "pending_schedule") or {}) do
      local normalized = normalize_freighter_schedule_entry(entry)
      if normalized then
        pending_schedule[#pending_schedule + 1] = normalized
      end
    end
    if #pending_schedule == 0 and (pending_from_signal_key ~= nil or pending_to_signal_key ~= nil) then
      pending_schedule[1] = {
        operation = (pending_to_signal_key and not pending_from_signal_key) and "unload" or ((pending_from_signal_key and pending_to_signal_key) and "transfer" or "load"),
        from_signal_key = pending_from_signal_key,
        to_signal_key = pending_to_signal_key,
      }
    end

    if #pending_schedule > 0 then
      rec.pending_schedule = copy_freighter_schedule_entries(pending_schedule)
      rec.pending_schedule_current_index = clamp_freighter_schedule_index(rawget(rec, "pending_schedule_current_index"), rec.pending_schedule)
      local pending_entry = freighter_schedule_entry_at(rec.pending_schedule, rec.pending_schedule_current_index) or {}
      rec.pending_from_signal_key = pending_entry.from_signal_key
      rec.pending_to_signal_key = pending_entry.to_signal_key
    else
      rec.pending_schedule = nil
      rec.pending_schedule_current_index = nil
      rec.pending_from_signal_key = nil
      rec.pending_to_signal_key = nil
    end

    local active_entry = freighter_schedule_entry_at(rec.schedule, rec.schedule_current_index) or {}
    rec.from_signal_key = active_entry.from_signal_key
    rec.to_signal_key = active_entry.to_signal_key

    rec.from_name = nil
    rec.to_name = nil
    rec.pending_from_name = nil
    rec.pending_to_name = nil
    return rec
  end
end
