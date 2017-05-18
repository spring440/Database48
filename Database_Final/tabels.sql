/*
Name: Bryan Wong
Comp 440

Description: File is to create all the tables.
*/
create TABLE PresenterPresentation(
	pp_id int not null identity primary key,
	presentation_title nvarchar(75) not null,
	presentation_speaker nvarchar(75) not null
    );

create TABLE Person(
	p_id int not null identity primary key,
	p_last nvarchar(30) not null,
	p_first nvarchar(30) not null,
	p_email nvarchar(50)
    );

create TABLE Location(
	location_id int not null identity primary key,
	location_address nvarchar(50) not null,
	location_zip nvarchar(20),
	state_id nvarchar(3) not null references State,
	country_id nvarchar(2) not null references Country,
	phone nvarchar(15),
	city_id int not null
    );

create TABLE Role(
	r_id int not null identity primary key,
	role_desc varchar(50) not null unique
    );

create TABLE Schedule(
	schedule_id int not null identity primary key,
	event_id int not null references Event,
	class_id nvarchar(10) references Class,
	room_id int not null references Room,
	scheduleTime date not null,
	unique (event_id, room_id)
    );

create TABLE Country(
	c_id nvarchar(2) not null primary key,
	c_name nvarchar(20) not null
    );

create TABLE PersonRole(
	prole_id int not null references Role,
	person_id int not null references Person
    );

create TABLE Track(
	track_id int not null identity primary key,
	track_desc varchar(50) not null	unique
    );

create TABLE State(
	s_id nvarchar(3) not null primary key,
	state_name nvarchar(15) not null,
	country_id nvarchar(2) not null references Country
    );

create TABLE Classattendee(
	class_id nvarchar(10) not null references Class,
	person_id int not null references Person
    );

create TABLE ClassDifficulty(
	difficulty_id int not null identity primary key,
	difficulty_desc varchar(50) not null unique
    );

create TABLE Room(
	room_id int not null identity primary key,
	event_id int,
	occupancy int
    );

create TABLE Class(
	class_id nvarchar(10) not null primary key,
	event_id int not null references Event,
	class_title nvarchar(35),
	class_desc nvarchar(100),
	class_difficulty_id int not null references ClassDifficulty,
	class_duration int not null,
	person_id int not null references Person,
	track_id int not null references Track,
	class_location int not null constraint Class_Location_locationId_fk references Location
    );

create TABLE City(
	city_id int not null identity primary key,
	city_name nvarchar(40) not null
    );

create TABLE Event(	
        event_id int not null identity primary key,
	event_desc nvarchar(60) not null,
	event_date date not null,
	location_id int not null references Location
    );