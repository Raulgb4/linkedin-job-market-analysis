# Analysis Notes
LinkedIn Job Market Analysis (2023–2024)

> Working document for exploration, observations, and decisions taken during the analysis.
> This file is not intended as final documentation.

---

## Data Quality Issues (Dataset understanding and EDA)

  - Too many nulls in company_size 24473 - 21699 = 2774 nulls in companies
  - Too many nulls in pay_period in salaries
  - Too many nulls in closed_time in postings
  - Registers detected with `country`, `state`, `zipcode`  field containing `"0"`, which is not valid null in companies
  - Registers detected with `address` field containing `"."` and `"-"`, which is not valid nul in companies
  - The location field mixes different geographic levels (e.g., country and city), resulting in a non-homogeneous granularity.
    (e.g., "United States", "New York, NY", "San Francisco, CA") in postings
  - Job titles are not standardized, and similar roles may appear under different names (e.g., variations by seniority 
    or wording) in postings
  - Two columns related to job type are available: `work_type` and `formatted_work_type`.
     While they convey similar information, `formatted_work_type` provides a cleaner and
     more standardized representation, making it more suitable for exploratory analysis.
  - The `remote_allowed` field does not contain an explicit negative category (0).
    Only positive values (1.0) are present, while the remaining records are missing.
    This suggests that the field acts as a flag indicating explicitly remote-allowed
    positions, rather than a complete remote vs non-remote classification.

---

## Questions Arising During Analysis
- Questions to investigate later:
- Potential business questions:
- Hypotheses to validate:

---

## Analysis Direction Decisions
- Scope adjustments:
- Focus areas selected:
- Analyses postponed or discarded:

---

## Notes on SQL Modeling
- Tables created:
- Indexing considerations:
- Query performance notes:

---

## Visualization Ideas
- Charts to build:
- Metrics to highlight:
- Storytelling ideas:


---