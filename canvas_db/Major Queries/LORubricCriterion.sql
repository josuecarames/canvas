USE canvas;
SELECT 
account_dim.name AS "Account Name"
, account_dim.workflow_state AS "Account Status"
, enrollment_term_dim.name AS "Term Name"
, enrollment_term_dim.date_start AS "Term Start On"
, enrollment_term_dim.date_end AS "Term Ends On"
, course_dim.sis_source_id As "Course SIS"
, course_dim.code AS "Course Catalog"
, course_dim.name AS "Course Name"
, course_dim.created_at AS "Course Created At"
, course_dim.start_at AS "Course Started At"
, course_dim.conclude_at AS "Course Concluded At"
, course_dim.workflow_state AS "Course State"
, learning_outcome_dim.calculation_int AS "LO Calculation Int"
, learning_outcome_dim.calculation_method AS "LO Calculation Method"
, learning_outcome_dim.created_at AS "LO Created At"
, learning_outcome_dim.display_name AS "LO Display Name"
, learning_outcome_dim.description AS "LO Description"
, learning_outcome_dim.short_description AS "LO Short Description"
, learning_outcome_dim.updated_at AS "LO Updated At"
, learning_outcome_dim.workflow_state AS "LO State"
, learning_outcome_rubric_criterion_dim.description AS "LO Rubric Criterion Description"
, learning_outcome_rubric_criterion_fact.points AS "LO Rubric Criterion Points"
FROM learning_outcome_rubric_criterion_fact
JOIN account_dim ON account_dim.id = learning_outcome_rubric_criterion_fact.account_id
JOIN learning_outcome_dim ON learning_outcome_dim.id = learning_outcome_rubric_criterion_fact.learning_outcome_id
JOIN learning_outcome_rubric_criterion_dim ON learning_outcome_rubric_criterion_dim.id = learning_outcome_rubric_criterion_fact.learning_outcome_rubric_criterion_id
LEFT JOIN course_dim ON course_dim.id = learning_outcome_rubric_criterion_fact.course_id
LEFT JOIN enrollment_term_dim ON enrollment_term_dim.id = learning_outcome_rubric_criterion_fact.enrollment_term_id;