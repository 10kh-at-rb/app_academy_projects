class QuestionLike

  def self.all
    results = QuestionDatabase.instance.execute('SELECT * FROM question_likes')
    results.map { |result| QuestionLike.new(result) }
  end

  def self.find_by_id(id)
    results = QuestionDatabase.instance.execute(<<-SQL, id)

    SELECT
      *
    FROM
      question_likes
    WHERE
      id = ?
    SQL

    QuestionLike.new(results.first)
  end

  def self.num_likes_for_question_id(question_id)
    result = QuestionDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      COUNT(*) count
    FROM
      question_likes
    WHERE
      question_id = ?

    SQL
    result[0]['count']
  end

  def self.likers_for_question_id(question_id)
    results = QuestionDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      users.*
    FROM
      question_likes
    JOIN
      users on users.id = question_likes.user_id
    WHERE
      question_id = ?

    SQL
    results.map { |result| User.new(result) }
  end

  attr_reader :id, :question_id, :user_id

  def initialize(options = {})
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

end
