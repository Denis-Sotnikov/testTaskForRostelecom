create table TSVETA(
id smallserial PRIMARY KEY not null,
color_number VARCHAR(2),
name VARCHAR(50)
);

DROP table TSVETA;

insert into TSVETA(color_number, name) values ('01', 'Red');
insert into TSVETA(color_number, name) values ('02', 'Orange');
insert into TSVETA(color_number, name) values ('03', 'Yellow');
insert into TSVETA(color_number, name) values ('04', 'Green');
insert into TSVETA(color_number, name) values ('05', 'Blue');
insert into TSVETA(color_number, name) values ('06', 'Dark blue');
insert into TSVETA(color_number, name) values ('07', 'Violet');

CREATE or replace PROCEDURE getInfo(IN Color varchar,INOUT EMP_FIRST VARCHAR)
LANGUAGE SQL
AS $$
select name from tsveta where color_number = Color;
$$;

DROP PROCEDURE getInfo(EMP_FIRST VARCHAR);

DO
$$
    DECLARE secuencial varchar;
        DECLARE number varchar = '07';
    BEGIN
        CALL getInfo(number,secuencial);
        RAISE NOTICE '%', secuencial;
    END
$$;