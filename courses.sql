CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int,
  "gender" varchar,
  "country" char(3),
  "role_id" int
);

CREATE TABLE "users_courses" (
  "id" uuid,
  "user_id" uuid,
  "course_id" uuid
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "teacher" varchar,
  "category_id" uuid
);

CREATE TABLE "courses_levels" (
  "id" uuid,
  "course_id" uuid,
  "level_id" int
);

CREATE TABLE "levels" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "course_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "url" varchar,
  "duration" int,
  "course_id" uuid
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "roles" (
  "id" int PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "courses_levels" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

ALTER TABLE "courses_levels" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

insert into users (
    id,
	first_name,
	last_name,
	email,
	"password",
	age,
	gender,
	country,
	role_id)
values (
'de4b204c-2ea5-44a8-bd0e-26632d742dc2',
'Elizabeth',
'Gonzalez',
'ely@academlo.com',
'ely09',
26,
'Female',
'MEX',
'1'
), 
(
'de4b204c-2ea5-44a8-bd0e-26632d742cd3',
'Mauricio',
'Hernandez',
'mau@gmail.com',
'mau78',
40,
'Male',
'ARG',
'2'
);

insert into users (
    id,
	first_name,
	last_name,
	email,
	"password",
	age,
	gender,
	country,
	role_id)
	values
(
'7ea1a23e-7a5a-4b9d-a688-c3949d084b86',
'Karla',
'Martinez',
'KM@gmail.com',
'krl78',
24,
'Female',
'USA',
'1'
);

insert into categories  ( id, name) 
values (
'8fa0a519-fc1d-4c16-97d2-efe5486416eh', 'course'),
('d07068c6-902a-4380-8f4d-701de3aebd2e', 'practice'), 
('8cd5fa61-d7b5-4b5d-b0bb-9318ef122bdb', 'quiz');

insert into roles ( id, name) values (1, 'student'), (2, 'teacher'), (3, 'admin');

insert into levels ( id, name) values (1, 'Basic'), (2, 'Intermediate'), (3, 'Advanced');

insert into courses (id, title, description, teacher, category_id) 
values 
('5aabae76-4c5a-44c1-a106-3c90de51ebfe',
'English Grammar Course For Beginners: Basic English Grammar',
'It is the best video course for beginner students. You will learn articles, pronouns, prepositions, etc.',
'Esther Park',
'8fa0a519-fc1d-4c16-97d2-efe5486416ed'),
('b3f9c84d-8bda-4bce-b2fc-2ee6faad41b9',
'Basic English Grammar Course for Beginners',
'All English grammar videos. Learn beginner grammar in her basic English grammar course.',
'Esther Park',
'8fa0a519-fc1d-4c16-97d2-efe5486416ed'),
('4e256eaf-86e4-4a09-818d-d8984b0d73b4',
'Reading - Intermediate English with Mark #1',
'Two 1-hour lessons per week with a Canadian or American teacher',
'Mark Smrt',
'8fa0a519-fc1d-4c16-97d2-efe5486416ed'),
('1f8823b4-93a3-448a-80d5-575396169d98',
'Listening - Intermediate English with Mark #2',
'In this class, Mark describes the different classes available in Smrt LIve Class.',
'Mark Smrt',
'8fa0a519-fc1d-4c16-97d2-efe5486416ed'),
('6eecd622-e693-4e5e-a86e-6919cb8bda3d',
'39 Minutes of Advanced English Listening Comprehension',
'This is the best video to get started with Advanced English listening comprehension!',
'Gabriela Rodriguez',
'8fa0a519-fc1d-4c16-97d2-efe5486416ed'),
('89e5bf89-7110-49e7-8296-6029712ae344',
'Advanced English Listening And Vocabulary Practice',
'It is the best video course to become a confident, fluent English speaker.',
'Stuart Smith',
'8fa0a519-fc1d-4c16-97d2-efe5486416ed');

insert into course_videos (id, title, url, duration, course_id) 
values 
(
'aed299ef-2a26-48da-9cff-85196fb9dcd3', 
'English Grammar Course For Beginners: Basic English Grammar', 
'https://www.youtube.com/watch?v=AVYfyTvc9KY', 
135,
'5aabae76-4c5a-44c1-a106-3c90de51ebfe'),
(
'c6702116-ac3b-41c2-9caf-51d6cd2fb2b1', 
'Basic English Grammar Course for Beginners', 
'https://www.youtube.com/watch?v=FI2OKNMWGc4', 
300,
'b3f9c84d-8bda-4bce-b2fc-2ee6faad41b9'),
(
'1cf5ef92-5885-4161-b053-86cf42080f47', 
'Reading - Intermediate English with Mark #1', 
'https://www.youtube.com/watch?v=oYI3dzny8n8&list=PLN3kZ8bfmMJMxqGdgwpxKyjhmuhvU1HkV', 
68,
'4e256eaf-86e4-4a09-818d-d8984b0d73b4'),
(
'02423c3b-c9eb-42da-820c-04a861d2f3b6', 
'Listening - Intermediate English with Mark #2', 
'https://www.youtube.com/watch?v=taOQboGLPfg&list=PLN3kZ8bfmMJMxqGdgwpxKyjhmuhvU1HkV&index=2', 
68,
'1f8823b4-93a3-448a-80d5-575396169d98'),
(
'1c0f69b5-2209-4ce5-89f1-c2a8c2c55ccb', 
'39 Minutes of Advanced English Listening Comprehension', 
'https://www.youtube.com/watch?v=dra6Dxp-2Xk', 
39,
'6eecd622-e693-4e5e-a86e-6919cb8bda3d'),
(
'7c3adc63-00ed-4068-8c39-f2b0469b4522', 
'Advanced English Listening And Vocabulary Practice', 
'https://www.youtube.com/watch?v=ZOOSIPzi3Ls', 
37,
'89e5bf89-7110-49e7-8296-6029712ae344');

insert into courses_levels (id, course_id, level_id)
values (
'6c59dbe1-3cb9-4a31-8bfa-0f19f7598854', '5aabae76-4c5a-44c1-a106-3c90de51ebfe', 1),
('df420dd1-5d0d-4f03-bf30-edec5275d8c9', 'b3f9c84d-8bda-4bce-b2fc-2ee6faad41b9', 1),
('2157138d-5c12-4c6a-8c71-834d5c3b1b41', '4e256eaf-86e4-4a09-818d-d8984b0d73b4', 2),
('02f8f6f1-35f8-460f-aaf9-cd7b4e6d7960', '1f8823b4-93a3-448a-80d5-575396169d98', 2),
('a1f1f0a5-a703-4d2a-bf82-92807844730f', '6eecd622-e693-4e5e-a86e-6919cb8bda3d', 3),
('27b1284a-7920-407b-b312-2ead39b3ee27', '89e5bf89-7110-49e7-8296-6029712ae344', 3)
;

insert into users_courses ( user_id, course_id)
values 
('de4b204c-2ea5-44a8-bd0e-26632d742dc2', '5aabae76-4c5a-44c1-a106-3c90de51ebfe' ),
('7ea1a23e-7a5a-4b9d-a688-c3949d084b86', '1f8823b4-93a3-448a-80d5-575396169d98');


select * from courses inner join categories on courses.category_id  = categories.id
select * from course_videos inner join courses on course_videos.course_id = courses.id
