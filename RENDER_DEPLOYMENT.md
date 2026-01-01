# 🚀 Render Deployment Guide - SCFIP

## ✅ Issue Fixed!

**Problem:** `ERROR: Could not find a version that satisfies the requirement tensorflow==2.15.0`

**Solution:** Updated `requirements.txt` to use `tensorflow>=2.16.0` which is compatible with Render's Linux environment.

---

## 📋 Deployment Files Created

### 1. **requirements.txt** (Updated)
- Changed `tensorflow==2.15.0` → `tensorflow>=2.16.0`
- Changed `keras==2.15.0` → `keras>=3.0.0`
- All other dependencies remain compatible

### 2. **Procfile**
```
web: streamlit run streamlit_app/dashboard.py --server.port $PORT --server.address 0.0.0.0
```
Tells Render how to start your Streamlit app.

### 3. **runtime.txt**
```
3.10.12
```
Specifies Python version for deployment.

### 4. **build.sh**
```bash
#!/bin/bash
# Download NLTK data
python -c "import nltk; nltk.download('punkt'); nltk.download('punkt_tab'); nltk.download('stopwords'); nltk.download('wordnet'); nltk.download('omw-1')"

# Train models
python ml/train_models.py
```
Runs during deployment to download NLTK data and train ML models.

### 5. **render.yaml**
Configuration file for easy Render deployment.

---

## 🚀 How to Deploy on Render

### **Method 1: Using render.yaml (Recommended)**

1. **Go to Render Dashboard**
   - Visit: https://dashboard.render.com/

2. **Create New Web Service**
   - Click "New +" → "Web Service"

3. **Connect GitHub Repository**
   - Select your repository: `Smart-Customer-Feedback-Intelligence-Platform-SCFIP-`
   - Render will automatically detect `render.yaml`

4. **Deploy**
   - Click "Apply" to use the configuration
   - Render will automatically build and deploy

---

### **Method 2: Manual Configuration**

1. **Go to Render Dashboard**
   - Visit: https://dashboard.render.com/

2. **Create New Web Service**
   - Click "New +" → "Web Service"

3. **Connect Repository**
   - Connect your GitHub account
   - Select: `Pawantripathi2606/Smart-Customer-Feedback-Intelligence-Platform-SCFIP-`

4. **Configure Settings**

   | Setting | Value |
   |---------|-------|
   | **Name** | `scfip-dashboard` (or your choice) |
   | **Region** | Choose closest to you |
   | **Branch** | `main` |
   | **Runtime** | `Python 3` |
   | **Build Command** | `pip install -r requirements.txt && chmod +x build.sh && ./build.sh` |
   | **Start Command** | `streamlit run streamlit_app/dashboard.py --server.port $PORT --server.address 0.0.0.0` |
   | **Plan** | `Free` |

5. **Environment Variables** (Optional)
   - `PYTHON_VERSION` = `3.10.12`

6. **Deploy**
   - Click "Create Web Service"
   - Wait for deployment (may take 10-15 minutes for first deployment)

---

## ⏱️ Deployment Timeline

| Phase | Duration | What Happens |
|-------|----------|--------------|
| **Build** | 5-8 min | Installs dependencies from requirements.txt |
| **NLTK Download** | 1-2 min | Downloads NLTK data packages |
| **Model Training** | 3-5 min | Trains sentiment and intent models |
| **Start** | 1 min | Starts Streamlit server |
| **Total** | ~10-15 min | First deployment complete |

---

## 🔍 Monitoring Deployment

### **Check Build Logs**
In Render dashboard:
1. Go to your service
2. Click "Logs" tab
3. Watch for:
   ```
   Downloading NLTK data...
   Training ML models...
   Setup complete!
   ```

### **Common Log Messages**

✅ **Success:**
```
INFO:     Application startup complete.
Your app is live at https://scfip-dashboard.onrender.com
```

❌ **If Build Fails:**
- Check logs for specific error
- Verify all files are pushed to GitHub
- Ensure build.sh has execute permissions

---

## 🌐 Accessing Your Deployed App

Once deployed, Render will provide a URL like:
```
https://scfip-dashboard.onrender.com
```

Or your custom domain if configured.

---

## ⚠️ Important Notes

### **Free Tier Limitations**
- App may spin down after 15 minutes of inactivity
- First request after spin-down may take 30-60 seconds
- 750 hours/month free

### **Model Training on Every Deploy**
The `build.sh` script trains models during deployment because:
- Models are excluded from Git (too large)
- Training takes ~3-5 minutes
- Models are stored in the deployment instance

### **Database Persistence**
- SQLite database is NOT persistent on Render free tier
- Data will be lost on redeploy
- For production, consider using PostgreSQL (Render offers free tier)

---

## 🔧 Troubleshooting

### **Issue: Build Timeout**
**Solution:** 
- Render free tier has build time limits
- Models train during build, which is acceptable
- If timeout occurs, try deploying again

### **Issue: Module Not Found**
**Solution:**
- Ensure all dependencies are in `requirements.txt`
- Check build logs for failed installations

### **Issue: Port Binding Error**
**Solution:**
- Ensure start command uses `$PORT` variable
- Current command is correct: `--server.port $PORT`

### **Issue: NLTK Data Not Found**
**Solution:**
- Verify `build.sh` is executable
- Check build logs for NLTK download messages
- Ensure build command includes `chmod +x build.sh`

---

## 🎯 Post-Deployment

### **Test Your Deployment**

1. **Access the URL**
   - Open the Render-provided URL
   - Wait for app to load (may take 30s on first access)

2. **Test Features**
   - Upload sample feedback
   - Analyze text in Live Analyzer
   - Check dashboard visualizations

3. **Verify API (if deploying backend separately)**
   - Test `/health` endpoint
   - Try `/api/analyze` with sample text

---

## 📊 Deployment Checklist

- [x] Updated `requirements.txt` with compatible TensorFlow version
- [x] Created `Procfile` for web service
- [x] Created `runtime.txt` for Python version
- [x] Created `build.sh` for NLTK and model setup
- [x] Created `render.yaml` for easy deployment
- [x] Pushed all files to GitHub
- [ ] Connected repository to Render
- [ ] Configured build and start commands
- [ ] Deployed and verified app is running

---

## 🔗 Useful Links

- **Render Dashboard:** https://dashboard.render.com/
- **Render Docs:** https://render.com/docs
- **Your GitHub Repo:** https://github.com/Pawantripathi2606/Smart-Customer-Feedback-Intelligence-Platform-SCFIP-

---

## 🎉 Summary

✅ **TensorFlow version fixed** (now using >=2.16.0)  
✅ **Deployment files created** (Procfile, runtime.txt, build.sh, render.yaml)  
✅ **All changes pushed to GitHub**  
✅ **Ready to deploy on Render!**

Follow the deployment steps above, and your SCFIP app will be live in ~10-15 minutes! 🚀
