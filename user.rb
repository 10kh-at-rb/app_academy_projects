require_relative 'saveable'
class User
  include Saveable

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

  attr_accessor :fname, :lname
  attr_reader :id

  def initialize(options = {})
    @id = options['id']
    @lname = options['lname']
    @fname = options['fname']
  end

  # def save
  #   if id.nil?
  #     QuestionDatabase.instance.execute(<<-SQL, fname, lname)
  #     INSERT INTO
  #       users(fname, lname)
  #     VALUES
  #       (?, ?)
  #     SQL
  #
  #     @id = QuestionDatabase.instance.last_insert_row_id
  #   else
  #     QuestionDatabase.instance.execute(<<-SQL, fname, lname, self.id)
  #     UPDATE
  #       users
  #     SET
  #       fname = ?, lname = ?
  #     WHERE
  #       id = ?
  #     SQL
  #
  #   end
  #
  #   nil
  # end

  def name
    "#{fname} #{lname}"
  end

  def authored_questions
    Question::find_by_author_id(self.id)
  end

  def authored_replies
    Reply::find_by_user_id(self.id)
  end

  def followed_questions
    QuestionFollow::followed_questions_for_user_id(self.id)
  end

  def liked_question
    QuestionLike::liked_questions_for_user_id(self.id)
  end

  def average_karma
    result = QuestionDatabase.instance.execute(<<-SQL, self.id)

    SELECT
      COUNT(question_likes.question_id) /
      CAST(COUNT(DISTINCT questions.id) AS FLOAT) AS karma
    FROM
      questions
    LEFT OUTER JOIN
      question_likes ON questions.id = question_likes.question_id
    WHERE
      questions.user_id = ?

    SQL

    result.first['karma']
  end

end
