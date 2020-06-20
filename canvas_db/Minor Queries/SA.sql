USE canvas;
SELECT
LEFT (sis_source_id, 5) "Course ID" 
, RIGHT (sis_source_id, 6) "Term ID"
FROM course_dim
WHERE course_dim.sis_source_id IS NOT NULL
;

------------------------------------------------------------
-- # ?
-- PIDM ?
G# 
Student first NAME /* this can be done via name in user_dim.name although it appears as full name; user_dim.name AS "Full Name" */
Student Last NAME /* see above */
Age /* I can do Birthdate in user_dim.birthdate AS "Birthdate" (although it needs to be brought from Banner because as of right now all data appears as null) */
IPEDS Ethnicity /* ? */
Ethnicity /* from Banner */
Gender /* user_dim.gender AS "Gender" (Do we need to synchronize it with Banner?) */
Denomination /* from Banner */
Citizenship /* from Banner */
Korean Classes Taken (flag) /* from Banner */
Spanish Classes Taken (flag) /* from Banner */
School /* user_dim.school_name AS "School" */
Program /* from Banner */
Program Desc /* from Banner */
Program Lang /* from Banner */
Year (term) /* enrollment_term_dim.name AS "Term Name" ??? */
Term code /* enrollment_term_dim.sis_source_id AS "Term Code" */
section modality  /* from Banner? */
section CRN  /* course_section_dim.sis_source_id AS "Section CRN" or course_dim.sis_source_id As "Course SIS" */
Section Subject  /* course_dim.code AS "Course Catalog" */
Section Number /* Concatenated with Subject */
Section Title /* course_dim.name AS "Course Title" */
School Offered Section /* from Banner */

assessment title /* from Banner */
assessment TYPE

attempts
outcome score
assessment question
assignment url /*  */


LO mastered /*  */
LO rating (description?) /* learning_outcome_rubric_criterion_dim.description AS "LO Rubric Criterion Description" */
LO rating points /* learning_outcome_rubric_criterion_fact.points AS "LO Rubric Criterion Points" */

--  

3. Student SIS id - yes. I want this.

learning_outcome_fact.points_possible AS "LO Possible Points"

12. outcome score - ESSENTIAL

course_dim.name AS "Course Title"
enrollment_term_dim.sis_source_id AS "Term Code"
learning_outcome_fact.points_possible AS "LO Possible Points"

-- + plus modality, student's program, language of course

1. Student name (one field) - non-essential, but helpful
8. Submission score - may be useful in future
11. attempt -  non-essential, but helpful
23. Learning outcome rating - doesn't hurt

-- Now, if you're up for processing some data, it would be additionally quite helpful to calculate the following fields by breaking up what is currently in the data, but only if it's not too hard, since I'm already breaking these things out on my side:
-- Quarter code (i.e. 201904)
-- CRN (i.e. 47177)
-- Catalog Number (i.e. MT520)