require 'singleton'
require 'sqlite3'

class QuestionDatabase < SQLite3::Database
  # Ruby provides a `Singleton` module that will only let one
  # `SchoolDatabase` object get instantiated. This is useful, because
  # there should only be a single connection to the database; there
  # shouldn't be multiple simultaneous connections. A call to
  # `SchoolDatabase::new` will result in an error. To get access to the
  # *single* SchoolDatabase instance, we call `#instance`.
  #
  # Don't worry too much about `Singleton`; it has nothing
  # intrinsically to do with SQL.
  include Singleton

  def initialize
    # Tell the SQLite3::Database the db file to read/write.
    super('questions.db')

    # Typically each row is returned as an array of values; it's more
    # convenient for us if we receive hashes indexed by column name.
    self.results_as_hash = true

    # Typically all the data is returned as strings and not parsed
    # into the appropriate type.
    self.type_translation = true
  end
end

class User

  def self.all
    results = QuestionDatabase.instance.execute('SELECT * FROM users')
    results.map { |result| User.new(result) }
  end

  def self.find_by_id(id)
    results = QuestionDatabase.instance.execute(<<-SQL, id)
    
    SELECT
      *
    FROM
      users
    WHERE
      id = ?
    SQL

    User.new(results)
  end

  attr_reader :fname, :lname, :id

  def initialize(options = {})
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def name
    "#{fname} #{lname}"
  end



end
