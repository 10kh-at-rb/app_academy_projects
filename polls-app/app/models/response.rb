class Response < ActiveRecord::Base
  validates :respondent_id, :answer_choice_id, presence: true
  validate :respondent_has_not_already_answered_question,
    :author_cannot_respond_to_own_poll

  belongs_to :respondent,
    class_name: "User",
    foreign_key: :respondent_id,
    primary_key: :id

  belongs_to :answer_choice,
    class_name: "AnswerChoice",
    foreign_key: :answer_choice_id,
    primary_key: :id

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses.where.not(id: id)
  end

  private
    def respondent_has_not_already_answered_question
      if sibling_responses.exists?(respondent_id: respondent_id)
        errors[:respondent_id] << "has already answered question."
      end
    end

    def author_cannot_respond_to_own_poll
      if respondent_id == self.question.poll.author_id
        errors[:respondent_id] << "can't answer their own poll."
      end
    end


end
