USE student_grades_db;

# Q1: View the table
-- Table student_grades
SELECT * FROM student_grades;

-- Table students
SELECT * FROM students;

# Q2: Show students who get school lunch
SELECT 
	student_name,
    grade_level,
    gpa
FROM 
	students
WHERE school_lunch = "Yes";

# Q3: Sort the students by gpa
SELECT 
	student_name,
    grade_level,
    gpa,
    email
FROM 
	students
ORDER BY gpa DESC;

# Q4: Show the average gpa for each grade level
SELECT
	grade_level,
	ROUND(AVG(gpa),2) AS avg_gpa
FROM 
	students
GROUP BY grade_level
ORDER BY avg_gpa;

# Q5: Show the grade levels with an average gpa below 3.3
SELECT
	grade_level,
	ROUND(AVG(gpa),2) AS avg_gpa
FROM 
	students
GROUP BY grade_level
HAVING avg_gpa < 3.3
ORDER BY avg_gpa;

# Q6: Show the final grades for each student
SELECT
	s.id, s.student_name,
	sg.class_name, sg.final_grade
FROM
	student_grades sg
		LEFT JOIN
	students s 
		ON
	sg.student_id = s.id
ORDER BY student_name;

