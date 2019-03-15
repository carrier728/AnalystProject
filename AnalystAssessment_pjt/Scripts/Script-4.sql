CREATE USER springuser
IDENTIFIED BY 0000
DEFAULT tablespace users
TEMPORARY TABLESPACE temp;
GRANT resource, CONNECT TO springuser;
