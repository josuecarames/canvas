USE canvas;
SELECT DISTINCT course_dim.canvas_id
FROM enrollment_fact
INNER JOIN account_dim ON account_dim.id = enrollment_fact.course_account_id
INNER JOIN enrollment_dim ON enrollment_dim.id = enrollment_fact.enrollment_id
INNER JOIN enrollment_term_dim ON enrollment_term_dim.id = enrollment_fact.enrollment_term_id
INNER JOIN course_dim ON course_dim.id = enrollment_fact.course_id
INNER JOIN user_dim ON user_dim.id = enrollment_fact.user_id
WHERE enrollment_term_dim.canvas_id IN (1, 8)
OR account_dim.canvas_id IN (22, 23, 24, 25, 26, 27, 28, 30, 32, 33, 34, 35, 38)
AND course_dim.workflow_state != "deleted"
ORDER BY canvas_id ASC;