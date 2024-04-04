require "sqlite3"

conn = SQLite3::Database.new "test.db"
conn.execute <<SQL

create table quotes (
  id INTEGER PRIMARY KEY,
  text TEXT,
  attribution VARCHAR(200),
  submitter VARCHAR(200)
);

SQL