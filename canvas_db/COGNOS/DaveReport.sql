USE 
    COGNOS;
SELECT 
    TERM_CODE AS "Term"
    , CRN
    , assessment_title AS "Assessment Title"
    , learning_outcome_name AS "Outcome Name"
    , submission_date AS "Submission Date"
    , submission_score AS "Submission Score"
    , attempt AS "Submission Attempt"
    , outcome_score AS "Outcome Score"
    , learn_out_points_possible AS "LO Points Possible"
    , learn_out_mastery_score AS "LO Mastery Score"
    , learn_out_mastered AS "LO Mastered"
    , learn_out_rating AS "LO Ratings"
    , learn_out_rating_points AS "LO Rating Points"
FROM 
    COGNOS.CANVAS_OUTCOME
ORDER BY 
    TERM_CODE ASC
    , CRN ASC
;