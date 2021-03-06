set hive.explain.user=false;
CREATE TABLE dest1_n120(key INT, ten INT, one INT, value STRING) STORED AS TEXTFILE;

EXPLAIN
FROM src
INSERT OVERWRITE TABLE dest1_n120
MAP src.key, CAST(src.key / 10 AS INT), CAST(src.key % 10 AS INT), src.value
USING 'cat' AS (tkey, ten, one, tvalue)
DISTRIBUTE BY tvalue, tkey
SORT BY ten, one;


FROM src
INSERT OVERWRITE TABLE dest1_n120
MAP src.key, CAST(src.key / 10 AS INT), CAST(src.key % 10 AS INT), src.value
USING 'cat' AS (tkey, ten, one, tvalue)
DISTRIBUTE BY tvalue, tkey
SORT BY ten, one;


SELECT dest1_n120.* FROM dest1_n120;
