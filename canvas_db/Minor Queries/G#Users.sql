USE 
    canvas;
SELECT 
    pseudonym_dim.sis_user_id AS "G#"
    , pseudonym_dim.canvas_id "Canvas ID"
    , user_dim.name AS "User Name"
    , user_dim.workflow_state AS "User Status"
FROM
    pseudonym_dim
INNER JOIN
    user_dim ON user_dim.id = pseudonym_dim.user_id
WHERE
    user_dim.workflow_state <> "deleted"
AND
    user_dim.name <> "Test Student"
AND
    pseudonym_dim.sis_user_id NOT LIKE "G%"
AND
    pseudonym_dim.sis_user_id NOT LIKE "%@instructure%"
ORDER BY 
    pseudonym_dim.canvas_id ASC
    , user_dim.name ASC
;

-- DESC pseudonym_dim;
-- DESC user_dim;



