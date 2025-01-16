---@type table<string, string>: Prompts
local prompts = {
	Explain = "Explain how the following code works.", -- Prompt to explain code
	Review = "Review the following code and provide suggestions for improvement.", -- Prompt to review code
	Tests = "Explain how the selected code works, then generate unit tests for it.", -- Prompt to generate unit tests
	Refactor = "Refactor the following code to improve its clarity and readability.", -- Prompt to refactor code
	FixCode = "Fix the following code to make it work as intended.", -- Prompt to fix code
	FixError = "Explain the error in the following text and provide a solution.", -- Prompt to fix errors
	BetterNamings = "Provide better names for the following variables and functions.", -- Prompt to suggest better names
	Documentation = "Provide documentation for the following code.", -- Prompt to generate documentation
	JsDocs = "Provide JsDocs for the following code.", -- Prompt to generate JsDocs
	LuaCATS = "Provide LuaCats for te following code.",
	DocumentationForGithub = "Provide documentation for the following code ready for GitHub using markdown.", -- Prompt to generate GitHub documentation
	CreateAPost = "Provide documentation for the following code to post it in social media, like Linkedin, it has be deep, well explained and easy to understand. Also do it in a fun and engaging way.", -- Prompt to create a social media post
	SwaggerApiDocs = "Provide documentation for the following API using Swagger.", -- Prompt to generate Swagger API docs
	SwaggerJsDocs = "Write JSDoc for the following API using Swagger.", -- Prompt to generate Swagger JsDocs
	Summarize = "Summarize the following text.", -- Prompt to summarize text
	Spelling = "Correct any grammar and spelling errors in the following text.", -- Prompt to correct spelling and grammar
	Wording = "Improve the grammar and wording of the following text.", -- Prompt to improve wording
	Concise = "Rewrite the following text to make it more concise.", -- Prompt to make text concise
	Commit = "'> #git:staged\n\nWrite commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
}

return prompts
