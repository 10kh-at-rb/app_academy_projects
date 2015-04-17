class Post < ActiveRecord::Base
  # belongs_to :sub
  belongs_to :author, class_name: "User"
  has_many :post_subs
  has_many :subs,
    through: :post_subs,
    source: :sub

  validates :title, :author_id, presence: true
  validate :url_or_content


  # private

  def url_or_content
    if url.blank? && content.blank?
      errors[:error] << "Please provide a URL or Content"
    elsif !url.blank? && !content.blank?
      errors[:error] << "Please provide either a URL or Content, not both"
    end
  end



end
