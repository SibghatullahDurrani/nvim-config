local M = {}

local mecha_css = [[
:root {
  --bg: #0a0a0f;
  --fg: #e8d8c9;
  --accent: #00FF43;
  --orange: #f3701e;
  --muted: #6b6b78;
  --border: #1a1a25;
}
* { box-sizing: border-box; }
html, body {
  background: var(--bg);
  color: var(--fg);
  font-family: "JetBrainsMono Nerd Font", "JetBrains Mono", ui-monospace, monospace;
  line-height: 1.6;
  margin: 0;
}
body { max-width: 880px; margin: 0 auto; padding: 3rem 2rem; }
h1, h2, h3, h4, h5, h6 { color: var(--accent); font-weight: 600; line-height: 1.25; }
h1 { border-bottom: 1px solid var(--border); padding-bottom: .3em; }
h2 { border-bottom: 1px solid var(--border); padding-bottom: .2em; }
a { color: var(--orange); text-decoration: none; }
a:hover { text-decoration: underline; }
code {
  background: #15151f;
  color: var(--accent);
  padding: .15em .4em;
  border-radius: 3px;
  font-size: .92em;
}
pre {
  background: #15151f;
  border: 1px solid var(--border);
  border-radius: 4px;
  padding: 1em;
  overflow-x: auto;
}
pre code { background: transparent; color: var(--fg); padding: 0; }
blockquote {
  border-left: 3px solid var(--orange);
  color: var(--muted);
  margin: 1em 0;
  padding: .25em 1em;
}
table { border-collapse: collapse; width: 100%; }
th, td { border: 1px solid var(--border); padding: .5em .8em; }
th { background: #15151f; color: var(--accent); }
hr { border: 0; border-top: 1px solid var(--border); margin: 2em 0; }
img { max-width: 100%; }
ul, ol { padding-left: 1.4em; }
li::marker { color: var(--orange); }
]]

local function render_markdown(src_path)
	local out_dir = vim.fn.stdpath("cache") .. "/md-preview"
	vim.fn.mkdir(out_dir, "p")

	local css_path = out_dir .. "/mecha.css"
	if vim.fn.filereadable(css_path) == 0 then
		local f = io.open(css_path, "w")
		if f then
			f:write(mecha_css)
			f:close()
		end
	end

	local out_path = out_dir .. "/" .. vim.fn.fnamemodify(src_path, ":t:r") .. ".html"
	local title = vim.fn.fnamemodify(src_path, ":t")

	local result = vim.fn.system({
		"pandoc",
		src_path,
		"-f", "gfm",
		"-t", "html5",
		"-s",
		"--metadata", "title=" .. title,
		"-c", "mecha.css",
		"-o", out_path,
	})

	if vim.v.shell_error ~= 0 then
		vim.notify("pandoc failed: " .. result, vim.log.levels.ERROR)
		return nil
	end
	return out_path
end

function M.open_current()
	local path = vim.fn.expand("%:p")
	if path == "" then
		vim.notify("No file to open", vim.log.levels.WARN)
		return
	end

	local ext = vim.fn.fnamemodify(path, ":e"):lower()
	local target = path

	if ext == "md" or ext == "markdown" then
		if vim.fn.executable("pandoc") == 0 then
			vim.notify("pandoc is not installed or not in PATH", vim.log.levels.ERROR)
			return
		end
		local rendered = render_markdown(path)
		if not rendered then return end
		target = rendered
	end

	local opener = vim.fn.executable("firefox") == 1 and "firefox" or "xdg-open"
	vim.fn.jobstart({ opener, target }, { detach = true })
	vim.notify("󰖟  " .. vim.fn.fnamemodify(path, ":t"), vim.log.levels.INFO)
end

return M
