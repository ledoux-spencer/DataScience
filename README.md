# DataScience — Graduate Certificate Portfolio

A collection of Python projects completed as part of the Graduate Certificate program at UT McCombs School of Business (delivered via Great Learning). Each project folder contains a README with a project summary, the Colab/Jupyter notebook(s), and suggested artifacts.

## Projects
- [Trade&Ahead](./TradeAndAhead) — Pattern Discovery with Unsupervised Learning  
- [EasyVisa](./EasyVisa) — Robust Data Modeling with Ensembling and Tuning Techniques  
- [INN Hotels](./INN_Hotels) — Classification Techniques for Predictive Modeling  
- [ReCell](./ReCell) — Predictive Modeling with Linear Regression  
- [E-news Express](./E-News_Express) — Decision Making with Business Statistics  
- [FoodHub Analysis](./FoodHub) — Data-driven Insights using Python  

## How to view & run
- View notebooks on GitHub or open them in Google Colab.
- To run locally:
  1. Clone the repository:
     ```
     git clone https://github.com/ledoux-spencer/DataScience.git
     cd DataScience
     ```
  2. Create a virtual environment and install dependencies (example):
     ```
     python -m venv .venv
     source .venv/bin/activate   # macOS / Linux
     .venv\Scripts\activate      # Windows
     pip install -r requirements.txt
     ```
  3. Launch Jupyter if you want to run locally:
     ```
     jupyter notebook
     ```

## Repository structure (recommended)
- `TradeAndAhead/`, `EasyVisa/`, `INN_Hotels/`, `ReCell/`, `E-News_Express/`, `FoodHub/` — per-project folders with README and notebooks
- `requirements.txt` — list of Python packages used
- `README.md` — this file
- `data/` — (optional) sample data or small datasets; large datasets are excluded

## Data & reproducibility
- Large raw datasets are not included in this repository. See each project README for dataset references and instructions to obtain sample data.
- Notebooks have had outputs cleared to reduce repo size. If you need a runnable environment, see `requirements.txt` and consider using Google Colab.

## License
- For viewing only — not for reuse "These materials are provided for viewing as a portfolio of my work. They are not to be reproduced, redistributed, modified, or used for any purpose without my prior written permission (Spencer LeDoux — ledouxs@gmail.com)."

## Acknowledgements
These projects were completed as part of the Graduate Certificate program at UT McCombs School of Business, delivered via Great Learning.

## Contact
Spencer LeDoux — ledouxs@gmail.com

## Environment

- Python: tested with Python 3.8+.
- Recommended packages: pandas, numpy, scikit-learn, matplotlib, seaborn, scipy, statsmodels.
- Optional (used in some projects): xgboost, lightgbm, imbalanced-learn, jupyter, nbconvert.
- Notes:
  - Notebooks were developed in Google Colab and should open there without extra configuration.
  - If you want to run locally, create a virtual environment and install packages (for example: `pip install -r requirements.txt` if a requirements file is present).
  - Large raw datasets are not included in this repo.
