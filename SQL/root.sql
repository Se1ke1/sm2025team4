-- 루트에서 아래 코드를 실행하여 testdb 만들 것
CREATE DATABASE testdb;
grant all on testdb.* to 'smuser'@'%';

--이후 testdb에서 tables.sql 및 insert_test.sql을 실행하여 테이블 구성까지 수행