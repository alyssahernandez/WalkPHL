-- Password for this user is 'greatwall'
INSERT INTO users (username, password, salt, role, img_url) VALUES
('admin',
'FjZDm+sndmsdEDwNtfr6NA==',
'kidcasB0te7i0jK0fmRIGHSm0mYhdLTaiGkEAiEvLp7dAEHWnuT8n/5bd2V/mqjstQ198iImm1xCmEFu+BHyOz1Mf7vm4LILcrr17y7Ws40Xyx4FOCt8jD03G+jEafpuVJnPiDmaZQXJEpEfekGOvhKGOCtBnT5uatjKEuVWuDA=',
'City Administrator', 'img.png');

INSERT INTO users (username, password, salt, role, img_url) VALUES
('frog', 'QfmYNWeAuChxhlfVXLKJDw==', 'C7WfxgiXaYdrORUifZ3LdFe2rt2Zb4NJpeVQS405rasLkxZQIqbqGGIRHmWAf88UX9TGS538vh//GPSc0213Hylpn8L4GKbgLpD1t9owpi3Pg+XXd2R/3pTpy77LSD2rTQXL9ogK5rkzh/7im7wGM5j+Az/zUFFIjhWBEfqdhWc=', 'City Visitor', 'img.png');


INSERT INTO category (category_name) VALUES ('Sights');
INSERT INTO category (category_name) VALUES ('Parks');
INSERT INTO category (category_name) VALUES ('Arts');
INSERT INTO category (category_name) VALUES ('Historical');
INSERT INTO category (category_name) VALUES ('Food');

