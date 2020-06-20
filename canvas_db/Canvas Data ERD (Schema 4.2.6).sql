CREATE TABLE `account_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `name` VARCHAR,
  `depth` INT,
  `workflow_state` VARCHAR,
  `parent_account` VARCHAR,
  `parent_account_id` BIGINT,
  `grandparent_account` VARCHAR,
  `grandparent_account_id` BIGINT,
  `root_account` VARCHAR,
  `root_account_id` BIGINT,
  `subaccount1` VARCHAR,
  `subaccount1_id` BIGINT,
  `subaccount2` VARCHAR,
  `subaccount2_id` BIGINT,
  `subaccount3` VARCHAR,
  `subaccount3_id` BIGINT,
  `subaccount4` VARCHAR,
  `subaccount4_id` BIGINT,
  `subaccount5` VARCHAR,
  `subaccount5_id` BIGINT,
  `subaccount6` VARCHAR,
  `subaccount6_id` BIGINT,
  `subaccount7` VARCHAR,
  `subaccount7_id` BIGINT,
  `subaccount8` VARCHAR,
  `subaccount8_id` BIGINT,
  `subaccount9` VARCHAR,
  `subaccount9_id` BIGINT,
  `subaccount10` VARCHAR,
  `subaccount10_id` BIGINT,
  `subaccount11` VARCHAR,
  `subaccount11_id` BIGINT,
  `subaccount12` VARCHAR,
  `subaccount12_id` BIGINT,
  `subaccount13` VARCHAR,
  `subaccount13_id` BIGINT,
  `subaccount14` VARCHAR,
  `subaccount14_id` BIGINT,
  `subaccount15` VARCHAR,
  `subaccount15_id` BIGINT,
  `sis_source_id` VARCHAR
);

CREATE TABLE `assignment_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `course_id` BIGINT,
  `title` VARCHAR,
  `description` TEXT,
  `due_at` TIMESTAMP,
  `unlock_at` TIMESTAMP,
  `lock_at` TIMESTAMP,
  `points_possible` double,
  `grading_type` VARCHAR,
  `submission_types` VARCHAR,
  `workflow_state` VARCHAR,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `peer_review_count` INT,
  `peer_reviews_due_at` TIMESTAMP,
  `peer_reviews_assigned` BOOLEAN,
  `peer_reviews` BOOLEAN,
  `automatic_peer_reviews` BOOLEAN,
  `all_day` BOOLEAN,
  `all_day_date` DATE,
  `could_be_locked` BOOLEAN,
  `grade_group_students_individually` BOOLEAN,
  `anonymous_peer_reviews` BOOLEAN,
  `muted` BOOLEAN,
  `assignment_group_id` BIGINT,
  `position` INT,
  `visibility` enum,
  `external_tool_id` BIGINT
);

CREATE TABLE `assignment_fact` (
  `assignment_id` BIGINT,
  `course_id` BIGINT,
  `course_account_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `points_possible` double,
  `peer_review_count` INT,
  `assignment_group_id` BIGINT,
  `external_tool_id` BIGINT
);

CREATE TABLE `assignment_group_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `course_id` BIGINT,
  `name` VARCHAR,
  `default_assignment_name` VARCHAR,
  `workflow_state` VARCHAR,
  `position` integer,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `assignment_group_fact` (
  `assignment_group_id` BIGINT,
  `course_id` BIGINT,
  `group_weight` double
);

CREATE TABLE `assignment_group_rule_dim` (
  `assignment_group_id` BIGINT,
  `drop_lowest` integer,
  `drop_highest` integer
);

CREATE TABLE `assignment_group_score_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `assignment_group_id` BIGINT,
  `enrollment_id` BIGINT,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `workflow_state` enum
);

CREATE TABLE `assignment_group_score_fact` (
  `score_id` BIGINT,
  `canvas_id` BIGINT,
  `account_id` BIGINT,
  `course_id` BIGINT,
  `assignment_group_id` BIGINT,
  `enrollment_id` BIGINT,
  `current_score` double,
  `final_score` double,
  `muted_current_score` double,
  `muted_final_score` double
);

CREATE TABLE `assignment_override_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `assignment_id` BIGINT,
  `course_section_id` BIGINT,
  `group_id` BIGINT,
  `quiz_id` BIGINT,
  `all_day` enum,
  `all_day_date` DATE,
  `assignment_version` INT,
  `created_at` TIMESTAMP,
  `due_at` TIMESTAMP,
  `due_at_overridden` enum,
  `lock_at` TIMESTAMP,
  `lock_at_overridden` enum,
  `set_type` enum,
  `title` TEXT,
  `unlock_at` TIMESTAMP,
  `unlock_at_overridden` enum,
  `updated_at` TIMESTAMP,
  `quiz_version` INT,
  `workflow_state` enum
);

