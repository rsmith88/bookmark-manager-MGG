require 'pg'
require 'database_connection'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url

  end

  def self.all
    #setup_connection
    results = DatabaseConnection.query('SELECT * FROM bookmarks')
    results.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(title:, url:)
    #return false unless is_url?(url)
    #setup_connection
    result = DatabaseConnection.query("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0][url])
  end

  def self.delete(id:)
    #setup_connection
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, url:, title:)
    result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id};")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  # def self.setup_connection
  #   if ENV['ENVIRONMENT'] == 'test'
  #     @@connection = PG.connect(dbname: 'bookmark_manager_test')
  #   else
  #     @@connection = PG.connect(dbname: 'bookmark_manager')
  #   end
  # end

end
