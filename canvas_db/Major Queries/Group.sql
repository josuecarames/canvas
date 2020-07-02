USE 
	canvas;
SELECT
    account_dim.name AS "Account Name"
    , enrollment_term_dim.name AS "Term Name"
	, enrollment_term_dim.date_start AS "Term Start On"
	, enrollment_term_dim.date_end AS "Term Ends On"
    , group_dim.name AS "Group Name"
	, group_dim.description AS "Group Description"
    , group_dim.created_at AS "Group Created At"
    , group_dim.updated_at AS "Group Updated At"
    , group_dim.deleted_at AS "Group Deleted At"
    , group_dim.is_public AS "Group Is Public"
    , group_dim.workflow_state AS "Group State"
    , group_dim.context_type AS "Group Context Type"
    , group_dim.category AS "Group Category"
    , group_dim.join_level AS "Group Join Level"
    , group_dim.default_view AS "Group Default View"
    , group_dim.sis_source_id AS "Group SIS ID"
    , wiki_dim.created_at AS "Wiki Created At"
	, wiki_dim.front_page_url AS "Wiki Front Page URL"
	, wiki_dim.has_no_front_page AS "Wiki Has No Front Page"
	, wiki_dim.parent_type AS "Wiki Parent Type"
	, wiki_dim.title AS "Wiki Title"
	, wiki_dim.updated_at AS "Wiki Updated At"
    , max_membership
	, storage_quota
FROM group_fact
INNER JOIN group_dim ON group_dim.id = group_fact.group_id
-- INNER JOIN group_category_id ON group_category_dim.id = group_fact.group_category_id
INNER JOIN account_dim ON account_dim.id = group_fact.account_id
-- LEFT OUTER JOIN parent_course_dim ON parent_course_dim.id = group_fact.parent_course_id
-- LEFT OUTER JOIN parent_account_dim ON parent_account_dim.id = group_fact.parent_account_id
-- LEFT OUTER JOIN parent_course_account_dim ON parent_course_account_dim.id = group_fact.parent_course_account_id
LEFT OUTER JOIN enrollment_term_dim ON enrollment_term_dim.id = group_fact.enrollment_term_id
LEFT OUTER JOIN wiki_dim ON wiki_dim.id = group_fact.wiki_id
WHERE enrollment_term_dim.name NOT IN ("All Other Courses", "Course Development (DL)", "Course Development (Faculty)", "Default Term", "Fuller Canvas Templates", "Orientation 2017", "Orientation 2018", "Orientation 2019", "Orientation 2020")
;