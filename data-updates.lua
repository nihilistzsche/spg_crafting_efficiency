local function starts_with(str, start) return str:sub(1, #start) == start end

for recipe, rtbl in pairs(data.raw.recipe) do
    if starts_with(recipe, "sem:spg") then
        local pack_number = recipe:sub(-2)
        if pack_number:sub(1,1) == "-" then
            pack_number = pack_number:sub(2)
        end
        pack_number = tonumber(pack_number)
        Recipes[recipe].research.level = (pack_number / 6) + 1 
    end
end
