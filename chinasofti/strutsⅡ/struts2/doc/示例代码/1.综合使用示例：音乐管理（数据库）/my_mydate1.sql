create table MUSICS
(
MUSIC_NO number(4),
MUSIC_NAME varchar2(50) not null,
MUSIC_SINGER varchar2(50) default 'unnamed',
MUSIC_SIZE varchar2(20) default 'unknown',
constraint MUSICS_PK primary key (MUSIC_NO)
);

insert into MUSICS (music_no, music_name, music_singer, music_size)
values (1, '北京北京', '汪峰', '3分40秒');
insert into MUSICS (music_no, music_name, music_singer, music_size)
values (2, '冬季到台北来看雨', '张雨生', '3分50秒');
insert into MUSICS (music_no, music_name, music_singer, music_size)
values (3, '站在高岗上', '张惠妹', '4分00秒');
insert into MUSICS (music_no, music_name, music_singer, music_size)
values (4, '三万英尺', '迪克牛仔', '4分30秒');
insert into MUSICS (music_no, music_name, music_singer, music_size)
values (5, '如果你是我的传说', '刘德华', '3分50秒');
insert into MUSICS (music_no, music_name, music_singer, music_size)
values (6, '白月光', '张信哲', '4分30秒');
commit;