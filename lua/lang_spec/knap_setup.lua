vim.g.knap_settings = {
    textopdf = "lualatex -interaction=batchmode -halt-on-error -synctex=1 %docroot%",
	-- mdtohtmlviewerlaunch = "min %outputfile%",
	-- textopdf = "lualatex -synctex=1 -halt-on-error -interaction=batchm.setup()ode %docroot%",
	htmltohtmlviewerlaunch = "live-server --quiet --browser=min --open=%outputfile% --watch=%outputfile% --wait=800",
	mdtohtmlviewerlaunch = "live-server --quiet --browser=min --open=%outputfile% --watch=%outputfile% --wait=800",
    textopdfviewerlaunch = "evince %outputfile%",
    textopdfviewerrefresh= "none",
    -- textopdfviewerlaunch = "sioyek --reuse-instance %outputfile%"
	-- textopdfviewerlaunch = [[sioyek --inverse-search 'nvim --headless ]]
	-- 	.. [[-es --cmd "lua]]
	-- 	.. [[require("knaphelper").relayjump]]
	-- 	.. [[("%servername%", "%1", %2,%3)' --reuse-instance %outputfile% ]],
	-- textopdfforwardjump = "sioyek --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,%3)\"' --reuse-instance --forward-search-file %srcfile% --forward-search-line %line% %outputfile%",
}
