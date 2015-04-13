class CommentsController < ApplicationController

  def index
    id = params[:commentable_id]
    if params[:commentable_type] == 'contact'
      comment = Contact.find(id).comments
    else
      comment = User.find(id).comments
    end
    render json: comments
  end

end
