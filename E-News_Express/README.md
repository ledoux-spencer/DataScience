# E-news Express Project

Date: Apr 2026  
Course: Decision Making with Business Statistics

Summary
- Use A/B testing and statistical analysis to evaluate whether a new landing page increases subscriber conversions.
- Analyze simulated dataset containing conversion flags, time spent, and user language preferences.

Files (suggested)
- notebooks/EnewsExpress.ipynb — data simulation (if used), A/B test analysis, visualizations
- reports/ — hypothesis test results, charts, summary recommendations

How to run
- Requirements: Python 3.8+, pandas, numpy, scipy, statsmodels, matplotlib, seaborn
- Run:
  - pip install -r requirements.txt
  - jupyter notebook notebooks/EnewsExpress.ipynb

Analysis workflow
1. Data checks: sample sizes by group, baseline balance.
2. Hypothesis testing: conversion rate comparison (proportions test), t-tests for time spent.
3. A/B test metrics: lift, confidence intervals, p-values, power analysis.
4. Additional analysis: dependence of conversion on preferred language (chi-square test or logistic regression).
5. Visualizations: conversion by group, time-spent distributions, language-wise conversion.

Skills & Tools Covered
- Hypothesis testing, A/B testing, Data Visualization, Statistical Inference

Contact
- ledouxs@gmail.com

Business recommendation (example)
- If conversion lift is statistically significant and practically meaningful, roll out the new landing page; otherwise run further experimentation or segment-specific tests.
