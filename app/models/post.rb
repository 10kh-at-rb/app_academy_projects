class Post < ActiveRecord::Base
  belongs_to :sub
  belongs_to :author, class_name: "User"
  validates :title, :sub_id, :author_id, presence: true
  validate :url_or_content


  private

  def url_or_content
    if url.nil? && content.nil?
      flash[:errors] = ["Please provide a URL or Content"]
    elsif !url.nil? && !content.nil?
      flash[:errors] = ["Please provide either a URL or Content, not both"]
    end
  end 



end
