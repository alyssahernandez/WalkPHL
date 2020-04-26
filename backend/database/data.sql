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
INSERT INTO user_reviews (username, title, review, review_date) VALUES ('frog', 'I love the Art Museum!', 'The ART Bell is the coolest thing I''ve ever seen. Oh, the history! Wow. Just wow. ''Murica.', '2018-09-09');
INSERT INTO user_reviews (username, title, review, review_date) VALUES ('frog', 'I love the Liberty Bell!', 'The liberty Bel13123131312312314124124141lest thing I''ve ever seen. Oh, the history! Wow. Just wow. ''Murica.', '2018-09-09');

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

INSERT INTO destination (category_id, name, description, latitude, longitude, city, state, zip_code, img_url, open_from, open_to, weekends) VALUES (1, 'Liberty One Observation Deck', 'One Liberty Observation Deck, also called Philly From The Top, is an 883 ft high observation deck located on the 57th floor of One Liberty Place in Center City, Philadelphia.', '39.9526', '-75.1681', 'Philadelphia', 'PA', '19103', 'https://www.uwishunu.com/wp-content/uploads/2015/11/philly-from-the-top-360philly-680uw.jpg','830', '2000', true);
INSERT INTO destination (category_id, name, description, latitude, longitude, city, state, zip_code, img_url, open_from, open_to, weekends) VALUES (2, 'Spruce Street Harbor Park', 'The Spruce Street Harbor Park is an urban beach located in Penn''s Landing in Philadelphia, Pennsylvania. Open during the summer, the place features a boardwalk along the Delaware River with a beachfront atmosphere.', '39.943729', '-75.142029', 'Philadelphia', 'PA', '19103', 'https://drwcsite.s3.amazonaws.com/files/966413611275729956-1507-drwc-sshp-5858-1.fullscreen.jpg','0', '2400', true);
INSERT INTO destination (category_id, name, description, latitude, longitude, city, state, zip_code, img_url, open_from, open_to, weekends) VALUES (3, 'Philadelphia Museum of Art', 'The Philadelphia Museum of Art is an art museum originally chartered in 1876 for the Centennial Exposition in Philadelphia. The main museum building was completed in 1928 on Fairmount.', '39.9656', '-75.1810', 'Philadelphia', 'PA', '19103', 'https://media.phillyvoice.com/media/images/060320_ArtMuseum_RockySteps.f5f176e9.fill-735x409.jpg','800', '1700', true);
INSERT INTO destination (category_id, name, description, latitude, longitude, city, state, zip_code, img_url, open_from, open_to, weekends) VALUES (4, 'City Hall', 'Philadelphia City Hall is the world’s largest free standing masonry building made of brick, white marble, limestone and granite and functions as the seat of government for the city of Philadelphia, Pennsylvania.', '39.9526', '-75.1652', 'Philadelphia', 'PA', '19103', 'https://www.inquirer.com/resizer/UhnDVvxcSKn0xXi55I0lQjtNDpA=/1400x932/smart/arc-anglerfish-arc2-prod-pmn.s3.amazonaws.com/public/ILKZK72LQFB2ZNGWNFRRSHLKQE.jpg','700', '1800', false);
INSERT INTO destination (category_id, name, description, latitude, longitude, city, state, zip_code, img_url, open_from, open_to, weekends) VALUES (5, 'Reading Terminal Market', 'Reading Terminal Market has all of the delicacies that you could ever want! This is an excellent stop for foodies & families.', '39.9533', '-75.1594', 'Philadelphia', 'PA', '19103', 'https://www.visitphilly.com/wp-content/uploads/2018/02/Reading-terminal-market-interior-R-Kennedy-VP-2200x1237.jpg','530', '1800', true);
INSERT INTO destination (category_id, name, description, latitude, longitude, city, state, zip_code, img_url, open_from, open_to, weekends) VALUES (4, 'Liberty Bell', 'The Liberty Bell, previously called the State House Bell or Old State House Bell, is an iconic symbol of American independence, located in Philadelphia, Pennsylvania.', '39.9656', '-75.1810', 'Philadelphia', 'PA', '19103', 'https://www.theconstitutional.com/sites/drupal.theconstitutional.com/files/Liberty_Bell%20w%20ind%20hall%20horiz.jpg','900', '1700', true);
INSERT INTO destination (category_id, name, description, latitude, longitude, city, state, zip_code, img_url, open_from, open_to, weekends) VALUES (3, 'The Franklin Institute', 'The Franklin Institute is a science museum and the center of science education and research in Philadelphia, Pennsylvania. It is named after the American scientist and statesman, Benjamin Franklin, and houses the Benjamin Franklin National Memorial.', '39.9582', '-75.1731', 'Philadelphia', 'PA', '19103', 'https://www.visitphilly.com/wp-content/uploads/2018/02/The-Franklin-Institute-Franklin-Statue-J-Fusco-1200VP.jpg','800', '1700', true);
INSERT INTO destination (category_id, name, description, latitude, longitude, city, state, zip_code, img_url, open_from, open_to, weekends) VALUES (4, 'Independence National Historical Park', 'Independence National Historical Park is a United States National Park in Philadelphia that preserves several sites associated with the American Revolution and the nation''s founding history.', '39.9582', '-75.1731', 'Philadelphia', 'PA', '19103', 'https://www.visitphilly.com/wp-content/uploads/2017/12/IndependenceMall-autumn-C-Smyth-2200VP.jpg','600', '2100', true);

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