class CommentsController < ApplicationController
  # http_basic_authentication_with name: "admin", password: "111Q"

  def create
    post = Post.find(params[:post_id])
    comment = ::Comments::CreateService.call(post, comment_params)
    if comment.persisted?
      redirect_to post_path(post)
    else
      flash[:error] = comment.errors.full_messages.to_sentence
      redirect_to post_path(post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
