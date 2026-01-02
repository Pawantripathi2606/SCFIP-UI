# Streamlit Cloud Deployment Guide

This guide provides step-by-step instructions for deploying the SCFIP UI to Streamlit Cloud.

## Prerequisites

- GitHub account
- Streamlit Cloud account (free tier available)
- SCFIP Backend API deployed and running
- Git installed on your local machine

## Deployment Steps

### Step 1: Prepare Your Repository

#### 1.1 Initialize Git Repository (if not already done)

\`\`\`bash
cd "c:\\Users\\Lenovo\\Desktop\\Smart Customer Feedback Intelligence Platform (SCFIP)"
git init
\`\`\`

#### 1.2 Add Remote Repository

\`\`\`bash
git remote add origin https://github.com/Pawantripathi2606/SCFIP-UI.git
\`\`\`

#### 1.3 Stage All Files

\`\`\`bash
git add .
\`\`\`

> [!IMPORTANT]
> Make sure `.gitignore` is in place to exclude sensitive files like `.streamlit/secrets.toml`

#### 1.4 Commit Changes

\`\`\`bash
git commit -m "Initial commit: Streamlit UI for SCFIP"
\`\`\`

#### 1.5 Push to GitHub

\`\`\`bash
git branch -M main
git push -u origin main
\`\`\`

### Step 2: Deploy to Streamlit Cloud

#### 2.1 Sign Up / Sign In

1. Go to [share.streamlit.io](https://share.streamlit.io)
2. Click "Sign in with GitHub"
3. Authorize Streamlit Cloud to access your GitHub account

#### 2.2 Create New App

1. Click "New app" button
2. Select deployment options:
   - **Repository**: `Pawantripathi2606/SCFIP-UI`
   - **Branch**: `main`
   - **Main file path**: `streamlit_app/dashboard.py`

#### 2.3 Advanced Settings (Optional)

- **Python version**: 3.9 or higher (default is fine)
- **App URL**: Choose a custom subdomain (optional)

### Step 3: Configure Secrets

> [!CAUTION]
> Never commit secrets to your repository! Always use Streamlit Cloud's secrets management.

#### 3.1 Access Secrets Management

1. After creating the app, go to app settings (⚙️ icon)
2. Click on "Secrets" in the left sidebar

#### 3.2 Add API Configuration

Paste the following into the secrets editor:

\`\`\`toml
API_BASE_URL = "https://scfip-backend.onrender.com/api"
\`\`\`

#### 3.3 Save Secrets

Click "Save" - the app will automatically restart with the new configuration.

### Step 4: Deploy

1. Click "Deploy!" button
2. Wait for deployment to complete (usually 2-5 minutes)
3. Your app will be live at: `https://[your-app-name].streamlit.app`

## Verification

### Test Your Deployed App

1. **Check API Connection**
   - The dashboard should load without errors
   - Health check indicator should show "Connected"

2. **Test Features**
   - Submit a test feedback
   - View analytics dashboard
   - Try bulk upload with sample CSV

3. **Monitor Logs**
   - Click "Manage app" → "Logs" to view real-time logs
   - Check for any errors or warnings

## Configuration Options

### Streamlit Cloud Settings

Access via app settings (⚙️):

#### General Settings
- **App name**: Change your app's subdomain
- **Visibility**: Public or Private
- **Sleep settings**: Configure auto-sleep behavior

#### Secrets
- Manage environment variables
- Update API URLs
- Add authentication tokens

#### Resources
- View resource usage
- Monitor app performance
- Check deployment history

### Custom Domain (Optional)

For custom domains:

1. Go to app settings → "Domains"
2. Add your custom domain
3. Configure DNS records as instructed
4. Wait for DNS propagation

## Updating Your App

### Method 1: Git Push (Recommended)

Any push to your GitHub repository will automatically trigger a redeploy:

