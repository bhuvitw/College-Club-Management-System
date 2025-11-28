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
--1
SELECT student_id, name, email, branch, year
FROM STUDENT
WHERE branch = 'CSE' AND year = 3;
--2
SELECT E.event_id, E.event_name, E.type, E.event_date, E.venue, E.budget_required
FROM EVENT E
JOIN CLUB C ON E.club_id = C.club_id
WHERE C.club_name = 'Rangmanch';
--3
SELECT C.club_name, SUM(E.budget_required) AS total_event_budget
FROM CLUB C
JOIN EVENT E ON C.club_id = E.club_id
GROUP BY C.club_name;
--4
SELECT S.student_id, S.name, P.attendance_status, P.position_secured
FROM PARTICIPATION P
JOIN STUDENT S ON P.student_id = S.student_id
JOIN EVENT E ON P.event_id = E.event_id
WHERE E.event_name = 'CodeSprint 2025';
--5
SELECT E.event_name, S.company_name, ES.amount_contributed
FROM EVENT_SPONSORSHIP ES
JOIN EVENT E ON ES.event_id = E.event_id
JOIN SPONSOR S ON ES.sponsor_id = S.sponsor_id;
ORDER BY c.club_name, ct.team_name, s.name;