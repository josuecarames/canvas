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
, course_ui_canvas_navigation_dim.name AS "Course UI Canvas Navigation Name"
, course_ui_canvas_navigation_dim.original_position AS "Course UI Canvas Navigation Original Position"
, course_ui_navigation_item_dim.visible AS "Navigation Item Visible"
, external_tool_activation_dim.name AS "External Tool Name"
, external_tool_activation_dim.created_at AS "External Tool Created At"
, external_tool_activation_dim.updated_at AS "External Tool Updated At"
, external_tool_activation_dim.workflow_state AS "External Tool State"
, external_tool_activation_dim.activation_target_type AS "External Tool Installed On"
FROM course_ui_navigation_item_fact
INNER JOIN course_dim ON course_dim.id = course_ui_navigation_item_fact.course_id
INNER JOIN course_ui_navigation_item_dim ON course_ui_navigation_item_dim.id = course_ui_navigation_item_fact.course_ui_navigation_item_id
INNER JOIN enrollment_term_dim ON enrollment_term_dim.id = course_ui_navigation_item_fact.enrollment_term_id
INNER JOIN course_ui_canvas_navigation_dim ON course_ui_canvas_navigation_dim.id = course_ui_navigation_item_fact.course_ui_canvas_navigation_id
LEFT OUTER JOIN external_tool_activation_dim ON external_tool_activation_dim.id = course_ui_navigation_item_fact.external_tool_activation_id
WHERE enrollment_term_dim.name NOT IN ("All Other Courses", "Course Development (DL)", "Course Development (Faculty)", "Default Term", "Fuller Canvas Templates", "Orientation 2017", "Orientation 2018", "Orientation 2019", "Orientation 2020")
AND course_dim.workflow_state != "deleted"
AND course_dim.sis_source_id IS NOT NULL
AND external_tool_activation_dim.workflow_state != "deleted"
;