CREATE TABLE `assignment_override_fact` (
  `assignment_override_id` BIGINT,
  `account_id` BIGINT,
  `assignment_id` BIGINT,
  `assignment_group_id` BIGINT,
  `course_id` BIGINT,
  `course_section_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `group_id` BIGINT,
  `group_category_id` BIGINT,
  `group_parent_account_id` BIGINT,
  `nonxlist_course_id` BIGINT,
  `quiz_id` BIGINT,
  `group_wiki_id` BIGINT
);

CREATE TABLE `assignment_override_user_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `assignment_id` BIGINT,
  `assignment_override_id` BIGINT,
  `quiz_id` BIGINT,
  `user_id` BIGINT,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `assignment_override_user_fact` (
  `assignment_override_user_id` BIGINT,
  `account_id` BIGINT,
  `assignment_group_id` BIGINT,
  `assignment_id` BIGINT,
  `assignment_override_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `quiz_id` BIGINT,
  `user_id` BIGINT
);

CREATE TABLE `assignment_override_user_rollup_fact` (
  `assignment_id` BIGINT,
  `assignment_override_id` BIGINT,
  `assignment_override_user_adhoc_id` BIGINT,
  `assignment_group_id` BIGINT,
  `course_id` BIGINT,
  `course_account_id` BIGINT,
  `course_section_id` BIGINT,
  `enrollment_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `group_category_id` BIGINT,
  `group_id` BIGINT,
  `group_parent_account_id` BIGINT,
  `group_wiki_id` BIGINT,
  `nonxlist_course_id` BIGINT,
  `quiz_id` BIGINT,
  `user_id` BIGINT
);

CREATE TABLE `assignment_rule_dim` (
  `assignment_id` BIGINT,
  `drop_rule` VARCHAR
);

CREATE TABLE `catalog_applicant_dim` (
  `id` BIGINT,
  `catalog_id` BIGINT,
  `catalog_product_id` BIGINT,
  `user_id` BIGINT,
  `notified_of_opening_at` TIMESTAMP,
  `activated` BOOLEAN,
  `status` VARCHAR,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `catalog_dim` (
  `id` BIGINT,
  `parent_id` BIGINT,
  `name` VARCHAR,
  `currency` VARCHAR,
  `country` VARCHAR,
  `time_zone` VARCHAR,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `catalog_enrollment_dim` (
  `id` BIGINT,
  `catalog_product_id` BIGINT,
  `user_id` BIGINT,
  `root_program_id` BIGINT,
  `status` VARCHAR,
  `requirements_completed_at` TIMESTAMP,
  `ends_at` TIMESTAMP,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `catalog_order_dim` (
  `id` BIGINT,
  `catalog_id` BIGINT,
  `user_id` BIGINT,
  `full_id` VARCHAR,
  `purchased_at` TIMESTAMP,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `currency` VARCHAR
);

CREATE TABLE `catalog_order_fact` (
  `catalog_order_id` BIGINT,
  `catalog_id` BIGINT,
  `parent_catalog_id` BIGINT,
  `user_id` BIGINT,
  `total` DOUBLE
);

CREATE TABLE `catalog_order_item_dim` (
  `id` BIGINT,
  `catalog_order_id` BIGINT,
  `catalog_product_id` BIGINT,
  `catalog_promotion_id` BIGINT,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `catalog_order_item_fact` (
  `catalog_order_item_id` BIGINT,
  `catalog_id` BIGINT,
  `parent_catalog_id` BIGINT,
  `catalog_order_id` BIGINT,
  `catalog_product_id` BIGINT,
  `catalog_promotion_id` BIGINT,
  `amount` DOUBLE
);

CREATE TABLE `catalog_payment_dim` (
  `id` BIGINT,
  `catalog_id` BIGINT,
  `catalog_order_id` BIGINT,
  `status` VARCHAR,
  `reference_id` VARCHAR,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `catalog_payment_fact` (
  `catalog_payment_id` BIGINT,
  `catalog_id` BIGINT,
  `parent_catalog_id` BIGINT,
  `catalog_order_id` BIGINT,
  `amount` DOUBLE
);

CREATE TABLE `catalog_product_dim` (
  `id` BIGINT,
  `catalog_id` BIGINT,
  `start_date` TIMESTAMP,
  `end_date` TIMESTAMP,
  `course_id` BIGINT,
  `product_type` VARCHAR,
  `title` VARCHAR,
  `visibility` VARCHAR,
  `enrollment_open` BOOLEAN,
  `has_waitlist` BOOLEAN,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `catalog_product_fact` (
  `catalog_product_id` BIGINT,
  `catalog_id` BIGINT,
  `parent_catalog_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `enrollment_fee` DOUBLE,
  `credits` DOUBLE,
  `waitlist_capacity` INT,
  `enrollment_capacity` INT
);

CREATE TABLE `catalog_product_tag_dim` (
  `id` BIGINT,
  `catalog_id` BIGINT,
  `catalog_product_id` BIGINT,
  `catalog_tag_id` BIGINT,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `catalog_program_requirement_fact` (
  `id` BIGINT,
  `catalog_id` BIGINT,
  `catalog_program_id` BIGINT,
  `catalog_product_id` BIGINT,
  `course_id` BIGINT
);

CREATE TABLE `catalog_promotion_dim` (
  `id` BIGINT,
  `catalog_id` BIGINT,
  `catalog_product_id` BIGINT,
  `discount_type` VARCHAR,
  `code` VARCHAR,
  `name` VARCHAR,
  `usage_type` VARCHAR,
  `start_date` TIMESTAMP,
  `end_date` TIMESTAMP,
  `active` BOOLEAN,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `catalog_promotion_fact` (
  `catalog_promotion_id` BIGINT,
  `catalog_id` BIGINT,
  `parent_catalog_id` BIGINT,
  `catalog_product_id` BIGINT,
  `amount` DOUBLE
);

CREATE TABLE `catalog_tag_dim` (
  `id` BIGINT,
  `catalog_id` BIGINT,
  `name` VARCHAR,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `catalog_user_registration_dim` (
  `id` BIGINT,
  `catalog_id` BIGINT,
  `user_id` BIGINT,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `communication_channel_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `user_id` BIGINT,
  `address` VARCHAR,
  `type` VARCHAR,
  `position` integer,
  `workflow_state` VARCHAR,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `communication_channel_fact` (
  `communication_channel_id` BIGINT,
  `user_id` BIGINT,
  `bounce_count` integer
);

CREATE TABLE `conference_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `title` VARCHAR,
  `conference_type` VARCHAR,
  `group_id` BIGINT,
  `course_id` BIGINT,
  `account_id` BIGINT,
  `start_at` TIMESTAMP,
  `started_at` TIMESTAMP,
  `end_at` TIMESTAMP,
  `ended_at` TIMESTAMP,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `conference_fact` (
  `conference_id` BIGINT,
  `group_id` BIGINT,
  `course_id` BIGINT,
  `account_id` BIGINT,
  `duration` double
);

CREATE TABLE `conference_participant_dim` (
  `id` BIGINT,
  `user_id` BIGINT,
  `conference_id` BIGINT,
  `participation_type` VARCHAR,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `conference_participant_fact` (
  `conference_participant_id` BIGINT,
  `group_id` BIGINT,
  `course_id` BIGINT,
  `account_id` BIGINT,
  `user_id` BIGINT,
  `conference_id` BIGINT
);

CREATE TABLE `conversation_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `has_attachments` BOOLEAN,
  `has_media_objects` BOOLEAN,
  `subject` VARCHAR,
  `course_id` BIGINT,
  `group_id` BIGINT,
  `account_id` BIGINT
);

CREATE TABLE `conversation_message_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `conversation_id` BIGINT,
  `author_id` BIGINT,
  `created_at` TIMESTAMP,
  `generated` BOOLEAN,
  `has_attachments` BOOLEAN,
  `has_media_objects` BOOLEAN,
  `body` TEXT
);

CREATE TABLE `conversation_message_participant_fact` (
  `conversation_message_id` BIGINT,
  `conversation_id` BIGINT,
  `user_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `course_account_id` BIGINT,
  `group_id` BIGINT,
  `account_id` BIGINT,
  `enrollment_rollup_id` BIGINT,
  `message_size_bytes` INT,
  `message_character_count` INT,
  `message_word_count` INT,
  `message_line_count` INT
);

CREATE TABLE `course_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `root_account_id` BIGINT,
  `account_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `name` VARCHAR,
  `code` VARCHAR,
  `type` VARCHAR,
  `created_at` TIMESTAMP,
  `start_at` TIMESTAMP,
  `conclude_at` TIMESTAMP,
  `publicly_visible` BOOLEAN,
  `sis_source_id` VARCHAR,
  `workflow_state` VARCHAR,
  `wiki_id` BIGINT,
  `syllabus_body` TEXT
);

CREATE TABLE `course_score_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `name` VARCHAR,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `default_section` BOOLEAN,
  `accepting_enrollments` BOOLEAN,
  `can_manually_enroll` BOOLEAN,
  `start_at` TIMESTAMP,
  `end_at` TIMESTAMP,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `workflow_state` VARCHAR,
  `restrict_enrollments_to_section_dates` BOOLEAN,
  `nonxlist_course_id` BIGINT,
  `sis_source_id` VARCHAR
);

CREATE TABLE `course_score_fact` (
  `score_id` BIGINT,
  `canvas_id` BIGINT,
  `account_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_id` BIGINT,
  `current_score` double,
  `final_score` double,
  `muted_current_score` double,
  `muted_final_score` double
);

CREATE TABLE `course_section_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `name` VARCHAR,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `default_section` BOOLEAN,
  `accepting_enrollments` BOOLEAN,
  `can_manually_enroll` BOOLEAN,
  `start_at` TIMESTAMP,
  `end_at` TIMESTAMP,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `workflow_state` VARCHAR,
  `restrict_enrollments_to_section_dates` BOOLEAN,
  `nonxlist_course_id` BIGINT,
  `sis_source_id` VARCHAR
);

CREATE TABLE `course_ui_canvas_navigation_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `name` VARCHAR,
  `default` VARCHAR,
  `original_position` VARCHAR
);

CREATE TABLE `course_ui_navigation_item_dim` (
  `id` BIGINT,
  `root_account_id` BIGINT,
  `visible` VARCHAR,
  `position` INT
);

CREATE TABLE `course_ui_navigation_item_fact` (
  `root_account_id` BIGINT,
  `course_ui_navigation_item_id` BIGINT,
  `course_ui_canvas_navigation_id` BIGINT,
  `external_tool_activation_id` BIGINT,
  `course_id` BIGINT,
  `course_account_id` BIGINT,
  `enrollment_term_id` BIGINT
);

CREATE TABLE `discussion_entry_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `message` TEXT,
  `workflow_state` VARCHAR,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `deleted_at` TIMESTAMP,
  `depth` INT
);

CREATE TABLE `discussion_entry_fact` (
  `discussion_entry_id` BIGINT,
  `parent_discussion_entry_id` BIGINT,
  `user_id` BIGINT,
  `topic_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `course_account_id` BIGINT,
  `topic_user_id` BIGINT,
  `topic_assignment_id` BIGINT,
  `topic_editor_id` BIGINT,
  `enrollment_rollup_id` BIGINT,
  `message_length` INT
);

CREATE TABLE `discussion_topic_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `title` VARCHAR,
  `message` TEXT,
  `type` VARCHAR,
  `workflow_state` VARCHAR,
  `last_reply_at` TIMESTAMP,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `delayed_post_at` TIMESTAMP,
  `posted_at` TIMESTAMP,
  `deleted_at` TIMESTAMP,
  `discussion_type` VARCHAR,
  `pinned` BOOLEAN,
  `locked` BOOLEAN,
  `course_id` BIGINT,
  `group_id` BIGINT
);

CREATE TABLE `discussion_topic_fact` (
  `discussion_topic_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `course_account_id` BIGINT,
  `user_id` BIGINT,
  `assignment_id` BIGINT,
  `editor_id` BIGINT,
  `enrollment_rollup_id` BIGINT,
  `message_length` INT,
  `group_id` BIGINT,
  `group_parent_course_id` BIGINT,
  `group_parent_account_id` BIGINT,
  `group_parent_course_account_id` BIGINT
);

CREATE TABLE `enrollment_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `root_account_id` BIGINT,
  `course_section_id` BIGINT,
  `role_id` BIGINT,
  `type` VARCHAR,
  `workflow_state` VARCHAR,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `start_at` TIMESTAMP,
  `end_at` TIMESTAMP,
  `completed_at` TIMESTAMP,
  `self_enrolled` BOOLEAN,
  `sis_source_id` VARCHAR,
  `course_id` BIGINT,
  `user_id` BIGINT,
  `last_activity_at` TIMESTAMP
);

CREATE TABLE `enrollment_fact` (
  `enrollment_id` BIGINT,
  `user_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `course_account_id` BIGINT,
  `course_section_id` BIGINT,
  `computed_final_score` DOUBLE,
  `computed_current_score` DOUBLE
);

CREATE TABLE `enrollment_rollup_dim` (
  `id` BIGINT,
  `user_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_count` INT,
  `role_count` INT,
  `base_role_count` INT,
  `account_admin_role_count` INT,
  `teacher_enrollment_role_count` INT,
  `designer_enrollment_role_count` INT,
  `ta_enrollment_role_count` INT,
  `student_enrollment_role_count` INT,
  `observer_enrollment_role_count` INT,
  `account_membership_role_count` INT,
  `no_permissions_role_count` INT,
  `account_admin_enrollment_id` BIGINT,
  `teacher_enrollment_enrollment_id` BIGINT,
  `designer_enrollment_enrollment_id` BIGINT,
  `ta_enrollment_enrollment_id` BIGINT,
  `student_enrollment_enrollment_id` BIGINT,
  `observer_enrollment_enrollment_id` BIGINT,
  `account_membership_enrollment_id` BIGINT,
  `no_permissions_enrollment_id` BIGINT,
  `most_privileged_role` VARCHAR,
  `least_privileged_role` VARCHAR
);

CREATE TABLE `enrollment_term_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `root_account_id` BIGINT,
  `name` VARCHAR,
  `date_start` TIMESTAMP,
  `date_end` TIMESTAMP,
  `sis_source_id` VARCHAR
);

CREATE TABLE `external_tool_activation_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `course_id` BIGINT,
  `account_id` BIGINT,
  `activation_target_type` VARCHAR,
  `url` VARCHAR,
  `name` VARCHAR,
  `description` VARCHAR,
  `workflow_state` VARCHAR,
  `privacy_level` VARCHAR,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `tool_id` VARCHAR,
  `selectable_all` BOOLEAN
);

CREATE TABLE `external_tool_activation_fact` (
  `external_tool_activation_id` BIGINT,
  `course_id` BIGINT,
  `account_id` BIGINT,
  `root_account_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `course_account_id` BIGINT
);

CREATE TABLE `file_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `display_name` TEXT,
  `account_id` BIGINT,
  `assignment_id` BIGINT,
  `conversation_message_id` BIGINT,
  `course_id` BIGINT,
  `folder_id` BIGINT,
  `group_id` BIGINT,
  `quiz_id` BIGINT,
  `quiz_submission_id` BIGINT,
  `replacement_file_id` BIGINT,
  `root_file_id` BIGINT,
  `submission_id` BIGINT,
  `uploader_id` BIGINT,
  `user_id` BIGINT,
  `owner_entity_type` ENUM,
  `content_type` VARCHAR,
  `md5` VARCHAR,
  `file_state` ENUM,
  `could_be_locked` ENUM,
  `locked` ENUM,
  `lock_at` TIMESTAMP,
  `unlock_at` TIMESTAMP,
  `viewed_at` TIMESTAMP,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `deleted_at` TIMESTAMP
);

CREATE TABLE `file_fact` (
  `file_id` BIGINT,
  `account_id` BIGINT,
  `assignment_id` BIGINT,
  `assignment_group_id` BIGINT,
  `conversation_id` BIGINT,
  `conversation_message_author_id` BIGINT,
  `conversation_message_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_rollup_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `folder_id` BIGINT,
  `grader_id` BIGINT,
  `group_id` BIGINT,
  `group_category_id` BIGINT,
  `quiz_id` BIGINT,
  `quiz_submission_id` BIGINT,
  `replacement_file_id` BIGINT,
  `root_file_id` BIGINT,
  `sis_source_id` VARCHAR,
  `submission_id` BIGINT,
  `uploader_id` BIGINT,
  `user_id` BIGINT,
  `wiki_id` BIGINT,
  `size` BIGINT
);

CREATE TABLE `grading_period_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `grading_period_group_id` BIGINT,
  `close_date` TIMESTAMP,
  `created_at` TIMESTAMP,
  `end_date` TIMESTAMP,
  `start_date` TIMESTAMP,
  `title` VARCHAR,
  `updated_at` TIMESTAMP,
  `workflow_state` VARCHAR
);

CREATE TABLE `grading_period_fact` (
  `grading_period_id` BIGINT,
  `canvas_id` BIGINT,
  `grading_period_group_id` BIGINT,
  `grading_period_group_account_id` BIGINT,
  `grading_period_group_course_id` BIGINT,
  `weight` DOUBLE
);

CREATE TABLE `grading_period_group_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `course_id` BIGINT,
  `account_id` BIGINT,
  `created_at` TIMESTAMP,
  `title` VARCHAR,
  `updated_at` TIMESTAMP,
  `workflow_state` VARCHAR
);

