# API Integration Documentation

This document describes how the SCFIP UI integrates with the backend API.

## API Overview

**Production API Base URL**: `https://scfip-backend.onrender.com/api`

**Local Development URL**: `http://localhost:8000/api`

The UI communicates with the backend API for all data processing, ML model inference, and data storage operations.

## Configuration

### Setting the API URL

The API URL is configured using Streamlit secrets (priority order):

1. **Streamlit Cloud Secrets** (`.streamlit/secrets.toml`)
2. **Environment Variable** (`API_BASE_URL`)
3. **Default** (`http://localhost:8000/api`)

### Example Configuration

**For Production (Streamlit Cloud)**:
\`\`\`toml
# .streamlit/secrets.toml
API_BASE_URL = "https://scfip-backend.onrender.com/api"
\`\`\`

**For Local Development**:
\`\`\`toml
# .streamlit/secrets.toml
API_BASE_URL = "http://localhost:8000/api"
\`\`\`

**Using Environment Variable**:
\`\`\`bash
export API_BASE_URL="https://scfip-backend.onrender.com/api"
\`\`\`

## API Endpoints Used

### 1. Health Check

**Endpoint**: `GET /health`

**Purpose**: Verify API connectivity and status

**Request**:
\`\`\`python
response = requests.get(f"{API_BASE_URL}/health")
\`\`\`

**Response**:
\`\`\`json
{
  "status": "healthy",
  "message": "SCFIP Backend API is running",
  "version": "1.0.0"
}
\`\`\`

**Used In**: Dashboard initialization, connection status indicator

---

### 2. Add Feedback

**Endpoint**: `POST /feedback/add`

**Purpose**: Submit a single feedback entry

**Request**:
\`\`\`python
data = {
    "feedback_text": "Great product!",
    "customer_id": "CUST001",
    "product": "Product A",
    "rating": 5
}
response = requests.post(f"{API_BASE_URL}/feedback/add", json=data)
\`\`\`

**Response**:
\`\`\`json
{
  "id": 1,
  "feedback_text": "Great product!",
  "customer_id": "CUST001",
  "product": "Product A",
  "rating": 5,
  "sentiment": "Positive",
  "sentiment_confidence": 0.95,
  "intent": "General Feedback",
  "intent_confidence": 0.87,
  "timestamp": "2026-01-02T12:00:00"
}
\`\`\`

**Used In**: Submit Feedback page

---

### 3. Bulk Upload Feedback

**Endpoint**: `POST /feedback/bulk`

**Purpose**: Upload multiple feedback entries from CSV

**Request**:
\`\`\`python
data = {
    "feedback_data": [
        {
            "feedback_text": "Great product!",
            "customer_id": "CUST001",
            "product": "Product A",
            "rating": 5
        },
        {
            "feedback_text": "App crashes",
            "customer_id": "CUST002",
            "product": "Product B",
            "rating": 2
        }
    ]
}
response = requests.post(f"{API_BASE_URL}/feedback/bulk", json=data)
\`\`\`

**Response**:
\`\`\`json
{
  "message": "Successfully processed 2 feedback entries",
  "processed": 2,
  "failed": 0,
  "results": [...]
}
\`\`\`

**Used In**: Bulk Upload page

---

### 4. Get All Feedback

**Endpoint**: `GET /feedback/all`

**Purpose**: Retrieve all feedback entries

**Request**:
\`\`\`python
response = requests.get(f"{API_BASE_URL}/feedback/all")
\`\`\`

**Response**:
\`\`\`json
{
  "total": 100,
  "feedback": [
    {
      "id": 1,
      "feedback_text": "Great product!",
      "sentiment": "Positive",
      "intent": "General Feedback",
      "timestamp": "2026-01-02T12:00:00",
      ...
    },
    ...
  ]
}
\`\`\`

**Used In**: View Feedback page, Analytics dashboard

---

### 5. Get Feedback by ID

**Endpoint**: `GET /feedback/{id}`

**Purpose**: Retrieve a specific feedback entry

**Request**:
\`\`\`python
feedback_id = 1
response = requests.get(f"{API_BASE_URL}/feedback/{feedback_id}")
\`\`\`

**Response**:
\`\`\`json
{
  "id": 1,
  "feedback_text": "Great product!",
  "customer_id": "CUST001",
  "product": "Product A",
  "rating": 5,
  "sentiment": "Positive",
  "sentiment_confidence": 0.95,
  "intent": "General Feedback",
  "intent_confidence": 0.87,
  "timestamp": "2026-01-02T12:00:00"
}
\`\`\`

**Used In**: Feedback detail view

---

### 6. Analyze Text

**Endpoint**: `POST /analyze`

**Purpose**: Analyze text without storing it

**Request**:
\`\`\`python
data = {
    "text": "The app is very slow"
}
response = requests.post(f"{API_BASE_URL}/analyze", json=data)
\`\`\`

**Response**:
\`\`\`json
{
  "text": "The app is very slow",
  "sentiment": {
    "label": "Negative",
    "confidence": 0.92,
    "probabilities": {
      "Positive": 0.03,
      "Neutral": 0.05,
      "Negative": 0.92
    }
  },
  "intent": {
    "label": "Performance Issue",
    "confidence": 0.88,
    "probabilities": {
      "Bug Report": 0.05,
      "Feature Request": 0.02,
      "Performance Issue": 0.88,
      "Pricing Issue": 0.02,
      "General Feedback": 0.03
    }
  }
}
\`\`\`

**Used In**: Quick analysis feature, preview before submission

---

### 7. Analytics Summary

**Endpoint**: `GET /analytics/summary`

**Purpose**: Get overall analytics summary

**Request**:
\`\`\`python
response = requests.get(f"{API_BASE_URL}/analytics/summary")
\`\`\`

**Response**:
\`\`\`json
{
  "total_feedback": 100,
  "sentiment_distribution": {
    "Positive": 60,
    "Neutral": 25,
    "Negative": 15
  },
  "intent_distribution": {
    "General Feedback": 40,
    "Feature Request": 25,
    "Bug Report": 15,
    "Performance Issue": 12,
    "Pricing Issue": 8
  },
  "average_rating": 4.2,
  "latest_feedback_date": "2026-01-02T12:00:00"
}
\`\`\`

**Used In**: Dashboard home page, Analytics overview

---

### 8. Sentiment Trends

**Endpoint**: `GET /analytics/trends`

**Purpose**: Get sentiment trends over time

**Query Parameters**:
- `days` (optional): Number of days to analyze (default: 30)

**Request**:
\`\`\`python
response = requests.get(f"{API_BASE_URL}/analytics/trends?days=30")
\`\`\`

**Response**:
\`\`\`json
{
  "trends": [
    {
      "date": "2026-01-01",
      "positive": 15,
      "neutral": 8,
      "negative": 3
    },
    {
      "date": "2026-01-02",
      "positive": 18,
      "neutral": 6,
      "negative": 2
    },
    ...
  ]
}
\`\`\`

**Used In**: Trend analysis charts

---

### 9. Negative Feedback

**Endpoint**: `GET /analytics/negative-feedback`

**Purpose**: Get all negative feedback for analysis

**Request**:
\`\`\`python
response = requests.get(f"{API_BASE_URL}/analytics/negative-feedback")
\`\`\`

**Response**:
\`\`\`json
{
  "total": 15,
  "feedback": [
    {
      "id": 5,
      "feedback_text": "App crashes frequently",
      "sentiment": "Negative",
      "intent": "Bug Report",
      "timestamp": "2026-01-02T10:00:00",
      ...
    },
    ...
  ]
}
\`\`\`

**Used In**: Negative feedback analysis section

## Error Handling

### HTTP Status Codes

- **200 OK**: Successful request
- **201 Created**: Resource created successfully
- **400 Bad Request**: Invalid request data
- **404 Not Found**: Resource not found
- **500 Internal Server Error**: Server error

### Error Response Format

\`\`\`json
{
  "detail": "Error message describing what went wrong"
}
\`\`\`

### UI Error Handling

The dashboard implements comprehensive error handling:

\`\`\`python
try:
    response = requests.get(f"{API_BASE_URL}/feedback/all")
    response.raise_for_status()
    data = response.json()
except requests.exceptions.ConnectionError:
    st.error("Failed to connect to API. Please check your connection.")
except requests.exceptions.Timeout:
    st.error("Request timed out. Please try again.")
except requests.exceptions.HTTPError as e:
    st.error(f"API error: {e.response.status_code}")
except Exception as e:
    st.error(f"Unexpected error: {str(e)}")
\`\`\`

## Request/Response Flow

### Typical Flow for Submitting Feedback

1. **User Input**: User fills out feedback form in UI
2. **Validation**: Client-side validation of required fields
3. **API Request**: POST request to `/feedback/add`
4. **Backend Processing**:
   - Text preprocessing
   - Sentiment analysis (ML model)
   - Intent classification (ML model)
   - Database storage
5. **API Response**: Returns analyzed feedback with predictions
6. **UI Update**: Display results to user

### Typical Flow for Viewing Analytics

1. **Page Load**: User navigates to Analytics page
2. **API Request**: GET request to `/analytics/summary`
3. **Backend Processing**:
   - Query database
   - Aggregate statistics
   - Calculate distributions
4. **API Response**: Returns analytics data
5. **UI Rendering**: Create charts and visualizations

## Performance Considerations

### Caching

The UI implements caching for frequently accessed data:

\`\`\`python
@st.cache_data(ttl=300)  # Cache for 5 minutes
def get_all_feedback():
    response = requests.get(f"{API_BASE_URL}/feedback/all")
    return response.json()
\`\`\`

### Pagination

For large datasets, consider implementing pagination:

\`\`\`python
# Future enhancement
params = {"page": 1, "limit": 50}
response = requests.get(f"{API_BASE_URL}/feedback/all", params=params)
\`\`\`

### Timeout Settings

All requests include timeout settings:

\`\`\`python
response = requests.get(
    f"{API_BASE_URL}/feedback/all",
    timeout=30  # 30 seconds
)
\`\`\`

## Security

### HTTPS

Always use HTTPS in production:
- ✅ `https://scfip-backend.onrender.com/api`
- ❌ `http://scfip-backend.onrender.com/api`

