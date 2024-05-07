DELETE FROM CHAT_MESSAGES;
DELETE FROM CHAT_ADMINS;
DELETE FROM CHAT_USERS;
DELETE FROM MESSAGE;
DELETE FROM CHAT;
DELETE FROM APP_USER;


INSERT INTO APP_USER(id, email, password, full_name)
-- Password: 1234
VALUES ('be900497-cc68-4504-9b99-4e5deaf1e6c0', 'luke.skywalker@test.com', '$2a$12$0TjSkhITHjj8BDk8KjHUYu1ASnDBOFMYFgRJSpkmdLQnRJdwoVIvS', 'Luke Skywalker'),
-- Password: 2345
       ('f290f384-60ba-4cdd-af96-26c88ede0264', 'darth.vader@test.com', '$2a$12$rrCst9IZ1/zsIFxRq.Zw9eUDEIRne0oIa0wRIy5frhnpy2YnBH3E6', 'Darth Vader'),
-- Password: 3456
       ('d7083ad6-9e09-453e-b7c8-65016f20ea37', 'obiwan.kenobi@test.com', '$2a$12$cfSJM7CNCVVJBqE2SczGne6x.toBqiViSbhbw6WP74GKBq58A3ejC', 'Obi Wan Kenobi'),
-- Password: 4567
       ('0fb97ac1-1304-4e83-b640-f659b8679907', 'leia.organa@test.com', '$2a$12$.Eo6Sidz9yNgIxCfPWxkU.NxWNGLseHKkrTEQYyremPbs06IebvKe', 'Leia Organa'),
-- Password: 5678
       ('4e039f0a-5eaf-4354-ad5b-14e2889643d4', 'han.solo@test.com', '$2a$12$WMTSS95ddiBK5r3PUiqLXezB/MvUo9bCN8cj81e6BZvCaUjVFR2jy', 'Han Solo'),
-- Password: 6789
       ('c419a854-010a-4a50-be82-f4587014d6e4', 'imperator.palpatine@test.com', '$2a$12$useRqqdVUGRpKvKoedssbeZVn/ePNO9jtcqcQfRzhQ.6g/vcPHciG', 'Imperator Palpatine');


INSERT INTO CHAT(id, chat_name, is_group, created_by_id)
VALUES ('0bd20a41-4d23-4c4e-a8aa-8e46743f9ee4', 'Darth Vader and Luke', false, 'f290f384-60ba-4cdd-af96-26c88ede0264'),
       ('c40e7df3-7e67-4955-96b5-25e8769ec9bc', 'Luke and Leia', false, 'be900497-cc68-4504-9b99-4e5deaf1e6c0'),
       ('ac63914e-151e-444f-b44c-f67a3374f1f1', 'The Goodies', true, 'be900497-cc68-4504-9b99-4e5deaf1e6c0'),
       ('f476eee8-9a39-4fd2-906f-9e7a746ef167', 'The Dark Side', true, 'c419a854-010a-4a50-be82-f4587014d6e4'),
       ('8a3ad4c8-3c57-43c3-aed7-f3af68da5135', 'Leia and Kenobi', false, 'd7083ad6-9e09-453e-b7c8-65016f20ea37');


INSERT INTO CHAT_ADMINS(admins_id, chat_id)
VALUES ('be900497-cc68-4504-9b99-4e5deaf1e6c0', 'ac63914e-151e-444f-b44c-f67a3374f1f1'),
       ('c419a854-010a-4a50-be82-f4587014d6e4', 'f476eee8-9a39-4fd2-906f-9e7a746ef167');


