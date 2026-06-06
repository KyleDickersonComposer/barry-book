local M = {}

local function trim(s)
	return (s or ""):match("^%s*(.-)%s*$")
end

local function unbrace(s)
	s = trim(s)
	if s:sub(1, 1) == "{" and s:sub(-1) == "}" then
		return trim(s:sub(2, -2))
	end
	return s
end

local function split_top_level(s, sep)
	local out = {}
	local depth = 0
	local start = 1
	sep = sep or ","

	for i = 1, #s do
		local ch = s:sub(i, i)
		if ch == "{" then
			depth = depth + 1
		elseif ch == "}" and depth > 0 then
			depth = depth - 1
		elseif ch == sep and depth == 0 then
			out[#out + 1] = s:sub(start, i - 1)
			start = i + 1
		end
	end

	out[#out + 1] = s:sub(start)
	return out
end

local function package_error(summary, help)
	tex.sprint("\\PackageError{musicchord}{" .. summary .. "}{" .. help .. "}")
end

local function parse_keyvals(input)
	local opts = {}

	for _, item in ipairs(split_top_level(input, ",")) do
		item = trim(item)
		if item ~= "" then
			local key, value = item:match("^([%a]+)%s*=%s*(.-)%s*$")
			if not key then
				package_error("malformed keyval item `" .. item .. "`", "Expected key=value, e.g. root=C, quality=dom.")
			else
				opts[key] = unbrace(value)
			end
		end
	end

	if opts.slash and not opts.bass then
		opts.bass = opts.slash
	end
	if opts.slashacc and not opts.bassacc then
		opts.bassacc = opts.slashacc
	end

	return opts
end

local function accidental(kind)
	if kind == nil or kind == "" then
		return ""
	elseif kind == "flat" then
		return "\\musicchordLetterAcc{\\flat}"
	elseif kind == "sharp" then
		return "\\musicchordLetterAcc{\\sharp}"
	end

	package_error("unknown accidental `" .. tostring(kind) .. "`", "Allowed accidentals are flat and sharp.")
	return ""
end

local function quality(opts)
	local q = opts.quality
	local seven = opts.seven

	if not q or q == "" then
		package_error("missing quality", "Set quality=maj|min|dom|aug.")
		return ""
	elseif q == "dom" then
		return (seven and seven ~= "") and seven or "7"
	elseif q == "maj" then
		return (seven and seven ~= "") and ("maj\\textsuperscript{" .. seven .. "}") or ""
	elseif q == "min" then
		return "min" .. ((seven and seven ~= "") and ("\\textsuperscript{" .. seven .. "}") or "")
	elseif q == "aug" then
		return "aug" .. ((seven and seven ~= "") and ("\\textsuperscript{" .. seven .. "}") or "")
	elseif q == "maj6" then
		return "6"
	elseif q == "dim" then
		return "dim7"
	elseif q == "min6" then
		return "min6"
	end

	package_error("unknown quality `" .. tostring(q) .. "`", "Allowed qualities are maj, min, dom, and aug.")
	return ""
end

local function alt_piece(degree, kind)
	degree = trim(degree)
	kind = trim(kind)

	if degree == "" then
		package_error("malformed alts item", "Each alts item must be degree/kind, e.g. 9/flat or 11/sharp.")
		return ""
	end

	if kind ~= "flat" and kind ~= "sharp" then
		package_error("unknown alts kind `" .. kind .. "`", "Each alts kind must be flat or sharp.")
		return ""
	end

	return accidental(kind) .. "\\mathrm{" .. degree .. "}"
end

local function alts(value)
	value = trim(value)
	if value == "" then
		return ""
	end

	local parsed = {}
	for _, item in ipairs(split_top_level(value, ",")) do
		item = trim(item)
		if item ~= "" then
			local degree, kind = item:match("^(.-)%s*/%s*(.-)$")
			if not degree or not kind then
				package_error(
					"malformed alts item `" .. item .. "`",
					"Each alts item must be degree/kind, e.g. 9/flat or 11/sharp."
				)
			else
				parsed[#parsed + 1] = {
					degree = trim(degree),
					kind = trim(kind),
					number = tonumber(trim(degree)) or 0,
				}
			end
		end
	end

	table.sort(parsed, function(a, b)
		return a.number > b.number
	end)

	local pieces = {}
	for _, alt in ipairs(parsed) do
		pieces[#pieces + 1] = alt_piece(alt.degree, alt.kind)
	end

	if #pieces == 0 then
		return ""
	end

	return "\\textsuperscript{\\ensuremath{(" .. table.concat(pieces, "\\, ") .. ")}}"
end

function M.render(input)
	local opts = parse_keyvals(input)

	if not opts.root or opts.root == "" then
		package_error("missing root", "Set root=<single letter A--G>, e.g. root=C, quality=dom.")
		return ""
	end

	local out = {}
	out[#out + 1] = opts.root
	out[#out + 1] = accidental(opts.acc)
	out[#out + 1] = quality(opts)
	out[#out + 1] = alts(opts.alts or "")

	if opts.bass and opts.bass ~= "" then
		out[#out + 1] = "/" .. opts.bass .. accidental(opts.bassacc)
	end

	return table.concat(out)
end

function M.print(input)
	tex.sprint(M.render(input))
end

return M
