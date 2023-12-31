local function starts_with(str, start) return str:sub(1, #start) == start end

for tech, ttbl in pairs(data.raw.technology) do
    if starts_with(tech, "ce-infused-station-science") or starts_with(tech, "ce-infused-planetary-data") then
       ttbl.icon_size = 32
    end
end
