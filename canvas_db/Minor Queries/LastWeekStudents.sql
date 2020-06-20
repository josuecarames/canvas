USE canvas;
SELECT NAME, last_activity
FROM (
SELECT user_id, user_dim.name, substr(course_section_dim.sis_source_id,-6), max(last_activity_at) AS last_activity
FROM enrollment_dim
INNER JOIN course_section_dim on course_section_dim.id = enrollment_dim.course_section_id
INNER JOIN user_dim on user_dim.id = enrollment_dim.user_id
WHERE enrollment_dim.workflow_state != 'deleted'
AND enrollment_dim.type='StudentEnrollment'
AND substr(course_section_dim.sis_source_id,-6) = '202002'
AND last_activity_at IS NOT NULL
GROUP BY user_id, user_dim.name, substr(course_section_dim.sis_source_id,-6)
) g
WHERE last_activity BETWEEN date_sub(now(), interval 14 day) AND date_sub(now(), interval 7 day);