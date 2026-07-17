The database is normalized because each table stores a single type of information. 
Students, Faculty, Classroom, Courses, and Extra_Curricular_Activities each contain only data related to their own entity, reducing redundancy and improving data consistency. 
The Student_Courses and Student_Activities junction tables correctly implement many-to-many relationships by linking students to courses and activities without duplicating information. 
This design helps maintain referential integrity, avoids unnecessary repeated data, and makes the database easier to update and maintain.


