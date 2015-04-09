class AnswerChoice < ActiveRecord::Base
  validates :question_id, :text, presence: true

  belongs_to :question,
    class_name: "Question",
    foreign_key: :question_id,
    primary_key: :id

end
