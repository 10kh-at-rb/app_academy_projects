class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :polls
    class_name: "Poll",
    foreign_key: :author_id,
    primary_key: :id


end
