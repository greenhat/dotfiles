function _G.P(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  print(unpack(objects))
  return ...
end

function _G.reload(module)
  require'plenary.reload'.reload_module(module)
  require(module)
end
