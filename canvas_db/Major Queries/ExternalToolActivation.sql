USE canvas;
SELECT
account_dim.name AS "Account Name"
, account_dim.workflow_state AS "Account Status"
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
, external_tool_activation_dim.activation_target_type AS "ET Activation Target Type"
, external_tool_activation_dim.url AS "ET URL"
, external_tool_activation_dim.name AS "ET Name"
, external_tool_activation_dim.description AS "ET Description"
, external_tool_activation_dim.workflow_state AS "ET State"
, external_tool_activation_dim.privacy_level AS "ET Privacy Level"
, external_tool_activation_dim.created_at AS "ET Created At"
, external_tool_activation_dim.updated_at AS "ET Updated At"
, external_tool_activation_dim.selectable_all AS "ET Selecttable All"
FROM external_tool_activation_fact
INNER JOIN external_tool_activation_dim ON external_tool_activation_dim.id = external_tool_activation_fact.external_tool_activation_id
LEFT OUTER JOIN course_dim ON course_dim.id = external_tool_activation_fact.course_id
LEFT OUTER JOIN account_dim ON account_dim.id = external_tool_activation_fact.account_id
LEFT OUTER JOIN enrollment_term_dim ON enrollment_term_dim.id = external_tool_activation_fact.enrollment_term_id;