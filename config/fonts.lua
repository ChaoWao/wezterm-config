local wezterm = require('wezterm')
local platform = require('utils.platform')

-- JetBrainsMono NF has no CJK glyphs, so Chinese falls back to Maple Mono CN
-- (also what fontconfig resolves `monospace` to). Both are upm=1000 with
-- 'M'=0.6 and 中=1.2, so CJK occupies exactly two cells.
local font_family = 'JetBrainsMono Nerd Font'
local cjk_family = 'Maple Mono CN'
local font_size = 14

---@type Config
return {
   font = wezterm.font_with_fallback({
      { family = font_family, weight = 'Medium' },
      { family = cjk_family },
   }),
   font_size = font_size,

   --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
   freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
   freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
