BEGIN TRANSACTION;
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
INSERT INTO category (category_name) VALUES ('Entertainment');
INSERT INTO category (category_name) VALUES ('Educational');


INSERT INTO badge (category_id, name, description, img_url) VALUES (1, 'Sky Badge', 'Visit Liberty One Observation Deck', 'sky.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (2, 'Harbor Park Badge', 'Visit Spruce Street Harbor Park', 'harborpark.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (3, 'Art Museum Badge', 'Visit Philadelphia Museum of Art', 'art.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (4, 'Liberty Badge', 'Visit Liberty Bell', 'libertybell.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (3, 'Franklin Institute Badge', 'Visit The Franklin Institute', 'franklininst.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (4, 'City Hall Badge', 'Visit City Hall', 'cityhall.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (2, 'Independence Park Badge', 'Visit Independence National Historical Park', 'doi.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (5, 'Reading Terminal Badge', 'Visit Reading Terminal Market', 'readingterminal.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (3, 'Fairmount Park Badge', 'Visit Fairmount Park', 'fairmountpark.png');
INSERT INTO badge (category_id, name, description, img_url) VALUES (6, 'Fillmore Philly Badge', 'Visit The Fillmore Philadelphia', 'fillmorephilly.png');


INSERT INTO user_badge (username, badge_id) VALUES ('admin', 6);
INSERT INTO user_badge (username, badge_id) VALUES ('admin', 8);
INSERT INTO user_badge (username, badge_id) VALUES ('admin', 4);
INSERT INTO user_badge (username, badge_id) VALUES ('frog', 5);
INSERT INTO user_badge (username, badge_id) VALUES ('frog', 7);


INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (4, 'City Hall', 'Philadelphia City Hall is the world’s largest free standing masonry building made of brick, white marble, limestone and granite and functions as the seat of government for the city.', '39.9526', '-75.1652', 'Philadelphia', 'PA', '19107', 'cityhall.jpg', 'arts.png', '7 a.m.', '6 p.m.', 'No', 'https://en.wikipedia.org/wiki/Philadelphia_City_Hall', 'PhiladelphiaGov');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (5, 'Reading Terminal Market', 'Reading Terminal Market, one of the nation’s oldest and largest public markets, first opened in 1893. Today, it stands out as one of the greatest public markets in the country, where visitors can enjoy eating a wide swath of different cuisines.', '39.9533', '-75.1594', 'Philadelphia', 'PA', '19107', 'rtm.jpg', 'foodicon.png', '8 a.m.', '5 p.m.', 'Yes', 'https://en.wikipedia.org/wiki/Reading_Terminal_Market', 'RdgTerminalMkt');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (4, 'Liberty Bell', 'The Liberty Bell, previously called the State House Bell or Old State House Bell, is an iconic symbol of American independence', '39.9496', '-75.1503', 'Philadelphia', 'PA', '19106', 'bell.jpg', 'camera.png', '9 a.m.', '5 p.m.', 'Yes', 'https://en.wikipedia.org/wiki/Liberty_Bell', 'PhiladelphiaGov');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (7, 'The Franklin Institute', 'The Franklin Institute is a science museum and the center of science education and research in Philadelphia, Pennsylvania. It is named after the American scientist and statesman, Benjamin Franklin, and houses the Benjamin Franklin National Memorial.', '39.9582', '-75.1731', 'Philadelphia', 'PA', '19103', 'franklin.jpg', 'arts.png', '8 a.m.', '5 p.m.', 'Yes', 'https://en.wikipedia.org/wiki/Franklin_Institute', 'TheFranklin');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (4, 'Independence National Historical Park', 'Independence National Historical Park is a United States National Park in Philadelphia that preserves several sites associated with the American Revolution and the nation''s founding history.', '39.9495', '-75.1497', 'Philadelphia', 'PA', '19106', 'inhp.jpg', 'arts.png', '6 p.m.', '9 p.m.', 'Yes', 'https://en.wikipedia.org/wiki/Independence_National_Historical_Park', 'INDEPENDENCENHP');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (1, 'One Liberty Observation Deck', 'One Liberty Observation Deck, also called Philly From The Top, is an 883 ft high observation deck located on the 57th floor of One Liberty Place in Center City.', '39.9526', '-75.1681', 'Philadelphia', 'PA', '19103', 'deck.jpg', 'camera.png', '10 a.m.', '8 p.m.', 'Yes', 'https://en.wikipedia.org/wiki/One_Liberty_Observation_Deck', 'OneLibertyPHL');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (2, 'Spruce Street Harbor Park', 'The Spruce Street Harbor Park is an urban beach located in Penn''s Landing in Philadelphia, Pennsylvania. Open during the summer, the place features a boardwalk along the Delaware River with a beachfront atmosphere.', '39.943729', '-75.142029', 'Philadelphia', 'PA', '19106', 'park.jpg', 'park.png', '7 a.m.', '10 p.m.', 'Yes', 'https://en.wikipedia.org/wiki/Spruce_Street_Harbor_Park', 'SSHarborPark');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (3, 'Philadelphia Museum of Art', 'The Philadelphia Museum of Art is an art museum originally chartered in 1876 for the Centennial Exposition in Philadelphia. It''s the cultural heart of a great city—the place for creative play, with a surprise around every corner.', '39.9656', '-75.1810', 'Philadelphia', 'PA', '19130', 'museum.jpg', 'arts.png', '8 a.m.', '5 p.m.', 'Yes', 'https://en.wikipedia.org/wiki/Philadelphia_Museum_of_Art', 'philamuseum');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (2, 'Fairmount Park', 'Fairmount Park is one of the most known regional parks and green zones, with wonderful waterfalls, statues, unique examples of flora and fauna. It is also one of the oldest pars of the city founded more than 200 years ago.', '39.9858', '-75.2156', 'Philadelphia', 'PA', '19119', 'fairmount.jpg', 'park.png', '7 a.m.', '10 p.m.', 'Yes', 'https://en.wikipedia.org/wiki/Fairmount_Park', 'myphillypark');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (6, 'The Fillmore', 'Completely renovated and home to a beautiful and state-of the-art 2,500-capacity live music club, this versatile space is the perfect blend of rock and elegance, both classic and cutting edge.', '39.9656', '-75.1351', 'Philadelphia', 'PA', '19123', 'fillmore.jpg', 'arts.png', '11 a.m.', 'Midnight', 'Yes', 'https://en.wikipedia.org/wiki/The_Fillmore', 'FillmorePhilly');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (6, 'Philadelphia Zoo', 'The Philadelphia Zoo is one of the premier zoos in the world for breeding animals that are difficult to breed in captivity. The zoo is consistently ranked as one of the top zoological destinations in the United States.', '39.9721', '-75.1958', 'Philadelphia', 'PA', '19104', 'zoo.jpg', 'park.png', '8 a.m.', '8 p.m.', 'Yes', 'https://en.wikipedia.org/wiki/Philadelphia_Zoo', 'phillyzoo');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (1, 'Eastern State Penitentiary', 'Eastern State Penitentiary was once the most famous and expensive prison in the world, but stands today in ruin. Its vaulted, sky-lit cells once held many of America''s most notorious lawbreakers, including "Slick Willie" Sutton and "Scarface" Al Capone.', '39.9683', '-75.1727', 'Philadelphia', 'PA', '19130', 'esp.jpg', 'arts.png', '10 a.m.', '5 p.m.', 'Yes', 'https://en.wikipedia.org/wiki/Eastern_State_Penitentiary', 'easternstate' );
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (4, 'Museum of the American Revolution', 'The Museum of the American Revolution is a Philadelphia museum dedicated to telling the story of the American Revolution. The museum was opened to the public on April 19, 2017, the anniversary of the first battle of the war, Lexington and Concord.', '39.9483', '-75.1459', 'Philadelphia', 'PA', '19106', 'rev.jpg', 'camera.png', '10 a.m.', '5 p.m.', 'Yes', 'https://en.wikipedia.org/wiki/Museum_of_the_American_Revolution', 'AmRevMuseum');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (4, 'National Constitution Center', 'The National Constitution Center in Philadelphia brings together people of all ages and perspectives, across America and around the world, to learn about, debate, and celebrate the greatest vision of human freedom in history, the U.S. Constitution.', '39.952728', '-75.149918', 'Philadelphia', 'PA', '19106', 'ncs.jpg', 'camera.png', '8 a.m.', '5 p.m.', 'Yes', 'https://en.wikipedia.org/wiki/National_Constitution_Center', 'ConstitutionCtr');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (7, 'The Academy of Natural Sciences of Drexel University', 'The Academy of Natural Sciences of Drexel University, formerly the Academy of Natural Sciences of Philadelphia, is the oldest natural science research institution and museum in the Americas.', '39.958309', '-75.171387', 'Philadelphia', 'PA', '19103', 'drexel.jpg', 'arts.png', '10 a.m.', '4:30 p.m.', 'Yes', 'https://en.wikipedia.org/wiki/Academy_of_Natural_Sciences_of_Drexel_University', 'AcadNatSci');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (6, 'The Mütter Museum', 'The Mütter Museum is a medical museum located in the Center City area of Philadelphia, Pennsylvania. It contains a collection of anatomical and pathological specimens, wax models, and antique medical equipment.', '39.9532', '-75.1764', 'Philadelphia', 'PA', '19103', 'mutter.jpg', 'foodicon.png', '8 a.m.', '8 p.m.', 'Yes', 'https://en.wikipedia.org/wiki/M%C3%BCtter_Museum', 'MutterMuseum');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (5, 'Murph''s Bar', 'Pennies cover the bar in this comfy pub with an exposed-brick interior & quirky decorations. Although an Irish bar, Murph''s serves some of the best pasta in the city.', '39.969000', '-75.133410', 'Philadelphia', 'PA', '19125', 'murphs.jpg', 'foodicon.png', '11 a.m.', '2 a.m.', 'Yes', 'awdda', 'awdadwada');
INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, img_url, icon_url, open_from, open_to, weekends, wiki, twitter_handle) VALUES (6, 'Philadelphia''s Magic Gardens', 'Philadelphia''s Magic Gardens is a non-profit organization, folk art environment, and gallery space. It''s the largest work by mosaic artist Isaiah Zagar. The Magic Gardens spans three city lots, and includes indoor galleries and a large outdoor labyrinth.', '39.9427', '-75.1593', 'Philadelphia', 'PA', '19147', 'mg.png', 'arts.png', '9 a.m.', '7 p.m.', 'Yes', 'https://en.wikipedia.org/wiki/Philadelphia''s_Magic_Gardens', 'magicgardens');

INSERT INTO user_destination (username, destination_id, date_visited) VALUES ('admin', 1, '2019-02-09');
INSERT INTO user_destination (username, destination_id, date_visited) VALUES ('admin', 2, '2020-09-20');
INSERT INTO user_destination (username, destination_id, date_visited) VALUES ('admin', 3, '2018-05-04');
INSERT INTO user_destination (username, destination_id, date_visited) VALUES ('frog', 4, '2020-09-09');
INSERT INTO user_destination (username, destination_id, date_visited) VALUES ('frog', 5, '2020-12-12');

INSERT INTO destination_badge (destination_id, badge_id) VALUES (1, 6);
INSERT INTO destination_badge (destination_id, badge_id) VALUES (2, 8);
INSERT INTO destination_badge (destination_id, badge_id) VALUES (3, 4);
INSERT INTO destination_badge (destination_id, badge_id) VALUES (4, 5);
INSERT INTO destination_badge (destination_id, badge_id) VALUES (5, 7);
INSERT INTO destination_badge (destination_id, badge_id) VALUES (6, 1);
INSERT INTO destination_badge (destination_id, badge_id) VALUES (7, 2);
INSERT INTO destination_badge (destination_id, badge_id) VALUES (8, 3);
INSERT INTO destination_badge (destination_id, badge_id) VALUES (9, 9);
INSERT INTO destination_badge (destination_id, badge_id) VALUES (10, 10);


INSERT INTO user_destination_submission (destination_name, submitted_by) VALUES ('The Cookie Club', 'frog');
INSERT INTO user_destination_submission (destination_name, submitted_by) VALUES ('Edgar Allen Poe House', 'frog');
INSERT INTO user_destination_submission (destination_name, submitted_by) VALUES ('That one place', 'frog');

INSERT INTO user_reviews (username, title, review, review_date, destination_id) VALUES ('frog', 'I love the Liberty Bell!', 'The liberty Bell is the coolest thing I''ve ever seen. Oh, the history! Wow. Just wow. ''Murica.', '2018-09-09', 3);
INSERT INTO user_reviews (username, title, review, review_date, destination_id) VALUES ('frog', 'I love the Art Museum!', 'I just love it here! So many arts! So much peoples! Yaaaaaaa.', '2018-09-09', 8);

COMMIT;