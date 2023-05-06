insert into enjoytrip.sido(sido_code, sido_name) select sido_code, sido_name from enjoytrips.sido;
insert into enjoytrip.gugun(gugun_code, gugun_name, sido_code) select gugun_code, gugun_name, sido_code from enjoytrips.gugun;
insert into enjoytrip.category(cat_id, cat_name) values('A01', '여행코스');
insert into enjoytrip.category(cat_id, cat_name) values('A02', '관광지');
insert into enjoytrip.category(cat_id, cat_name) values('B02', '숙박');
insert into enjoytrip.category(cat_id, cat_name) values('A04', '쇼핑');
insert into enjoytrip.category(cat_id, cat_name) values('B01', '문화시설');
insert into enjoytrip.category(cat_id, cat_name) values('A03', '레포츠');
insert into enjoytrip.category(cat_id, cat_name) values('A05', '음식점');
insert into enjoytrip.category(cat_id, cat_name) values('C01', '축제공연행사');
insert into enjoytrip.category(cat_id, cat_name) values('', 'Unknown');
insert into enjoytrip.attraction_info select content_id, content_type_id, title, addr1, addr2, zipcode, tel, first_image, first_image2, readcount, sido_code, gugun_code, latitude, longitude, cat1, created_time, modified_time, booktour, overview from enjoytrips.attraction_description natural join enjoytrips.attraction_detail natural join enjoytrips.attraction_info;

select * from enjoytrip.attraction_info;