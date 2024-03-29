ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
 
 CREATE USER TEST IDENTIFIED BY "dbhunter"
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  GRANT DBA TO TEST;
  ALTER USER TEST DEFAULT ROLE ALL;
  ALTER USER TEST QUOTA UNLIMITED ON USERS;
  GRANT CREATE ROLE TO TEST;
  GRANT CREATE USER TO TEST;
  GRANT CREATE SESSION TO TEST;
