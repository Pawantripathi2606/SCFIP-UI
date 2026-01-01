#!/bin/bash

# Download NLTK data
echo "Downloading NLTK data..."
python -c "import nltk; nltk.download('punkt'); nltk.download('punkt_tab'); nltk.download('stopwords'); nltk.download('wordnet'); nltk.download('omw-1')"

# Train models
echo "Training ML models..."
python ml/train_models.py

echo "Setup complete!"
