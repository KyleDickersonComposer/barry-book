local M = {
	cache = {},
}

local function absolute_path(path)
	if path:sub(1, 1) == "/" then
		return path
	end

	if lfs and lfs.currentdir then
		return lfs.currentdir() .. "/" .. path
	end

	return path
end

local function module_path(name)
	return absolute_path(kpse.find_file("source/lua/" .. name .. ".lua") or ("source/lua/" .. name .. ".lua"))
end

function M.require(name)
	if not M.cache[name] then
		M.cache[name] = dofile(module_path(name))
	end

	return M.cache[name]
end

function M.call(module_name, function_name, ...)
	return M.require(module_name)[function_name](...)
end

return M
