require 'pg'

class Bookmark

  def initialize(title:, url:)
    @url = url
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connected = PG.connect(dbname: 'bookmark_manager_test')
    else
      connected = PG.connect(dbname: 'bookmark_manager')
    end
    list_results = connected.exec('SELECT * FROM bookmarks')
    list_results.map { |bookmark| bookmark['url'] }
  end

  def self.create(title:, url:)
    if ENV['ENVIRONMENT'] == 'test'
      connected = PG.connect(dbname: 'bookmark_manager_test')
    else
      connected = PG.connect(dbname: 'bookmark_manager')
    end
    connected.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}');")
  end

end
