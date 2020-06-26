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
, group_dim.category AS "Group Category"
, group_dim.context_type AS "Group Type"
, group_dim.created_at AS "Group Created At"
, group_dim._default_view AS "Group Default View"
, group_dim.deleted_at AS "Group Deleted At"
, group_dim.name AS "Group Name"
, group_dim.updated_at AS "Group Updated At"
, group_dim.workflow_state AS "Group State"
, conference_dim.title AS "Conference Title"
, conference_fact.duration AS "Conference Duration"
, conference_dim.conference_type AS "Conference Type"
, conference_dim.updated_at AS "Conference Updated At"
, conference_dim.created_at AS "Conference Created At"
, conference_dim.start_at AS "Conference Start At"
, conference_dim.started_at AS "Conference Started At"
, conference_dim.end_at AS "Conference Ended At"
FROM conference_fact
INNER JOIN conference_dim ON conference_dim.id = conference_fact.conference_id
LEFT OUTER JOIN account_dim ON account_dim.id = conference_fact.account_id
LEFT OUTER JOIN course_dim ON course_dim.id = conference_fact.course_id
LEFT OUTER JOIN group_dim ON group_dim.id = conference_fact.group_id
WHERE account_dim.name = "Fuller Theological Seminary"
AND account_dim.workflow_state != "deleted"
AND course_dim.workflow_state != "deleted"
AND course_dim.sis_source_id IS NOT NULL
;