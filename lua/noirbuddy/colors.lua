local Color = require('colorbuddy').Color

local M = {}

function M.setup(opts)
  local defaultPreset = require('noirbuddy.presets.default')
  local userPreset = require('noirbuddy.presets.' .. (opts.preset or 'default'))

  local getConfiguredColor = function(color)
    return opts[color] or userPreset[color] or defaultPreset[color]
  end

  -- Set up primary and secondary flavor colors
  -- Can be configured by preset or end user
  Color.new('primary', getConfiguredColor('primary'))
  Color.new('secondary', getConfiguredColor('secondary'))

  -- Set up semantic color palette
  -- These are to be used sparingly, but have semantic meaning for things like lsp diagnostics, git diffs, etc.
  -- Can be configured by preset or end user
  Color.new('diagnostic_error', getConfiguredColor('diagnostic_error'))
  Color.new('diagnostic_warning', getConfiguredColor('diagnostic_warning'))
  Color.new('diagnostic_info', getConfiguredColor('diagnostic_info'))
  Color.new('diagnostic_hint', getConfiguredColor('diagnostic_hint'))
  Color.new('diff_add', getConfiguredColor('diff_add'))
  Color.new('diff_change', getConfiguredColor('diff_change'))
  Color.new('diff_delete', getConfiguredColor('diff_delete'))

  -- Set up grayscale palette
  -- The rest of the theme is based on this grayscale palette, hence the name 'noir' buddy
  Color.new('black', '#121212')
  Color.new('gray_11', '#787878')
  Color.new('gray_10', '#b0b0b0')
  Color.new('gray_9', '#212121')
  Color.new('gray_8', '#323232')
  Color.new('gray_7', '#535353')
  Color.new('gray_6', '#737373')
  Color.new('gray_5', '#949494')
  Color.new('gray_4', '#a7a7a7')
  Color.new('gray_3', '#b4b4b4')
  Color.new('gray_2', '#d5d5d5')
  Color.new('gray_1', '#f5f5f5')
  Color.new('white', '#ffffff')
end

return M