-- DROP USER METROTICKET CASCADE;

CREATE USER METROTICKET IDENTIFIED BY "123";

GRANT CREATE VIEW, CONNECT, RESOURCE, UNLIMITED TABLESPACE TO METROTICKET;

-- manager table
CREATE TABLE manager
(
    mgr_id    number(10) PRIMARY KEY,
    mgr_name  varchar2(20),
    mgr_pass  varchar2(20),
    mgr_email varchar2(50),
    mgr_phone varchar2(20)
);

CREATE SEQUENCE mgr_seq START WITH 1;

INSERT INTO manager VALUES (mgr_seq.nextval, 'Zaid', 'zaid1986', 'zaid@email.com', '0123649849810');
INSERT INTO manager VALUES (mgr_seq.nextval, 'Mgr2', 'mgr2123', 'mgr2@email.com', '0123649849810');
INSERT INTO manager VALUES (mgr_seq.nextval, 'Mgr3', 'mgr3123', 'mgr3@email.com', '0123649849810');
INSERT INTO manager VALUES (mgr_seq.nextval, 'Mgr4', 'mgr4123', 'mgr4@email.com', '0123649849810');
INSERT INTO manager VALUES (mgr_seq.nextval, 'Mgr5', 'mgr5123', 'mgr5@email.com', '0123649849810');


-- passenger table
CREATE TABLE passenger
(
    pass_id       number(10) PRIMARY KEY,
    pass_name     varchar2(20),
    pass_password varchar2(20),
    pass_email    varchar2(50),
    pass_phone    varchar2(20),
    mgr_id        number(10),
    FOREIGN KEY (mgr_id) REFERENCES manager (mgr_id)
);

CREATE SEQUENCE pass_seq START WITH 1;

INSERT INTO passenger VALUES (pass_seq.nextval, 'Raofin', 'raofin123', 'raofin@hotmail.com', '01234567890', 1);
INSERT INTO passenger VALUES (pass_seq.nextval, 'Passenger2', 'passenger2986', 'passenger2@email.com', '01541236140', 3);
INSERT INTO passenger VALUES (pass_seq.nextval, 'Passenger3', 'passenger3986', 'passenger3@email.com', '01234162530', 2);
INSERT INTO passenger VALUES (pass_seq.nextval, 'Passenger4', 'passenger4986', 'passenger4@email.com', '01653416230', 1);
INSERT INTO passenger VALUES (pass_seq.nextval, 'Passenger5', 'passenger5986', 'passenger5@email.com', '01673516360', 3);

-- ticket table
CREATE TABLE ticket
(
    ticket_id     number(10) PRIMARY KEY,
    total_ticket  number(1),
    ticket_status varchar2(10),
    pass_id       number(10),
    FOREIGN KEY (pass_id) REFERENCES passenger (pass_id)
);

CREATE SEQUENCE ticket_seq START WITH 1;

INSERT INTO ticket VALUES (ticket_seq.nextval, 2, 'Booked', 1);
INSERT INTO ticket VALUES (ticket_seq.nextval, 6, 'Available', 3);
INSERT INTO ticket VALUES (ticket_seq.nextval, 5, 'Booked', 2);
INSERT INTO ticket VALUES (ticket_seq.nextval, 2, 'Available', 2);
INSERT INTO ticket VALUES (ticket_seq.nextval, 3, 'Available', 5);


-- schedule table
CREATE TABLE schedule
(
    sch_id         number(10) PRIMARY KEY,
    departure      varchar2(20),
    destination    varchar2(20),
    departure_time date,
    arrival_time   date,
    cost      number(10, 2),
    mgr_id         number(10),
    FOREIGN KEY (mgr_id) REFERENCES manager (mgr_id)
);

CREATE SEQUENCE sche_seq START WITH 1;

INSERT INTO schedule VALUES (sche_seq.nextval, 'Dhaka', 'Noakhali', TO_DATE('07-11-22 11:59 a.m.','dd-mm-yy hh:mi a.m.'), TO_DATE('07-11-22 11:30 a.m.','dd-mm-yy hh:mi a.m.'), 9600, 2);
INSERT INTO schedule VALUES (sche_seq.nextval, 'Rajshahi', 'Dhaka', TO_DATE('08-11-22 10:59 a.m.','dd-mm-yy hh:mi a.m.'), TO_DATE('08-11-22 10:30 a.m.','dd-mm-yy hh:mi a.m.'), 6050, 3);
INSERT INTO schedule VALUES (sche_seq.nextval, 'Chittagong', 'Dhaka', TO_DATE('10-11-22 9:59 a.m.','dd-mm-yy hh:mi a.m.'), TO_DATE('10-11-22 9:30 a.m.','dd-mm-yy hh:mi a.m.'), 4538, 3);
INSERT INTO schedule VALUES (sche_seq.nextval, 'Khulna', 'Pabna', TO_DATE('15-11-22 8:59 a.m.','dd-mm-yy hh:mi a.m.'), TO_DATE('15-11-22 8:30 a.m.','dd-mm-yy hh:mi a.m.'), 1500, 2);
INSERT INTO schedule VALUES (sche_seq.nextval, 'Noakhali', 'Chittagong', TO_DATE('19-11-22 7:59 a.m.','dd-mm-yy hh:mi a.m.'), TO_DATE('09-11-22 7:59 a.m.','dd-mm-yy hh:mi a.m.'), 8601, 5);


