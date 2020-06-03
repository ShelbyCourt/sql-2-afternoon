-- Prob 1
select * from invoice_line
where unit_price > .99;
--111 rows returned;

select * from invoice i
join invoice_line il on il.invoice_id = i.invoice_id
where unit_price > .99;
-- 111 rows returns, all info from table 'invoice' listed

--2
        --first attempt w/names only
        select cu.first_name, cu.last_name from customer cu
        join invoice  on cu.customer_id = invoice.customer_id;
        --412 rows displayed

        select invoice.invoice_date, cu.first_name, cu.last_name from customer cu
        join invoice  on cu.customer_id = invoice.customer_id;
        --412 rows displayed w/invoice data

    --with total added
    select invoice.invoice_date, cu.first_name, cu.last_name, invoice.total from customer cu
    join invoice  on cu.customer_id = invoice.customer_id;

    -- actual solution; seems opposite mine, but seems to have yielded the same result

    SELECT i.invoice_date, c.first_name, c.last_name, i.total
    FROM invoice i
    JOIN customer c ON i.customer_id = c.customer_id;

--3
select c.first_name, c.last_name, e.first_name, e.last_name
from customer c
join employee e on c.support_rep_id = e.employee_id;

--4
--attempted code from mini, which seemed to ask for same thing, but it did not work.
select ar.name, al.title 
from album al
join artist ar on ar.artist_id = al.artist_id;

--5


select pt.track_id from playlist_track pt
join playlist p on p.playlist_id = pt.playlist_id
where p.name = 'Music';

--6
-- oops, this yields the playlist name
select p.name from playlist p
join playlist_track pt on p.playlist_id = pt.playlist_id
where pt.playlist_id = 5;

select t.name from track t
join playlist_track pt on p.track_id = t.track_id
where pt.playlist_id = 5;

--7
select t.name, p.name from track t
join playlist_track pt on t.track_id = pt.track_id
join playlist p on pt.playlist_id = p.playlist_id;
-- p.name = music? 

--8
-- 332 rows, returned, will check solution
select t.name, a.title 
from album a
join track t on t.album_id = a.album_id
join genre g on g.genre_id = t.genre_id
where g.name = 'Alternative & Punk';
-- woohoo

--NESTED QUERIES
--1

select * from invoice
where invoice_id in (select invoice_id 
                     from invoice_line 
                     where unit_price > .99);

--2
select * from playlist_track
where playlist_id in ( select playlist_id
                      from playlist
                      where name = 'Music');
--3
select * from track
where track_id in ( select track_id
                      from playlist_track
                      where playlist_id = 5);
--4
select * from track
where genre_id in ( select genre_id
                      from genre
                      where name = 'Comedy');
--5

select * from track
where album_id in ( select album_id
                      from album
                      where title = 'Fireball');                      
--6


select * from track
where album_id in ( select album_id
                      from album
                      where artist_id in (select artist_id
                                          from artist
                                          where name = 'Queen'));


-- Practice Updating ROWS

--1

--2

--3

--4

--5

--6





