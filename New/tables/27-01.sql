CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,              
    CourseName VARCHAR(100) NOT NULL,
    Duration INT,                         
    Fee DECIMAL(8, 2)
);
drop table students;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,            
    StudentName VARCHAR(100) NOT NULL,
    CourseID INT,                          
    EnrollmentDate DATE,
    Marks INT,
    CONSTRAINT FK_Course FOREIGN KEY (CourseID)
    REFERENCES Courses(CourseID)           
);
INSERT INTO Courses (CourseID, CourseName, Duration, Fee) VALUES
(201, 'Mathematics', 12, 3000),
(202, 'Physics', 10, 2500),
(203, 'Chemistry', 14, 3500),
(204, 'Biology', 8, 2000),
(205, 'Computer Science', 16, 4000);

INSERT INTO Students (StudentID, StudentName, CourseID, EnrollmentDate, Marks) VALUES
(1, 'John Doe', 201, '2022-05-10', 85),  
(2, 'Jane Smith', 202, '2021-09-15', 90),
(3, 'Emily Davis', NULL, '2023-01-20', 75),
(4, 'Michael Brown', 204, '2022-11-25', 88), 
(5, 'Sarah Wilson', NULL, '2023-06-10', 92);

select * from students;
select * from courses;

select students.StudentName,courses.CourseName
 from students 
 inner join
 courses on students.CourseID = courses.CourseID;

select students.StudentName,courses.CourseName
 from students 
 left join
 courses on students.CourseID = courses.CourseID;

select students.StudentName,courses.CourseName
 from students 
 right join
 courses on students.CourseID = courses.CourseID;

select students.StudentName,courses.CourseName
 from students 
 left join
 courses on students.CourseID = courses.CourseID
UNION
select students.StudentName,courses.CourseName
 from students 
 right join
 courses on students.CourseID = courses.CourseID;

select students.StudentName,courses.CourseName
 from students 
 cross join
 courses;

