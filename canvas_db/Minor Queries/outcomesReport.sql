USE canvas;
SELECT
    user_dim.name AS Name
	, pseudonym_dim.sis_user_id AS 'G#'
	, enrollment_term_dim.name AS 'Term Name'
	, SUBSTR(course_dim.sis_source_id, -6, 6) AS 'Term Code'
	, CASE WHEN SUBSTR(course_dim.sis_source_id, 1, 1) = 'X' THEN SUBSTR(course_section_dim.sis_source_id, 1, 5)
		ELSE SUBSTR(course_dim.sis_source_id, 1, 5) END AS 'CRN'
    , course_dim.code AS 'Course Code'   
	, course_dim.name AS 'Course Name'
	, assignment_dim.title AS Assignment
	, submission_fact.score AS 'Assignment Score'
    , assignment_dim.points_possible AS 'Possible Points'
	, learning_outcome_dim.short_description AS 'Assignment Description'
	, learning_outcome_result_dim.submitted_at 'LO Submitted At'
	, learning_outcome_rubric_criterion_dim.description AS 'LO Rubric Criterion Description'
	, learning_outcome_fact.points_possible AS 'LO Possible Points'
	, learning_outcome_fact.mastery_points AS 'LO Mastery points'
	, learning_outcome_result_fact.score AS 'LO Score'
	, learning_outcome_result_fact.mastery AS 'LO Mastered'
    , CASE WHEN INSTR(UPPER(DIM_SECTION.STVPTRM_DESC), 'HYBRID') != 0
          OR DIM_SECTION.SSBSECT_SCHD_CODE = 'H+'
          OR DIM_SECTION.SSBSECT_SCHD_CODE = 'X' THEN 'Hybrid'
        WHEN DIM_SECTION.SSBSECT_INSM_CODE = 'POLYC' THEN 'Fuller Live'
        WHEN DIM_SECTION.SSBSECT_INSM_CODE = 'OLL' THEN 'Online Live'
        WHEN DIM_SECTION.SSBSECT_CAMP_CODE in ('8','8G','8D','8DI') THEN 'Online' 
        ELSE 'On Campus'
        END AS Modality
    , CASE WHEN DIM_SECTION.SECTION_LANGUAGE IS NULL THEN 'English'
    ELSE DIM_SECTION.SECTION_LANGUAGE END AS 'Language'
FROM learning_outcome_result_fact
INNER JOIN assignment_dim ON assignment_dim.id = learning_outcome_result_fact.assignment_id
INNER JOIN course_dim ON course_dim.id = learning_outcome_result_fact.course_id
INNER JOIN course_section_dim ON course_section_dim.course_id = course_dim.id
INNER JOIN enrollment_term_dim ON enrollment_term_dim.id = learning_outcome_result_fact.enrollment_term_id
INNER JOIN learning_outcome_dim ON learning_outcome_dim.id = learning_outcome_result_fact.learning_outcome_id
INNER JOIN learning_outcome_result_dim ON learning_outcome_result_dim.id = learning_outcome_result_fact.learning_outcome_result_id
INNER JOIN user_dim ON user_dim.id = learning_outcome_result_fact.user_id
INNER JOIN learning_outcome_fact ON learning_outcome_fact.learning_outcome_id = learning_outcome_result_fact.learning_outcome_id
LEFT OUTER JOIN COGNOS.DIM_SECTION ON DIM_SECTION.SSBSECT_TERM_CODE = SUBSTR(course_dim.sis_source_id, -6, 6) AND 
DIM_SECTION.SSBSECT_CRN = SUBSTR(course_dim.sis_source_id, 1, 5)
LEFT OUTER JOIN submission_fact ON submission_fact.assignment_id = learning_outcome_result_fact.assignment_id AND submission_fact.user_id = learning_outcome_result_fact.user_id
LEFT OUTER JOIN learning_outcome_rubric_criterion_fact ON learning_outcome_rubric_criterion_fact.learning_outcome_id = learning_outcome_result_fact.learning_outcome_id
	AND learning_outcome_rubric_criterion_fact.points = learning_outcome_result_fact.score
LEFT OUTER JOIN learning_outcome_rubric_criterion_dim ON learning_outcome_rubric_criterion_dim.id = learning_outcome_rubric_criterion_fact.learning_outcome_rubric_criterion_id
LEFT OUTER JOIN pseudonym_dim ON pseudonym_dim.user_id = learning_outcome_result_fact.user_id AND pseudonym_dim.workflow_state = 'active' 
WHERE (pseudonym_dim.position IS NULL
    OR (IFNULL(pseudonym_dim.sis_user_id, 'X') = IFNULL((SELECT p1.sis_user_id
            FROM pseudonym_dim p1
            WHERE p1.user_id = learning_outcome_result_fact.user_id
              AND p1.workflow_state = 'active'
              AND p1.sis_user_id like 'G1%'),
            (SELECT IFNULL(p2.sis_user_id, 'X')
            FROM pseudonym_dim p2
            WHERE p2.user_id = learning_outcome_result_fact.user_id
              AND p2.workflow_state = 'active'
              AND p2.position = (SELECT MIN(p3.position) 
                FROM pseudonym_dim p3
                WHERE p3.user_id = learning_outcome_result_fact.user_id
                  AND p3.workflow_state = 'active')))
  ) 
) 
AND enrollment_term_dim.name NOT IN ('All Other Courses', 'Default Term', 'Orientation%')
AND course_dim.sis_source_id IS NOT NULL
AND course_dim.name != 'OUTCOMES DEV 3'
AND course_section_dim.sis_source_id NOT LIKE 'X%'
ORDER BY SUBSTR(course_dim.sis_source_id, -6, 6)
AND course_dim.code
AND user_dim.name;
