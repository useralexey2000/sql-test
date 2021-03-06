-- QUERRIES
-- querry all users that have posts > 0
SELECT U.ID, U.NAME FROM USERS U INNER JOIN POSTS P ON U.ID = P.USER_ID;

-- querry the users that have posts = 0 
SELECT U.ID, U.NAME FROM USERS U LEFT JOIN POSTS P ON U.ID = P.USER_ID WHERE P.USER_ID IS NULL;

-- querry the users that have posts > 2
SELECT USERS.ID, USERS.NAME, COUNT(POSTS.ID) AS POST_NUM FROM USERS
INNER JOIN POSTS ON USERS.ID = POSTS.USER_ID
GROUP BY USERS.ID
HAVING POST_NUM > 2;

--querry the users that have posts with comments > 3
SELECT USERS.ID, USERS.NAME, POSTS.NAME, COUNT(COMMENTS.ID) AS COM_NUM
FROM USERS INNER JOIN POSTS ON USERS.ID = POSTS.USER_ID
INNER JOIN COMMENTS ON POSTS.ID = COMMENTS.POST_ID
GROUP BY COMMENTS.POST_ID
HAVING COM_NUM >3;

-- querry the users that logged in from - to
SELECT USERS.ID, USERS.NAME, LOGIN_LOG.DATE FROM USERS
INNER JOIN LOGIN_LOG ON USERS.ID = LOGIN_LOG.USER_ID
WHERE LOGIN_LOG.DATE >= '2019-10-1' AND LOGIN_LOG.DATE <= '2019-10-15';

-- querry num of logins for every day
SELECT DATE_FORMAT(LOGIN_LOG.DATE, "%Y-%m-%d") AS DATE,
COUNT(LOGIN_LOG.USER_ID) AS USER_NUM
FROM LOGIN_LOG GROUP BY DATE; 
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 7ba08e7... Adding querry - get users for the last 10 days

-- querry num of enters for the last 10 days
SELECT USERS.ID, USERS.NAME, LOGIN_LOG.DATE
FROM USERS INNER JOIN LOGIN_LOG
ON USERS.ID = LOGIN_LOG.USER_ID
WHERE LOGIN_LOG.DATE > (CURDATE() - INTERVAL 10 DAY);


<<<<<<< HEAD
=======
>>>>>>> d1f926a... adding sql-scripts to create-fill-querry mysql-db
=======
>>>>>>> 7ba08e7... Adding querry - get users for the last 10 days
