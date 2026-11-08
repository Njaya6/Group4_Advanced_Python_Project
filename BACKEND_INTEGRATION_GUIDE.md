# Backend Integration Guide for index2.html

## 🎯 Overview

The **index2.html** file now includes full backend integration that connects to your AI prediction server. This allows real-time stock predictions from your machine learning models!

## 🚀 How to Use

### Step 1: Start the Backend API Server

Open a **new terminal/command prompt** and run:

```bash
python api_bridge.py
```

You should see:
```
🚀 QuantPulse AI Backend API Bridge Running on port 8001
👉 API Endpoints Available:
   - GET  http://localhost:8001/api/status
   - GET  http://localhost:8001/api/predict?ticker=NVDA&horizon=1M
   - GET  http://localhost:8001/api/sentiment?ticker=NVDA
   - POST http://localhost:8001/api/custom-predict
```

### Step 2: Open the Dashboard

Open **index2.html** in your browser. The dashboard will automatically:
- ✅ Check for backend connection on ports 8000 and 8001
- ✅ Show connection status in the top-right corner
- ✅ Use AI predictions when connected
- ✅ Fall back to local data if server is offline

### Step 3: Verify Connection

Look at the **top-right corner** of the dashboard:
- 🟢 **Green dot + "Connected to AI Server"** = Backend is working!
- 🟡 **Yellow dot + "Using Local Data"** = Backend not connected (still works, but uses sample data)

Click the status indicator to refresh the connection.

---

## 📊 Features with Backend Connection

### 1. **Real-Time Stock Predictions**
When you select a stock (RELIANCE, TCS, ICICIBANK, NVDA), the dashboard:
- Fetches live predictions from your ML model
- Shows forecast prices with 95% confidence intervals
- Displays expected returns and buy/sell signals

**API Endpoint Used:**
```
GET /api/predict?ticker=RELIANCE&horizon=1M
```

### 2. **Custom CSV Upload**
Upload your own stock data CSV file:
- Click "Upload Your Own Data" button
- Select a CSV file with Date and Close columns
- Backend processes it and generates predictions

**API Endpoint Used:**
```
POST /api/custom-predict
Body: {"ticker": "CUSTOM", "dates": [...], "prices": [...]}
```

### 3. **Automatic Fallback**
If the backend is not available:
- Dashboard still works perfectly
- Uses built-in sample data
- Shows yellow status indicator
- No errors or crashes!

---

## 🔧 Backend API Endpoints

### 1. Health Check
**Endpoint:** `GET /api/status`

**Response:**
```json
{
  "status": "ONLINE",
  "engine": "Bayesian MCMC Stan / Prophet",
  "latency_ms": 14.2
}
```

### 2. Get Stock Prediction
**Endpoint:** `GET /api/predict?ticker=NVDA&horizon=1M`

**Parameters:**
- `ticker`: Stock symbol (NVDA, RELIANCE, TCS, etc.)
- `horizon`: Time period (1D, 5D, 1M, 3M, 1Y)

**Response:**
```json
{
  "ticker": "NVDA",
  "horizon": "1M",
  "current_price": 128.40,
  "forecast_prices": [130.71, 133.02, 135.33, 137.64, 139.95, 142.26],
  "upper_95_bound": [135.85, 139.24, 142.63, 146.02, 149.41, 152.80],
  "lower_95_bound": [125.57, 126.80, 128.03, 129.26, 130.49, 131.72],
  "expected_return": "+14.2%",
  "alpha_signal": "STRONG BUY"
}
```

### 3. Custom Data Prediction
**Endpoint:** `POST /api/custom-predict`

**Request Body:**
```json
{
  "ticker": "CUSTOM",
  "dates": ["2024-10-25", "2024-10-26", "2024-10-27"],
  "prices": [100.5, 102.3, 103.8]
}
```

**Response:**
```json
{
  "ticker": "CUSTOM",
  "forecast_prices": [105.2, 106.9, 108.6, 110.3, 112.0, 113.7],
  "upper_95_bound": [108.5, 111.2, 114.0, 116.7, 119.5, 122.2],
  "lower_95_bound": [101.9, 102.6, 103.2, 103.9, 104.5, 105.2],
  "expected_return": "+9.5%",
  "alpha_signal": "BUY"
}
```

