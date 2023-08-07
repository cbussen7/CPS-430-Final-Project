DROP TABLE conference
CASCADE CONSTRAINTS;
CREATE TABLE conference
(
  confname varchar(7) not null,
  lastchampion varchar2(15),
  primary key (confname)
);

DROP TABLE team
CASCADE CONSTRAINTS;
CREATE TABLE team
(
  tname varchar2(15) not null,
  tlocation varchar2(15),
  conferencename varchar(7),
  division varchar2(10),
  championships number,
  primary key (tname),
  foreign key (conferencename) references conference(confname)
);

DROP TABLE player
CASCADE CONSTRAINTS;
CREATE TABLE player
(
  pname varchar2(25) not null,
  age number,
  pnumber number,
  height number,
  position varchar2(2),
  pteam varchar2(15),
  ppg number,
  apg number,
  rpg number,
  primary key (pname),
  foreign key (pteam) references team(tname)
);

DROP TABLE coach
CASCADE CONSTRAINTS;
CREATE TABLE coach
(
  cname varchar2(25) not null,
  cage number,
  startyear number,
  cteam varchar2(15),
  primary key (cname),
  foreign key (cteam) references team(tname)
);

DROP TABLE arena
CASCADE CONSTRAINTS;
CREATE TABLE arena
(
  aname varchar2(30) not null,
  ateam varchar2(15),
  alocation varchar2(15),
  capacity number,
  yearbuilt number,
  primary key (aname),
  foreign key (ateam) references team(tname)
);

DROP TABLE owners
CASCADE CONSTRAINTS;
CREATE TABLE owners
(
  oname varchar2(25) not null,
  oteam varchar2(15),
  oage number,
  yearsowned number,
  primary key (oname),
  foreign key (oteam) references team(tname)
);
​