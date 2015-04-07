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

  attr_reader :id, :question_id, :user_id, :body, :parent_id

  def initialize(options = {})
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @body = options['body']
    @parent_id = options['parent_id']
  end

end
