class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all.reverse
    end
    
    def new
        @post = current_user.posts.build
    end
    
    def show
    end
    
    def create  
        @post = current_user.posts.build(post_params)
        @post.save
        if @post.save
          flash[:success] = "기록되었습니다."
          redirect_to posts_path
        else
          flash.now[:alert] = "다시 시도해 보세요"
          render :new
        end  
    end  
    
    def edit  
    end  
    
    def update  
        if @post.update(post_params)
          flash[:success] = "기록이 수정되었습니다."
          redirect_to posts_path
        else
          flash.now[:alert] = "다시 시도해 보세요"
          render :edit
        end
    end  
    
    def destroy  
        @post.destroy
        redirect_to posts_path
    end     
    
    
    
private

    def find_post
      @post = Post.find(params[:id])
    end
    
    def post_params  
        params.require(:post).permit(:image, :content)
    end  
end
