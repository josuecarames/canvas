SELECT 
account_dim.name AS "Account Name"
, account_dim.workflow_state AS "Account Status"
, enrollment_term_dim.name AS "Term Name"
, enrollment_term_dim.date_start AS "Term Start On"
, enrollment_term_dim.date_end AS "Term Ends On"
, wiki_dim.title AS "Wiki Title"
, wiki_dim.created_at AS "Wiki Created At"
, wiki_dim.updated_at AS "Wiki Updated At"
, wiki_dim.front_page_url AS "Front Page URL"
, wiki_dim.has_no_front_page AS "Has No Front Page"
, wiki_dim.parent_type AS "Wiki Parent Type"
FROM wiki_fact
JOIN account_dim ON account_dim.id = wiki_fact.account_id
JOIN wiki_dim ON wiki_dim.id = wiki_fact.wiki_id
-- JOIN root_account_dim ON root_account_dim.id = wiki_fact.root_account_id
LEFT JOIN enrollment_term_dim ON enrollment_term_dim.id = wiki_fact.enrollment_term_id
-- LEFT JOIN group_category_dim ON group_category_dim.id = wiki_fact.group_category_id 
-- LEFT JOIN parent_course_account_dim ON parent_course_account_dim.id = wiki_fact.parent_course_account_id
-- LEFT JOIN parent_course_dim ON parent_course_dim.id = wiki_fact.parent_course_id
-- LEFT JOIN parent_group_account_dim ON parent_group_account_dim.id = wiki_fact.parent_group_account_id
-- LEFT JOIN parent_group_dim ON parent_group_dim.id = wiki_fact.parent_group_id
;