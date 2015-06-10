class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :authored_polls,
    class_name: "Poll",
    foreign_key: :author_id,
    primary_key: :id

  has_many :responses,
    class_name: "Response",
    foreign_key: :respondent_id,
    primary_key: :id

  def completed_polls
    Poll
      .select("polls.*")
      .joins("JOIN questions ON questions.poll_id = polls.id")
      .joins("JOIN answer_choices ON answer_choices.question_id = questions.id")
      .joins("JOIN responses ON responses.answer_choice_id = answer_choices.id")
      .where("responses.respondent_id = ?", self.id)
      .group("polls.id")
      .having("COUNT(responses.*) = COUNT(questions.*)")
  end


  def incomplete_polls
    Poll.all - completed_polls
  end

end