CREATE TABLE `grading_period_score_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `enrollment_id` BIGINT,
  `grading_period_id` BIGINT,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `workflow_state` ENUM
);

CREATE TABLE `grading_period_score_fact` (
  `score_id` BIGINT,
  `canvas_id` BIGINT,
  `account_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_id` BIGINT,
  `grading_period_id` BIGINT,
  `grading_period_group_id` BIGINT,
  `grading_period_group_account_id` BIGINT,
  `current_score` DOUBLE,
  `final_score` DOUBLE,
  `muted_current_score` DOUBLE,
  `muted_final_score` DOUBLE
);

CREATE TABLE `group_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `name` VARCHAR,
  `description` TEXT,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `deleted_at` TIMESTAMP,
  `is_public` BOOLEAN,
  `workflow_state` VARCHAR,
  `context_type` VARCHAR,
  `category` TEXT,
  `join_level` VARCHAR,
  `default_view` VARCHAR,
  `sis_source_id` BIGINT,
  `group_category_id` BIGINT,
  `account_id` BIGINT,
  `wiki_id` BIGINT
);

CREATE TABLE `group_fact` (
  `group_id` BIGINT,
  `parent_course_id` BIGINT,
  `parent_account_id` BIGINT,
  `parent_course_account_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `max_membership` INT,
  `storage_quota` BIGINT,
  `group_category_id` BIGINT,
  `account_id` BIGINT,
  `wiki_id` BIGINT
);

CREATE TABLE `group_membership_dim` (
  `id` VARCHAR,
  `canvas_id` VARCHAR,
  `group_id` BIGINT,
  `moderator` ENUM,
  `workflow_state` ENUM,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `group_membership_fact` (
  `group_id` BIGINT,
  `parent_course_id` BIGINT,
  `parent_account_id` BIGINT,
  `parent_course_account_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `user_id` BIGINT,
  `group_membership_id` VARCHAR
);

CREATE TABLE `learning_outcome_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `account_id` BIGINT,
  `course_id` BIGINT,
  `short_description` VARCHAR,
  `description` TEXT,
  `workflow_state` VARCHAR,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `vendor_guid` VARCHAR,
  `display_name` VARCHAR,
  `calculation_method` TEXT,
  `calculation_int` INT,
  `outcome_import_id` BIGINT
);

CREATE TABLE `learning_outcome_fact` (
  `learning_outcome_id` BIGINT,
  `account_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `mastery_points` DOUBLE,
  `points_possible` DOUBLE,
  `outcome_import_id` BIGINT
);

CREATE TABLE `learning_outcome_group_association_fact` (
  `learning_outcome_id` BIGINT,
  `learning_outcome_group_id` BIGINT,
  `account_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT
);

CREATE TABLE `learning_outcome_group_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `account_id` BIGINT,
  `course_id` BIGINT,
  `title` VARCHAR,
  `parent_group_id` BIGINT,
  `root_group_id` BIGINT,
  `workflow_state` VARCHAR,
  `description` TEXT,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `vendor_guid` VARCHAR,
  `outcome_import_id` BIGINT
);

CREATE TABLE `learning_outcome_group_fact` (
  `learning_outcome_group_id` BIGINT,
  `account_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `parent_group_id` BIGINT,
  `root_group_id` BIGINT,
  `outcome_import_id` BIGINT
);

CREATE TABLE `learning_outcome_question_result_dim` (
  `id` BIGINT,
  `learning_outcome_result_id` BIGINT,
  `learning_outcome_id` BIGINT,
  `assessment_question_id` BIGINT,
  `title` TEXT,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `assessed_at` TIMESTAMP,
  `submitted_at` TIMESTAMP
);

CREATE TABLE `learning_outcome_question_result_fact` (
  `learning_outcome_question_result_id` BIGINT,
  `learning_outcome_result_id` BIGINT,
  `learning_outcome_id` BIGINT,
  `assessment_question_id` BIGINT,
  `user_id` BIGINT,
  `account_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `assignment_id` BIGINT,
  `quiz_id` BIGINT,
  `mastery` BOOLEAN,
  `score` DOUBLE,
  `attempts` INT,
  `possible` DOUBLE,
  `original_score` DOUBLE,
  `original_possible` DOUBLE,
  `original_mastery` BOOLEAN,
  `percent` DOUBLE
);

CREATE TABLE `learning_outcome_result_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `account_id` BIGINT,
  `course_id` BIGINT,
  `assignment_id` BIGINT,
  `quiz_id` BIGINT,
  `learning_outcome_id` BIGINT,
  `user_id` BIGINT,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `assessed_at` TIMESTAMP,
  `submitted_at` TIMESTAMP,
  `hide_points` BOOLEAN,
  `hidden` BOOLEAN
);

CREATE TABLE `learning_outcome_result_fact` (
  `learning_outcome_result_id` BIGINT,
  `account_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `assignment_id` BIGINT,
  `quiz_id` BIGINT,
  `learning_outcome_id` BIGINT,
  `user_id` BIGINT,
  `mastery` BOOLEAN,
  `score` DOUBLE,
  `attempts` INT,
  `possible` DOUBLE,
  `original_score` DOUBLE,
  `original_possible` DOUBLE,
  `original_mastery` BOOLEAN,
  `percent` DOUBLE
);

CREATE TABLE `learning_outcome_rubric_criterion_dim` (
  `id` BIGINT,
  `learning_outcome_id` BIGINT,
  `description` TEXT
);

CREATE TABLE `learning_outcome_rubric_criterion_fact` (
  `learning_outcome_rubric_criterion_id` BIGINT,
  `learning_outcome_id` BIGINT,
  `account_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `points` DOUBLE
);

CREATE TABLE `module_completion_requirement_dim` (
  `id` BIGINT,
  `module_id` BIGINT,
  `module_item_id` BIGINT,
  `requirement_type` ENUM
);

CREATE TABLE `module_completion_requirement_fact` (
  `module_completion_requirement_id` BIGINT,
  `account_id` BIGINT,
  `assignment_id` BIGINT,
  `assignment_group_id` BIGINT,
  `course_id` BIGINT,
  `discussion_topic_id` BIGINT,
  `discussion_topic_editor_id` BIGINT,
  `enrollment_rollup_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `file_id` BIGINT,
  `module_id` BIGINT,
  `module_item_id` BIGINT,
  `quiz_id` BIGINT,
  `user_id` BIGINT,
  `wiki_id` BIGINT,
  `wiki_page_id` BIGINT,
  `min_score` DOUBLE
);

CREATE TABLE `module_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `course_id` BIGINT,
  `require_sequential_progress` ENUM,
  `workflow_state` ENUM,
  `position` INT,
  `name` TEXT,
  `created_at` TIMESTAMP,
  `deleted_at` TIMESTAMP,
  `unlock_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `module_fact` (
  `module_id` BIGINT,
  `account_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `wiki_id` BIGINT
);

CREATE TABLE `module_item_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `assignment_id` BIGINT,
  `course_id` BIGINT,
  `discussion_topic_id` BIGINT,
  `file_id` BIGINT,
  `module_id` BIGINT,
  `quiz_id` BIGINT,
  `wiki_page_id` BIGINT,
  `content_type` ENUM,
  `workflow_state` ENUM,
  `position` INT,
  `title` TEXT,
  `url` TEXT,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `module_item_fact` (
  `module_item_id` BIGINT,
  `account_id` BIGINT,
  `assignment_id` BIGINT,
  `assignment_group_id` BIGINT,
  `course_id` BIGINT,
  `discussion_topic_id` BIGINT,
  `discussion_topic_editor_id` BIGINT,
  `enrollment_rollup_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `file_id` BIGINT,
  `module_id` BIGINT,
  `quiz_id` BIGINT,
  `user_id` BIGINT,
  `wiki_id` BIGINT,
  `wiki_page_id` BIGINT
);

CREATE TABLE `module_prerequisite_dim` (
  `id` BIGINT,
  `module_id` BIGINT,
  `prerequisite_module_id` BIGINT
);

CREATE TABLE `module_prerequisite_fact` (
  `module_prerequisite_id` BIGINT,
  `account_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `module_id` BIGINT,
  `prerequisite_module_id` BIGINT,
  `prerequisite_wiki_id` BIGINT,
  `wiki_id` BIGINT
);

CREATE TABLE `module_progression_completion_requirement_dim` (
  `id` BIGINT,
  `module_progression_id` BIGINT,
  `module_item_id` BIGINT,
  `requirement_type` ENUM,
  `completion_status` ENUM
);

CREATE TABLE `module_progression_completion_requirement_fact` (
  `module_progression_completion_requirement_id` BIGINT,
  `account_id` BIGINT,
  `assignment_id` BIGINT,
  `assignment_group_id` BIGINT,
  `course_id` BIGINT,
  `discussion_topic_id` BIGINT,
  `discussion_topic_editor_id` BIGINT,
  `enrollment_rollup_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `file_id` BIGINT,
  `module_id` BIGINT,
  `module_item_id` BIGINT,
  `module_progression_id` BIGINT,
  `quiz_id` BIGINT,
  `user_id` BIGINT,
  `wiki_id` BIGINT,
  `wiki_page_id` BIGINT,
  `min_score` DOUBLE,
  `score` DOUBLE
);

CREATE TABLE `module_progression_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `module_id` BIGINT,
  `user_id` BIGINT,
  `collapsed` ENUM,
  `is_current` ENUM,
  `workflow_state` ENUM,
  `current_position` INT,
  `lock_version` INT,
  `created_at` TIMESTAMP,
  `completed_at` TIMESTAMP,
  `evaluated_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `module_progression_fact` (
  `module_progression_id` BIGINT,
  `account_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `module_id` BIGINT,
  `user_id` BIGINT,
  `wiki_id` BIGINT
);

CREATE TABLE `pseudonym_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `user_id` BIGINT,
  `account_id` BIGINT,
  `workflow_state` VARCHAR,
  `last_request_at` TIMESTAMP,
  `last_login_at` TIMESTAMP,
  `current_login_at` TIMESTAMP,
  `last_login_ip` VARCHAR,
  `current_login_ip` VARCHAR,
  `position` INT,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `password_auto_generated` BOOLEAN,
  `deleted_at` TIMESTAMP,
  `sis_user_id` VARCHAR,
  `unique_name` VARCHAR,
  `integration_id` VARCHAR,
  `authentication_provider_id` BIGINT
);

CREATE TABLE `pseudonym_fact` (
  `pseudonym_id` BIGINT,
  `user_id` BIGINT,
  `account_id` BIGINT,
  `login_count` INT,
  `failed_login_count` INT
);

CREATE TABLE `quiz_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `root_account_id` BIGINT,
  `name` VARCHAR,
  `points_possible` DOUBLE,
  `description` TEXT,
  `quiz_type` VARCHAR,
  `course_id` BIGINT,
  `assignment_id` BIGINT,
  `workflow_state` VARCHAR,
  `scoring_policy` VARCHAR,
  `anonymous_submissions` VARCHAR,
  `display_questions` VARCHAR,
  `answer_display_order` VARCHAR,
  `go_back_to_previous_question` VARCHAR,
  `could_be_locked` VARCHAR,
  `browser_lockdown` VARCHAR,
  `browser_lockdown_for_displaying_results` VARCHAR,
  `browser_lockdown_monitor` VARCHAR,
  `ip_filter` VARCHAR,
  `show_results` VARCHAR,
  `show_correct_answers` VARCHAR,
  `show_correct_answers_at` TIMESTAMP,
  `hide_correct_answers_at` TIMESTAMP,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `published_at` TIMESTAMP,
  `unlock_at` TIMESTAMP,
  `lock_at` TIMESTAMP,
  `due_at` TIMESTAMP,
  `deleted_at` TIMESTAMP
);

