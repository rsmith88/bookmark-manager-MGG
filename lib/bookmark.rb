require 'pg'

class Bookmark
  attr_reader :id, :title, :url
  def initialize(id, title, url)
    @id  = id
    @title = title
    @url = url
  end
  if ENV['ENVIRONMENT'] == 'test'
     connection = PG.connect(dbname: 'bookmark_manager_test')
   else
     connection = PG.connect(dbname: 'bookmark_manager')
   end


  def self.all
     if ENV['ENVIRONMENT'] == "test"
       database = PG.connect(dbname: 'bookmark_manager_test')
     else
       connection = PG.connect(dbname: "book_manager", :user => "mariusgg")
    end

    result = connection.exec("SELECT * FROM bookmarks")
        result.map { |bookmark| bookmark['url'] }
      end

      rs = con.exec 'SELECT url FROM bookmark_manager'
      rs.map { |e| e["url"] }.join(' ')
  end

  def self.create
    @bookmark || Bookmark.new
  end

end
