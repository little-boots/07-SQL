﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" String   NOT NULL,
    "dept_name" String   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" Int   NOT NULL,
    "birth_date" Int   NOT NULL,
    "first_name" String   NOT NULL,
    "last_name" String   NOT NULL,
    "gender" String   NOT NULL,
    "hire_date" Int   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" Int   NOT NULL,
    "dept_no" String   NOT NULL,
    "from_date" Int   NOT NULL,
    "to_date" Int   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" String   NOT NULL,
    "emp_no" Int   NOT NULL,
    "from_date" Int   NOT NULL,
    "to_date" Int   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" Int   NOT NULL,
    "salaray" Int   NOT NULL,
    "from_date" Int   NOT NULL,
    "to_date" Int   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" Int   NOT NULL,
    "title" String   NOT NULL,
    "from_date" Int   NOT NULL,
    "to_date" Int   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

