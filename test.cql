CREATE KEYSPACE IF NOT EXISTS test WITH replication = {
    'class': 'SimpleStrategy',
    'replication_factor': '1'
};
CREATE TYPE test.type_test (
    name TEXT,
    date TIMESTAMP,
);
CREATE TABLE test.table_test (
    test_id INT PRIMARY KEY,
    test_name FROZEN <type_test>
);
INSERT INTO test.table_test (
    test_id,
    test_name
) VALUES (
    1,
    {
        name: 'test1',
        date: dateof(now())
    }
);
ALTER TABLE test.table_test ADD test_list LIST<text>;
INSERT INTO test.table_test (
    test_id,
    test_list,
    test_name
) VALUES (
    1,
    ['test a', 'test b'],
    {
        name: 'test1',
        date: dateof(now())
    }
);
ALTER TABLE test.table_test ADD test_set SET<FROZEN<type_test>>;
INSERT INTO test.table_test (
    test_id,
    test_list,
    test_name,
    test_set
) VALUES (
    1,
    ['test a', 'test b'],
    {
        name: 'test1',
        date: dateof(now())
    },
    {
        {
            name: 'test2',
            date: dateof(now())
        },
        {
            name: 'test3',
            date: dateof(now())
        }
    }
);
ALTER TABLE test.table_test ADD test_map map<text, frozen <type_test>>;
UPDATE test.table_test
SET test_map = test_map + {
    name: 'test1',
    date: dateof(now())
}
WHERE test_id = 1;