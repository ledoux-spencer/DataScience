# INN Hotels

Date: Jun 2026  
Course: Classification Techniques for Predictive Modeling

Summary
- Analyze hotel booking data to identify drivers of cancellations.
- Build a predictive model to forecast bookings likely to be canceled to inform policy and operations.

Files (suggested)
- notebooks/INN_Hotels.ipynb — exploratory analysis and modeling pipeline
- data/ — sample datasets or pointers to original data source
- reports/ — model performance plots (ROC, confusion matrix), feature importance

How to run
- Requirements: Python 3.8+, pandas, numpy, scikit-learn, matplotlib, seaborn
- Run:
  - pip install -r requirements.txt
  - jupyter notebook notebooks/INN_Hotels.ipynb

Modeling overview
1. EDA: time features, booking lead time, customer type, seasonal patterns.
2. Preprocessing: handling categorical variables, missing values, feature engineering (lead time buckets, weekend flags).
3. Models: Logistic Regression (with multicollinearity checks), Decision Tree (with pruning), possibly ensemble baseline.
4. Evaluation: AUC-ROC, precision/recall, calibration checks.

Skills & Tools Covered
- EDA, Data Preprocessing, Logistic Regression, Multicollinearity, AUC-ROC, Decision Tree, Pruning

Contact
- ledouxs@gmail.com

Business impact (example)
- Targeted offers and stricter refund policies for high-cancellation-risk bookings.
- Operational staffing optimization based on predicted cancellation rates.
