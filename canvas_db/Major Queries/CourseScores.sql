USE canvas;
SELECT 
account_dim.name AS "Account Name"
, account_dim.workflow_state AS "Account Status"
, enrollment_dim.type AS "User Role"
, enrollment_dim.workflow_state AS "Enrollment State"
, enrollment_dim.last_activity_at AS "User Last Activity"
, course_dim.sis_source_id As "Course SIS"
, course_dim.code AS "Course Catalog"
, course_dim.name AS "Course Name"
, course_dim.created_at AS "Course Created At"
, course_dim.start_at AS "Course Started At"
, course_dim.conclude_at AS "Course Concluded At"
, course_dim.workflow_state AS "Course State"
, course_score_fact.muted_current_score AS "Course Muted Current Score"
, course_score_fact.muted_final_score AS "Course Muted Final Score"
, course_score_fact.current_score AS "Course Current Score"
, course_score_fact.final_score AS "Course Final Score"
FROM course_score_fact
JOIN account_dim ON account_dim.id = course_score_fact.account_id
JOIN enrollment_dim ON enrollment_dim.id = course_score_fact.enrollment_id
JOIN course_dim ON course_dim.id = course_score_fact.course_id
WHERE account_dim.name = "Fuller Theological Seminary"
AND account_dim.workflow_state != "deleted"
AND enrollment_dim.workflow_state != "deleted"
AND course_dim.workflow_state != "deleted"
AND course_dim.sis_source_id IS NOT NULL
;