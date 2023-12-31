class CommentsController < ApplicationController
    before_action :set_comment, only: %i[ show edit update destroy ]
    before_action :authenticate_user!, except: %i[ show ] 
    
    # GET /comments/1/edit
    def edit
    end
  
    # POST /comments or /comments.json
    def create
        @post = Post.find(params[:comment][:post_id])
        @comment = Comment.new(comment_params)
        @comment.user = current_user

      respond_to do |format|
        if @comment.save
          format.html { redirect_to post_path(@post.id), notice: "Comment was successfully created." }
          format.json { render :show, status: :created, location: @comment }
        else
          Rails.logger.debug "Comment errors: #{@comment.errors.full_messages}"
          format.html { redirect_to post_path(@post.id), notice: "Comment wasn't created." }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end
  

  

  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        @comment = Comment.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
    def comment_params
        params.require(:comment).permit(:content, :post_id, :user_id)
    end
  
end
