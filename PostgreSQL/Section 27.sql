WITH RECURSIVE countdown(val) AS (
SELECT 3
UNION ALL
SELECT val - 1
FROM countdown
WHERE val > 1)
SELECT *
FROM countdown;


WITH RECURSIVE countdown(val) AS (SELECT 10
UNION ALL
SELECT val - 1
FROM countdown
WHERE val > 1)
SELECT *
FROM countdown;





SELECT leader_id, follower_id, 1 AS depth FROM followers WHERE follower_id = 1000;




SELECT followers.leader_id, followers.follower_id, depth + 1 FROM followers 
JOIN suggestions ON suggestions.leader_id = followers.follower_id WHERE depth < 3;


WITH RECURSIVE suggestions(leader_id, follower_id, depth) AS
(SELECT leader_id, follower_id, 1 AS depth FROM followers WHERE follower_id = 1000 UNION SELECT followers.leader_id, 
followers.follower_id, depth + 1 FROM followers  JOIN suggestions ON suggestions.leader_id = followers.follower_id WHERE depth < 30) 
SELECT DISTINCT users.id, users.username FROM suggestions JOIN users ON users.id = suggestions.leader_id
WHERE depth > 1 LIMIT 5;




-- SEction 28
SELECT username, COUNT(*) FROM users JOIN (SELECT user_id FROM photo_tags UNION ALL SELECT user_id FROM caption_tags) 
AS tags on tags.user_id = users.id GROUP BY username ORDER BY COUNT(*) DESC;



INSERT INTO tags (
    created_at, updated_at, user_id, post_id, x, y)
SELECT created_at, updated_at, user_id, post_id, x, y
FROM photo_tags;



CREATE VIEW tags AS (SELECT id, created_at, user_id, post_id, 'photo tag' AS type FROM photo_tags
UNION ALL
SELECT id, created_at, user_id, post_id, 'caption tag' AS type FROM caption_tags);


SELECT * FROM tags;

SELECT * FROM tags WHERE type = 'caption tag';

SELECT users.username, COUNT(*) AS tag_count FROM users
JOIN tags ON tags.user_id = users.id
GROUP BY users.id, users.username ORDER BY tag_count DESC;



CREATE VIEW recent_posts AS SELECT * FROM posts ORDER BY created_at DESC LIMIT 10;

SELECT * FROM recent_posts;

SELECT users.username FROM recent_posts JOIN users ON users.id = recent_posts.user_id;




--Section 29

SELECT
    DATE_TRUNC(
        'week',
        COALESCE(posts.created_at, comments.created_at)
    ) AS week,
    COUNT(posts.id) AS num_likes_for_posts,
    COUNT(comments.id) AS num_likes_for_comments
FROM likes
LEFT JOIN posts
    ON posts.id = likes.post_id
LEFT JOIN comments
    ON comments.id = likes.comment_id
GROUP BY week
ORDER BY week;




CREATE MATERIALIZED VIEW weekly_likes AS (SELECT DATE_TRUNC('week', COALESCE(posts.created_at, comments.created_at)) AS week,
COUNT(posts.id) AS num_likes_for_posts, COUNT(comments.id) AS num_likes_for_comments FROM likes LEFT JOIN posts 
ON posts.id = likes.post_id LEFT JOIN comments ON comments.id = likes.comment_id GROUP BY week ORDER BY week) WITH DATA;



SELECT * FROM weekly_likes;



DELETE FROM posts WHERE created_at < '2010-02-01';


REFRESH MATERIALIZED VIEW weekly_likes;


-- Section 30
CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    balance INTEGER NOT NULL
);


INSERT INTO accounts (name, balance)
VALUES
    ('Allison', 100),
    ('Jia', 100);


SELECT * FROM accounts;



BEGIN;


UPDATE accounts
SET balance = balance - 50
WHERE name = 'Allison';

UPDATE accounts
SET balance = balance + 50
WHERE name = 'Jia';

COMMIT;


ROLLBACK;


UPDATE accounts
SET balance = 100;

SELECT * FROM accounts;

BEGIN;

UPDATE accounts
SET balance = balance - 50
WHERE name = 'Allison';

SELECT * FROM accounts;



