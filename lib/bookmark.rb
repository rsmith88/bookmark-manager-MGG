require 'pg'

class Bookmark

  def initialize
    @bookmarks = { 'bookmark' =>'www.bookmark.com', 'google' => 'www.google.com'}
  end

  def view
      con = PG.connect :dbname => "bookmark", :user => "mariusgg"
      rs = con.exec 'SELECT url FROM bookmarks'
      rs.map { |e| e["url"] }.join(' ')
  end

  def self.create
    @bookmark || Bookmark.new
  end

end
