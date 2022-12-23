----------------------------------------
-- public schema. (re-)create sql
----------------------------------------
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;
SET search_path TO public;
SET client_min_messages TO WARNING;