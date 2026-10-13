# Loan Approval Analysis

Exploratory analysis of 614 loan applications to find what drives loan approval, using Python, MySQL and Power BI.

## Tools
Python (Pandas, NumPy, Matplotlib, Seaborn) | MySQL | Power BI

## Key findings
- Overall approval rate: **68.7%**
- Credit history is the strongest driver: **79.0%** approved with a good credit history vs **7.9%** without
- Semiurban applicants had the highest approval rate (**76.8%**) vs Rural (**61.5%**)
- Graduates were approved more often than non-graduates (**70.8%** vs **61.2%**)

## What I did
1. **Data cleaning (Python):** treated missing values in 7 columns (mode / median), checked duplicates, exported a clean dataset
2. **EDA (Python):** univariate and bivariate analysis of categorical and numerical features against loan status
3. **SQL analysis (MySQL):** aggregations, CASE WHEN, filtering and derived columns, e.g. approval rate by gender and property area
4. **Dashboard (Power BI):** interactive dashboard of the findings

## Project structure
- `data/` raw and cleaned CSV
- `notebooks/` Python EDA and cleaning
- `sql/` MySQL queries
- `dashboard/` Power BI file (`.pbix`)
