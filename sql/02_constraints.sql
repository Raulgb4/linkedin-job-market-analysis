-- ==================================
-- CONSTRAINTS & FOREIGN KEYS
-- ==================================

ALTER TABLE job_postings       DROP CONSTRAINT IF EXISTS fk_job_postings_company;
ALTER TABLE salaries           DROP CONSTRAINT IF EXISTS fk_salaries_job;
ALTER TABLE employee_counts    DROP CONSTRAINT IF EXISTS fk_employee_counts_company;
ALTER TABLE job_skills         DROP CONSTRAINT IF EXISTS fk_job_skills_job;
ALTER TABLE job_skills         DROP CONSTRAINT IF EXISTS fk_job_skills_skill;
ALTER TABLE job_industries     DROP CONSTRAINT IF EXISTS fk_job_industries_job;
ALTER TABLE job_industries     DROP CONSTRAINT IF EXISTS fk_job_industries_industry;
ALTER TABLE company_industries DROP CONSTRAINT IF EXISTS fk_company_industries_company;
ALTER TABLE company_industries DROP CONSTRAINT IF EXISTS fk_company_industries_industry;

-- --------------------------
-- Foreign keys
-- --------------------------

ALTER TABLE job_postings
  ADD CONSTRAINT fk_job_postings_company
  FOREIGN KEY (company_id)
  REFERENCES companies(company_id)
  ON UPDATE CASCADE
  ON DELETE SET NULL;

ALTER TABLE salaries
  ADD CONSTRAINT fk_salaries_job
  FOREIGN KEY (job_id)
  REFERENCES job_postings(job_id)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

ALTER TABLE employee_counts
  ADD CONSTRAINT fk_employee_counts_company
  FOREIGN KEY (company_id)
  REFERENCES companies(company_id)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

ALTER TABLE job_skills
  ADD CONSTRAINT fk_job_skills_job
  FOREIGN KEY (job_id)
  REFERENCES job_postings(job_id)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

ALTER TABLE job_skills
  ADD CONSTRAINT fk_job_skills_skill
  FOREIGN KEY (skill_abr)
  REFERENCES skills(skill_abr)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

ALTER TABLE job_industries
  ADD CONSTRAINT fk_job_industries_job
  FOREIGN KEY (job_id)
  REFERENCES job_postings(job_id)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

ALTER TABLE job_industries
  ADD CONSTRAINT fk_job_industries_industry
  FOREIGN KEY (industry_id)
  REFERENCES industries(industry_id)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

ALTER TABLE company_industries
  ADD CONSTRAINT fk_company_industries_company
  FOREIGN KEY (company_id)
  REFERENCES companies(company_id)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

ALTER TABLE company_industries
  ADD CONSTRAINT fk_company_industries_industry
  FOREIGN KEY (industry_id)
  REFERENCES industries(industry_id)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

-- --------------------------
-- Basic CHECK constraints
-- --------------------------

ALTER TABLE job_postings
  DROP CONSTRAINT IF EXISTS chk_job_postings_views_nonneg,
  DROP CONSTRAINT IF EXISTS chk_job_postings_applies_nonneg;

ALTER TABLE job_postings
  ADD CONSTRAINT chk_job_postings_views_nonneg  CHECK (views   IS NULL OR views >= 0),
  ADD CONSTRAINT chk_job_postings_applies_nonneg CHECK (applies IS NULL OR applies >= 0);

ALTER TABLE salaries
  DROP CONSTRAINT IF EXISTS chk_salaries_nonneg;

ALTER TABLE salaries
  ADD CONSTRAINT chk_salaries_nonneg CHECK (
    (min_salary IS NULL OR min_salary >= 0) AND
    (med_salary IS NULL OR med_salary >= 0) AND
    (max_salary IS NULL OR max_salary >= 0) AND
    (salary_yearly IS NULL OR salary_yearly >= 0)
  );

-- --------------------------
-- (Opcional) Uniques útiles
-- --------------------------

ALTER TABLE skills
  DROP CONSTRAINT IF EXISTS uq_skills_skill_name;

ALTER TABLE skills
  ADD CONSTRAINT uq_skills_skill_name UNIQUE (skill_name);
