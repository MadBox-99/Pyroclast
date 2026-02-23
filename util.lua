local util = {}

--- Add an input to a lab (data stage only)
---@param lab_name string
---@param input_name string
function util.add_lab_input(lab_name, input_name)
    local lab = data.raw["lab"][lab_name]
    if lab and lab.inputs then
        table.insert(lab.inputs, input_name)
    end
end

return util
