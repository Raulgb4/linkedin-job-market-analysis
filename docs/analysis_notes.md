# Analysis Notes  
## LinkedIn Job Market Analysis (2023–2024)

---

## 1. Context and Audience

### Target audience
**Hiring Managers / Talent & HR decision-makers**

The analysis is designed to support hiring and workforce planning decisions by providing a clear,
data-driven view of the current job market based on real LinkedIn job postings.

The focus is on **market signals and patterns**, not on predictive modeling.

---

## 2. Data Quality and Analytical Considerations

This section summarizes the main dataset characteristics and limitations that influence
how results should be interpreted.

### 2.1 Location field
- The `location` field mixes different geographic levels (e.g. country-level and city-level:
  `"United States"`, `"New York, NY"`, `"San Francisco, CA"`).
- This reflects how locations are reported on LinkedIn.
- No normalization was applied to avoid introducing assumptions or inaccuracies.
- Location is therefore treated as a **descriptive attribute**, suitable for relative comparisons
  but not precise geographic aggregation.

### 2.2 Job titles
- Job titles are not standardized.
- Similar roles may appear under different names due to wording, seniority, or company conventions.
- Title normalization was intentionally avoided, as it would require semantic modeling
  and could introduce subjective bias.
- Titles are used as a **practical proxy for roles**, with volume-based filters applied
  to ensure robustness.

### 2.3 Remote work indicator
- The `remote_allowed` field only contains positive values (`1`) and missing values.
- Missing values do **not** indicate on-site roles, only absence of explicit remote information.
- The analysis therefore focuses on **explicitly remote-allowed roles**, not a full
  remote vs hybrid vs on-site classification.

### 2.4 Salary data
- Salary information is not available for all postings.
- Compensation analysis is based on **annualized salary values** to ensure comparability
  across hourly and yearly pay structures.
- Volume thresholds are applied to avoid drawing conclusions from sparse data.

---

## 3. Visualization and Storytelling Framework

### Purpose of this phase
This phase transforms analytical results into **clear, decision-oriented insights** through:
- curated metrics
- focused visualizations
- narrative structure

The output of this phase feeds directly into:
- the Visualization & Storytelling notebook
- potential Power BI dashboards
- portfolio presentation material

---