CREATE TABLE `quiz_fact` (
  `quiz_id` BIGINT,
  `points_possible` DOUBLE,
  `time_limit` INT,
  `allowed_attempts` INT,
  `unpublished_question_count` INT,
  `question_count` INT,
  `course_id` BIGINT,
  `assignment_id` BIGINT,
  `course_account_id` BIGINT,
  `enrollment_term_id` BIGINT
);

CREATE TABLE `quiz_question_answer_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `quiz_question_id` BIGINT,
  `text` TEXT,
  `html` TEXT,
  `comments` TEXT,
  `text_after_answers` TEXT,
  `answer_match_left` VARCHAR,
  `answer_match_right` VARCHAR,
  `matching_answer_incorrect_matches` VARCHAR,
  `numerical_answer_type` VARCHAR,
  `blank_id` VARCHAR,
  `exact` DOUBLE,
  `margin` DOUBLE,
  `starting_range` DOUBLE,
  `ending_range` DOUBLE
);

CREATE TABLE `quiz_question_answer_fact` (
  `quiz_question_answer_id` BIGINT,
  `quiz_question_id` BIGINT,
  `quiz_question_group_id` BIGINT,
  `quiz_id` BIGINT,
  `assessment_question_id` BIGINT,
  `course_id` BIGINT,
  `assignment_id` BIGINT,
  `course_account_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `weight` DOUBLE,
  `exact` DOUBLE,
  `margin` DOUBLE,
  `starting_range` DOUBLE,
  `ending_range` DOUBLE
);

CREATE TABLE `quiz_question_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `quiz_id` BIGINT,
  `quiz_question_group_id` BIGINT,
  `position` INT,
  `workflow_state` VARCHAR,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `assessment_question_id` BIGINT,
  `assessment_question_version` INT,
  `name` VARCHAR,
  `question_type` VARCHAR,
  `question_text` TEXT,
  `regrade_option` VARCHAR,
  `correct_comments` TEXT,
  `incorrect_comments` TEXT,
  `neutral_comments` TEXT
);

CREATE TABLE `quiz_question_fact` (
  `quiz_question_id` BIGINT,
  `quiz_id` BIGINT,
  `quiz_question_group_id` BIGINT,
  `assessment_question_id` BIGINT,
  `course_id` BIGINT,
  `assignment_id` BIGINT,
  `course_account_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `points_possible` DOUBLE
);

CREATE TABLE `quiz_question_group_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `quiz_id` BIGINT,
  `name` VARCHAR,
  `position` INT,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);

CREATE TABLE `quiz_question_group_fact` (
  `quiz_question_group_id` BIGINT,
  `pick_count` INT,
  `question_points` DOUBLE,
  `quiz_id` BIGINT,
  `course_id` BIGINT,
  `assignment_id` BIGINT,
  `course_account_id` BIGINT,
  `enrollment_term_id` BIGINT
);

CREATE TABLE `quiz_submission_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `quiz_id` BIGINT,
  `submission_id` BIGINT,
  `user_id` BIGINT,
  `workflow_state` VARCHAR,
  `quiz_state_during_submission` VARCHAR,
  `submission_scoring_policy` VARCHAR,
  `submission_source` VARCHAR,
  `has_seen_results` VARCHAR,
  `temporary_user_code` VARCHAR,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `started_at` TIMESTAMP,
  `finished_at` TIMESTAMP,
  `due_at` TIMESTAMP
);

CREATE TABLE `quiz_submission_fact` (
  `score` DOUBLE,
  `kept_score` DOUBLE,
  `date` TIMESTAMP,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `course_account_id` BIGINT,
  `quiz_id` BIGINT,
  `assignment_id` BIGINT,
  `user_id` BIGINT,
  `submission_id` BIGINT,
  `enrollment_rollup_id` BIGINT,
  `quiz_submission_id` BIGINT,
  `quiz_points_possible` DOUBLE,
  `score_before_regrade` DOUBLE,
  `fudge_points` DOUBLE,
  `total_attempts` INT,
  `extra_attempts` INT,
  `extra_time` INT,
  `time_taken` INT
);

CREATE TABLE `quiz_submission_historical_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `quiz_id` BIGINT,
  `submission_id` BIGINT,
  `user_id` BIGINT,
  `version_number` INT,
  `submission_state` VARCHAR,
  `workflow_state` VARCHAR,
  `quiz_state_during_submission` VARCHAR,
  `submission_scoring_policy` VARCHAR,
  `submission_source` VARCHAR,
  `has_seen_results` VARCHAR,
  `temporary_user_code` VARCHAR,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `started_at` TIMESTAMP,
  `finished_at` TIMESTAMP,
  `due_at` TIMESTAMP
);

CREATE TABLE `quiz_submission_historical_fact` (
  `score` DOUBLE,
  `kept_score` DOUBLE,
  `date` TIMESTAMP,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `course_account_id` BIGINT,
  `quiz_id` BIGINT,
  `assignment_id` BIGINT,
  `user_id` BIGINT,
  `submission_id` BIGINT,
  `enrollment_rollup_id` BIGINT,
  `quiz_submission_historical_id` BIGINT,
  `quiz_points_possible` DOUBLE,
  `score_before_regrade` DOUBLE,
  `fudge_points` DOUBLE,
  `total_attempts` INT,
  `extra_attempts` INT,
  `extra_time` INT,
  `time_taken` INT
);

CREATE TABLE `role_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `root_account_id` BIGINT,
  `account_id` BIGINT,
  `name` VARCHAR,
  `base_role_type` VARCHAR,
  `workflow_state` VARCHAR,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `deleted_at` TIMESTAMP
);

CREATE TABLE `submission_comment_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `submission_id` BIGINT,
  `recipient_id` BIGINT,
  `author_id` BIGINT,
  `assessment_request_id` BIGINT,
  `group_comment_id` VARCHAR,
  `comment` TEXT,
  `author_name` VARCHAR,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `anonymous` BOOLEAN,
  `teacher_only_comment` BOOLEAN,
  `hidden` BOOLEAN
);

CREATE TABLE `submission_comment_fact` (
  `submission_comment_id` BIGINT,
  `submission_id` BIGINT,
  `recipient_id` BIGINT,
  `author_id` BIGINT,
  `assignment_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `course_account_id` BIGINT,
  `message_size_bytes` INT,
  `message_character_count` INT,
  `message_word_count` INT,
  `message_line_count` INT
);

CREATE TABLE `submission_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `body` TEXT,
  `url` VARCHAR,
  `grade` VARCHAR,
  `submitted_at` TIMESTAMP,
  `submission_type` ENUM,
  `workflow_state` ENUM,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `processed` BOOLEAN,
  `process_attempts` INT,
  `grade_matches_current_submission` BOOLEAN,
  `published_grade` VARCHAR,
  `graded_at` TIMESTAMP,
  `has_rubric_assessment` BOOLEAN,
  `attempt` INT,
  `has_admin_comment` BOOLEAN,
  `assignment_id` BIGINT,
  `excused` ENUM,
  `graded_anonymously` ENUM,
  `grader_id` BIGINT,
  `group_id` BIGINT,
  `quiz_submission_id` BIGINT,
  `user_id` BIGINT,
  `grade_state` ENUM,
  `posted_at` TIMESTAMP
);

CREATE TABLE `submission_fact` (
  `submission_id` BIGINT,
  `assignment_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `user_id` BIGINT,
  `grader_id` BIGINT,
  `course_account_id` BIGINT,
  `enrollment_rollup_id` BIGINT,
  `score` DOUBLE,
  `published_score` DOUBLE,
  `what_if_score` DOUBLE,
  `submission_comments_count` INT,
  `account_id` BIGINT,
  `assignment_group_id` BIGINT,
  `group_id` BIGINT,
  `quiz_id` BIGINT,
  `quiz_submission_id` BIGINT,
  `wiki_id` BIGINT
);

CREATE TABLE `submission_file_fact` (
  `submission_file_id` BIGINT,
  `file_id` BIGINT,
  `submission_id` BIGINT,
  `assignment_id` BIGINT,
  `user_id` BIGINT,
  `grader_id` BIGINT,
  `course_id` BIGINT,
  `enrollment_term_id` BIGINT
);

CREATE TABLE `user_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `root_account_id` BIGINT,
  `name` VARCHAR,
  `time_zone` VARCHAR,
  `created_at` TIMESTAMP,
  `visibility` VARCHAR,
  `school_name` VARCHAR,
  `school_position` VARCHAR,
  `gender` VARCHAR,
  `locale` VARCHAR,
  `public` VARCHAR,
  `birthdate` TIMESTAMP,
  `country_code` VARCHAR,
  `workflow_state` VARCHAR,
  `sortable_name` VARCHAR,
  `global_canvas_id` VARCHAR
);

CREATE TABLE `wiki_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `parent_type` VARCHAR,
  `title` TEXT,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `front_page_url` TEXT,
  `has_no_front_page` BOOLEAN
);

