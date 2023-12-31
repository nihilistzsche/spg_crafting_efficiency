for i = 1, 36 do
    k2_se_ce_add_recipe("sem:spg_science-pack-"..i)
end

local prefixes = {
    ["sem:spg_science-pack-"] = true,
}

local function has_valid_prefix(name, prefix) return name:sub(1, string.len(prefix)) == prefix end

local suffixes = {
    ["-science-pack"] = true,
    ["-science-pack-1"] = true,
    ["-science-pack-2"] = true,
    ["-science-pack-3"] = true,
    ["-science-pack-4"] = true,
    ["-tech-card"] = true,
    ["_science_item"] = true,
    ["planetary-data"] = true,
    ["station-science"] = true,
}

local function has_valid_suffix(name, suffix) return name:sub(-string.len(suffix)) == suffix end

local function is_valid_science_pack(science)
    if not science then return false end
    if science.name == "space-science-pack" then return false end
    for prefix in pairs(prefixes) do
        if has_valid_prefix(science.name, prefix) then return true end
    end
    for suffix in pairs(suffixes) do
        if has_valid_suffix(science.name, suffix) then return true end
    end
    return false
end

for _, science in pairs(data.raw["tool"]) do
    if is_valid_science_pack(science) then k2_se_ce_add_recipe("infused-"..science.name) end
end
