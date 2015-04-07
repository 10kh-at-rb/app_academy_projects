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

    User.new(results.first)
  end

  def self.find_by_name(fname, lname)
    results = QuestionDatabase.instance.execute(<<-SQL, fname, lname)

    SELECT
      *
    FROM
      users
    WHERE
      fname = ? AND
      lname = ?
    SQL

    User.new(results.first)
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

  def authored_questions
    Question::find_by_author_id(self.id)
  end

  def authored_replies
    Reply::find_by_user_id(self.id)
  end

end
