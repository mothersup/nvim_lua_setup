local settings = require("lang_spec.lang_spec_settings")
local pdf_viewer = settings.pdf_viewer

vim.g.knap_settings = {
    textopdf = "arara %docroot%",
    -- mdtohtmlviewerlaunch = "min %outputfile%",
    -- textopdf = "lualatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
    -- textopdf = "lualatex -synctex=1 -halt-on-error -interaction=batchm.setup()ode %docroot%",
    htmltohtmlviewerlaunch = [[live-server ]]
        .. [[--quiet --browser=firefox --open=%outputfile% ]]
        .. [[--watch=%outputfile% --wait=800]],
    mdtohtmlviewerlaunch = "live-server --quiet --browser=firefox --open=%outputfile% --watch=%outputfile% --wait=800",
    -- textopdfviewerlaunch = pdf_viewer .. [[ %outputfile]],
    textopdfviewerlaunch = pdf_viewer
        .. [[ --inverse-search 'nvim --headless ]]
        .. [[-es --cmd "lua ]]
        .. [[require("knaphelper").relayjump("%servername%", "%1", %2,%3)"' ]]
        .. [[--new-window %outputfile% ]],
    textopdfforwardjump = pdf_viewer
        .. [[ --inverse-search 'nvim --headless]]
        .. [[-es --cmd "lua]]
        .. [[require("knaphelper").relayjump("%servername%", "%1", %2,%3)"']]
        .. [[--new-instance]]
        .. [[--forward-search-file %srcfile% --forward-search-line %line%]]
        .. [[%outputfile%]]
        -- "sioyek.exe --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,%3)\"' --reuse-instance --forward-search-file %srcfile% --forward-search-line %line% %outputfile%",
}