INSERT INTO CHAT_USERS(chat_id, users_id)
VALUES ('0bd20a41-4d23-4c4e-a8aa-8e46743f9ee4', 'f290f384-60ba-4cdd-af96-26c88ede0264'),
       ('0bd20a41-4d23-4c4e-a8aa-8e46743f9ee4', 'be900497-cc68-4504-9b99-4e5deaf1e6c0'),
       ('c40e7df3-7e67-4955-96b5-25e8769ec9bc', 'be900497-cc68-4504-9b99-4e5deaf1e6c0'),
       ('c40e7df3-7e67-4955-96b5-25e8769ec9bc', '0fb97ac1-1304-4e83-b640-f659b8679907'),
       ('ac63914e-151e-444f-b44c-f67a3374f1f1', 'be900497-cc68-4504-9b99-4e5deaf1e6c0'),
       ('ac63914e-151e-444f-b44c-f67a3374f1f1', 'd7083ad6-9e09-453e-b7c8-65016f20ea37'),
       ('ac63914e-151e-444f-b44c-f67a3374f1f1', '0fb97ac1-1304-4e83-b640-f659b8679907'),
       ('ac63914e-151e-444f-b44c-f67a3374f1f1', '4e039f0a-5eaf-4354-ad5b-14e2889643d4'),
       ('f476eee8-9a39-4fd2-906f-9e7a746ef167', 'f290f384-60ba-4cdd-af96-26c88ede0264'),
       ('f476eee8-9a39-4fd2-906f-9e7a746ef167', 'c419a854-010a-4a50-be82-f4587014d6e4'),
       ('8a3ad4c8-3c57-43c3-aed7-f3af68da5135', '0fb97ac1-1304-4e83-b640-f659b8679907'),
       ('8a3ad4c8-3c57-43c3-aed7-f3af68da5135', 'd7083ad6-9e09-453e-b7c8-65016f20ea37');


INSERT INTO MESSAGE(id, content, time_stamp, user_id, chat_id)
VALUES ('a284a44a-7b28-45da-8463-3a35417715f0', 'I am your father', '2024-04-22 20:01:07.535241 +00:00', 'f290f384-60ba-4cdd-af96-26c88ede0264', '0bd20a41-4d23-4c4e-a8aa-8e46743f9ee4'),
       ('37afbdc4-89b4-4961-b825-bb4d666e5442', 'Noooo', '2024-04-22 20:02:08.535241 +00:00', 'be900497-cc68-4504-9b99-4e5deaf1e6c0', '0bd20a41-4d23-4c4e-a8aa-8e46743f9ee4'),
       ('620d606a-9033-4210-b9c0-982e0f3800ef', 'Oh btw I am your sister', '2024-04-22 20:03:08.535241 +00:00', '0fb97ac1-1304-4e83-b640-f659b8679907', 'c40e7df3-7e67-4955-96b5-25e8769ec9bc'),
       ('15733d9e-939d-497b-b042-fd2fe54d7430', 'Good to know', '2024-04-22 20:04:08.535241 +00:00', 'be900497-cc68-4504-9b99-4e5deaf1e6c0', 'c40e7df3-7e67-4955-96b5-25e8769ec9bc'),
       ('6bd25bf8-dba1-46b1-8821-ba838d4a84ae', 'We won!', '2024-04-22 20:05:08.535241 +00:00', 'be900497-cc68-4504-9b99-4e5deaf1e6c0', 'ac63914e-151e-444f-b44c-f67a3374f1f1');


INSERT INTO CHAT_MESSAGES(chat_id, messages_id)
VALUES ('0bd20a41-4d23-4c4e-a8aa-8e46743f9ee4', 'a284a44a-7b28-45da-8463-3a35417715f0'),
       ('0bd20a41-4d23-4c4e-a8aa-8e46743f9ee4', '37afbdc4-89b4-4961-b825-bb4d666e5442'),
       ('c40e7df3-7e67-4955-96b5-25e8769ec9bc', '620d606a-9033-4210-b9c0-982e0f3800ef'),
       ('c40e7df3-7e67-4955-96b5-25e8769ec9bc', '15733d9e-939d-497b-b042-fd2fe54d7430'),
       ('ac63914e-151e-444f-b44c-f67a3374f1f1', '6bd25bf8-dba1-46b1-8821-ba838d4a84ae');