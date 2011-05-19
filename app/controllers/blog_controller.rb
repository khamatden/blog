class BlogController < ApplicationController
  def comment
 if params[:postid] != nil && params[:name]!= nil && params[:bodycomment]!= nil
 @co = Comment.new
 @co.postid = params[:postid]
 @co.name = params[:name]
 @co.bodycomment = params[:bodycomment]
 @co.save
 redirect_to :controller => 'blog', :action => 'post', :id => params[:postid]
 else
 redirect_to :controller => 'blog', :action => 'post'
 end
 end
  def index
 @pos = Post.order('id').reverse
  end
  def post
 if params[:id]
 @post = Post.where('id = ?', params[:id])
   @comm = Comment.where('postid = ?', params[:id]).order('id').reverse
 end
end
 end
