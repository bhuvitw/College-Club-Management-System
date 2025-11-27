--COMPLEX JOIN 1 = List students who have attended more than 2 events

SELECT 
   s.student_id,
   s.name,
   s.branch,
   s.year,
COUNT(p.event_id) AS total_events_attended
FROM STUDENT s
JOIN PARTICIPATION p 
   ON s.student_id = p.student_id
JOIN EVENT e
   ON p.event_id = e.event_id
JOIN CLUB c
   ON e.club_id = c.club_id
WHERE p.attendance_status = 'Present'
GROUP BY s.student_id, s.name, s.branch, s.year
HAVING COUNT(p.event_id) > 2;

--COMPLEX JOIN 2 = List all students along with the club and team they belong to

SELECT
    s.student_id,
    s.name AS student_name,
    c.club_name,
    ct.team_name,
    m.role
FROM STUDENT s
JOIN MEMBERSHIP m
    ON s.student_id = m.student_id
JOIN CLUB_TEAMS ct
    ON m.team_id = ct.team_id
JOIN CLUB c
    ON ct.club_id = c.club_id
ORDER BY c.club_name, ct.team_name, s.name;
