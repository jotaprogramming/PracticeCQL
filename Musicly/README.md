# Musicly

Musicly is a fictitious audio streaming platform designed for SQL and NoSQL database practice.

In this case, it is a NoSQL database, with the Cassandra database manager and CQL.

## Index
- [Musicly](#musicly)
  - [Index](#index)
    - [KEYSPACE](#keyspace)
    - [TYPES](#types)
      - [User profile](#user-profile)
    - [COLUMN FAMILIES](#column-families)
      - [Users](#users)
      - [Songs](#songs)
    - [INSERT INTO](#insert-into)
      - [songs](#songs-1)
---
### KEYSPACE
```sql
CREATE KEYSPACE IF NOT EXISTS musicly WITH replication = {
    'class': 'SimpleStrategy',
    'replication_factor': '1'
};
```
[back to index](#index)

---
### TYPES
#### User profile
```sql
CREATE TYPE musicly.user_profile (
    fullname TEXT,
    email TEXT,
    age INT,
    bio TEXT,
);
```
[back to index](#index)

---
### COLUMN FAMILIES
#### Users
```sql
CREATE TABLE musicly.users (
    user_id INT,
    user_alias TEXT,
    user_info FROZEN <user_profile>,
    PRIMARY KEY (user_id, user_alias)
) WITH CLUSTERING ORDER BY (user_alias ASC);
```
> A frozen value serializes multiple components into a single value.
> 
> The `user_info` attribute stores an object with the following attributes:
> ```js
> {
>   fullname: <text>,
>   email: <text>,
>   age: <int>,
>   bio: <text>
> }
> ```

#### Songs
```sql
CREATE TABLE musicly.songs (
    song_id INT,
    song_name TEXT,
    song_artist TEXT,
    song_album TEXT,
    song_release TEXT,
    PRIMARY KEY (song_id, song_name)
) WITH CLUSTERING ORDER BY (song_name ASC);
```
[back to index](#index)

---
### INSERT INTO
#### songs
```sql
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
```
[back to index](#index)