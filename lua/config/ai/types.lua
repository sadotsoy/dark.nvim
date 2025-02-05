---@class CompanionPrompts
---@field [string] CompanionPrompt

---@class CompanionPrompt
---@field strategy string
---@field description string
---@field opts CompanionPromptOpts
---@field prompts CompanionPromptMessage[]

---@class CompanionPromptOpts
---@field mapping string
---@field modes string[]
---@field short_name string
---@field auto_submit boolean
---@field stop_context_insertion boolean
---@field user_prompt boolean

---@class CompanionPromptMessage
---@field role string
---@field content fun(context: CompanionPromptContext): string
---@field opts? CompanionPromptMessageOpts

---@class CompanionPromptContext
---@field filetype string
---@field start_line number
---@field end_line number

---@class CompanionPromptMessageOpts
---@field contains_code boolean

