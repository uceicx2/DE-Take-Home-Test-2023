drop table if exists product;
drop table if exists product;
drop table if exists product_proprietary;
drop table if exists product_info;
drop table if exists product_substance;
drop table if exists order_product;
drop table if exists "order";
drop table if exists location;



create table product (
    product_id         integer primary key,
    product_type_name  varchar,
    proprietary_id     integer,
    FOREIGN KEY (proprietary_id) REFERENCES product (proprietary_id)
);

create table product_proprietary (
    product_id         integer primary key,
    proprietary_name    varchar,
    propreitary_name_suffix varchar,
    non_proprietary_name   varchar,
);

create table product_info (
    product_id         integer primary key,
    product_ndc    varchar,
    start_marketing_date timestamp without time zone,
    end_marketing_time timestamp without time zone,
    marketing_category_name varchar,
    applicationnumber varchar(9),
    labler_name varchar,
    FOREIGN KEY (product_id) REFERENCES product (product_id)
);

create table product_substance (
    product_id         integer primary key,
    dosage_form_name    varchar,
    routename          varchar,
    substancename        varchar,
    activenumeratorstrength varchar,
    activeingredunit     varchar,
    pharmclasses        varchar,
    deaschedule        varchar,
    FOREIGN KEY (product_id) REFERENCES product (product_id)
);

create table order_product (
    order_id           integer primary key,
    product_id         integer,
    quantity           integer,
    FOREIGN KEY (product_id) REFERENCES product (product_id),
    FOREIGN KEY (order_id) REFERENCES "order" (order_id)
);


create table "order" (
    order_id           integer primary key,
    product_cost       numeric
    product_price      numeric
    order_status       varchar(50) NOT NULL,
    order_date         timestamp without time zone,
    location_id        integer
    FOREIGN KEY (location_id) REFERENCES location (location_id),
);


create table location (
    location_id        integer primary key,
    city               varchar(100),
    country            varchar(100)
);