INSERT INTO badge (category_id, name, description, img_url) VALUES (1, 'Sky Badge', 'Visit Liberty One Observation Deck', 'sky.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (2, 'Harbor Park Badge', 'Visit Spruce Street Harbor Park', 'harborpark.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (3, 'Art Museum Badge', 'Visit Philadelphia Museum of Art', 'art.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (4, 'Liberty Badge', 'Visit Liberty Bell', 'libertybell.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (3, 'Franklin Institute Badge', 'Visit The Franklin Institute', 'franklininst.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (4, 'City Hall Badge', 'Visit City Hall', 'cityhall.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (2, 'Independence Park Badge', 'Visit Independence National Historical Park', 'doi.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (5, 'Reading Terminal Badge', 'Visit Reading Terminal Market', 'readingterminal.png');


INSERT INTO user_badge (username, badge_id) VALUES ('admin', 1);
INSERT INTO user_badge (username, badge_id) VALUES ('admin', 2);
INSERT INTO user_badge (username, badge_id) VALUES ('admin', 3);
INSERT INTO user_badge (username, badge_id) VALUES ('frog', 1);
INSERT INTO user_badge (username, badge_id) VALUES ('frog', 2);


INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki) VALUES (4, 'City Hall', 'Philadelphia City Hall is the world’s largest free standing masonry building made of brick, white marble, limestone and granite and functions as the seat of government for the city.', '39.9526', '-75.1652', 'Philadelphia', 'PA', '19103', 'cityhall.jpg', 'arts.png', '700', '1800', 'No', 'https://en.wikipedia.org/wiki/Philadelphia_City_Hall');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki) VALUES (5, 'Reading Terminal Market', 'Reading Terminal Market, one of the nation’s oldest and largest public markets, first opened in 1893. Today, it stands out as one of the greatest public markets in the country, where visitors can enjoy eating a wide swath of different cuisines.', '39.9533', '-75.1594', 'Philadelphia', 'PA', '19103', 'rtm.jpg', 'foodicon.png', '530', '1800', 'Yes', 'https://en.wikipedia.org/wiki/Reading_Terminal_Market');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki) VALUES (4, 'Liberty Bell', 'The Liberty Bell, previously called the State House Bell or Old State House Bell, is an iconic symbol of American independence', '39.9496', '-75.1503', 'Philadelphia', 'PA', '19103', 'bell.jpg', 'camera.png', '900', '1700', 'Yes', 'https://en.wikipedia.org/wiki/Liberty_Bell');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki) VALUES (3, 'The Franklin Institute', 'The Franklin Institute is a science museum and the center of science education and research in Philadelphia, Pennsylvania. It is named after the American scientist and statesman, Benjamin Franklin, and houses the Benjamin Franklin National Memorial.', '39.9582', '-75.1731', 'Philadelphia', 'PA', '19103', 'franklin.jpg', 'arts.png', '800', '1700', 'Yes', 'https://en.wikipedia.org/wiki/Franklin_Institute');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki) VALUES (4, 'Independence National Historical Park', 'Independence National Historical Park is a United States National Park in Philadelphia that preserves several sites associated with the American Revolution and the nation''s founding history.', '39.9495', '-75.1497', 'Philadelphia', 'PA', '19103', 'inhp.jpg', 'arts.png', '600', '2100', 'Yes', 'https://en.wikipedia.org/wiki/Independence_National_Historical_Park');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki) VALUES (1, 'One Liberty Observation Deck', 'One Liberty Observation Deck, also called Philly From The Top, is an 883 ft high observation deck located on the 57th floor of One Liberty Place in Center City.', '39.9526', '-75.1681', 'Philadelphia', 'PA', '19103', 'deck.jpg', 'camera.png', '830', '2000', 'Yes', 'https://en.wikipedia.org/wiki/One_Liberty_Observation_Deck');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki) VALUES (2, 'Spruce Street Harbor Park', 'The Spruce Street Harbor Park is an urban beach located in Penn''s Landing in Philadelphia, Pennsylvania. Open during the summer, the place features a boardwalk along the Delaware River with a beachfront atmosphere.', '39.943729', '-75.142029', 'Philadelphia', 'PA', '19103', 'park.jpg', 'park.png', '0', '2400', 'Yes', 'https://en.wikipedia.org/wiki/Spruce_Street_Harbor_Park');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki) VALUES (3, 'Philadelphia Museum of Art', 'The Philadelphia Museum of Art is an art museum originally chartered in 1876 for the Centennial Exposition in Philadelphia. It''s the cultural heart of a great city—the place for creative play, with a surprise around every corner.', '39.9656', '-75.1810', 'Philadelphia', 'PA', '19103', 'museum.jpg', 'arts.png', '800', '1700', 'Yes', 'https://en.wikipedia.org/wiki/Philadelphia_Museum_of_Art');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki) VALUES (3, 'Fairmount Park', 'Fairmount Park is one of the most known regional parks and green zones, with wonderful waterfalls, statues, unique examples of flora and fauna. It is also one of the oldest pars of the city founded more than 200 years ago.', '39.9858', '-75.2156', 'Philadelphia', 'PA', '19103', 'fairmount.jpg', 'park.png', '0', '2400', 'Yes', 'https://en.wikipedia.org/wiki/Fairmount_Park');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki) VALUES (3, 'The Fillmore', 'Completely renovated and home to a beautiful and state-of the-art 2,500-capacity live music club, this versatile space is the perfect blend of rock and elegance, both classic and cutting edge.', '39.9656', '-75.1351', 'Philadelphia', 'PA', '19103', 'fillmore.jpg', 'arts.png', '1100', '2400', 'Yes', 'https://en.wikipedia.org/wiki/The_Fillmore');

INSERT INTO user_destination (username, destination_id, date_visited) VALUES ('admin', 1, '2019-02-09');
INSERT INTO user_destination (username, destination_id, date_visited) VALUES ('admin', 2, '2020-09-20');
INSERT INTO user_destination (username, destination_id, date_visited) VALUES ('admin', 3, '2018-05-04');
INSERT INTO user_destination (username, destination_id, date_visited) VALUES ('frog', 1, '2020-09-09');
INSERT INTO user_destination (username, destination_id, date_visited) VALUES ('frog', 3, '2020-12-12');

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

INSERT INTO user_reviews (username, title, review, review_date, destination_id) VALUES ('frog', 'I love the Liberty Bell!', 'The liberty Bell is the coolest thing I''ve ever seen. Oh, the history! Wow. Just wow. ''Murica.', '2018-09-09', 3);
INSERT INTO user_reviews (username, title, review, review_date, destination_id) VALUES ('frog', 'I love the Art Museum!', 'I just love it here! So many arts! So much peoples! Yaaaaaaa.', '2018-09-09', 8);

COMMIT;