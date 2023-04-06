Lib = {}

Lib.keymapper = function(mode, opts)
  return function(lhs, rhs, desc)
    if desc ~= '' then
      opts['desc'] = desc
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
