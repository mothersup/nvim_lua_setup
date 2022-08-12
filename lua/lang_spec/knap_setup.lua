vim.g.knap_settings = {
    -- mdtohtmlviewerlaunch = "min %outputfile%",
    htmltohtmlviewerlaunch =  "live-server --quiet --browser=min --open=%outputfile% --watch=%outputfile% --wait=800",
    mdtohtmlviewerlaunch = "live-server --quiet --browser=min --open=%outputfile% --watch=%outputfile% --wait=800",
    textopdfviewerlaunch = "sioyek.exe --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,%3)\"' --reuse-instance %outputfile%",
    textopdfforwardjump = "sioyek.exe --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,%3)\"' --reuse-instance --forward-search-file %srcfile% --forward-search-line %line% %outputfile%",
}
