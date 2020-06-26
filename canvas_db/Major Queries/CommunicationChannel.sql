USE canvas;
SELECT 
communication_channel_fact.bounce_count AS "Communication Bounce Count"
, communication_channel_dim.type AS "Communication Type"
, communication_channel_dim.created_at AS "Communication Created At"
, communication_channel_dim.updated_at AS "Communication Updated At"
, communication_channel_dim.workflow_state AS "Communication State"
, communication_channel_dim.address AS "Communication Address"
, user_dim.name AS "User Name"
, user_dim.gender AS "User Gender"
, user_dim.birthdate AS "User Birthdate"
, user_dim.school_name AS "User School"
, user_dim.school_position AS "User School Position"
, user_dim.country_code AS "User Country"
, user_dim.locale AS "User locale"
, user_dim.time_zone AS "User Time Zone"
, user_dim.workflow_state AS "User Status"
, user_dim.created_at AS "User Created At"
FROM communication_channel_fact
INNER JOIN communication_channel_dim ON communication_channel_dim.id = communication_channel_fact.communication_channel_id
INNER JOIN user_dim ON user_dim.id = communication_channel_fact.user_id
WHERE user_dim.workflow_state != "deleted"
;