# Titanic Survival Analysis: End-to-End Data Analytics Project

## Project Overview

This project investigates whether passenger class influenced survival rates during the Titanic disaster and whether certain age groups were more vulnerable than others.

The project was completed using a full end-to-end analytics workflow, beginning with stakeholder requirements gathering and ending with dashboard development and business recommendations.

## Business Problem

A fictional shipbuilding company wanted to understand whether cabin design and passenger class affected survival outcomes during the Titanic disaster.

### Key Questions

- Did passenger class affect survival rates?
- Were some age groups more vulnerable than others?
- Did survival patterns differ across passenger classes and age categories?

## Tools Used

- SQL
- Python (Pandas)
- Tableau / Power BI
- Excel

## Project Workflow

### 1. Requirements Gathering

Worked through a stakeholder scenario to identify business requirements and define project objectives.

### 2. Data Extraction

Queried Titanic passenger data using SQL.

### 3. Data Cleaning

- Identified missing age values
- Replaced missing ages using mean imputation
- Checked data quality and summary statistics

### 4. Feature Engineering

Created age categories:

- Child (0–14)
- Youth & Adult (15–64)
- Senior (65+)

### 5. Exploratory Data Analysis

Investigated:

- Survival rates by passenger class
- Survival rates by age category
- Missing values
- Distribution of passenger ages

### 6. Dashboard Development

Created an interactive dashboard to visualise:

- Number of survivors by passenger class
- Survival rate (%) by passenger class
- Survival rate (%) by passenger class and age category

## Dashboard

(Add dashboard screenshot here)

```markdown
![Dashboard Overview](dashboard-overview.png)
```

## Key Findings

- First-class passengers had the highest survival rate (63%)
- Second-class passengers had a survival rate of 47%
- Third-class passengers had the lowest survival rate (24%)
- Children generally had higher survival rates than adults and seniors
- Passenger class remained a significant factor even when age was considered

## Recommendations

- Consider passenger class as a major factor affecting survival outcomes
- Treat lower-class passengers as a potentially vulnerable group in emergency planning
- Investigate whether access to emergency exits and equipment differed across passenger classes
- Conduct further statistical testing to validate observed patterns

## Skills Demonstrated

- Business requirements gathering
- SQL querying
- Python programming
- Data cleaning
- Exploratory data analysis
- Dashboard development
- Data visualisation
- Insight generation
- Business recommendations

## Repository Contents

- Titanic_End_to_End_Project.ipynb
- 
  <img width="675" height="512" alt="TitanicTableauDashboard" src="https://github.com/user-attachments/assets/2712e596-26d0-48ec-9e99-63a0c2c0c37e" />

- README.md
