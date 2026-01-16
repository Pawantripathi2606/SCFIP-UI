# Smart Customer Feedback Intelligence Platform (SCFIP) - UI..

[![Streamlit](https://img.shields.io/badge/Streamlit-FF4B4B?style=for-the-badge&logo=Streamlit&logoColor=white)](https://streamlit.io/)
[![Python](https://img.shields.io/badge/Python-3.8+-blue?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)

A modern, intelligent dashboard for analyzing customer feedback using AI-powered sentiment analysis and intent classification.

## 🌟 Features

### Real-time Feedback Analysis
- **Sentiment Analysis**: Automatically detect positive, negative, or neutral sentiment
- **Intent Classification**: Identify feedback categories (Bug Report, Feature Request, Performance Issue, etc.)
- **Confidence Scores**: View AI model confidence for each prediction

### Interactive Dashboard
- **Analytics Overview**: Key metrics and trends at a glance
- **Sentiment Distribution**: Visual breakdown of customer sentiment
- **Trend Analysis**: Track sentiment changes over time
- **Word Clouds**: Visualize common themes in feedback
- **Negative Feedback Insights**: Focus on areas needing improvement

### Feedback Management
- **Submit Feedback**: Add new customer feedback through the UI
- **Bulk Upload**: Import multiple feedback entries via CSV
- **View All Feedback**: Browse and filter all submitted feedback
- **Individual Analysis**: Analyze specific feedback items

## 🚀 Live Demo

**Dashboard**: [Coming Soon - Deploy to Streamlit Cloud]

**Backend API**: https://scfip-backend.onrender.com

## 📋 Prerequisites

- Python 3.8 or higher
- Access to the SCFIP Backend API

## 🛠️ Local Development Setup

### 1. Clone the Repository

\`\`\`bash
git clone https://github.com/Pawantripathi2606/SCFIP-UI.git
cd SCFIP-UI
\`\`\`

### 2. Create Virtual Environment

\`\`\`bash
# Windows
python -m venv venv
venv\\Scripts\\activate

# Linux/Mac
python3 -m venv venv
source venv/bin/activate
\`\`\`

### 3. Install Dependencies

\`\`\`bash
pip install -r requirements.txt
\`\`\`

### 4. Configure API Connection.

Create `.streamlit/secrets.toml` from the example:

\`\`\`bash
cp .streamlit/secrets.toml.example .streamlit/secrets.toml
\`\`\`

Edit `.streamlit/secrets.toml`:

\`\`\`toml
API_BASE_URL = "https://scfip-backend.onrender.com/api"
\`\`\`

For local backend development:

\`\`\`toml
API_BASE_URL = "http://localhost:8000/api"
\`\`\`

### 5. Run the Dashboard

\`\`\`bash
streamlit run streamlit_app/dashboard.py
\`\`\`

The dashboard will open in your browser at `http://localhost:8501`

## ☁️ Streamlit Cloud Deployment

See [STREAMLIT_DEPLOYMENT.md](STREAMLIT_DEPLOYMENT.md) for detailed deployment instructions.

### Quick Deploy

1. **Fork/Push to GitHub**
   - Push this repository to your GitHub account

2. **Connect to Streamlit Cloud**
   - Go to [share.streamlit.io](https://share.streamlit.io)
   - Sign in with GitHub
   - Click "New app"
   - Select your repository

3. **Configure Secrets**
   - In Streamlit Cloud dashboard, go to app settings
   - Add secret: `API_BASE_URL = "https://scfip-backend.onrender.com/api"`

4. **Deploy**
   - Click "Deploy"
   - Your app will be live in minutes!

## 📁 Project Structure

\`\`\`
SCFIP-UI/
├── streamlit_app/
│   └── dashboard.py          # Main Streamlit application
├── .streamlit/
│   ├── config.toml           # Streamlit configuration
│   └── secrets.toml.example  # Example secrets file
├── requirements.txt          # Python dependencies
├── .gitignore               # Git ignore rules
├── README.md                # This file
├── STREAMLIT_DEPLOYMENT.md  # Deployment guide
└── API_INTEGRATION.md       # API integration docs
\`\`\`

## 🔌 API Integration

The UI connects to the SCFIP Backend API for all data processing and ML operations.

**Production API**: `https://scfip-backend.onrender.com/api`

See [API_INTEGRATION.md](API_INTEGRATION.md) for detailed API documentation.

### Key Endpoints Used

- `GET /health` - API health check
- `POST /feedback/add` - Submit new feedback
- `POST /feedback/bulk` - Bulk upload feedback
- `GET /feedback/all` - Retrieve all feedback
- `POST /analyze` - Analyze text
- `GET /analytics/summary` - Get analytics summary
- `GET /analytics/trends` - Get sentiment trends

## 🎨 Features Overview

### 1. Dashboard Home
- Real-time analytics summary
- Sentiment distribution charts
- Recent feedback overview
- Quick stats

### 2. Submit Feedback
- Simple form interface
- Real-time sentiment analysis
- Immediate feedback classification

### 3. Bulk Upload
- CSV file upload
- Batch processing
- Progress tracking
- Results summary

### 4. View Feedback
- Searchable feedback table
- Filter by sentiment/intent
- Detailed view for each entry

### 5. Analytics
- Sentiment trends over time
- Word cloud visualization
- Negative feedback analysis
- Exportable reports

## 🔧 Configuration

### Environment Variables

The app supports multiple configuration methods (in order of priority):

1. **Streamlit Secrets** (`.streamlit/secrets.toml`)
2. **Environment Variables**
3. **Default Values** (localhost for development)

### Streamlit Configuration

Edit `.streamlit/config.toml` to customize:
- Theme colors
- Server settings
- Browser behavior

## 📊 Sample Data

For testing, you can use the sample CSV format:

\`\`\`csv
feedback_text,customer_id,product,rating
"Great product, very satisfied!",CUST001,Product A,5
"App crashes frequently",CUST002,Product B,2
\`\`\`

## 🐛 Troubleshooting

### API Connection Issues

**Problem**: "Failed to connect to API"

**Solutions**:
1. Check if backend API is running
2. Verify `API_BASE_URL` in secrets
3. Check network/firewall settings
4. Ensure API URL ends with `/api`

### Streamlit Cloud Deployment Issues

**Problem**: App won't start on Streamlit Cloud

**Solutions**:
1. Verify `requirements.txt` is in root directory
2. Check secrets are configured correctly
3. Review deployment logs for errors
4. Ensure Python version compatibility

See [STREAMLIT_DEPLOYMENT.md](STREAMLIT_DEPLOYMENT.md) for more troubleshooting tips.

## 📝 License

This project is part of the Smart Customer Feedback Intelligence Platform.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📧 Support

For issues and questions:
- Open an issue on GitHub
- Check the documentation files
- Review the API documentation

## 🔗 Related Repositories

- **Backend API**: [SCFIP-backend](https://github.com/Pawantripathi2606/SCFIP-backend)

## 🙏 Acknowledgments

- Built with [Streamlit](https://streamlit.io/)
- Visualizations powered by [Plotly](https://plotly.com/)
- Backend powered by FastAPI and TensorFlow

---

**Made with ❤️ for better customer insights**
