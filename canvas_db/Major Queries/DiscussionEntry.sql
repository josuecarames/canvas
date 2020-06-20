USE canvas;
SELECT 
enrollment_term_dim.name AS "Term Name"
, enrollment_term_dim.date_start AS "Term Start On"
, enrollment_term_dim.date_end AS "Term Ends On"
, course_dim.sis_source_id As "Course SIS"
, course_dim.code AS "Course Catalog"
, course_dim.name AS "Course Name"
, course_dim.created_at AS "Course Created At"
, course_dim.start_at AS "Course Started At"
, course_dim.conclude_at AS "Course Concluded At"
, course_dim.workflow_state AS "Course State"
, enrollment_rollup_dim.account_admin_role_count AS "Enrollment Rollup Admin Role Count"
, enrollment_rollup_dim.account_membership_role_count AS "Enrollment Rollup Membership Role Count"
, enrollment_rollup_dim.base_role_count AS "Enrollment Rollup Base Role Count"
, enrollment_rollup_dim.designer_enrollment_role_count AS "Enrollment Rollup Designer Role Count"
, enrollment_rollup_dim.enrollment_count AS "Enrollment Rollup Enrollment Count"
, enrollment_rollup_dim.least_privileged_role AS "Enrollment Rollup Lest Privileged Role"
, enrollment_rollup_dim.most_privileged_role AS "Enrollment Rollup Most Privileged Role"
, enrollment_rollup_dim.no_permissions_role_count AS "Enrollment Rollup No Permissions Role Count"
, enrollment_rollup_dim.observer_enrollment_role_count AS "Enrollment Rollup Observer Role Count"
, enrollment_rollup_dim.role_count AS "Enrollment Rollup Role Count"
, enrollment_rollup_dim.student_enrollment_role_count AS "Enrollment Rollup Student Role Count"
, enrollment_rollup_dim.ta_enrollment_role_count AS "Enrollment Rollup TA Role Count"
, enrollment_rollup_dim.teacher_enrollment_role_count AS "Enrollment Rollup Teacher Role Count"
, user_dim.name AS "User Name"
, user_dim.gender AS "User Gender"
, user_dim.birthdate AS "User Birthdate"
, user_dim.school_name AS "User School"
, user_dim.school_position AS "User School Position"
, user_dim.country_code AS "User Country"
, user_dim.locale AS "User Locale"
, user_dim.time_zone AS "User Time Zone"
, user_dim.created_at AS "User Created At"
, user_dim.workflow_state AS "User Status"
, discussion_entry_fact.message_length AS "Discussion Entry Message Length"
, discussion_entry_dim.message AS "Discussion Entry Message"
, discussion_entry_dim.created_at AS "Discussion Entry Created At"
, discussion_entry_dim.updated_at AS "Discussion Entry Updated At"
, discussion_entry_dim.deleted_at AS "Discussion Entry Deleted At"
, discussion_entry_dim.depth AS "Discussion Entry Depth"
, discussion_entry_dim.workflow_state AS "Discussion Entry State"
FROM discussion_entry_fact
JOIN discussion_entry_dim ON discussion_entry_dim.id = discussion_entry_fact.discussion_entry_id
JOIN user_dim ON user_dim.id = discussion_entry_fact.user_id
-- JOIN topic_dim ON topic_dim.id = discussion_entry_fact.topic_id
-- LEFT JOIN course_account_dim ON course_account_dim.id = discussion_entry_fact.course_account_id
LEFT JOIN course_dim ON course_dim.id = discussion_entry_fact.course_id
LEFT JOIN enrollment_rollup_dim ON enrollment_rollup_dim.id = discussion_entry_fact.enrollment_rollup_id
LEFT JOIN enrollment_term_dim ON enrollment_term_dim.id = discussion_entry_fact.enrollment_term_id
-- LEFT JOIN parent_discussion_entry_dim ON parent_discussion_entry_dim.id = discussion_entry_fact.parent_discussion_entry_id
-- LEFT JOIN topic_assignment_dim ON topic_assignment_dim.id = discussion_entry_fact.topic_assignment_id
-- LEFT JOIN topic_editor_dim ON topic_editor_dim.id = discussion_entry_fact.topic_editor_id
-- LEFT JOIN topic_user_dim ON topic_user_dim.id = discussion_entry_fact.topic_user_id
WHERE enrollment_term_dim.name NOT IN ("All Other Courses", "Course Development (DL)", "Course Development (Faculty)", "Default Term", "Fuller Canvas Templates", "Orientation 2017", "Orientation 2018", "Orientation 2019", "Orientation 2020")
AND course_dim.workflow_state != "deleted"
AND course_dim.sis_source_id IS NOT NULL
AND user_dim.workflow_state != "deleted"
;