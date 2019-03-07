require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil #removes extrenuous return values when running program.

require_all 'app'
require_all 'lib'
