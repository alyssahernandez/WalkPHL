BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS user_reviews;
DROP TABLE IF EXISTS badge;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS badge_category;
DROP TABLE IF EXISTS user_badge;
DROP TABLE IF EXISTS destination;
DROP TABLE IF EXISTS user_destination;
DROP TABLE IF EXISTS destination_badge;

CREATE TABLE users 
(
          user_id serial PRIMARY KEY,
          username varchar(255) NOT NULL UNIQUE,     -- Username
          password varchar(32) NOT NULL,      -- Password
          salt varchar(256) NOT NULL,          -- Password Salt
          role varchar(255) NOT NULL default('user')
);


CREATE TABLE user_reviews
(
        review_id serial PRIMARY KEY,
        user_id int not null,
        title varchar(255) not null,
        review varchar(255) not null,
        
        constraint fk_user_reviews_users foreign key (user_id) references users (user_id)
);

-- Update badge/category to category + bridge table if we want badges to include multiple categories (e.g. Art Museum has a Museum category + Rocky category)
CREATE TABLE badge_category
(
        category_id serial PRIMARY KEY,
        name varchar(64) not null
);

CREATE TABLE badge
(
        badge_id serial PRIMARY KEY,
        category_id int,
        name varchar(64) not null,
        
        constraint fk_badge_badge_category foreign key (category_id) references badge_category (category_id)
);


CREATE TABLE user_badge
(
        user_id int,
        badge_id int,
        
        constraint pk_user_badge primary key (user_id, badge_id),
        constraint fk_user_badge_users foreign key (user_id) references users (user_id),
        constraint fk_user_badge_badge foreign key (badge_id) references badge (badge_id)
);

CREATE TABLE destination
(
        destination_id serial PRIMARY KEY,
        name varchar(128) not null,
        description varchar(255) not null,
        x_coordinate varchar (128) not null,
        y_coordinate varchar(128) not null,
        city varchar(64) not null,
        state varchar(32) not null,
        zip_code varchar(16) not null
);

CREATE TABLE user_destination
(
        user_id int not null,
        destination_id int not null,
        checked_in boolean,
        
        constraint pk_user_destination primary key (user_id, destination_id),
        constraint fk_user_destination_users foreign key (user_id) references users (user_id),
        constraint fk_user_destination_destination foreign key (destination_id) references destination (destination_id)
);

CREATE TABLE destination_badge
(
        destination_id int,
        badge_id int,
        
        constraint pk_destination_badge primary key (destination_id, badge_id),
        constraint fk_destination_badge_destination foreign key (destination_id) references destination (destination_id),
        constraint fk_destination_badge_badge foreign key (badge_id) references badge (badge_id)
);

COMMIT;