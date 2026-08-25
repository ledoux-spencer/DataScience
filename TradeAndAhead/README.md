# Trade&Ahead

Date: Jul 2026  
Course: Pattern Discovery with Unsupervised Learning

Summary
- Analyze stock data to group stocks by shared characteristics using unsupervised learning.
- Provide cluster profiles and interpret the characteristics and business meaning of each group.

Key goals
- Discover natural groupings among stocks based on chosen features.
- Describe and visualize characteristics of each cluster for actionable insights.

Files (suggested)
- notebooks/TradeAndAhead.ipynb — main Colab notebook with EDA and clustering steps
- data/ — (not committed if large) raw and cleaned datasets (include README in data/)
- reports/ — cluster profiling outputs and plots (PNG/SVG)
- README.md — this file

How to run
- Open the notebook in Google Colab or Jupyter.
- Requirements: Python 3.8+, pandas, numpy, scikit-learn, matplotlib, seaborn, scipy
- To run locally:
  - pip install -r requirements.txt
  - jupyter notebook notebooks/TradeAndAhead.ipynb

Analysis steps (high level)
1. Exploratory Data Analysis (EDA): data cleaning, missing values, feature distributions.
2. Feature selection and scaling (StandardScaler or MinMax).
3. KMeans clustering: choose k (elbow method, silhouette), run and interpret centroids.
4. Hierarchical clustering: dendrograms and linkage to confirm structure.
5. Cluster profiling: summary statistics per cluster, typical stock attributes, visualization.

Skills & Tools Covered
- EDA, KMeans, Hierarchical Clustering, Cluster Profiling, data visualization

Contact
- ledouxs@gmail.com

Notes
- Remove or redact any sensitive financial data before publishing.
- For reproducibility, include random seeds and a requirements.txt file.
