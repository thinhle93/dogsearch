class PostsController < ApplicationController
    
    def allposts
        @posts = Post.all
    end

    def newpost
    end

    def create
        
        newpost = params[:post_title]
        post = Post.create(title: newpost, user_id: session[:userid])
        if !post.valid?
            flash[:errors] = post.errors.full_messages
            redirect_to '/post/new'
        else
            redirect_to '/post/all'
        end
        
        
    end

    def findpost
        @post = Post.find(params[:postid])
        @post_comments = @post.comments
    end

    def createcomment   
        postid = params[:postid]
        
        form_content = params[:comment_content]
        
        comment = Comment.create(content: form_content, user_id: session[:userid], post_id: postid)
        if !comment.valid? 
            flash[:errors] = comment.errors.full_messages
        end
        redirect_to "/post/find/#{postid}"
    end

    def dltmsg
        comment = Comment.find(params[:cmtid])
        comment.destroy
        redirect_to "/post/find/#{params[:postid]}"
    end

    def myposts
        @myposts = Post.where("user_id = #{session[:userid]}")
    end
end
