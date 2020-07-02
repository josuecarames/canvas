USE canvas;
SELECT
    enrollment_term_dim.name AS "Term Name"
	, enrollment_term_dim.date_start AS "Term Start On"
	, enrollment_term_dim.date_end AS "Term Ends On"
	, group_dim.name AS "Group Name"
	, group_dim.description AS "Group Description"
	, group_dim.created_at AS "Group Created At"
	, group_dim.updated_at AS "Group Updated At"
	, group_dim.deleted_at AS "Group Deleted At"
	, group_dim.is_public AS "Group Is Public"
	, group_dim.workflow_state AS "Group State"
	, group_dim.context_type AS "Group Context Type"
	, group_dim.category AS "Group Category"
	, group_dim.join_level AS "Group Join Level"
	, group_dim.default_view AS "Group Default View"
	, group_dim.sis_source_id AS "Group SIS ID"
	, group_membership_dim.moderator AS "Group Membership Moderator"
	, group_membership_dim.workflow_state AS "Group Membership State"
	, group_membership_dim.created_at AS "Group Membership Created At"
	, group_membership_dim.updated_at AS "Group Membership Updated At"
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
FROM group_membership_fact
INNER JOIN group_dim ON group_dim.id = group_membership_fact.group_id
INNER JOIN user_dim ON user_dim.id = group_membership_fact.user_id
INNER JOIN group_membership_dim ON group_membership_dim.id = group_membership_fact.group_membership_id
-- LEFT OUTER JOIN parent_course_dim ON parent_course_dim.id = group_membership_fact.parent_course_id
-- LEFT OUTER JOIN parent_account_dim ON parent_account_dim.id = group_membership_fact.parent_account_id
-- LEFT OUTER JOIN parent_course_account_dim ON parent_course_account_dim.id = group_membership_fact.parent_course_account_id
LEFT OUTER JOIN enrollment_term_dim ON enrollment_term_dim.id = group_membership_fact.enrollment_term_id
WHERE enrollment_term_dim.name NOT IN ("All Other Courses", "Course Development (DL)", "Course Development (Faculty)", "Default Term", "Fuller Canvas Templates", "Orientation 2017", "Orientation 2018", "Orientation 2019", "Orientation 2020");