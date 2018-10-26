require './lib/database_connection'
#  def self.setup_connection
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('bookmark_manager_test')
    else
      DatabaseConnection.setup('bookmark_manager')
    end
#  end
