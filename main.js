const { app, BrowserWindow } = require('electron');
const path = require('path');
const { spawn } = require('child_process');

let flaskProcess;

function createWindow() {
    const win = new BrowserWindow({
        width: 800,
        height: 600,
        resizable: true,
        fullscreen: false,
        autoHideMenuBar: true
    });

    win.loadURL("http://localhost:5000");
    win.maximize();
}

app.whenReady().then(() => {  
  flaskProcess = spawn("python", [path.join(__dirname, "server.py")], {
    stdio: "inherit",
    shell: true
  });

  createWindow();
});

app.on("window-all-closed", () => {
  if (flaskProcess) flaskProcess.kill();
  app.quit();
});
