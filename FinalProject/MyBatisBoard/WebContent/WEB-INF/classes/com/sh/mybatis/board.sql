CREATE TABLE tblBoard(
    b_num NUMBER PRIMARY KEY NOT NULL,
    b_subject VARCHAR2(50),
    b_pwd VARCHAR2(20),
    b_content VARCHAR2(2000),
    b_writer VARCHAR2(20),
    b_date VARCHAR2(20),
    b_readcount NUMBER
);

