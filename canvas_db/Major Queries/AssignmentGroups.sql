USE canvas;
SELECT
course_dim.sis_source_id As "Course SIS"
, course_dim.code AS "Course Catalog"
, course_dim.name AS "Course Name"
, course_dim.created_at AS "Course Created At"
, course_dim.start_at AS "Course Started At"
, course_dim.conclude_at AS "Course Concluded At"
, course_dim.workflow_state AS "Course State"
, assignment_group_fact.group_weight AS "Assignment Group Weight"
, assignment_group_dim.created_at AS "Assignment Group Created At"
, assignment_group_dim.default_assignment_name AS "Assignment Group Default Assignment Name"
, assignment_group_dim.name AS "Assignment Group Name"
, assignment_group_dim.position AS "Assignment Group Position"
, assignment_group_dim.updated_at AS "Assignment Group Updated At"
, assignment_group_dim.workflow_state AS "Assignment Group State"
FROM assignment_group_fact
INNER JOIN assignment_group_dim ON assignment_group_dim.id = assignment_group_fact.assignment_group_id
INNER JOIN course_dim ON course_dim.id = assignment_group_fact.course_id
WHERE course_dim.sis_source_id IS NOT NULL
AND course_dim.workflow_state != "deleted"
AND assignment_group_dim.workflow_state != "deleted"
;