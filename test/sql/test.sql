\pset null _null_

CREATE TABLE test (a serial, b uri);

INSERT INTO test (b)
VALUES ('http://www.postgresql.org/'),
       ('http://www.postgresql.org/docs/devel/static/xfunc-sql.html#XFUNC-SQL-FUNCTION-ARGUMENTS'),
       ('https://duckduckgo.com/?q=postgresql&ia=about'),
       ('ftp://ftp.gnu.org/gnu/bison'),
       ('mailto:foo@example.com'),
       ('ssh://username@review.openstack.org:29418/openstack/nova.git'),
       ('http://admin:password@192.168.0.1'),
       ('http://[FEDC:BA98:7654:3210:FEDC:BA98:7654:3210]:80/index.html'),
       ('http://[1080::8:800:200C:417A]/foo'),
       (''),
       ('foobar');

SELECT * FROM test;

-- error cases
SELECT uri ':';
SELECT uri 'foo bar';


\x on
SELECT b AS uri,
       uri_scheme(b),
       uri_userinfo(b),
       uri_host(b),
       uri_host_inet(b),
       uri_port(b),
       uri_path(b),
       uri_query(b),
       uri_fragment(b)
  FROM test;
\x off

SELECT DISTINCT b FROM test ORDER BY b;
