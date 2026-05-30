local uv, fs, fn = vim.loop, vim.fs, vim.fn
local M = {}
M._last = nil

function M.select_debug_dll(opts)
	opts = opts or {}
	local root = opts.start_dir or uv.cwd()
	local depth = opts.depth or 6

	local progs = fs.find("Program.cs", { path = root, type = "file", depth = depth, limit = math.huge })
	local seen, items = {}, {}

	for _, prog in ipairs(progs) do
		local dir = fs.dirname(prog)
		if not seen[dir] then
			seen[dir] = true
			local csproj = fs.find(function(n)
				return n:lower():sub(-7) == ".csproj"
			end, { path = dir, type = "file", depth = 1, limit = 1 })[1]
			if csproj then
				local name = fs.basename(csproj):gsub("%.csproj$", "")
				local dlls = fn.globpath(dir .. "/bin/Debug", "**/" .. name .. ".dll", false, true) or {}
				for _, dll in ipairs(dlls) do
					table.insert(items, dll)
				end
			end
		end
	end

	if #items == 1 then
		M._last = items[1]
		return items[1]
	elseif #items > 1 then
		return coroutine.create(function(co)
			vim.ui.select(items, { prompt = "Select Debug DLL" }, function(choice)
				if choice then
					M._last = choice
				end
				coroutine.resume(co, choice)
			end)
		end)
	else
		local manual = fn.input("Path to Debug dll: ", fn.getcwd() .. "/bin/Debug/", "file")
		M._last = (manual ~= "" and manual) or nil
		return manual
	end
end

function M.last_project_dir()
	if not M._last or M._last == "" then
		return vim.fn.getcwd()
	end
	local dir = M._last:match("^(.*)[/\\]bin[/\\].*$")
	return dir or vim.fn.getcwd()
end

return M
