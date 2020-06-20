SELECT
account_dim.name AS "Account Name"
, account_dim.workflow_state AS "Account Status"
, enrollment_term_dim.name AS "Term Name"
, enrollment_term_dim.date_start AS "Term Start On"
, enrollment_term_dim.date_end AS "Term Ends On"
, enrollment_rollup_dim.least_privileged_role AS "Min-Role in Course"
, enrollment_rollup_dim.most_privileged_role AS "Max-Role in Course"
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
, user_dim.locale AS "User Locale"
, user_dim.time_zone AS "User Time Zone"
, user_dim.created_at AS "User Created At"
, user_dim.workflow_state AS "User Status"
, conversation_dim.has_attachments AS "Conversation Has Attachments"
, conversation_dim.has_media_objects AS "Conversation Has Media Objects"
, conversation_dim.subject AS "Conversation Subject"
, conversation_message_dim.generated AS "Message Was Computer Generated"
, conversation_message_dim.has_attachments AS "Message Has Attachments"
, conversation_message_dim.has_media_objects AS "Message Has Media Objects"
, conversation_message_dim.created_at AS "Message Created At"
, conversation_message_participant_fact.message_line_count AS "Message Line Count"
, conversation_message_participant_fact.message_word_count AS "Message Word Count"
, conversation_message_participant_fact.message_character_count AS "Message Character Count"
, conversation_message_participant_fact.message_size_bytes AS "Message Size in Bytes"
FROM conversation_message_participant_fact
JOIN conversation_dim ON conversation_dim.id = conversation_message_participant_fact.conversation_id
JOIN conversation_message_dim ON conversation_message_dim.id = conversation_message_participant_fact.conversation_message_id
JOIN user_dim ON user_dim.id = conversation_message_participant_fact.user_id
LEFT JOIN account_dim ON account_dim.id = conversation_message_participant_fact.account_id
LEFT JOIN course_dim ON course_dim.id = conversation_message_participant_fact.course_id
LEFT JOIN enrollment_rollup_dim ON enrollment_rollup_dim.id = conversation_message_participant_fact.enrollment_rollup_id
LEFT JOIN enrollment_term_dim ON enrollment_term_dim.id = conversation_message_participant_fact.enrollment_term_id
LEFT JOIN group_dim ON group_dim.id = conversation_message_participant_fact.group_id
WHERE account_dim.name = "Fuller Theological Seminary"
AND account_dim.workflow_state != "deleted"
AND enrollment_term_dim.name NOT IN ("All Other Courses", "Course Development (DL)", "Course Development (Faculty)", "Default Term", "Fuller Canvas Templates", "Orientation 2017", "Orientation 2018", "Orientation 2019", "Orientation 2020")
AND course_dim.workflow_state != "deleted"
AND course_dim.sis_source_id IS NOT NULL
AND user_dim.workflow_state != "deleted"
;