CREATE TABLE Item (
id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
name VARCHAR(255) NOT NULL,
subject VARCHAR(255) NOT NULL,
price INTEGER NOT NULL,
bidprice INTEGER NOT NULL,
description VARCHAR(255) NOT NULL,
status VARCHAR(255) NOT NULL,
bidusername VARCHAR(255),
PRIMARY KEY (id));


CREATE TABLE attachment (
id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
filename VARCHAR(255) DEFAULT NULL,
content_type VARCHAR(255) DEFAULT NULL,
content BLOB DEFAULT NULL,
item_id INTEGER DEFAULT NULL,
PRIMARY KEY (id),
FOREIGN KEY (item_id) REFERENCES item(id));

CREATE TABLE usercomment (
id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
username VARCHAR(255) DEFAULT NULL,
comment VARCHAR(255) DEFAULT NULL,
item_id INTEGER DEFAULT NULL,
PRIMARY KEY (id),
FOREIGN KEY (item_id) REFERENCES item(id)
);

CREATE TABLE bidrecord (
id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
username VARCHAR(255) DEFAULT NULL,
price INTEGER DEFAULT NULL,
item_id INTEGER DEFAULT NULL,
PRIMARY KEY (id),
FOREIGN KEY (item_id) REFERENCES item(id)
);
