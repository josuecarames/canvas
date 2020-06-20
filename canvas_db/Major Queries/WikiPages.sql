SELECT
account_dim.name AS "Account Name"
, account_dim.workflow_state AS "Account Status"
, enrollment_term_dim.name AS "Term Name"
, enrollment_term_dim.date_start AS "Term Start On"
, enrollment_term_dim.date_end AS "Term Ends On"
, user_dim.name AS "User Name"
, user_dim.gender AS "User Gender"
, user_dim.birthdate AS "User Birthdate"
, user_dim.school_name AS "User School"
, user_dim.school_position AS "User School Position"
, user_dim.country_code AS "User Country"
, user_dim.locale AS "User locale"
, user_dim.time_zone AS "User Time Zone"
, user_dim.created_at AS "User Created At"
, user_dim.workflow_state AS "User Status"
, wiki_dim.title AS "Wiki Title"
, wiki_dim.created_at AS "Wiki Created At"
, wiki_dim.updated_at AS "Wiki Updated At"
, wiki_dim.front_page_url AS "Front Page URL"
, wiki_dim.has_no_front_page AS "Has No Front Page"
, wiki_dim.parent_type AS "Wiki Parent Type"
, wiki_page_fact.view_count AS "Wiki View Count"
, wiki_page_fact.wiki_page_comments_count AS "Wiki Comments Count"
, wiki_page_dim.title AS "Wiki Page Title"
, wiki_page_dim.body AS "Wiki Page Body"
, wiki_page_dim.created_at AS "Wiki Page Created At"
, wiki_page_dim.revised_at AS "Wiki Page Revised At"
, wiki_page_dim.updated_at AS "Wiki Page Updated At"
, wiki_page_dim.could_be_locked AS "Wiki Page Could Be Locked"
, wiki_page_dim.editing_roles AS "Wiki Page Editing Roles"
, wiki_page_dim.protected_editing AS "Wiki Page Protected Editing"
, wiki_page_dim.url AS "Wiki Page URL"
, wiki_page_dim.workflow_state AS "Wiki Page State"
FROM wiki_page_fact
JOIN account_dim ON account_dim.id = wiki_page_fact.account_id
JOIN wiki_dim ON wiki_dim.id = wiki_page_fact.wiki_id
JOIN user_dim ON user_dim.id = wiki_page_fact.user_id
JOIN wiki_page_dim ON wiki_page_dim.id = wiki_page_fact.wiki_page_id
-- JOIN root_account_dim ON root_account_dim.id = wiki_page_fact.root_account_id
LEFT JOIN enrollment_term_dim ON enrollment_term_dim.id = wiki_page_fact.enrollment_term_id
-- LEFT JOIN group_category_dim ON group_category_dim.id = wiki_page_fact.group_category_id 
-- LEFT JOIN parent_course_account_dim ON parent_course_account_dim.id = wiki_page_fact.parent_course_account_id
-- LEFT JOIN parent_course_dim ON parent_course_dim.id = wiki_page_fact.parent_course_id
-- LEFT JOIN parent_group_account_dim ON parent_group_account_dim.id = wiki_page_fact.parent_group_account_id
-- LEFT JOIN parent_group_dim ON parent_group_dim.id = wiki_page_fact.parent_group_id
;