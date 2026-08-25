# ReCell

Date: May 2026  
Course: Predictive Modeling with Linear Regression

Summary
- Analyze used devices dataset to model pricing for used and refurbished devices.
- Provide a dynamic pricing strategy and highlight features with strong influence on price.

Files (suggested)
- notebooks/ReCell.ipynb — data cleaning, exploratory analysis, regression modeling
- data/ — dataset reference or sample CSV
- reports/ — regression diagnostics, residual plots, coefficient table

How to run
- Requirements: Python 3.8+, pandas, numpy, statsmodels, scikit-learn, matplotlib, seaborn
- Run:
  - pip install -r requirements.txt
  - jupyter notebook notebooks/ReCell.ipynb

Modeling steps
1. EDA: price distribution, outlier detection, categorical breakdowns.
2. Feature engineering: age of device, condition, storage, brand indicators.
3. Linear regression: OLS, diagnosis for heteroscedasticity and normality.
4. Statistical inference: p-values, confidence intervals, interpretation of coefficients.
5. Business recommendations: pricing bands, refurbishment ROI.

Skills & Tools Covered
- EDA, Linear Regression, Statistical Inference, Business Insights

Contact
- ledouxs@gmail.com

Notes
- Consider log-transforming price if distribution is skewed.
- Save final model parameters and a short “how to score” example for business users.
