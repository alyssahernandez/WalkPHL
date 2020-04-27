BEGIN TRANSACTION;

DROP TABLE IF EXISTS user_reviews;
DROP TABLE IF EXISTS destination_badge;
DROP TABLE IF EXISTS user_badge;
DROP TABLE IF EXISTS badge;
DROP TABLE IF EXISTS user_destination;
DROP TABLE IF EXISTS user_destination_submission;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS destination;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS badge_category;
DROP TABLE IF EXISTS destination_category;


CREATE TABLE users 
(
          id serial PRIMARY KEY,
          username varchar(255) NOT NULL UNIQUE,     -- Username
          password varchar(32) NOT NULL,      -- Password
          salt varchar(256) NOT NULL,          -- Password Salt
          role varchar(255) NOT NULL default('City Vistor'),
          img_url varchar(255),
          bio varchar(255),
          profile_pic varchar(100) NOT NULL default('boat.png')
);


CREATE TABLE user_reviews
(
        review_id serial PRIMARY KEY,
        username varchar(128) not null,
        title varchar(255) not null,
        review varchar(255) not null,
        review_date date not null,
        
                
        constraint fk_user_reviews_users foreign key (username) references users (username)
);

-- Update badge/category to category + bridge table if we want badges to include multiple categories (e.g. Art Museum has a Museum category + Rocky category)
CREATE TABLE category
(
        category_id serial PRIMARY KEY,
        category_name varchar(64) not null
);


CREATE TABLE badge
(
        badge_id serial PRIMARY KEY,
        category_id int,
        name varchar(64) not null UNIQUE,
        description varchar(128) not null,
        img_url varchar(255),
        
        constraint fk_badge_category foreign key (category_id) references category (category_id)
);

-- Probably change username to user_id, but seemed easier with doing API calls.
CREATE TABLE user_badge
(
        username varchar(128),
        badge_id int,
        
        constraint pk_user_badge primary key (username, badge_id),
        constraint fk_user_badge_users foreign key (username) references users (username),
        constraint fk_user_badge_badge foreign key (badge_id) references badge (badge_id)
);

CREATE TABLE destination
(
        destination_id serial PRIMARY KEY,
        category_id int not null,
        name varchar(128) not null,
        description varchar(255) not null,
        lat varchar (128) not null,
        long varchar(128) not null,
        city varchar(64) not null,
        state varchar(32) not null,
        zip_code varchar(16) not null,
        open_from varchar(32) not null,
        open_to varchar(32) not null,
        weekends boolean not null,
        img_url varchar(255),
        
        constraint fk_destination_category foreign key (category_id) references category (category_id)
);

CREATE TABLE user_destination
(
        username varchar(128) not null,
        destination_id int not null,
        date_visited date not null,
        
        constraint fk_user_destination_users foreign key (username) references users (username),
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

CREATE TABLE user_destination_submission
(
        destination_id serial PRIMARY KEY,
        destination_name varchar(128) not null,
        submitted_by varchar(128) not null,
        
        constraint fk_user_destination_submission_users foreign key (submitted_by) references users (username)
);
COMMIT;