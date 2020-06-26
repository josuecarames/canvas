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
, learning_outcome_group_dim.created_at AS "LO Group Created At"
, learning_outcome_group_dim.description AS "LO Group Description"
, learning_outcome_group_dim.title AS "LO Group Title"
, learning_outcome_group_dim.updated_at AS "LO Group Updated At"
, learning_outcome_group_dim.workflow_state AS "LO Group State"
FROM learning_outcome_group_fact
INNER JOIN account_dim ON account_dim.id = learning_outcome_group_fact.account_id
INNER JOIN learning_outcome_group_dim ON learning_outcome_group_dim.id = learning_outcome_group_fact.learning_outcome_group_id
LEFT OUTER JOIN course_dim ON course_dim.id = learning_outcome_group_fact.course_id
LEFT OUTER JOIN enrollment_term_dim ON enrollment_term_dim.id = learning_outcome_group_fact.enrollment_term_id;