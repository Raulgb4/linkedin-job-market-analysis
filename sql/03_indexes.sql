-- ==================================
-- INDEXES (performance for joins & filters)
-- ==================================

-- --------------------------
-- job_postings
-- --------------------------

CREATE INDEX IF NOT EXISTS idx_job_postings_company_id
  ON job_postings(company_id);

CREATE INDEX IF NOT EXISTS idx_job_postings_remote_allowed
  ON job_postings(remote_allowed);

CREATE INDEX IF NOT EXISTS idx_job_postings_work_type
  ON job_postings(formatted_work_type);

CREATE INDEX IF NOT EXISTS idx_job_postings_experience_level
  ON job_postings(formatted_experience_level);

CREATE INDEX IF NOT EXISTS idx_job_postings_listed_time
  ON job_postings(listed_time);

CREATE INDEX IF NOT EXISTS idx_job_postings_original_listed_time
  ON job_postings(original_listed_time);

CREATE INDEX IF NOT EXISTS idx_job_postings_zip_code
  ON job_postings(zip_code);

CREATE INDEX IF NOT EXISTS idx_job_postings_fips
  ON job_postings(fips);

-- --------------------------
-- salaries
-- --------------------------

CREATE INDEX IF NOT EXISTS idx_salaries_job_id
  ON salaries(job_id);

CREATE INDEX IF NOT EXISTS idx_salaries_currency
  ON salaries(currency);

CREATE INDEX IF NOT EXISTS idx_salaries_pay_period
  ON salaries(pay_period);

-- --------------------------
-- employee_counts
-- --------------------------

-- La PK ya indexa (company_id, time_recorded),
-- pero si consultas por time_recorded (global) es útil:
CREATE INDEX IF NOT EXISTS idx_employee_counts_time_recorded
  ON employee_counts(time_recorded);

-- --------------------------
-- bridge tables
-- --------------------------

-- job_skills: PK (job_id, skill_abr) ya indexa por job_id,
-- añadimos el índice inverso para consultas por skill:
CREATE INDEX IF NOT EXISTS idx_job_skills_skill_abr
  ON job_skills(skill_abr);

-- job_industries: PK (job_id, industry_id) ya indexa por job_id,
-- añadimos inverso para consultas por industry:
CREATE INDEX IF NOT EXISTS idx_job_industries_industry_id
  ON job_industries(industry_id);

-- company_industries: PK (company_id, industry_id) ya indexa por company_id,
-- añadimos inverso para consultas por industry:
CREATE INDEX IF NOT EXISTS idx_company_industries_industry_id
  ON company_industries(industry_id);

-- --------------------------
-- Optional: Full-text search
-- --------------------------
-- Actívalo solo si vas a buscar por palabras en title/description.
-- Requiere una columna generada o un índice sobre expresión.
-- CREATE INDEX IF NOT EXISTS idx_job_postings_fts
--   ON job_postings USING GIN (to_tsvector('english', coalesce(title,'') || ' ' || coalesce(description,'')));
