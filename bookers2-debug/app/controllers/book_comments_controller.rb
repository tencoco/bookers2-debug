class BookCommentsController < ApplicationController
  before_action :is_matching_login_user, only: [:destroy]
  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    BookComment.find(params[:id]).destroy
    @book = Book.find(params[:book_id])
    #redirect_to request.referer
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  def is_matching_login_user
    book_comment = BookComment.find(params[:id])
    user = book_comment.user_id
    unless user == current_user.id
      redirect_to books_path
    end
  end

end
