-- These Tips and Tricks pages teach the mod's core workflow directly inside
-- Factorio's built-in onboarding UI. Keeping them in data stage avoids any
-- runtime bookkeeping and lets the pages unlock from the same technologies
-- that already gate the feature itself.

local flying_freighter_tips = {
  {
    type = "tips-and-tricks-item-category",
    name = "flying-freighters",
    order = "z-[flying-freighters]",
    localised_name = {"technology-name.flying-freighters"},
  },
  {
    type = "tips-and-tricks-item",
    name = "flying-freighters-briefing",
    category = "flying-freighters",
    order = "a-a",
    tag = "[technology=flying-freighters]",
    trigger = {
      type = "research",
      technology = "flying-freighters",
    },
  },
  {
    type = "tips-and-tricks-item",
    name = "flying-freighter-station-setup",
    category = "flying-freighters",
    order = "a-b",
    indent = 1,
    tag = "[entity=flying-freighter-station]",
    trigger = {
      type = "research",
      technology = "flying-freighters",
    },
  },
  {
    type = "tips-and-tricks-item",
    name = "flying-freighter-route-planning",
    category = "flying-freighters",
    order = "a-c",
    indent = 1,
    tag = "[item=flying-freighter]",
    trigger = {
      type = "research",
      technology = "flying-freighters",
    },
  },
  {
    type = "tips-and-tricks-item",
    name = "flying-freighter-passive-provider-stations",
    category = "flying-freighters",
    order = "b-a",
    tag = "[entity=flying-freighter-passive-provider-station]",
    trigger = {
      type = "research",
      technology = "flying-freighter-passive-provider-stations",
    },
  },
}

data:extend(flying_freighter_tips)