var panel = new Panel
var panelScreen = panel.screen

panel.location = "bottom";
panel.height = 32
panel.alignment = "center";

geo = screenGeometry(panelScreen);

panel.minimumLength = geo.width * 9 / 16
panel.maximumLength = geo.width * 9 / 16

var kickoff = panel.addWidget("org.kde.plasma.kickoff")
kickoff.currentConfigGroup = ["Shortcuts"]
kickoff.writeConfig("global", "Alt+F1")
kickoff.currentConfigGroup = ["General"]
kickoff.writeConfig("favorites", ["preferred://browser", "org.kde.dolphin.desktop", "org.kde.konsole.desktop", "systemsettings.desktop"])

panel.addWidget("org.kde.plasma.panelspacer");

let taskBar = panel.addWidget("org.kde.plasma.icontasks")
taskBar.currentConfigGroup = ["General"]
taskBar.writeConfig("launchers", ["preferred://browser", "preferred://filemanager", "applications:org.kde.konsole.desktop"])

panel.addWidget("org.kde.plasma.panelspacer");

panel.addWidget("org.kde.plasma.systemtray");

var dClock = panel.addWidget("org.kde.plasma.digitalclock");
dClock.writeConfig("showDate", false);

var dLogout = panel.addWidget("org.kde.plasma.lock_logout");
dLogout.writeConfig("show_lockScreen", false);
