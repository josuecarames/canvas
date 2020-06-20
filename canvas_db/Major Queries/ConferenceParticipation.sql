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
, group_dim.category AS "Group Category"
, group_dim.context_type AS "Group Type"
, group_dim.created_at AS "Group Created At"
, group_dim.default_view AS "Group Default View"
, group_dim.deleted_at AS "Group Deleted At"
, group_dim.name AS "Group Name"
, group_dim.updated_at AS "Group Updated At"
, group_dim.workflow_state AS "Group State"
, user_dim.name AS "User Name"
, user_dim.gender AS "User Gender"
, user_dim.birthdate AS "User Birthdate"
, user_dim.school_name AS "User School"
, user_dim.school_position AS "User School Position"
, user_dim.country_code AS "User Country"
, user_dim.locale AS "User locale"
, user_dim.time_zone AS "User Time Zone"
, user_dim.created_at AS "User Created At"
, user_dim.workflow_state AS "User Status"
, conference_dim.conference_type AS "Conference Type"
, conference_dim.created_at AS "Conference Created At"
, conference_dim.updated_at AS "Conference Updated At"
, conference_dim.start_at AS "Conference Start At"
, conference_dim.started_at AS "Conference Started At"
, conference_dim.end_at AS "Conference Ended At"
, conference_participant_dim.participation_type AS "Participant Type"
, conference_participant_dim.created_at AS "Participant Created At"
, conference_participant_dim.updated_at AS "Participant Updated At"
FROM conference_participant_fact
JOIN conference_dim ON conference_dim.id = conference_participant_fact.conference_id
JOIN conference_participant_dim ON conference_participant_dim.id = conference_participant_fact.conference_participant_id
JOIN course_dim ON course_dim.id = conference_participant_fact.course_id
LEFT JOIN account_dim ON account_dim.id = conference_participant_fact.account_id
LEFT JOIN group_dim ON group_dim.id = conference_participant_fact.group_id
LEFT JOIN user_dim ON user_dim.id = conference_participant_fact.user_id
WHERE account_dim.name = "Fuller Theological Seminary"
AND account_dim.workflow_state != "deleted"
AND course_dim.workflow_state != "deleted"
AND course_dim.sis_source_id IS NOT NULL
;