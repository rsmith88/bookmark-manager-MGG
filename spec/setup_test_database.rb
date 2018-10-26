require 'pg'

def setup_test_database
  "Setting up test database..."
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE comments, bookmarks;")
end
