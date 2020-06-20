-- If there are rows returned, use LEFT OUTER JOIN. 
-- If zero rows are returned, user INNER JOIN

USE canvas;
-- DESC discussion_entry_fact;
SELECT id FROM 
discussion_topic_dim 
WHERE id IS NULL 
LIMIT 0, 10;
