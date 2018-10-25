require 'pg'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    setup_connection
    list_results = @@connected.exec('SELECT * FROM bookmarks')
    list_results.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(title:, url:)
    #return false unless is_url?(url)
    setup_connection
    result = @@connected.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0][url])
  end

  def self.delete(id:)
    setup_connection
    @@connected.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.setup_connection
    if ENV['ENVIRONMENT'] == 'test'
      @@connected = PG.connect(dbname: 'bookmark_manager_test')
    else
      @@connected = PG.connect(dbname: 'bookmark_manager')
    end
  end

end
