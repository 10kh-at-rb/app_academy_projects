class Reply

  def self.all
    results = QuestionDatabase.instance.execute('SELECT * FROM replies')
    results.map { |result| Reply.new(result) }
  end

  def self.find_by_id(id)
    results = QuestionDatabase.instance.execute(<<-SQL, id)

    SELECT
      *
    FROM
      replies
    WHERE
      id = ?
    SQL

    Reply.new(results.first)
  end

  def self.find_by_user_id(user_id)
    results = QuestionDatabase.instance.execute(<<-SQL, user_id)

    SELECT
      *
    FROM
      replies
    WHERE
      user_id = ?
    SQL

    results.map {|result| Reply.new(result)}
  end

  def self.find_by_question_id(question_id)
    results = QuestionDatabase.instance.execute(<<-SQL, question_id)

    SELECT
      *
    FROM
      replies
    WHERE
      question_id = ?
    SQL

    results.map {|result| Reply.new(result)}
  end

  attr_reader :id, :question_id, :user_id, :body, :parent_id

  def initialize(options = {})
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @body = options['body']
    @parent_id = options['parent_id']
  end

  def author
    User::find_by_id(self.user_id)
  end

  def question
    Question::find_by_id(self.question_id)
  end

  def parent_reply
    return nil if self.parent_id.nil?
    Reply::find_by_id(self.parent_id)
  end

  def child_replies
    results = QuestionDatabase.instance.execute(<<-SQL, self.id)

    SELECT
      *
    FROM
      replies
    WHERE
      parent_id = ?
    SQL

    results.map {|result| Reply.new(result)}
  end

end
