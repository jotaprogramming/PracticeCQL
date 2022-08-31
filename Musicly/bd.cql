CREATE KEYSPACE IF NOT EXISTS musicly WITH replication = {
    'class': 'SimpleStrategy',
    'replication_factor': '1'
};
-- } AND durable_writes = true; default value

CREATE TYPE musicly.user_profile (
    fullname TEXT,
    email TEXT,
    age INT,
    bio TEXT,
);

CREATE TABLE musicly.users (
    user_id INT,
    user_alias TEXT,
    user_info FROZEN <user_profile>,
    PRIMARY KEY (user_id, user_alias)
) WITH CLUSTERING ORDER BY (user_alias ASC);

CREATE TABLE musicly.songs (
    song_id INT,
    song_name TEXT,
    song_artist TEXT,
    song_album TEXT,
    song_release TEXT,
    PRIMARY KEY (song_id, song_name)
) WITH CLUSTERING ORDER BY (song_name ASC);

INSERT INTO musicly.songs (
    song_id,
    song_name,
    song_artist,
    song_album,
    song_release
) VALUES (
    1,
    'California Waiting',
    'Kings of Leon',
    'Youth and Young Manhood',
    '2003'
);