CREATE TABLE `wiki_fact` (
  `wiki_id` BIGINT,
  `parent_course_id` BIGINT,
  `parent_group_id` BIGINT,
  `parent_course_account_id` BIGINT,
  `parent_group_account_id` BIGINT,
  `account_id` BIGINT,
  `root_account_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `group_category_id` BIGINT
);

CREATE TABLE `wiki_page_dim` (
  `id` BIGINT,
  `canvas_id` BIGINT,
  `title` VARCHAR,
  `body` TEXT,
  `workflow_state` VARCHAR,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `url` TEXT,
  `protected_editing` BOOLEAN,
  `editing_roles` VARCHAR,
  `revised_at` TIMESTAMP,
  `could_be_locked` BOOLEAN
);

CREATE TABLE `wiki_page_fact` (
  `wiki_page_id` BIGINT,
  `wiki_id` BIGINT,
  `parent_course_id` BIGINT,
  `parent_group_id` BIGINT,
  `parent_course_account_id` BIGINT,
  `parent_group_account_id` BIGINT,
  `user_id` BIGINT,
  `account_id` BIGINT,
  `root_account_id` BIGINT,
  `enrollment_term_id` BIGINT,
  `group_category_id` BIGINT,
  `wiki_page_comments_count` INT,
  `view_count` INT
);

CREATE TABLE `requests` (
  `id` guid,
  `timestamp` datetime,
  `timestamp_year` VARCHAR,
  `timestamp_month` VARCHAR,
  `timestamp_day` VARCHAR,
  `user_id` BIGINT,
  `course_id` BIGINT,
  `root_account_id` BIGINT,
  `course_account_id` BIGINT,
  `quiz_id` BIGINT,
  `discussion_id` BIGINT,
  `conversation_id` BIGINT,
  `assignment_id` BIGINT,
  `url` TEXT,
  `user_agent` TEXT,
  `http_method` VARCHAR,
  `remote_ip` VARCHAR,
  `interaction_micros` BIGINT,
  `web_application_controller` VARCHAR,
  `web_application_action` VARCHAR,
  `web_application_context_type` VARCHAR,
  `web_application_context_id` VARCHAR,
  `real_user_id` BIGINT,
  `session_id` VARCHAR,
  `user_agent_id` BIGINT,
  `http_status` VARCHAR,
  `http_version` VARCHAR,
  `developer_key_id` BIGINT
);

ALTER TABLE `assignment_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `assignment_dim` ADD FOREIGN KEY (`assignment_group_id`) REFERENCES `assignment_group_dim` (`id`);

ALTER TABLE `assignment_dim` ADD FOREIGN KEY (`external_tool_id`) REFERENCES `external_tool_activation_dim` (`id`);

ALTER TABLE `assignment_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `assignment_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `assignment_fact` ADD FOREIGN KEY (`course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `assignment_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `assignment_fact` ADD FOREIGN KEY (`assignment_group_id`) REFERENCES `assignment_group_dim` (`id`);

ALTER TABLE `assignment_fact` ADD FOREIGN KEY (`external_tool_id`) REFERENCES `external_tool_activation_dim` (`id`);

ALTER TABLE `assignment_group_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `assignment_group_fact` ADD FOREIGN KEY (`assignment_group_id`) REFERENCES `assignment_group_dim` (`id`);

ALTER TABLE `assignment_group_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `assignment_group_score_dim` ADD FOREIGN KEY (`assignment_group_id`) REFERENCES `assignment_group_dim` (`id`);

ALTER TABLE `assignment_group_score_dim` ADD FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment_dim` (`id`);

ALTER TABLE `assignment_group_score_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `assignment_group_score_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `assignment_group_score_fact` ADD FOREIGN KEY (`assignment_group_id`) REFERENCES `assignment_group_dim` (`id`);

ALTER TABLE `assignment_group_score_fact` ADD FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment_dim` (`id`);

ALTER TABLE `assignment_override_dim` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `assignment_override_dim` ADD FOREIGN KEY (`course_section_id`) REFERENCES `course_section_dim` (`id`);

ALTER TABLE `assignment_override_dim` ADD FOREIGN KEY (`group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `assignment_override_dim` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `assignment_override_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `assignment_override_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `assignment_override_fact` ADD FOREIGN KEY (`assignment_group_id`) REFERENCES `assignment_group_dim` (`id`);

ALTER TABLE `assignment_override_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `assignment_override_fact` ADD FOREIGN KEY (`course_section_id`) REFERENCES `course_section_dim` (`id`);

ALTER TABLE `assignment_override_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `assignment_override_fact` ADD FOREIGN KEY (`group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `assignment_override_fact` ADD FOREIGN KEY (`group_parent_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `assignment_override_fact` ADD FOREIGN KEY (`nonxlist_course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `assignment_override_fact` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `assignment_override_fact` ADD FOREIGN KEY (`group_wiki_id`) REFERENCES `wiki_dim` (`id`);

ALTER TABLE `assignment_override_user_dim` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `assignment_override_user_dim` ADD FOREIGN KEY (`assignment_override_id`) REFERENCES `assignment_override_dim` (`id`);

ALTER TABLE `assignment_override_user_dim` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `assignment_override_user_dim` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `assignment_override_user_fact` ADD FOREIGN KEY (`assignment_override_user_id`) REFERENCES `assignment_override_user_dim` (`id`);

ALTER TABLE `assignment_override_user_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `assignment_override_user_fact` ADD FOREIGN KEY (`assignment_group_id`) REFERENCES `assignment_group_dim` (`id`);

ALTER TABLE `assignment_override_user_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `assignment_override_user_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `assignment_override_user_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `assignment_override_user_fact` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `assignment_override_user_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `assignment_override_user_rollup_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `assignment_override_user_rollup_fact` ADD FOREIGN KEY (`assignment_override_id`) REFERENCES `assignment_override_dim` (`id`);

ALTER TABLE `assignment_override_user_rollup_fact` ADD FOREIGN KEY (`assignment_override_user_adhoc_id`) REFERENCES `assignment_override_user_dim` (`id`);

ALTER TABLE `assignment_override_user_rollup_fact` ADD FOREIGN KEY (`assignment_group_id`) REFERENCES `assignment_group_dim` (`id`);

ALTER TABLE `assignment_override_user_rollup_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `assignment_override_user_rollup_fact` ADD FOREIGN KEY (`course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `assignment_override_user_rollup_fact` ADD FOREIGN KEY (`course_section_id`) REFERENCES `course_section_dim` (`id`);

ALTER TABLE `assignment_override_user_rollup_fact` ADD FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment_dim` (`id`);

ALTER TABLE `assignment_override_user_rollup_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `assignment_override_user_rollup_fact` ADD FOREIGN KEY (`group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `assignment_override_user_rollup_fact` ADD FOREIGN KEY (`group_parent_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `assignment_override_user_rollup_fact` ADD FOREIGN KEY (`group_wiki_id`) REFERENCES `wiki_dim` (`id`);

ALTER TABLE `assignment_override_user_rollup_fact` ADD FOREIGN KEY (`nonxlist_course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `assignment_override_user_rollup_fact` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `assignment_override_user_rollup_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `assignment_rule_dim` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `catalog_applicant_dim` ADD FOREIGN KEY (`catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_applicant_dim` ADD FOREIGN KEY (`catalog_product_id`) REFERENCES `catalog_product_dim` (`id`);

ALTER TABLE `catalog_applicant_dim` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `catalog_dim` ADD FOREIGN KEY (`parent_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_enrollment_dim` ADD FOREIGN KEY (`catalog_product_id`) REFERENCES `catalog_product_dim` (`id`);

ALTER TABLE `catalog_enrollment_dim` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `catalog_enrollment_dim` ADD FOREIGN KEY (`root_program_id`) REFERENCES `catalog_product_dim` (`id`);

ALTER TABLE `catalog_order_dim` ADD FOREIGN KEY (`catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_order_dim` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `catalog_order_fact` ADD FOREIGN KEY (`catalog_order_id`) REFERENCES `catalog_order_dim` (`id`);

ALTER TABLE `catalog_order_fact` ADD FOREIGN KEY (`catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_order_fact` ADD FOREIGN KEY (`parent_catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_order_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `catalog_order_item_dim` ADD FOREIGN KEY (`catalog_order_id`) REFERENCES `catalog_order_dim` (`id`);

ALTER TABLE `catalog_order_item_dim` ADD FOREIGN KEY (`catalog_product_id`) REFERENCES `catalog_product_dim` (`id`);

ALTER TABLE `catalog_order_item_dim` ADD FOREIGN KEY (`catalog_promotion_id`) REFERENCES `catalog_promotion_dim` (`id`);

ALTER TABLE `catalog_order_item_fact` ADD FOREIGN KEY (`catalog_order_item_id`) REFERENCES `catalog_order_dim` (`id`);

ALTER TABLE `catalog_order_item_fact` ADD FOREIGN KEY (`catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_order_item_fact` ADD FOREIGN KEY (`parent_catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_order_item_fact` ADD FOREIGN KEY (`catalog_order_id`) REFERENCES `catalog_order_dim` (`id`);

ALTER TABLE `catalog_order_item_fact` ADD FOREIGN KEY (`catalog_product_id`) REFERENCES `catalog_product_dim` (`id`);

ALTER TABLE `catalog_order_item_fact` ADD FOREIGN KEY (`catalog_promotion_id`) REFERENCES `catalog_product_dim` (`id`);

ALTER TABLE `catalog_payment_dim` ADD FOREIGN KEY (`catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_payment_dim` ADD FOREIGN KEY (`catalog_order_id`) REFERENCES `catalog_order_dim` (`id`);

ALTER TABLE `catalog_payment_fact` ADD FOREIGN KEY (`catalog_payment_id`) REFERENCES `catalog_payment_dim` (`id`);

ALTER TABLE `catalog_payment_fact` ADD FOREIGN KEY (`catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_payment_fact` ADD FOREIGN KEY (`parent_catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_payment_fact` ADD FOREIGN KEY (`catalog_order_id`) REFERENCES `catalog_order_dim` (`id`);

ALTER TABLE `catalog_product_dim` ADD FOREIGN KEY (`catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_product_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `catalog_product_fact` ADD FOREIGN KEY (`catalog_product_id`) REFERENCES `catalog_product_dim` (`id`);

ALTER TABLE `catalog_product_fact` ADD FOREIGN KEY (`catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_product_fact` ADD FOREIGN KEY (`parent_catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_product_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `catalog_product_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `catalog_product_tag_dim` ADD FOREIGN KEY (`catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_product_tag_dim` ADD FOREIGN KEY (`catalog_product_id`) REFERENCES `catalog_product_dim` (`id`);

ALTER TABLE `catalog_product_tag_dim` ADD FOREIGN KEY (`catalog_tag_id`) REFERENCES `catalog_tag_dim` (`id`);

ALTER TABLE `catalog_program_requirement_fact` ADD FOREIGN KEY (`catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_program_requirement_fact` ADD FOREIGN KEY (`catalog_program_id`) REFERENCES `catalog_product_dim` (`id`);

ALTER TABLE `catalog_program_requirement_fact` ADD FOREIGN KEY (`catalog_product_id`) REFERENCES `catalog_product_dim` (`id`);

ALTER TABLE `catalog_program_requirement_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `catalog_promotion_dim` ADD FOREIGN KEY (`catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_promotion_dim` ADD FOREIGN KEY (`catalog_product_id`) REFERENCES `catalog_product_dim` (`id`);

ALTER TABLE `catalog_promotion_fact` ADD FOREIGN KEY (`catalog_promotion_id`) REFERENCES `catalog_promotion_dim` (`id`);

ALTER TABLE `catalog_promotion_fact` ADD FOREIGN KEY (`catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_promotion_fact` ADD FOREIGN KEY (`parent_catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_promotion_fact` ADD FOREIGN KEY (`catalog_product_id`) REFERENCES `catalog_product_dim` (`id`);

ALTER TABLE `catalog_tag_dim` ADD FOREIGN KEY (`catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_user_registration_dim` ADD FOREIGN KEY (`catalog_id`) REFERENCES `catalog_dim` (`id`);

ALTER TABLE `catalog_user_registration_dim` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `communication_channel_dim` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `communication_channel_fact` ADD FOREIGN KEY (`communication_channel_id`) REFERENCES `communication_channel_dim` (`id`);

ALTER TABLE `communication_channel_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `conference_dim` ADD FOREIGN KEY (`group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `conference_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `conference_dim` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `conference_fact` ADD FOREIGN KEY (`conference_id`) REFERENCES `conference_dim` (`id`);

ALTER TABLE `conference_fact` ADD FOREIGN KEY (`group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `conference_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `conference_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `conference_participant_dim` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `conference_participant_dim` ADD FOREIGN KEY (`conference_id`) REFERENCES `conference_dim` (`id`);

ALTER TABLE `conference_participant_fact` ADD FOREIGN KEY (`conference_participant_id`) REFERENCES `conference_participant_dim` (`id`);

ALTER TABLE `conference_participant_fact` ADD FOREIGN KEY (`group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `conference_participant_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `conference_participant_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `conference_participant_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `conference_participant_fact` ADD FOREIGN KEY (`conference_id`) REFERENCES `conference_dim` (`id`);

ALTER TABLE `conversation_message_participant_fact` ADD FOREIGN KEY (`conversation_message_id`) REFERENCES `conversation_message_dim` (`id`);

ALTER TABLE `conversation_message_participant_fact` ADD FOREIGN KEY (`conversation_id`) REFERENCES `conversation_dim` (`id`);

ALTER TABLE `conversation_message_participant_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `conversation_message_participant_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `conversation_message_participant_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `conversation_message_participant_fact` ADD FOREIGN KEY (`course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `conversation_message_participant_fact` ADD FOREIGN KEY (`group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `conversation_message_participant_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `conversation_message_participant_fact` ADD FOREIGN KEY (`enrollment_rollup_id`) REFERENCES `enrollment_rollup_dim` (`id`);

ALTER TABLE `course_dim` ADD FOREIGN KEY (`root_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `course_dim` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `course_dim` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `course_dim` ADD FOREIGN KEY (`wiki_id`) REFERENCES `wiki_dim` (`id`);

ALTER TABLE `course_score_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `course_score_dim` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `course_score_dim` ADD FOREIGN KEY (`nonxlist_course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `course_score_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `course_score_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `course_score_fact` ADD FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment_dim` (`id`);

ALTER TABLE `course_section_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `course_section_dim` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `course_section_dim` ADD FOREIGN KEY (`nonxlist_course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `course_ui_navigation_item_dim` ADD FOREIGN KEY (`root_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `course_ui_navigation_item_fact` ADD FOREIGN KEY (`root_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `course_ui_navigation_item_fact` ADD FOREIGN KEY (`course_ui_navigation_item_id`) REFERENCES `course_ui_navigation_item_dim` (`id`);

ALTER TABLE `course_ui_navigation_item_fact` ADD FOREIGN KEY (`course_ui_canvas_navigation_id`) REFERENCES `course_ui_canvas_navigation_dim` (`id`);

ALTER TABLE `course_ui_navigation_item_fact` ADD FOREIGN KEY (`external_tool_activation_id`) REFERENCES `external_tool_activation_dim` (`id`);

ALTER TABLE `course_ui_navigation_item_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `course_ui_navigation_item_fact` ADD FOREIGN KEY (`course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `course_ui_navigation_item_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `discussion_entry_fact` ADD FOREIGN KEY (`discussion_entry_id`) REFERENCES `discussion_entry_dim` (`id`);

ALTER TABLE `discussion_entry_fact` ADD FOREIGN KEY (`parent_discussion_entry_id`) REFERENCES `discussion_entry_dim` (`id`);

ALTER TABLE `discussion_entry_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `discussion_entry_fact` ADD FOREIGN KEY (`topic_id`) REFERENCES `discussion_topic_dim` (`id`);

ALTER TABLE `discussion_entry_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `discussion_entry_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `discussion_entry_fact` ADD FOREIGN KEY (`course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `discussion_entry_fact` ADD FOREIGN KEY (`topic_user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `discussion_entry_fact` ADD FOREIGN KEY (`topic_assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `discussion_entry_fact` ADD FOREIGN KEY (`topic_editor_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `discussion_entry_fact` ADD FOREIGN KEY (`enrollment_rollup_id`) REFERENCES `enrollment_rollup_dim` (`id`);

ALTER TABLE `discussion_topic_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `discussion_topic_dim` ADD FOREIGN KEY (`group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `discussion_topic_fact` ADD FOREIGN KEY (`discussion_topic_id`) REFERENCES `discussion_topic_dim` (`id`);

ALTER TABLE `discussion_topic_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `discussion_topic_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `discussion_topic_fact` ADD FOREIGN KEY (`course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `discussion_topic_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `discussion_topic_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `discussion_topic_fact` ADD FOREIGN KEY (`editor_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `discussion_topic_fact` ADD FOREIGN KEY (`enrollment_rollup_id`) REFERENCES `enrollment_rollup_dim` (`id`);

ALTER TABLE `discussion_topic_fact` ADD FOREIGN KEY (`group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `discussion_topic_fact` ADD FOREIGN KEY (`group_parent_course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `discussion_topic_fact` ADD FOREIGN KEY (`group_parent_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `discussion_topic_fact` ADD FOREIGN KEY (`group_parent_course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `enrollment_dim` ADD FOREIGN KEY (`root_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `enrollment_dim` ADD FOREIGN KEY (`course_section_id`) REFERENCES `course_section_dim` (`id`);

ALTER TABLE `enrollment_dim` ADD FOREIGN KEY (`role_id`) REFERENCES `role_dim` (`id`);

ALTER TABLE `enrollment_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `enrollment_dim` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `enrollment_fact` ADD FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment_dim` (`id`);

ALTER TABLE `enrollment_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `enrollment_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `enrollment_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `enrollment_fact` ADD FOREIGN KEY (`course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `enrollment_fact` ADD FOREIGN KEY (`course_section_id`) REFERENCES `course_section_dim` (`id`);

ALTER TABLE `enrollment_rollup_dim` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `enrollment_rollup_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `enrollment_rollup_dim` ADD FOREIGN KEY (`account_admin_enrollment_id`) REFERENCES `enrollment_dim` (`id`);

ALTER TABLE `enrollment_rollup_dim` ADD FOREIGN KEY (`teacher_enrollment_enrollment_id`) REFERENCES `enrollment_dim` (`id`);

ALTER TABLE `enrollment_rollup_dim` ADD FOREIGN KEY (`designer_enrollment_enrollment_id`) REFERENCES `enrollment_dim` (`id`);

ALTER TABLE `enrollment_rollup_dim` ADD FOREIGN KEY (`ta_enrollment_enrollment_id`) REFERENCES `enrollment_dim` (`id`);

ALTER TABLE `enrollment_rollup_dim` ADD FOREIGN KEY (`student_enrollment_enrollment_id`) REFERENCES `enrollment_dim` (`id`);

ALTER TABLE `enrollment_rollup_dim` ADD FOREIGN KEY (`observer_enrollment_enrollment_id`) REFERENCES `enrollment_dim` (`id`);

ALTER TABLE `enrollment_rollup_dim` ADD FOREIGN KEY (`account_membership_enrollment_id`) REFERENCES `enrollment_dim` (`id`);

ALTER TABLE `enrollment_rollup_dim` ADD FOREIGN KEY (`no_permissions_enrollment_id`) REFERENCES `enrollment_dim` (`id`);

ALTER TABLE `enrollment_term_dim` ADD FOREIGN KEY (`root_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `external_tool_activation_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `external_tool_activation_dim` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `external_tool_activation_fact` ADD FOREIGN KEY (`external_tool_activation_id`) REFERENCES `external_tool_activation_dim` (`id`);

ALTER TABLE `external_tool_activation_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `external_tool_activation_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `external_tool_activation_fact` ADD FOREIGN KEY (`root_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `external_tool_activation_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `external_tool_activation_fact` ADD FOREIGN KEY (`course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `file_dim` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `file_dim` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `file_dim` ADD FOREIGN KEY (`conversation_message_id`) REFERENCES `conversation_message_dim` (`id`);

ALTER TABLE `file_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `file_dim` ADD FOREIGN KEY (`group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `file_dim` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `file_dim` ADD FOREIGN KEY (`quiz_submission_id`) REFERENCES `quiz_submission_dim` (`id`);

ALTER TABLE `file_dim` ADD FOREIGN KEY (`replacement_file_id`) REFERENCES `file_dim` (`id`);

ALTER TABLE `file_dim` ADD FOREIGN KEY (`root_file_id`) REFERENCES `file_dim` (`id`);

ALTER TABLE `file_dim` ADD FOREIGN KEY (`submission_id`) REFERENCES `submission_dim` (`id`);

ALTER TABLE `file_dim` ADD FOREIGN KEY (`uploader_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `file_dim` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`file_id`) REFERENCES `file_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`assignment_group_id`) REFERENCES `assignment_group_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`conversation_id`) REFERENCES `conversation_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`conversation_message_author_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`conversation_message_id`) REFERENCES `conversation_message_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`enrollment_rollup_id`) REFERENCES `enrollment_rollup_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`folder_id`) REFERENCES `file_dim` (`folder_id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`grader_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`quiz_submission_id`) REFERENCES `quiz_submission_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`replacement_file_id`) REFERENCES `file_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`root_file_id`) REFERENCES `file_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`submission_id`) REFERENCES `submission_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`uploader_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `file_fact` ADD FOREIGN KEY (`wiki_id`) REFERENCES `wiki_dim` (`id`);

ALTER TABLE `grading_period_dim` ADD FOREIGN KEY (`grading_period_group_id`) REFERENCES `grading_period_group_dim` (`id`);

ALTER TABLE `grading_period_fact` ADD FOREIGN KEY (`grading_period_group_id`) REFERENCES `grading_period_group_dim` (`id`);

ALTER TABLE `grading_period_fact` ADD FOREIGN KEY (`grading_period_group_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `grading_period_fact` ADD FOREIGN KEY (`grading_period_group_course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `grading_period_group_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `grading_period_group_dim` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `grading_period_score_dim` ADD FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment_dim` (`id`);

ALTER TABLE `grading_period_score_dim` ADD FOREIGN KEY (`grading_period_id`) REFERENCES `grading_period_dim` (`id`);

ALTER TABLE `grading_period_score_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `grading_period_score_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `grading_period_score_fact` ADD FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment_dim` (`id`);

ALTER TABLE `grading_period_score_fact` ADD FOREIGN KEY (`grading_period_id`) REFERENCES `grading_period_dim` (`id`);

ALTER TABLE `group_dim` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `group_dim` ADD FOREIGN KEY (`wiki_id`) REFERENCES `wiki_dim` (`id`);

ALTER TABLE `group_fact` ADD FOREIGN KEY (`group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `group_fact` ADD FOREIGN KEY (`parent_course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `group_fact` ADD FOREIGN KEY (`parent_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `group_fact` ADD FOREIGN KEY (`parent_course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `group_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `group_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `group_fact` ADD FOREIGN KEY (`wiki_id`) REFERENCES `wiki_dim` (`id`);

ALTER TABLE `group_membership_dim` ADD FOREIGN KEY (`group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `group_membership_fact` ADD FOREIGN KEY (`group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `group_membership_fact` ADD FOREIGN KEY (`parent_course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `group_membership_fact` ADD FOREIGN KEY (`parent_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `group_membership_fact` ADD FOREIGN KEY (`parent_course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `group_membership_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `group_membership_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `group_membership_fact` ADD FOREIGN KEY (`group_membership_id`) REFERENCES `group_membership_dim` (`id`);

ALTER TABLE `learning_outcome_dim` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `learning_outcome_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `learning_outcome_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `learning_outcome_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `learning_outcome_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `learning_outcome_group_association_fact` ADD FOREIGN KEY (`learning_outcome_id`) REFERENCES `learning_outcome_dim` (`id`);

ALTER TABLE `learning_outcome_group_association_fact` ADD FOREIGN KEY (`learning_outcome_group_id`) REFERENCES `learning_outcome_group_dim` (`id`);

ALTER TABLE `learning_outcome_group_association_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `learning_outcome_group_association_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `learning_outcome_group_association_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `learning_outcome_group_dim` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `learning_outcome_group_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `learning_outcome_group_dim` ADD FOREIGN KEY (`parent_group_id`) REFERENCES `learning_outcome_group_dim` (`id`);

ALTER TABLE `learning_outcome_group_dim` ADD FOREIGN KEY (`root_group_id`) REFERENCES `learning_outcome_group_dim` (`id`);

ALTER TABLE `learning_outcome_group_fact` ADD FOREIGN KEY (`learning_outcome_group_id`) REFERENCES `learning_outcome_group_dim` (`id`);

ALTER TABLE `learning_outcome_group_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `learning_outcome_group_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `learning_outcome_group_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `learning_outcome_group_fact` ADD FOREIGN KEY (`parent_group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `learning_outcome_group_fact` ADD FOREIGN KEY (`root_group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `learning_outcome_question_result_dim` ADD FOREIGN KEY (`learning_outcome_result_id`) REFERENCES `learning_outcome_result_dim` (`id`);

ALTER TABLE `learning_outcome_question_result_dim` ADD FOREIGN KEY (`learning_outcome_id`) REFERENCES `learning_outcome_dim` (`id`);

ALTER TABLE `learning_outcome_question_result_fact` ADD FOREIGN KEY (`learning_outcome_question_result_id`) REFERENCES `learning_outcome_question_result_dim` (`id`);

ALTER TABLE `learning_outcome_question_result_fact` ADD FOREIGN KEY (`learning_outcome_result_id`) REFERENCES `learning_outcome_result_dim` (`id`);

ALTER TABLE `learning_outcome_question_result_fact` ADD FOREIGN KEY (`learning_outcome_id`) REFERENCES `learning_outcome_dim` (`id`);

ALTER TABLE `learning_outcome_question_result_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `learning_outcome_question_result_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `learning_outcome_question_result_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `learning_outcome_question_result_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `learning_outcome_question_result_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `learning_outcome_question_result_fact` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `learning_outcome_result_dim` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `learning_outcome_result_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `learning_outcome_result_dim` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `learning_outcome_result_dim` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `learning_outcome_result_dim` ADD FOREIGN KEY (`learning_outcome_id`) REFERENCES `learning_outcome_dim` (`id`);

ALTER TABLE `learning_outcome_result_dim` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `learning_outcome_result_fact` ADD FOREIGN KEY (`learning_outcome_result_id`) REFERENCES `learning_outcome_result_dim` (`id`);

ALTER TABLE `learning_outcome_result_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `learning_outcome_result_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `learning_outcome_result_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `learning_outcome_result_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `learning_outcome_result_fact` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `learning_outcome_result_fact` ADD FOREIGN KEY (`learning_outcome_id`) REFERENCES `learning_outcome_dim` (`id`);

ALTER TABLE `learning_outcome_result_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `learning_outcome_rubric_criterion_dim` ADD FOREIGN KEY (`learning_outcome_id`) REFERENCES `learning_outcome_dim` (`id`);

ALTER TABLE `learning_outcome_rubric_criterion_fact` ADD FOREIGN KEY (`learning_outcome_rubric_criterion_id`) REFERENCES `learning_outcome_rubric_criterion_dim` (`id`);

ALTER TABLE `learning_outcome_rubric_criterion_fact` ADD FOREIGN KEY (`learning_outcome_id`) REFERENCES `learning_outcome_dim` (`id`);

ALTER TABLE `learning_outcome_rubric_criterion_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `learning_outcome_rubric_criterion_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `learning_outcome_rubric_criterion_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `module_completion_requirement_dim` ADD FOREIGN KEY (`module_id`) REFERENCES `module_dim` (`id`);

ALTER TABLE `module_completion_requirement_dim` ADD FOREIGN KEY (`module_item_id`) REFERENCES `module_item_dim` (`id`);

ALTER TABLE `module_completion_requirement_fact` ADD FOREIGN KEY (`module_completion_requirement_id`) REFERENCES `module_completion_requirement_dim` (`id`);

ALTER TABLE `module_completion_requirement_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `module_completion_requirement_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `module_completion_requirement_fact` ADD FOREIGN KEY (`assignment_group_id`) REFERENCES `assignment_group_dim` (`id`);

ALTER TABLE `module_completion_requirement_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `module_completion_requirement_fact` ADD FOREIGN KEY (`discussion_topic_id`) REFERENCES `discussion_topic_dim` (`id`);

ALTER TABLE `module_completion_requirement_fact` ADD FOREIGN KEY (`discussion_topic_editor_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `module_completion_requirement_fact` ADD FOREIGN KEY (`enrollment_rollup_id`) REFERENCES `enrollment_rollup_dim` (`id`);

ALTER TABLE `module_completion_requirement_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `module_completion_requirement_fact` ADD FOREIGN KEY (`file_id`) REFERENCES `file_dim` (`id`);

ALTER TABLE `module_completion_requirement_fact` ADD FOREIGN KEY (`module_id`) REFERENCES `module_dim` (`id`);

ALTER TABLE `module_completion_requirement_fact` ADD FOREIGN KEY (`module_item_id`) REFERENCES `module_item_dim` (`id`);

ALTER TABLE `module_completion_requirement_fact` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `module_completion_requirement_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `module_completion_requirement_fact` ADD FOREIGN KEY (`wiki_id`) REFERENCES `wiki_dim` (`id`);

ALTER TABLE `module_completion_requirement_fact` ADD FOREIGN KEY (`wiki_page_id`) REFERENCES `wiki_page_dim` (`id`);

ALTER TABLE `module_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `module_fact` ADD FOREIGN KEY (`module_id`) REFERENCES `module_dim` (`id`);

ALTER TABLE `module_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `module_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `module_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `module_fact` ADD FOREIGN KEY (`wiki_id`) REFERENCES `wiki_dim` (`id`);

ALTER TABLE `module_item_dim` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `module_item_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `module_item_dim` ADD FOREIGN KEY (`discussion_topic_id`) REFERENCES `discussion_topic_dim` (`id`);

ALTER TABLE `module_item_dim` ADD FOREIGN KEY (`file_id`) REFERENCES `file_dim` (`id`);

ALTER TABLE `module_item_dim` ADD FOREIGN KEY (`module_id`) REFERENCES `module_dim` (`id`);

ALTER TABLE `module_item_dim` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `module_item_dim` ADD FOREIGN KEY (`wiki_page_id`) REFERENCES `wiki_page_dim` (`id`);

ALTER TABLE `module_item_fact` ADD FOREIGN KEY (`module_item_id`) REFERENCES `module_item_dim` (`id`);

ALTER TABLE `module_item_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `module_item_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `module_item_fact` ADD FOREIGN KEY (`assignment_group_id`) REFERENCES `assignment_group_dim` (`id`);

ALTER TABLE `module_item_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `module_item_fact` ADD FOREIGN KEY (`discussion_topic_id`) REFERENCES `discussion_topic_dim` (`id`);

ALTER TABLE `module_item_fact` ADD FOREIGN KEY (`discussion_topic_editor_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `module_item_fact` ADD FOREIGN KEY (`enrollment_rollup_id`) REFERENCES `enrollment_rollup_dim` (`id`);

ALTER TABLE `module_item_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `module_item_fact` ADD FOREIGN KEY (`file_id`) REFERENCES `file_dim` (`id`);

ALTER TABLE `module_item_fact` ADD FOREIGN KEY (`module_id`) REFERENCES `module_dim` (`id`);

ALTER TABLE `module_item_fact` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `module_item_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `module_item_fact` ADD FOREIGN KEY (`wiki_id`) REFERENCES `wiki_dim` (`id`);

ALTER TABLE `module_item_fact` ADD FOREIGN KEY (`wiki_page_id`) REFERENCES `wiki_page_dim` (`id`);

ALTER TABLE `module_prerequisite_dim` ADD FOREIGN KEY (`module_id`) REFERENCES `module_dim` (`id`);

ALTER TABLE `module_prerequisite_dim` ADD FOREIGN KEY (`prerequisite_module_id`) REFERENCES `module_dim` (`id`);

ALTER TABLE `module_prerequisite_fact` ADD FOREIGN KEY (`module_prerequisite_id`) REFERENCES `module_prerequisite_dim` (`id`);

ALTER TABLE `module_prerequisite_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `module_prerequisite_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `module_prerequisite_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `module_prerequisite_fact` ADD FOREIGN KEY (`module_id`) REFERENCES `module_dim` (`id`);

ALTER TABLE `module_prerequisite_fact` ADD FOREIGN KEY (`prerequisite_module_id`) REFERENCES `module_dim` (`id`);

ALTER TABLE `module_prerequisite_fact` ADD FOREIGN KEY (`prerequisite_wiki_id`) REFERENCES `wiki_dim` (`id`);

ALTER TABLE `module_prerequisite_fact` ADD FOREIGN KEY (`wiki_id`) REFERENCES `wiki_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_dim` ADD FOREIGN KEY (`module_progression_id`) REFERENCES `module_progression_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_dim` ADD FOREIGN KEY (`module_item_id`) REFERENCES `module_item_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_fact` ADD FOREIGN KEY (`module_progression_completion_requirement_id`) REFERENCES `module_progression_completion_requirement_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_fact` ADD FOREIGN KEY (`assignment_group_id`) REFERENCES `assignment_group_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_fact` ADD FOREIGN KEY (`discussion_topic_id`) REFERENCES `discussion_topic_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_fact` ADD FOREIGN KEY (`discussion_topic_editor_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_fact` ADD FOREIGN KEY (`enrollment_rollup_id`) REFERENCES `enrollment_rollup_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_fact` ADD FOREIGN KEY (`file_id`) REFERENCES `file_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_fact` ADD FOREIGN KEY (`module_id`) REFERENCES `module_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_fact` ADD FOREIGN KEY (`module_item_id`) REFERENCES `module_item_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_fact` ADD FOREIGN KEY (`module_progression_id`) REFERENCES `module_progression_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_fact` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_fact` ADD FOREIGN KEY (`wiki_id`) REFERENCES `wiki_dim` (`id`);

ALTER TABLE `module_progression_completion_requirement_fact` ADD FOREIGN KEY (`wiki_page_id`) REFERENCES `wiki_page_dim` (`id`);

ALTER TABLE `module_progression_dim` ADD FOREIGN KEY (`module_id`) REFERENCES `module_dim` (`id`);

ALTER TABLE `module_progression_dim` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `module_progression_fact` ADD FOREIGN KEY (`module_progression_id`) REFERENCES `module_progression_dim` (`id`);

ALTER TABLE `module_progression_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `module_progression_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `module_progression_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `module_progression_fact` ADD FOREIGN KEY (`module_id`) REFERENCES `module_dim` (`id`);

ALTER TABLE `module_progression_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `module_progression_fact` ADD FOREIGN KEY (`wiki_id`) REFERENCES `wiki_dim` (`id`);

ALTER TABLE `pseudonym_dim` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `pseudonym_dim` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `pseudonym_fact` ADD FOREIGN KEY (`pseudonym_id`) REFERENCES `pseudonym_dim` (`id`);

ALTER TABLE `pseudonym_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `pseudonym_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `quiz_dim` ADD FOREIGN KEY (`root_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `quiz_dim` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `quiz_dim` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `quiz_fact` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `quiz_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `quiz_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `quiz_fact` ADD FOREIGN KEY (`course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `quiz_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `quiz_question_answer_dim` ADD FOREIGN KEY (`quiz_question_id`) REFERENCES `quiz_question_dim` (`id`);

ALTER TABLE `quiz_question_answer_fact` ADD FOREIGN KEY (`quiz_question_answer_id`) REFERENCES `quiz_question_answer_dim` (`id`);

ALTER TABLE `quiz_question_answer_fact` ADD FOREIGN KEY (`quiz_question_id`) REFERENCES `quiz_question_dim` (`id`);

ALTER TABLE `quiz_question_answer_fact` ADD FOREIGN KEY (`quiz_question_group_id`) REFERENCES `quiz_question_dim` (`id`);

ALTER TABLE `quiz_question_answer_fact` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `quiz_question_answer_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `quiz_question_answer_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `quiz_question_answer_fact` ADD FOREIGN KEY (`course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `quiz_question_answer_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `quiz_question_dim` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `quiz_question_dim` ADD FOREIGN KEY (`quiz_question_group_id`) REFERENCES `quiz_question_group_dim` (`id`);

ALTER TABLE `quiz_question_fact` ADD FOREIGN KEY (`quiz_question_id`) REFERENCES `quiz_question_dim` (`id`);

ALTER TABLE `quiz_question_fact` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `quiz_question_fact` ADD FOREIGN KEY (`quiz_question_group_id`) REFERENCES `quiz_question_group_dim` (`id`);

ALTER TABLE `quiz_question_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `quiz_question_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `quiz_question_fact` ADD FOREIGN KEY (`course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `quiz_question_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `quiz_question_group_dim` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `quiz_question_group_fact` ADD FOREIGN KEY (`quiz_question_group_id`) REFERENCES `quiz_question_group_dim` (`id`);

ALTER TABLE `quiz_question_group_fact` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `quiz_question_group_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `quiz_question_group_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `quiz_question_group_fact` ADD FOREIGN KEY (`course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `quiz_question_group_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `quiz_submission_dim` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `quiz_submission_dim` ADD FOREIGN KEY (`submission_id`) REFERENCES `submission_dim` (`id`);

ALTER TABLE `quiz_submission_dim` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `quiz_submission_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `quiz_submission_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `quiz_submission_fact` ADD FOREIGN KEY (`course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `quiz_submission_fact` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `quiz_submission_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `quiz_submission_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `quiz_submission_fact` ADD FOREIGN KEY (`submission_id`) REFERENCES `submission_dim` (`id`);

ALTER TABLE `quiz_submission_fact` ADD FOREIGN KEY (`enrollment_rollup_id`) REFERENCES `enrollment_rollup_dim` (`id`);

ALTER TABLE `quiz_submission_fact` ADD FOREIGN KEY (`quiz_submission_id`) REFERENCES `quiz_submission_dim` (`id`);

ALTER TABLE `quiz_submission_historical_dim` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `quiz_submission_historical_dim` ADD FOREIGN KEY (`submission_id`) REFERENCES `submission_dim` (`id`);

ALTER TABLE `quiz_submission_historical_dim` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `quiz_submission_historical_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `quiz_submission_historical_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `quiz_submission_historical_fact` ADD FOREIGN KEY (`course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `quiz_submission_historical_fact` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `quiz_submission_historical_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `quiz_submission_historical_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `quiz_submission_historical_fact` ADD FOREIGN KEY (`submission_id`) REFERENCES `submission_dim` (`id`);

ALTER TABLE `quiz_submission_historical_fact` ADD FOREIGN KEY (`enrollment_rollup_id`) REFERENCES `enrollment_rollup_dim` (`id`);

ALTER TABLE `quiz_submission_historical_fact` ADD FOREIGN KEY (`quiz_submission_historical_id`) REFERENCES `quiz_submission_historical_dim` (`id`);

ALTER TABLE `role_dim` ADD FOREIGN KEY (`root_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `role_dim` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `submission_comment_dim` ADD FOREIGN KEY (`submission_id`) REFERENCES `submission_dim` (`id`);

ALTER TABLE `submission_comment_dim` ADD FOREIGN KEY (`author_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `submission_comment_fact` ADD FOREIGN KEY (`submission_comment_id`) REFERENCES `submission_comment_dim` (`id`);

ALTER TABLE `submission_comment_fact` ADD FOREIGN KEY (`submission_id`) REFERENCES `submission_dim` (`id`);

ALTER TABLE `submission_comment_fact` ADD FOREIGN KEY (`recipient_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `submission_comment_fact` ADD FOREIGN KEY (`author_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `submission_comment_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `submission_comment_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `submission_comment_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `submission_comment_fact` ADD FOREIGN KEY (`course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `submission_dim` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `submission_dim` ADD FOREIGN KEY (`grader_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `submission_dim` ADD FOREIGN KEY (`group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `submission_dim` ADD FOREIGN KEY (`quiz_submission_id`) REFERENCES `quiz_submission_dim` (`id`);

ALTER TABLE `submission_dim` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `submission_fact` ADD FOREIGN KEY (`submission_id`) REFERENCES `submission_dim` (`id`);

ALTER TABLE `submission_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `submission_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `submission_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `submission_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `submission_fact` ADD FOREIGN KEY (`grader_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `submission_fact` ADD FOREIGN KEY (`course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `submission_fact` ADD FOREIGN KEY (`enrollment_rollup_id`) REFERENCES `enrollment_rollup_dim` (`id`);

ALTER TABLE `submission_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `submission_fact` ADD FOREIGN KEY (`assignment_group_id`) REFERENCES `assignment_group_dim` (`id`);

ALTER TABLE `submission_fact` ADD FOREIGN KEY (`group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `submission_fact` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `submission_fact` ADD FOREIGN KEY (`quiz_submission_id`) REFERENCES `quiz_submission_dim` (`id`);

ALTER TABLE `submission_fact` ADD FOREIGN KEY (`wiki_id`) REFERENCES `wiki_dim` (`id`);

ALTER TABLE `submission_file_fact` ADD FOREIGN KEY (`file_id`) REFERENCES `file_dim` (`id`);

ALTER TABLE `submission_file_fact` ADD FOREIGN KEY (`submission_id`) REFERENCES `submission_dim` (`id`);

ALTER TABLE `submission_file_fact` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `submission_file_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `submission_file_fact` ADD FOREIGN KEY (`grader_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `submission_file_fact` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `submission_file_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `user_dim` ADD FOREIGN KEY (`root_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `wiki_fact` ADD FOREIGN KEY (`wiki_id`) REFERENCES `wiki_dim` (`id`);

ALTER TABLE `wiki_fact` ADD FOREIGN KEY (`parent_course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `wiki_fact` ADD FOREIGN KEY (`parent_group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `wiki_fact` ADD FOREIGN KEY (`parent_course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `wiki_fact` ADD FOREIGN KEY (`parent_group_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `wiki_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `wiki_fact` ADD FOREIGN KEY (`root_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `wiki_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `wiki_page_fact` ADD FOREIGN KEY (`wiki_page_id`) REFERENCES `wiki_page_dim` (`id`);

ALTER TABLE `wiki_page_fact` ADD FOREIGN KEY (`wiki_id`) REFERENCES `wiki_dim` (`id`);

ALTER TABLE `wiki_page_fact` ADD FOREIGN KEY (`parent_course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `wiki_page_fact` ADD FOREIGN KEY (`parent_group_id`) REFERENCES `group_dim` (`id`);

ALTER TABLE `wiki_page_fact` ADD FOREIGN KEY (`parent_course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `wiki_page_fact` ADD FOREIGN KEY (`parent_group_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `wiki_page_fact` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `wiki_page_fact` ADD FOREIGN KEY (`account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `wiki_page_fact` ADD FOREIGN KEY (`root_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `wiki_page_fact` ADD FOREIGN KEY (`enrollment_term_id`) REFERENCES `enrollment_term_dim` (`id`);

ALTER TABLE `requests` ADD FOREIGN KEY (`user_id`) REFERENCES `user_dim` (`id`);

ALTER TABLE `requests` ADD FOREIGN KEY (`course_id`) REFERENCES `course_dim` (`id`);

ALTER TABLE `requests` ADD FOREIGN KEY (`course_account_id`) REFERENCES `account_dim` (`id`);

ALTER TABLE `requests` ADD FOREIGN KEY (`quiz_id`) REFERENCES `quiz_dim` (`id`);

ALTER TABLE `requests` ADD FOREIGN KEY (`discussion_id`) REFERENCES `discussion_topic_dim` (`id`);

ALTER TABLE `requests` ADD FOREIGN KEY (`conversation_id`) REFERENCES `conversation_dim` (`id`);

ALTER TABLE `requests` ADD FOREIGN KEY (`assignment_id`) REFERENCES `assignment_dim` (`id`);

ALTER TABLE `requests` ADD FOREIGN KEY (`real_user_id`) REFERENCES `user_dim` (`id`);
