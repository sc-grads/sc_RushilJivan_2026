SHOW data_directory;

select oid, datname from pg_database;

select * from pg_class;


-- Sect 23
CREATE INDEX ON users (username);

DROP INDEX users_username_idx;

EXPLAIN ANALYZE select * from users where username = 'Emil30';

select pg_size_pretty(pg_relation_size('users'));
select pg_size_pretty(pg_relation_size('users_username_idx'));



-- Section 24

EXPLAIN ANALYZE
SELECT users.username, comments.contents
FROM users
JOIN comments
    ON comments.user_id = users.id
WHERE users.username = 'Allison14';


SELECT *
FROM pg_stats
WHERE tablename = 'users';



-- Sect 26

SELECT user_id, created_at
FROM caption_tags

UNION ALL

SELECT user_id, created_at
FROM photo_tags;


SELECT users.username, tags.created_at FROM users JOIN (SELECT user_id, created_at FROM caption_tags UNION ALL SELECT user_id, 
created_at FROM photo_tags) AS tags ON tags.user_id = users.id WHERE tags.created_at < '2010-01-07';