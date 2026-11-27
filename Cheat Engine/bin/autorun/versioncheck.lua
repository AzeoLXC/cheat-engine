-- Opens this fork's release page. This fork does not query upstream update services.

local releasesURL = 'https://github.com/AzeoLXC/cheat-engine/releases'
local mi = createMenuItem(MainForm.MainMenu)
mi.Caption = 'View AzeoLXC releases'
mi.ImageIndex = 15
mi.OnClick = function()
  shellExecute(releasesURL)
end

MainForm.miHelp.insert(MainForm.miAbout.MenuIndex, mi)
