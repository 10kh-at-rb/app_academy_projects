module Saveable

  def instance_variable_symbols
    iv = self.instance_variables
    iv.delete(:@id)
    iv << :@id
  end

  def make_question_marks(n)
    [].tap do |qs|
      n.times {qs << '?'}
    end.join(', ')
  end

  def make_insert_str(arr)
    arr.map do |var|
      var.to_s[1..-1]
    end.join(', ')
  end

  def make_update_str(arr)
    arr.map do |var|
      var.to_s[1..-1] + ' = ?'
    end.join(', ')
  end

  def instance_variable_values
    instance_variable_symbols.map do |var|
      self.instance_variable_get(var)
    end
  end

  def save
    iv_insert_values = instance_variable_values[0...-1]
    iv_insert_symbols = instance_variable_symbols[0...-1]
    insert_str = make_insert_str(iv_insert_symbols)
    insert_q_marks = make_question_marks(iv_insert_values.count)
    iv_update_values = instance_variable_values
    update_str = make_update_str(iv_insert_symbols)

    if id.nil?
      QuestionDatabase.instance.execute(<<-SQL, insert_str, insert_q_marks, *iv_insert_values)
      INSERT INTO
        users(?)
      VALUES
        (?)

      SQL

      @id = QuestionDatabase.instance.last_insert_row_id
    else
      QuestionDatabase.instance.execute(<<-SQL, update_str, *iv_update_values)
      UPDATE
        users
      SET
        ?
      WHERE
        id = ?
      SQL

    end

    nil
  end
end
