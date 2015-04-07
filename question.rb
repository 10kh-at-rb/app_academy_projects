
class Question

  def self.all
    results = QuestionDatabase.instance.execute('SELECT * FROM questions')
    results.map { |result| Question.new(result) }
  end

  def self.find_by_id(id)
    results = QuestionDatabase.instance.execute(<<-SQL, id)

    SELECT
      *
    FROM
      questions
    WHERE
      id = ?
    SQL

    Question.new(results.first)
  end

  def self.find_by_author_id(author_id)
    results = QuestionDatabase.instance.execute(<<-SQL, author_id)

    SELECT
      *
    FROM
      questions
    WHERE
      user_id = ?

    SQL

    results.map {|result| Question.new(result)}

  end

  attr_reader :id, :title, :body, :user_id

  def initialize(options = {})
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def author
    User::find_by_id(self.user_id)
  end

  def replies
    Reply::find_by_question_id(self.id)
  end


end
