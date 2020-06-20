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
, assignment_group_dim.created_at AS "Assignment Group Created At"
, assignment_group_dim.default_assignment_name AS "Assignment Group Default Assignment Name"
, assignment_group_dim.name AS "Assignment Group Name"
, assignment_group_dim.position AS "Assignment Group Position"
, assignment_group_dim.updated_at AS "Assignment Group Updated At"
, assignment_group_dim.workflow_state AS "Assignment Group State"
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
FROM assignment_fact
JOIN assignment_dim ON assignment_dim.id = assignment_fact.assignment_id
JOIN course_dim ON course_dim.id = assignment_fact.course_id
JOIN enrollment_term_dim ON enrollment_term_dim.id = assignment_fact.enrollment_term_id
JOIN assignment_group_dim ON assignment_group_dim.id = assignment_fact.assignment_group_id
WHERE enrollment_term_dim.name NOT IN ("All Other Courses", "Course Development (DL)", "Course Development (Faculty)", "Default Term", "Fuller Canvas Templates", "Orientation 2017", "Orientation 2018", "Orientation 2019", "Orientation 2020")
AND course_dim.workflow_state != "deleted"
AND course_dim.sis_source_id IS NOT NULL
AND assignment_dim.workflow_state NOT IN ("unpublished", "deleted")
;