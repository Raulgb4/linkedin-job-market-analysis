# Analysis Notes
LinkedIn Job Market Analysis (2023–2024)

> Working document for exploration, observations, and decisions taken during the analysis.
> This file is not intended as final documentation.

---

## Data Quality Issues (Dataset understanding and EDA)

- The `location` field mixes different geographic levels (e.g., country-level and
  city-level locations such as "United States", "New York, NY", "San Francisco, CA").
  This heterogeneity reflects the way job locations are reported on the platform.
  No normalization was applied to avoid introducing assumptions or inaccuracies.
  The field is therefore treated as a descriptive attribute with limited
  geographic comparability.

- Job titles are not standardized, and similar roles may appear under different
  names due to variations in wording and seniority levels. Title normalization was
  not performed during the cleaning phase, as it would require semantic analysis
  or domain-specific taxonomies and could introduce subjective bias.

- The `remote_allowed` field does not contain an explicit negative category (0).
  Only positive values (1.0) are present, while the remaining records are missing.
  This indicates that the field functions as a positive flag for explicitly
  remote-allowed positions rather than a complete remote vs non-remote
  classification. Missing values were left unchanged.


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