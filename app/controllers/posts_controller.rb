class PostsController < ApplicationController
	skip_before_action :verify_authenticity_token
	wrap_parameters format: [:json, :xml, :url_encoded_form, :multipart_form]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
	  @posts = Post.all
	end

	def show
	  @posts = Post.all
	end

	def new
	    @post = Post.new
	end

	def edit
	    @post = Post.find(params[:id])
	end

	def create
	   @posts = Post.all
	   @post = Post.create(post_params)
	end

	def update
	    @posts = Post.all
	    @post = Post.find(params[:id])    
	    @post.update_attributes(post_params)
	end

	def delete
	    @post = Post.find(params[:id])
	end

	def destroy
	   @posts = Post.all
	   @post = Post.find(params[:id])
	   @post.destroy
	end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:subject, :content)
    end
end	