CREATE TABLE job_applied
( job_id INT,
job_posted_date DATE,
job_application BOOLEAN,
resume_file VARCHAR(225),
status VARCHAR(225)
);

INSERT INTO job_applied
(job_id,
job_posted_date,
job_application,
resume_file,
status)

VALUES
    (1,
    '2025-4-1',
    true,
    'resume_file_01.pdf',
    'ghosted'),

    (2,
    '2025-4-10',
    false,
    'resume_file_02.pdf',
    'accepted'),

    (3,
    '2025-4-21',
    true,
    'resume_file_03.pdf',
    'rejected'),

    (4,
    '2025-4-25',
    false,
    'resume_file_04.pdf',
    'interview is scheduled'),

    (5,
    '2025-4-30',
    false,
    NULL,
    'rejected');

SELECT * FROM job_applied;  -- To check --

ALTER TABLE job_applied
ADD contact VARCHAR(50);

UPDATE job_applied
SET contact = 'Elon Musk'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'Mark Zuckerberg'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'Jeff Bezos'
WHERE job_id = 3;

UPDATE job_applied
SET contact = 'Taylor Swift'
WHERE job_id = 4;

UPDATE job_applied
SET contact = 'Lionel Messi'
WHERE job_id = 5; 

SELECT * FROM job_applied;  -- To check --

ALTER TABLE job_applied
RENAME contact to contact_name; 

SELECT * FROM job_applied; -- To check --

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

SELECT * FROM job_applied;

ALTER TABLE job_applied
DROP COLUMN contact_name;   

DROP TABLE job_applied;
