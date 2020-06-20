USE canvas;
SELECT 
sis_source_id
, name
, canvas_id
FROM course_dim 
-- Update the CRN of the course you are trying to locate
WHERE sis_source_id LIKE "27131%";