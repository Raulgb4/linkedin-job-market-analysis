/*

companies ─────┐
               ├── job_postings ─── job_skills ─── skills
               │
               └── company_industries ─── industries

job_postings ─── job_industries ─── industries
job_postings ─── salaries

*/

-- =========================
-- 01) CORE TABLE: companies
-- =========================

CREATE TABLE IF NOT EXISTS companies (
  company_id   BIGINT PRIMARY KEY,
  name         TEXT NOT NULL,
  description  TEXT,
  company_size INTEGER,
  state        TEXT,
  country      TEXT,
  city         TEXT,
  zip_code     TEXT,
  address      TEXT,
  url          TEXT
);

-- =========================
-- 02) DIMENSION TABLE: skills
-- =========================

CREATE TABLE IF NOT EXISTS skills (
  skill_abr  TEXT PRIMARY KEY,
  skill_name TEXT NOT NULL
);

-- ============================
-- 03) DIMENSION TABLE: industries
-- ============================

CREATE TABLE IF NOT EXISTS industries (
  industry_id   INTEGER PRIMARY KEY,
  industry_name TEXT NOT NULL
);

-- ============================
-- 04) CORE TABLE: job_postings
-- ============================

CREATE TABLE IF NOT EXISTS job_postings (
  job_id                      BIGINT PRIMARY KEY,
  company_id                  BIGINT,
  company_name                TEXT,

  title                       TEXT,
  description                 TEXT,

  location                    TEXT,
  zip_code                    TEXT,
  fips                        TEXT,

  formatted_work_type         TEXT,
  formatted_experience_level  TEXT,
  remote_allowed              BOOLEAN,

  job_posting_url             TEXT,
  application_url             TEXT,
  application_type            TEXT,
  posting_domain              TEXT,

  views                       INTEGER,
  applies                     INTEGER,

  original_listed_time        BIGINT,
  listed_time                 BIGINT,
  expiry                      BIGINT,
  closed_time                 BIGINT,

  sponsored                   BOOLEAN,

  skills_desc                 TEXT
);


-- =======================
-- 05) FACT TABLE: salaries
-- =======================

CREATE TABLE IF NOT EXISTS salaries (
  salary_id          BIGINT PRIMARY KEY,
  job_id             BIGINT NOT NULL,

  max_salary         NUMERIC,
  med_salary         NUMERIC,
  min_salary         NUMERIC,

  pay_period         TEXT,
  currency           TEXT,
  compensation_type  TEXT,

  salary_value       NUMERIC,
  salary_yearly      NUMERIC
);

-- =================================
-- 06) FACT TABLE: employee_counts
-- =================================

CREATE TABLE IF NOT EXISTS employee_counts (
  company_id       BIGINT NOT NULL,
  time_recorded    BIGINT NOT NULL,

  employee_count   INTEGER,
  follower_count   INTEGER,

  PRIMARY KEY (company_id, time_recorded)
);

-- ===========================
-- 07) BRIDGE TABLE: job_skills
-- ===========================

CREATE TABLE IF NOT EXISTS job_skills (
  job_id    BIGINT NOT NULL,
  skill_abr TEXT   NOT NULL,

  PRIMARY KEY (job_id, skill_abr)
);

-- ===============================
-- 08) BRIDGE TABLE: job_industries
-- ===============================

CREATE TABLE IF NOT EXISTS job_industries (
  job_id      BIGINT  NOT NULL,
  industry_id INTEGER NOT NULL,

  PRIMARY KEY (job_id, industry_id)
);


-- ==================================
-- 09) BRIDGE TABLE: company_industries
-- ==================================

CREATE TABLE IF NOT EXISTS company_industries (
  company_id  BIGINT  NOT NULL,
  industry_id INTEGER NOT NULL,

  PRIMARY KEY (company_id, industry_id)
);
