module App
  class CommentsController < AppController
    before_action :fetch_comment, only: [:show, :like]

    # POST /comments/new
    def create
      @comment = current_user.comments.build
      @comment.assign_attributes(comment_params)

      if @comment.save
        url = :back
        url = app_post_path(@comment.commentable) if @comment.commentable.is_a?(Post)

        redirect_to url, notice: t('.notice')
      else
        render :new
      end
    end

    # GET /comments/:id
    def show
    end

    # POST /comments/:id/like
    def like
      if current_user.express!(:like, @comment).newly_expressed?
        @comment.commenter.increment!(:karma)
      end

      redirect_to :back
    end

  private

    def fetch_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      permitted_parameters = [:comment, :commentable_id, :commentable_type]
      params.require(:comment).permit(*permitted_parameters)
    end
  end
end
