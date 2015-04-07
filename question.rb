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

  attr_reader :id, :title, :body, :user_id

  def initialize(options = {})
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

end