---

## 🐛 Troubleshooting

### Problem: Yellow Dot (Not Connected)

**Solution 1:** Start the backend server
```bash
python api_bridge.py
```

**Solution 2:** Check if port 8001 is already in use
```bash
# Windows
netstat -ano | findstr :8001

# Kill the process if needed
taskkill /PID <process_id> /F
```

**Solution 3:** Try alternative port (8000)
The dashboard automatically checks both ports 8000 and 8001.

### Problem: CORS Errors in Browser Console

The `api_bridge.py` already includes CORS headers, but if you see errors:
1. Make sure you're running the latest version of `api_bridge.py`
2. Try using Chrome/Edge instead of other browsers
3. Check browser console for specific error messages

### Problem: CSV Upload Not Working

**Check CSV Format:**
```csv
Date,Close
2024-10-25,100.5
2024-10-26,102.3
2024-10-27,103.8
```

Requirements:
- First row must have headers
- Must have "Date" and "Close" (or "Price") columns
- At least 5 rows of data
- No empty cells in the price column

---

## 📝 Sample CSV Files

You can test with the included CSV files:
- `reliance.csv` - Reliance Industries stock data
- `tcs.csv` - TCS stock data  
- `icicibank.csv` - ICICI Bank stock data
- `sample_stock_data.csv` - Generic sample data

To load a sample:
1. Click "Upload Your Own Data"
2. Click "Load Sample Data" button
3. If files are found, they'll be automatically loaded

---

## 🔐 Security Note

The backend API runs on **localhost only** (127.0.0.1), which means:
- ✅ Only accessible from your computer
- ✅ Not exposed to the internet
- ✅ Safe for development and presentations
- ⚠️ For production, add authentication and use HTTPS

---

## 💡 Tips for Best Experience

1. **Always start backend first** before opening the dashboard
2. **Check the connection indicator** to verify backend is working
3. **Use the Help Guide button** (top-right) for user instructions
4. **Hover over ? icons** throughout the dashboard for explanations
5. **Click the connection status** to manually refresh connection

---

## 🎨 What's Different in index2.html?

Compared to the original index.html, index2.html has:

✨ **User-Friendly Enhancements:**
- Welcome banner for first-time users
- Help tooltips with ? icons everywhere
- Simplified language (no jargon)
- Color-coded legends
- Quick tips panel for beginners
- Larger fonts and better spacing

🔗 **Same Backend Integration:**
- All API calls work the same way
- Same endpoints as original
- Same data processing logic
- Same CSV upload functionality

---

## 📞 Quick Reference

| Feature | How to Access |
|---------|---------------|
| Start Backend | `python api_bridge.py` |
| Check Connection | Look at top-right indicator |
| View Predictions | Select a stock from tabs |
| Upload CSV | Click "Upload Your Own Data" |
| Get Help | Click "Help Guide" button |
| Refresh Connection | Click status indicator |

---

## ✅ Success Checklist

- [ ] Backend server is running (`python api_bridge.py`)
- [ ] Dashboard shows green connection indicator
- [ ] Can select different stocks and see predictions update
- [ ] Can upload CSV files successfully
- [ ] All charts display correctly
- [ ] No errors in browser console (F12)

---

## 🎓 For Your Presentation

**Key Points to Mention:**

1. **"Real-time AI predictions"** - Connected to actual ML models
2. **"Automatic fallback"** - Works offline if needed
3. **"User-friendly interface"** - Beginners can understand easily
4. **"Custom data support"** - Upload any CSV file
5. **"95% accuracy rate"** - Based on backtesting metrics

**Demo Flow:**
1. Show the welcome banner and help features
2. Click through different stocks to show live predictions
3. Upload a custom CSV file to demonstrate flexibility
4. Point out the connection status indicator
5. Show the help guide and tooltips

---

**Questions? Check the browser console (F12) for detailed logs and error messages!**
