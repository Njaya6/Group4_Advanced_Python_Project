# 👥 QuantPulse AI: Team Collaboration & Host Server Access Guide

This guide explains how to fix the terminal error from your screenshot and how to set up password-protected host server access so your teammates can collaborate and edit code with you.

---

## ⚡ 1. Fixing the Terminal Error in Your Screenshot

In your screenshot, you ran `python backend/main.py` and saw this error:
```
python.exe: can't open file '.../ai-stock-assistant/.venv/backend/main.py': [Errno 2] No such file or directory
```

### Why it happened:
Look closely at your terminal prompt:
`PS C:\Users\HomePC\Downloads\New folder\ai-stock-assistant\.venv>`

Your terminal is currently located **inside the `.venv` subfolder**, not the main project folder. Python is searching inside `.venv\backend\main.py`, which does not exist!

### The 1-Second Fix:
In your VS Code terminal, type:
```powershell
cd ..
python backend/main.py
```

Now you are in `ai-stock-assistant`, and the backend will start immediately!

---

## 🔐 2. Method 1: Password-Protected Host Server Access (Built-In)

We have built a **Team Server Access & Password Protection Gateway** directly into your project:

### How it works:
1. Start your backend server:
   ```powershell
   python backend/main.py
   ```
2. The server binds to `0.0.0.0:8000` (listening to your local network/Wi-Fi) and prints a banner:
   ```
   ========================================================================
   🚀 QuantPulse AI - Real-Time Market Server & Team Host Gateway
   📡 Local Dashboard:   http://localhost:8000
   👥 Teammate Network:  http://192.168.x.x:8000
   🔑 Team Access Pass:  quantpulse2026
   ========================================================================
   ```
3. **Give your teammates:**
   - The Network URL: `http://<YOUR_LOCAL_IP>:8000` (shown in your terminal)
   - The Team Password: `quantpulse2026` (or whatever you change it to)

4. **What your teammates can do on their own computers:**
   - They open `http://<YOUR_LOCAL_IP>:8000` in their browser.
   - They click the **`👥 Team Access`** button in the top navigation bar.
   - They enter the password (e.g. `GRACEINFINITY`) and click **Authorize Access**.
   - **Team Developer Mode unlocks!**
     - **⚡ 1-Click Feature Jump Buttons:**
       - **`📰 News Sentiment`**: Instantly jumps to the News Sentiment tab and opens the **Live News Publisher dock** where teammates can type new headlines, pick a stock (`RELIANCE`, `NVDA`, `TCS`, `TSLA`), choose polarity (`+0.92 Bullish`, `-0.75 Bearish`), and click **`+ Publish Live`**!
       - **`📈 Stock Targets & Prices`**: Jumps to the stock database editor where teammates can change active prices, target prices, and alpha signals (`STRONG BUY`, `ACCUMULATE`).
       - **`🔬 Trend Forecaster Lab`**: Jumps directly to Bayesian MCMC sliders.
       - **`📑 Quant Alpha Report`**: Jumps to customize executive summary notes and conviction ratings.
       - **`📊 Backtesting Strategies`**: Jumps to strategy performance simulations.
       - **`🛡️ Risk & VaR Scenarios`**: Jumps to stress test matrix.
     - **Code Section Auto-Jump Dropdown:**
       In the Code Editor, teammates can pick:
       - `-- Jump to Code Block --` → `📰 newsFeedItems Array`, `📈 stockDatabase Dictionary`, etc.
       - The editor immediately jumps to that exact line number, scrolls into view, and highlights the code!
     - **Direct On-Card Edit Buttons:**
       Teammates can also click the **`✏️ Edit News`** or **`✏️ Edit Targets`** buttons directly on the dashboard cards at any time to open the quick-edit dock.
     - **Save Edits:**
       Clicking **"Save Edits to Host Server"** saves changes directly to your host PC with an automatic `.bak` backup created first.

5. **How to Change the Team Password:**
   - Click **`👥 Team Access`** → **"Change Password"**.
   - Or open `team_config.json` in VS Code and edit `"team_password"`.

---

## 💻 3. Method 2: Live Multi-Cursor Code Editing in VS Code (Microsoft Live Share)

If your team wants to type inside the **exact same code files simultaneously** (like Google Docs for code):

1. **Install Live Share in VS Code:**
   - In VS Code, press `Ctrl + Shift + X` (Extensions).
   - Search for **`Live Share`** (by Microsoft) and click **Install**.
2. **Start a Collaboration Session:**
   - Look at the bottom blue status bar in VS Code and click **`Live Share`**.
   - A link is automatically copied to your clipboard (e.g. `https://vsls.io/join/...`).
3. **Set Password / Guest Approval for Security:**
   - In VS Code settings (`Ctrl + ,`), search for **`Live Share: Guest Approval Required`** and turn it **ON**.
   - When a teammate clicks your link to join, VS Code will pop up a notification on your screen:
     > *"Teammate wants to join. Accept with Read/Write permissions?"*
   - Click **Accept** to allow them to edit the code with you!
4. **Share Server with Teammates:**
   - In the Live Share tab on the left, click **"Share Server"** and enter port `8000`.
   - Your teammates can now preview the live running server directly on their computers without having to install Python!

---

## 🌐 4. Method 3: Remote Access Over the Internet (When Not on Same Wi-Fi)

If your teammates are working from home:

### Option A: VS Code Remote Tunnels (Built-in & Free)
1. In VS Code, click the **Accounts** icon (bottom left) or the **Remote Explorer** icon on the sidebar.
2. Click **"Turn on Remote Tunnel Access"**.
3. Sign in with GitHub or Microsoft.
4. Share the tunnel URL with your team. They can open it directly in `vscode.dev` and edit files with your permission!

### Option B: Cloudflare Tunnel or Ngrok with Password
Run in terminal:
```powershell
npx ngrok http 8000 --basic-auth "team:quantpulse2026"
```
Ngrok will give you an internet link (e.g. `https://xyz.ngrok-free.app`) where any teammate who enters username `team` and password `quantpulse2026` can access your server from anywhere in the world.
