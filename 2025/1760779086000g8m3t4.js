module.exports = advanced_uri;

// 用window.open直接開啟advnace uri的ettingid指定的設定視窗
async function advanced_uri(params) {
  quickAddApi = params.quickAddApi;
  
  const aTexts =   [ "Hotkeys",
"社群外掛",
"外掛瀏覽器",
"主題瀏覽器",
"cMenu",
"Customizable Page Header Buttons",
"Emo-Uploader",
"Editing Toolbar",
"Image ToolKit",
"Linter",
"Local Rest API",
"Obsidian Minimal Settings",
"QuickAdd",
"Review",
"Reminder",
"Shell Commands",
"Style Settings",
"Tasks",
"Templater"];

  const aValues = [ "hotkeys",
"community-plugins",
"plugin-browser",
"theme-browser",
"cmenu-plugin",
"customizable-page-header-buttons" ,
"emo-uploader",
"editing-toolbar",
"obsidian-image-toolkit",
"obsidian-linter" ,
"obsidian-local-rest-api" ,
"obsidian-minimal-settings",
"quickadd",
"review-obsidian",
"obsidian-reminder-plugin",
"obsidian-shellcommands",
"obsidian-style-settings" ,
"obsidian-tasks-plugin",
"templater-obsidian"];

  let choice = await quickAddApi.suggester(aTexts, aValues);
  //console.log("choice", choice);

  //this.quickAddApi.utility.setClipboard(choice);
  window.open("obsidian://advanced-uri?vault=Hoonsor&settingid=" + choice);

  return choice;
}