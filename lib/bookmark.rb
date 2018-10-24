require 'pg'

class Bookmark

  # def initialize
  # end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connected = PG.connect(dbname: 'bookmark_manager_test')
    else
      connected = PG.connect(dbname: 'bookmark_manager')
    end
    list_results = connected.exec('SELECT * FROM bookmarks')
    list_results.map { |bookmark| bookmark['url'] }
  end

  def self.create
    @bookmark || Bookmark.new
  end

end