-- booking table
CREATE TABLE book
(
    book_id number(10) PRIMARY KEY,
    pass_id number(10),
    sch_id  number(10),
    FOREIGN KEY (pass_id) REFERENCES passenger (pass_id),
    FOREIGN KEY (sch_id) REFERENCES schedule (sch_id)
);

CREATE SEQUENCE book_seq START WITH 1;

INSERT INTO book VALUES (book_seq.nextval, 1, 1);
INSERT INTO book VALUES (book_seq.nextval, 2, 1);
INSERT INTO book VALUES (book_seq.nextval, 3, 3);
INSERT INTO book VALUES (book_seq.nextval, 4, 3);
INSERT INTO book VALUES (book_seq.nextval, 5, 2);

-- order table
CREATE TABLE orders
(
    order_id    number(10) PRIMARY KEY,
    ticket_id   number(10),
    sche_id number(10),
    FOREIGN KEY (ticket_id) REFERENCES ticket (ticket_id),
    FOREIGN KEY (sche_id) REFERENCES schedule (sch_id)
);

CREATE SEQUENCE order_seq START WITH 1;

INSERT INTO orders VALUES (order_seq.nextval, 2, 1);
INSERT INTO orders VALUES (order_seq.nextval, 5, 3);
INSERT INTO orders VALUES (order_seq.nextval, 3, 5);
INSERT INTO orders VALUES (order_seq.nextval, 4, 4);
INSERT INTO orders VALUES (order_seq.nextval, 1, 1);

-- train_class table
CREATE TABLE train_class
(
    class_id number(10) PRIMARY KEY,
    class    varchar2(20),
    min_cost number(10),
    max_cost number(10)
);

CREATE SEQUENCE train_class_seq START WITH 1;

INSERT INTO train_class VALUES (train_class_seq.nextval, 'First Class', 6001, 9999);
INSERT INTO train_class VALUES (train_class_seq.nextval, 'Second Class', 3001, 6000);
INSERT INTO train_class VALUES (train_class_seq.nextval, 'Third Class', 0, 3000);

-- #Procedures

-- 1. A user registration package that includes a procedure, function, and proper exception handling.
CREATE OR REPLACE PACKAGE pkg_user_registration
IS
    PROCEDURE register(
        		p_name IN passenger.pass_name%TYPE,
        		p_password IN passenger.pass_password%TYPE,
        		p_email IN passenger.pass_email%TYPE,
		p_phone IN passenger.pass_phone%TYPE,
        		p_mgr_id IN passenger.mgr_id%TYPE);
END pkg_user_registration;

CREATE OR REPLACE PACKAGE BODY pkg_user_registration
IS
    FUNCTION is_passenger_unique(
        	      p_name passenger.pass_name%TYPE, p_email passenger.pass_email%TYPE)
	RETURN BOOLEAN IS
	v_count NUMBER := 0;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM passenger
        WHERE pass_name = p_name OR pass_email = p_email;

        IF v_count = 0 THEN RETURN TRUE;
        ELSE RETURN FALSE;
        END IF;
    END;

    PROCEDURE register(
	        	p_name IN passenger.pass_name%TYPE,
		p_password IN passenger.pass_password%TYPE,
	        	p_email IN passenger.pass_email%TYPE,
		p_phone IN passenger.pass_phone%TYPE,
	        	p_mgr_id IN passenger.mgr_id%TYPE)
        IS
        is_pass_unique BOOLEAN;
        exc_duplicate_user EXCEPTION;
    BEGIN
        is_pass_unique := is_passenger_unique(p_name, p_email);

        IF is_pass_unique = FALSE THEN
            RAISE exc_duplicate_user;
        END IF;

        INSERT INTO passenger
        VALUES (pass_seq.NEXTVAL, p_name, p_password, p_email, p_phone, p_mgr_id);
        DBMS_OUTPUT.PUT_LINE('The user has been registered successfully.');

        EXCEPTION WHEN exc_duplicate_user THEN
            DBMS_OUTPUT.PUT_LINE('The username or email address is not unique. Please try it once again.');
    END;
END pkg_user_registration;

BEGIN
    pkg_user_registration.register('Rawfin', '#wf$', 'fin@email.com', '01234', 1);
END;


-- 2. A package including procedure, function, and proper exception handling to remove a user based on his email address.
CREATE OR REPLACE PACKAGE pkg_remove_user
IS
    PROCEDURE remove(p_email IN passenger.pass_email%TYPE);
END pkg_remove_user;


CREATE OR REPLACE PACKAGE BODY pkg_remove_user
IS
    FUNCTION is_passenger_exist(p_email passenger.pass_email%TYPE)
    RETURN BOOLEAN IS
        v_count NUMBER := 0;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM passenger
        WHERE pass_email = p_email;

        IF v_count = 0 THEN RETURN FALSE;
        ELSE RETURN TRUE;
        END IF;
    END;

    PROCEDURE remove(p_email IN passenger.pass_email%TYPE)
    IS
        is_user_exist BOOLEAN;
        exc_user_not_exist EXCEPTION;
    BEGIN
        is_user_exist := is_passenger_exist(p_email);

        IF is_user_exist = FALSE THEN
            RAISE exc_user_not_exist;
        END IF;

        DELETE FROM passenger WHERE pass_email = p_email;

        DBMS_OUTPUT.PUT_LINE('The user has been deleted successfully');

        EXCEPTION WHEN exc_user_not_exist THEN
            DBMS_OUTPUT.PUT_LINE('The email address is not exist. Please try it once again.');
    END;
END pkg_remove_user;


BEGIN
    pkg_remove_user.remove('rawfin@email.com');
END;