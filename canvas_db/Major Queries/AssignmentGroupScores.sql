USE canvas;
SELECT
account_dim.name AS "Account Name"
, account_dim.workflow_state AS "Account Status"
, course_dim.sis_source_id As "Course SIS"
, course_dim.code AS "Course Catalog"
, course_dim.name AS "Course Name"
, course_dim.created_at AS "Course Created At"
, course_dim.start_at AS "Course Started At"
, course_dim.conclude_at AS "Course Concluded At"
, course_dim.workflow_state AS "Course State"
, assignment_group_dim.created_at AS "Assignment Group Created At"
, assignment_group_dim.default_assignment_name AS "Assignment Group Default Assignment Name"
, assignment_group_dim.name AS "Assignment Group Name"
, assignment_group_dim.position AS "Assignment Group Position"
, assignment_group_dim.updated_at AS "Assignment Group Updated At"
, assignment_group_dim.workflow_state AS "Assignment Group State"
, assignment_group_score_fact.current_score AS "Assignment Group Current Score"
, assignment_group_score_fact.final_score AS "Assignment Group Final Score"
, assignment_group_score_fact.muted_current_score AS "Assignment Group Muted Current Score"
, assignment_group_score_fact.muted_final_score AS "Assignment Group Muted Final Score"
, enrollment_dim.type AS "Enrollee Type"
, enrollment_dim.self_enrolled AS "Enrollee is Self-Enrolled"
, enrollment_dim.created_at AS "Enrollee Created At"
, enrollment_dim.start_at AS "Enrollee Start At"
, enrollment_dim.updated_at AS "Enrollee Updated At"
, enrollment_dim.last_activity_at AS "Enrollee Last Activity At"
, enrollment_dim.end_at AS "Enrollee End At"
, enrollment_dim.completed_at AS "Enrollee Completed At"
, enrollment_dim.workflow_state AS "Enrollee State"
FROM assignment_group_score_fact
INNER JOIN account_dim ON account_dim.id = assignment_group_score_fact.account_id
INNER JOIN assignment_group_dim ON assignment_group_dim.id = assignment_group_score_fact.assignment_group_id
INNER JOIN course_dim ON course_dim.id = assignment_group_score_fact.course_id
INNER JOIN enrollment_dim ON enrollment_dim.id = assignment_group_score_fact.enrollment_id
WHERE account_dim.name = "Fuller Theological Seminary"
AND account_dim.workflow_state != "deleted"
AND course_dim.workflow_state != "deleted"
AND course_dim.sis_source_id IS NOT NULL
AND assignment_group_dim.workflow_state != "deleted"
AND enrollment_dim.workflow_state != "deleted"
;