BEGIN TRANSACTION;
-- Password for this user is 'greatwall'
INSERT INTO users (username, password, salt, role, img_url) VALUES
('admin',
'FjZDm+sndmsdEDwNtfr6NA==',
'kidcasB0te7i0jK0fmRIGHSm0mYhdLTaiGkEAiEvLp7dAEHWnuT8n/5bd2V/mqjstQ198iImm1xCmEFu+BHyOz1Mf7vm4LILcrr17y7Ws40Xyx4FOCt8jD03G+jEafpuVJnPiDmaZQXJEpEfekGOvhKGOCtBnT5uatjKEuVWuDA=',
'City Administrator', 'img.png');

INSERT INTO users (username, password, salt, role, img_url) VALUES
('frog', 'QfmYNWeAuChxhlfVXLKJDw==', 'C7WfxgiXaYdrORUifZ3LdFe2rt2Zb4NJpeVQS405rasLkxZQIqbqGGIRHmWAf88UX9TGS538vh//GPSc0213Hylpn8L4GKbgLpD1t9owpi3Pg+XXd2R/3pTpy77LSD2rTQXL9ogK5rkzh/7im7wGM5j+Az/zUFFIjhWBEfqdhWc=', 'City Visitor', 'img.png');

INSERT INTO user_reviews (username, title, review, review_date) VALUES ('frog', 'I love the Liberty Bell!', 'The liberty Bell is the coolest thing I''ve ever seen. Oh, the history! Wow. Just wow. ''Murica.', '2018-09-09');
INSERT INTO user_reviews (username, title, review, review_date) VALUES ('frog', 'I love the Art Museum!', 'I just love it here! So many arts! So much peoples! Yaaaaaaa.', '2018-09-09');

INSERT INTO category (category_name) VALUES ('Sights');
INSERT INTO category (category_name) VALUES ('Parks');
INSERT INTO category (category_name) VALUES ('Arts');
INSERT INTO category (category_name) VALUES ('Historical');
INSERT INTO category (category_name) VALUES ('Food');

INSERT INTO badge (category_id, name, description, img_url) VALUES (1, 'Sky Badge', 'You''re sky high!', 'sky.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (2, 'X Park Badge', 'Look! A squirrel smoking a cigar!', 'harborpark.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (3, 'Art Museum / Rocky Badge', 'So cultured, you are!', 'art.png');

INSERT INTO user_badge (username, badge_id) VALUES ('admin', 1);
INSERT INTO user_badge (username, badge_id) VALUES ('admin', 2);
INSERT INTO user_badge (username, badge_id) VALUES ('admin', 3);
INSERT INTO user_badge (username, badge_id) VALUES ('frog', 1);
INSERT INTO user_badge (username, badge_id) VALUES ('frog', 2);


INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, open_from, open_to, weekends) VALUES (4, 'City Hall', '', '39.9526', '-75.1652', 'Philadelphia', 'PA', '19103', 'art.png','700', '1800', false);
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, open_from, open_to, weekends) VALUES (5, 'Reading Terminal Market', '', '39.9533', '-75.1594', 'Philadelphia', 'PA', '19103', 'art.png', '530', '1800', true);
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, open_from, open_to, weekends) VALUES (4, 'Liberty Bell', '', '39.9656', '-75.1810', 'Philadelphia', 'PA', '19103', 'art.png', '900', '1700', true);
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, open_from, open_to, weekends) VALUES (3, 'The Franklin Institute', '', '39.9582', '-75.1731', 'Philadelphia', 'PA', '19103', 'art.png','800', '1700', true);
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, open_from, open_to, weekends) VALUES (4, 'Independence National Historical Park', '', '39.9582', '-75.1731', 'Philadelphia', 'PA', '19103', 'art.png', '600', '2100', true);
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, open_from, open_to, weekends) VALUES (1, 'Liberty One Observation Deck', '', '39.9526', '-75.1681', 'Philadelphia', 'PA', '19103', 'art.png', '830', '2000', true);
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, open_from, open_to, weekends) VALUES (2, 'Spruce Street Harbor Park', '', '39.943729', '-75.142029', 'Philadelphia', 'PA', '19103', 'art.png', '0', '2400', true);
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, open_from, open_to, weekends) VALUES (3, 'Philadelphia Museum of Art', '', '39.9656', '-75.1810', 'Philadelphia', 'PA', '19103', 'art.png', '800', '1700', true);

INSERT INTO user_destination (username, destination_id) VALUES ('admin', 1);
INSERT INTO user_destination (username, destination_id) VALUES ('admin', 2);
INSERT INTO user_destination (username, destination_id) VALUES ('admin', 3);
INSERT INTO user_destination (username, destination_id) VALUES ('frog', 1);
INSERT INTO user_destination (username, destination_id) VALUES ('frog', 3);

INSERT INTO destination_badge (destination_id, badge_id) VALUES (1, 1);
INSERT INTO destination_badge (destination_id, badge_id) VALUES (2, 2);
INSERT INTO destination_badge (destination_id, badge_id) VALUES (3, 3);
INSERT INTO destination_badge (destination_id, badge_id) VALUES (4, 1);
INSERT INTO destination_badge (destination_id, badge_id) VALUES (5, 2);
INSERT INTO destination_badge (destination_id, badge_id) VALUES (6, 3);
INSERT INTO destination_badge (destination_id, badge_id) VALUES (7, 1);
INSERT INTO destination_badge (destination_id, badge_id) VALUES (8, 2);


INSERT INTO user_destination_submission (destination_name, submitted_by) VALUES ('The Cookie Club', 'frog');
INSERT INTO user_destination_submission (destination_name, submitted_by) VALUES ('Edgar Allen Poe House', 'frog');
INSERT INTO user_destination_submission (destination_name, submitted_by) VALUES ('That one place', 'frog');

COMMIT;