local symbols_outline_ok, symbols_outline = pcall(require, "symbols-outline")

if not symbols_outline_ok then
  return
end

symbols_outline.setup({
  symbols = {
    File = { icon = "", hl = "TSURI" },
    Module = { icon = "", hl = "TSNamespace" },
    Namespace = { icon = "", hl = "TSNamespace" },
    Package = { icon = "", hl = "TSNamespace" },
    Class = { icon = "", hl = "TSType" },
    Method = { icon = "", hl = "TSMethod" },
    Property = { icon = "", hl = "TSMethod" },
    Field = { icon = "", hl = "TSField" },
    Constructor = { icon = "", hl = "TSConstructor" },
    Enum = { icon = "", hl = "TSType" },
    Interface = { icon = "", hl = "TSType" },
    Function = { icon = "", hl = "TSFunction" },
    Variable = { icon = "", hl = "TSConstant" },
    Constant = { icon = "", hl = "TSConstant" },
    String = { icon = "", hl = "TSString" },
    Number = { icon = "", hl = "TSNumber" },
    Boolean = { icon = "", hl = "TSBoolean" },
    Array = { icon = "", hl = "TSConstant" },
    Object = { icon = "", hl = "TSType" },
    Key = { icon = "", hl = "TSType" },
    Null = { icon = "NULL", hl = "TSType" },
    EnumMember = { icon = "", hl = "TSField" },
    Struct = { icon = "", hl = "TSType" },
    Event = { icon = "", hl = "TSType" },
    Operator = { icon = "", hl = "TSOperator" },
    TypeParameter = { icon = "", hl = "TSParameter" },
  },
})
