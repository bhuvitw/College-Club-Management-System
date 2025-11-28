
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
