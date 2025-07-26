##Challenge 1a: PDF Processing Solution

## Overview
This is a machine learning pipeline designed to automatically identify and classify structural headings (such as Title, Section, Subsection, and Subsubsection) from PDF documents, with a particular strength in processing research papers. The system leverages a robust dataset curated from arXiv, ensuring high accuracy and reliability for academic and scientific documents.

---

## 1. Data Collection & Preparation
- **Source**: The dataset is built from LaTeX source files of approximately 1,400 research papers downloaded from [arXiv](https://arxiv.org). This ensures the model is highly attuned to the structure and conventions of scientific writing.
- **Extraction**: Custom scripts parse LaTeX commands such as `\title{}`, `\section{}`, `\subsection{}`, and `\subsubsection{}` to extract headings and assign them to the classes: Title, H1, H2, and H3.
- **Preprocessing**: The extracted text is cleaned by removing LaTeX commands, normalizing case, and optionally removing stopwords and punctuation. This results in a high-quality, labeled dataset suitable for training.

---

## 2. Exploratory Data Analysis (EDA)
- **Class Distribution**: The dataset contains four classes (Title, H1, H2, H3) with some class imbalance, visualized using bar plots.
- **Text Length Analysis**: Distribution plots show that while Title lengths are normally distributed, H1, H2, and H3 are more skewed, indicating that text length alone is not a strong discriminator.
- **Noise & Balance**: The dataset is checked for noise and missing values, ensuring robust training data.

---

## 3. Model Pipeline
- **Vectorization**: Uses TF-IDF (Term Frequency-Inverse Document Frequency) vectorization to convert text headings into numerical features, capturing the importance of words and n-grams.
- **Classifier**: Employs a Logistic Regression model (with options for SGDClassifier for incremental learning) to perform multi-class classification. The model is trained with class balancing to address dataset imbalance.
- **Training**: The model is trained and validated using stratified splits to ensure fair evaluation. Training progress and performance are visualized with loss and accuracy plots.

---

## 4. Heading Extraction & Classification from PDFs
- **PDF Parsing**: The system uses heuristics (font size, boldness, position, etc.) to extract candidate headings from PDF files.
- **Classification**: Extracted headings are passed through the trained model, which predicts their structural level (Title, H1, H2, H3).
- **Output**: Results are saved as a structured JSON file, including heading text, page number, and predicted class.

---

## 5. Model Performance
The final model demonstrates strong and consistent performance across all section classes when evaluated on an independent test set:

- **Loss:** 0.1366
- **Overall Accuracy:** 96.4%

| Class   | Precision | Recall | F1-Score | Support |
|---------|-----------|--------|----------|---------|
| H1      | 0.97      | 0.92   | 0.94     | 1586    |
| H2      | 1.00      | 1.00   | 1.00     | 2051    |
| H3      | 0.90      | 0.94   | 0.92     | 1018    |
| Title   | 0.95      | 0.99   | 0.97     | 941     |

**Averages:**
- **Macro avg F1:** 0.96
- **Weighted avg F1:** 0.96

---

## 6. Strengths & Applicability
- **Optimized for Research Papers**: Since the training data is sourced from arXiv, the model is especially effective for academic and scientific documents, where heading structures follow similar conventions.
- **Generalizability**: While optimized for research papers, the approach can be adapted to other structured documents with similar heading patterns.
- **Automation**: Enables automated document analysis, metadata extraction, and downstream NLP tasks for large collections of PDFs.

---

## 7. How to Use
1. **Classify Headings**: Run the PDF parsing and classification script to extract and label headings from new PDF files.
2. **Analyze Output**: Use the structured JSON output for further document analysis or integration into other systems.

---
