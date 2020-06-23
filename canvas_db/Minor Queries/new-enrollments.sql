USE canvas;
SELECT DISTINCT user_dim.canvas_id
FROM enrollment_fact
JOIN account_dim ON account_dim.id = enrollment_fact.course_account_id
JOIN enrollment_dim ON enrollment_dim.id = enrollment_fact.enrollment_id
JOIN enrollment_term_dim ON enrollment_term_dim.id = enrollment_fact.enrollment_term_id
-- JOIN course_dim ON course_dim.id = enrollment_fact.course_id
JOIN user_dim ON user_dim.id = enrollment_fact.user_id
WHERE enrollment_term_dim.name = "Summer 2020"
AND account_dim.workflow_state != "deleted"
AND enrollment_dim.workflow_state = "active"
AND enrollment_dim.type = "StudentEnrollment"
AND user_dim.canvas_id NOT IN (
SELECT  user_dim.canvas_id
FROM enrollment_fact
JOIN account_dim ON account_dim.id = enrollment_fact.course_account_id
JOIN enrollment_dim ON enrollment_dim.id = enrollment_fact.enrollment_id
JOIN enrollment_term_dim ON enrollment_term_dim.id = enrollment_fact.enrollment_term_id
-- JOIN course_dim ON course_dim.id = enrollment_fact.course_id
JOIN user_dim ON user_dim.id = enrollment_fact.user_id
WHERE enrollment_term_dim.name != 'Summer 2020'
AND account_dim.workflow_state != 'deleted'
AND enrollment_dim.workflow_state = 'active'
AND enrollment_dim.type = 'StudentEnrollment')
ORDER BY canvas_id ASC;