\`\`\`bash
git add .
git commit -m "Update: [description]"
git push
\`\`\`

### Method 2: Manual Reboot

In Streamlit Cloud dashboard:
1. Go to app settings
2. Click "Reboot app"

### Method 3: Clear Cache

To clear cached data:
1. Go to app settings
2. Click "Clear cache"
3. Click "Reboot app"

## Troubleshooting

### Common Issues

#### 1. App Won't Start

**Symptoms**: Deployment fails or app shows error page

**Solutions**:
- Check deployment logs for specific errors
- Verify `requirements.txt` is in the root directory
- Ensure `streamlit_app/dashboard.py` path is correct
- Check Python version compatibility

#### 2. API Connection Failed

**Symptoms**: "Failed to connect to API" error

**Solutions**:
- Verify secrets are configured correctly
- Check backend API is running: https://scfip-backend.onrender.com/health
- Ensure `API_BASE_URL` ends with `/api`
- Check for CORS issues in backend

#### 3. Module Import Errors

**Symptoms**: `ModuleNotFoundError` in logs

**Solutions**:
- Verify all dependencies are in `requirements.txt`
- Check package versions are compatible
- Try pinning specific versions

#### 4. App Runs Locally But Not on Cloud

**Symptoms**: Works on localhost but fails on Streamlit Cloud

**Solutions**:
- Check for hardcoded local paths
- Verify environment variable handling
- Review file path separators (use `os.path.join`)
- Check for missing system dependencies

#### 5. Slow Performance

**Symptoms**: App loads slowly or times out

**Solutions**:
- Optimize data loading with `@st.cache_data`
- Reduce API calls where possible
- Check backend API response times
- Consider pagination for large datasets

### Viewing Logs

Access logs in Streamlit Cloud:

1. Go to your app dashboard
2. Click "Manage app"
3. Select "Logs" tab
4. View real-time application logs

### Debug Mode

Enable debug mode locally:

\`\`\`bash
streamlit run streamlit_app/dashboard.py --logger.level=debug
\`\`\`

## Best Practices

### 1. Version Control

- Commit frequently with descriptive messages
- Use branches for new features
- Tag releases for production deployments

### 2. Secrets Management

- Never commit `.streamlit/secrets.toml`
- Use environment-specific secrets
- Rotate secrets regularly

### 3. Performance

- Cache expensive operations with `@st.cache_data`
- Minimize API calls
- Use session state for temporary data
- Implement pagination for large datasets

### 4. Monitoring

- Regularly check app logs
- Monitor resource usage
- Set up alerts for errors
- Track user analytics

### 5. Security

- Validate all user inputs
- Sanitize data before display
- Use HTTPS for API connections
- Implement rate limiting if needed

## Resource Limits

### Streamlit Cloud Free Tier

- **Resources**: 1 CPU, 1 GB RAM
- **Apps**: Unlimited public apps
- **Sleep**: Apps sleep after inactivity
- **Build time**: 10 minutes max

### Optimization Tips

1. **Reduce dependencies**: Only include necessary packages
2. **Lazy loading**: Load data only when needed
3. **Caching**: Use Streamlit caching decorators
4. **Async operations**: Use async for API calls where possible

## Support and Resources

### Official Documentation

- [Streamlit Docs](https://docs.streamlit.io/)
- [Streamlit Cloud Docs](https://docs.streamlit.io/streamlit-community-cloud)
- [Deployment Guide](https://docs.streamlit.io/streamlit-community-cloud/get-started/deploy-an-app)

### Community

- [Streamlit Forum](https://discuss.streamlit.io/)
- [GitHub Issues](https://github.com/streamlit/streamlit/issues)
- [Discord Community](https://discord.gg/streamlit)

### SCFIP Specific

- Backend API Docs: [API_INTEGRATION.md](API_INTEGRATION.md)
- Backend Repository: https://github.com/Pawantripathi2606/SCFIP-backend
- UI Repository: https://github.com/Pawantripathi2606/SCFIP-UI

## Next Steps

After successful deployment:

1. ✅ Test all features thoroughly
2. ✅ Share your app URL with stakeholders
3. ✅ Monitor usage and performance
4. ✅ Gather user feedback
5. ✅ Plan future enhancements

## Rollback Procedure

If you need to rollback to a previous version:

### Option 1: Git Revert

\`\`\`bash
git revert HEAD
git push
\`\`\`

### Option 2: Redeploy Previous Commit

1. In Streamlit Cloud, go to app settings
2. Click "Advanced"
3. Select previous commit from dropdown
4. Click "Deploy"

---

**Need help?** Check the [troubleshooting section](#troubleshooting) or open an issue on GitHub.
