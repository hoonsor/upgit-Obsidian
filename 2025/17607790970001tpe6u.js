module.exports = async (params) => {
  const { app, quickAddApi } = params;

  // 步驟1: 檢查目前開啟的視圖是否為 Markdown 視圖
  const activeView = app.workspace.activeLeaf?.view;
  if (!activeView || activeView.getViewType() !== "markdown") {
    await quickAddApi.infoDialog("錯誤", "請先開啟一個 Markdown 檔案再執行此指令。");
    return;
  }

  // 步驟2: 取得當前檔案
  const activeFile = activeView.file;
  if (!activeFile || activeFile.extension !== "md") {
    await quickAddApi.infoDialog("錯誤", "目前開啟的檔案不是 Markdown 檔案。");
    return;
  }

  // 步驟3: 檢查 MarkMind 插件是否載入
  const mindmapViewType = "markmind-mindmap-view"; // 從 main.js 提取的視圖 ID
  const markmindPlugin = app.plugins.plugins["obsidian-markmind"];
  if (!markmindPlugin) {
    await quickAddApi.infoDialog("錯誤", "MarkMind 插件未啟用或未正確載入。請確認插件狀態。");
    return;
  }

  // 步驟4: 檢查檔案是否為思維導圖檔案
  const fileCache = app.metadataCache.getFileCache(activeFile);
  if (!fileCache?.frontmatter || !["rich", "basic"].includes(fileCache.frontmatter["mindmap-plugin"])) {
    await quickAddApi.infoDialog("錯誤", "此檔案未標記為 MarkMind 思維導圖檔案（需要 frontmatter: mindmap-plugin）。");
    return;
  }

  // 步驟5: 轉換視圖為 Mindmap 視圖
  try {
    await activeView.leaf.setViewState({
      type: mindmapViewType,
      state: activeView.getState(),
      popstate: true
    });
    await quickAddApi.infoDialog("成功", `已將檔案 "${activeFile.basename}" 開啟為 Mindmap 視圖。`);
  } catch (error) {
    await quickAddApi.infoDialog("錯誤", `轉換視圖失敗：${error.message}`);
    console.error("MarkMind 轉換錯誤:", error);
  }
};