CREATE TABLE users 
(
	uid INTEGER,
	username VARCHAR(40) NOT NULL,
	first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
	email VARCHAR(40) NOT NULL
	privacy INTEGER NOT NULL,
	webpage VARCHAR(40),
	time_zone INTEGER,
	bio VARCHAR(140),
	location VARCHAR(40),
	lang VARCHAR(40),
	PRIMARY KEY(uid)
)  

CREATE TABLE tweets
(
	tid INTEGER,
	uid INTEGER,
       	tweet_time DATE NOT NULL,
       	body VARCHAR(140) NOT NULL,
	PRIMARY KEY(tid),
	FOREIGN KEY(uid) REFERENCES users,
	ON DELETE CASCADE
)                   

CREATE TABLE lists
(
	owner INTEGER,
	lid INTEGER,
       	name VARCHAR(30) NOT NULL,
       	privacy INTEGER NOT NULL,
       	PRIMARY KEY(lid),
	FOREIGN KEY(owner) references users,
	ON DELETE CASCADE
)

CREATE TABLE tags
(
	tag VARCHAR(140),
	tid INTEGER,
	PRIMARY KEY(tag, tid),
	FOREIGN KEY(tid) REFERENCES tweets,
	ON DELETE CASCADE
)


CREATE TABLE follows
(
	follower INTEGER,
	followee INTEGER,
	follow_date DATE,
	PRIMARY KEY(follower, followee),
	FOREIGN KEY(follower) REFERENCES users,
	FOREIGN KEY(followee) REFERENCES users,
	ON DELETE CASCADE
)

CREATE TABLE messages
(
	from INTEGER,
	to INTEGER,
	message_time DATE,
	body VARCHAR(140),
	subject VARCHAR(20) NOT NULL,
	PRIMARY KEY(from, to),
	FOREIGN KEY(from) REFERENCES users,
	FOREIGN KEY(to) REFERENCES users,
	ON DELETE CASCADE
)

CREATE TABLE mentions
(
	tid INTEGER,
	uid INTEGER,
	PRIMARY KEY(tid, uid),
	FOREIGN KEY(tid) REFERENCES tweets,
	FOREIGN KEY(uid) REFERENCES users,
	ON DELETE CASCADE
)

CREATE TABLE list_contains
(
	lid INTEGER,
	uid INTEGER,
	PRIMARY KEY(lid, uid),
	FOREIGN KEY(lid) REFERENCES lists,
	FOREIGN KEY(uid) REFERENCES users,
	ON DELETE CASCADE
)

CREATE TABLE follows_list
(
	uid INTEGER,
	lid INTEGER,
	PRIMARY KEY(uid, lid),
	FOREIGN KEY(uid) REFERENCES users,
	FOREIGN KEY(lid) REFERENCES lists,
	ON DELETE CASCADE
)