class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @review = Review.find(params[:review_id])
    @comment = Comment.new
  end

  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to site_path(@review.site)
    else
      render "comments/new"
    end
  end

  def edit
    @review = Review.find(params[:review_id])
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @review = Review.find(params[:review_id])
    @comment = @review.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @site
    else
      render "comments/edit"
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to site_path(@site)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