### CORS

The backend is configured to accept requests from Streamlit Cloud domains.

### Input Validation

All user inputs are validated before sending to API:
- Required fields checked
- Data types validated
- Length limits enforced

## Testing API Integration

### Manual Testing

Test API connectivity:

\`\`\`python
import requests

API_BASE_URL = "https://scfip-backend.onrender.com/api"

# Test health endpoint
response = requests.get(f"{API_BASE_URL}/health")
print(response.json())
\`\`\`

### Using cURL

\`\`\`bash
# Health check
curl https://scfip-backend.onrender.com/api/health

# Get all feedback
curl https://scfip-backend.onrender.com/api/feedback/all

# Add feedback
curl -X POST https://scfip-backend.onrender.com/api/feedback/add \\
  -H "Content-Type: application/json" \\
  -d '{
    "feedback_text": "Test feedback",
    "customer_id": "TEST001",
    "product": "Test Product",
    "rating": 5
  }'
\`\`\`

## Troubleshooting

### Common Issues

#### 1. Connection Refused

**Cause**: Backend API is not running or URL is incorrect

**Solution**:
- Verify backend is deployed: https://scfip-backend.onrender.com/health
- Check `API_BASE_URL` configuration
- Ensure URL ends with `/api`

#### 2. CORS Errors

**Cause**: Backend not configured to accept requests from your domain

**Solution**:
- Contact backend administrator
- Verify CORS settings in backend configuration

#### 3. Timeout Errors

**Cause**: Request taking too long (cold start, large dataset)

**Solution**:
- Increase timeout value
- Implement loading indicators
- Consider pagination for large datasets

#### 4. 404 Not Found

**Cause**: Incorrect endpoint URL

**Solution**:
- Verify endpoint path
- Check API documentation
- Ensure API version compatibility

## API Versioning

Current API version: **v1**

The API is designed to be backward compatible. Future versions will be introduced with new endpoints if breaking changes are needed.

## Rate Limiting

Currently, no rate limiting is implemented. For production use, consider:
- Implementing client-side request throttling
- Caching responses where appropriate
- Batching requests when possible

## Support

For API-related issues:
- Check backend logs on Render
- Review API documentation
- Open issue on GitHub: https://github.com/Pawantripathi2606/SCFIP-backend

---

**Last Updated**: 2026-01-02
