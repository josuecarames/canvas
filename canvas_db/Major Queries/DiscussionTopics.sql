USE canvas;
SELECT
enrollment_rollup_dim.least_privileged_role AS "Min-Role in Course"
, enrollment_rollup_dim.most_privileged_role AS "Max-Role in Course"
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
, group_dim.category AS "Group Category"
, group_dim.context_type AS "Group Type"
, group_dim.created_at AS "Group Created At"
, group_dim.default_view AS "Group Default View"
, group_dim.deleted_at AS "Group Deleted At"
, group_dim.name AS "Group Name"
, group_dim.updated_at AS "Group Updated At"
, group_dim.workflow_state AS "Group State"
, assignment_dim.submission_types AS "Assignment Submission Type"
, assignment_dim.title AS "Assignment Title"
, assignment_dim.description AS "Assignment Description"
, assignment_dim.created_at AS "Assignment Created At"
, assignment_dim.all_day AS "Assignment All Day Due"
, assignment_dim.all_day_date AS "Assignment All Day Due Date"
, assignment_dim.due_at AS "Assignment Due At"
, assignment_dim.peer_reviews_due_at AS "Assignment Peer Reviews Due At"
, assignment_dim.updated_at AS "Assignment Updated At"
, assignment_dim.could_be_locked AS "Assignment Could Be Locked"
, assignment_dim.lock_at AS "Assignment Locked At"
, assignment_dim.unlock_at AS "Assignment Unlock At"
, assignment_dim.peer_reviews AS "Assignment Peer Reviews"
, assignment_dim.automatic_peer_reviews AS "Assignment Peer Review Automatically Assigned"
, assignment_dim.peer_review_count AS "Assignment Peer Reviewers Count"
, assignment_dim.grading_type AS "Assignment Grading Type"
, assignment_dim.points_possible AS "Assignment Possible Points"
, assignment_dim.grade_group_students_individually AS "Assignment Group Individually Graded"
, assignment_dim.visibility AS "Assignment Visibility"
, assignment_dim.position AS "Assignment Position"
, assignment_dim.workflow_state AS "Assignment State"
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
, discussion_topic_dim.title AS "Discussion Topic Title"
, discussion_topic_dim.message AS "Discussion Topic Message"
, discussion_topic_fact.message_length AS "Message Length"
, discussion_topic_dim.created_at AS "Discussion Topic Created At"
, discussion_topic_dim.delayed_post_at AS "Discussion Topic Delayed Post At"
, discussion_topic_dim.updated_at AS "Discussion Topic Updated At"
, discussion_topic_dim.last_reply_at AS "Discussion Topic Last Reply At"
, discussion_topic_dim.posted_at AS "Discussion Topic Posted At"
, discussion_topic_dim.deleted_at AS "Discussion Topic Deleted At"
, discussion_topic_dim.locked AS "Discussion Topic Is Locked"
, discussion_topic_dim.pinned AS "Discussion Topic Pinned"
, discussion_topic_dim.discussion_type AS "Discussion Topic Discussion Type"
, discussion_topic_dim.type AS "Discussion Topic Type"
, discussion_topic_dim.workflow_state AS "Discussion Topic State"
FROM discussion_topic_fact
INNER JOIN discussion_topic_dim ON discussion_topic_dim.id = discussion_topic_fact.discussion_topic_id
LEFT OUTER JOIN enrollment_rollup_dim ON enrollment_rollup_dim.id = discussion_topic_fact.enrollment_rollup_id
LEFT OUTER JOIN enrollment_term_dim ON enrollment_term_dim.id = discussion_topic_fact.enrollment_term_id
LEFT OUTER JOIN group_dim ON group_dim.id = discussion_topic_fact.group_id
LEFT OUTER JOIN assignment_dim ON assignment_dim.id = discussion_topic_fact.assignment_id
LEFT OUTER JOIN course_dim ON course_dim.id = discussion_topic_fact.course_id
LEFT OUTER JOIN user_dim ON user_dim.id = discussion_topic_fact.user_id
-- LEFT OUTER JOIN course_account_dim ON course_account_dim.id = discussion_topic_fact.course_account_id
-- LEFT OUTER JOIN editor_dim ON editor_dim.id = discussion_topic_fact.editor_id
-- LEFT OUTER JOIN group_parent_account_dim ON group_parent_account_dim.id = discussion_topic_fact.group_parent_account_id
-- LEFT OUTER JOIN group_parent_course_account_dim ON group_parent_course_account_dim.id = discussion_topic_fact.group_parent_course_account_id
-- LEFT OUTER JOIN group_parent_course_dim ON group_parent_course_dim.id = discussion_topic_fact.group_parent_course_id
WHERE enrollment_term_dim.name NOT IN ("All Other Courses", "Course Development (DL)", "Course Development (Faculty)", "Default Term", "Fuller Canvas Templates", "Orientation 2017", "Orientation 2018", "Orientation 2019", "Orientation 2020")
AND course_dim.workflow_state != "deleted"
AND course_dim.sis_source_id IS NOT NULL
AND assignment_dim.workflow_state NOT IN ("deleted", "unpublished")
AND user_dim.workflow_state != "deleted"
;

