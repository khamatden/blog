class BlogController < ApplicationController


   def edit
#if params[:author] != nil && params[:postbody] != nil && params[:title] != nil
 @poss = Post.find(params[:postid])
 @poss.postbody = params[:postbody]
 @poss.title = params[:title]
 @poss.save
 redirect_to :controller => 'blog', :action => 'index' #, :id => params[:id]
#end
  end


def delete
  Post.find(params[:postid]).destroy
  flash[:success] = "Post destroyed."
  #@p = (params[:id])
  #Post.delete(@p)
  #Post.where('id = ?', params[:id])
  #@p.author = params[:author]
  #@p.postbody = params[:postbody]
  #@p.title = params[:title] *

  redirect_to :controller => 'blog', :action => 'index'
end


 def create
 if params[:author] != nil && params[:postbody] != nil && params[:title] != nil
 @po = Post.new
 @po.author = params[:author]
 @po.postbody = params[:postbody]
 @po.title = params[:title]
 @po.save
 redirect_to :controller => 'blog', :action => 'index'
 end
  end


  def comment
 if params[:postid]!= nil && params[:name]!= nil && params[:bodycomment]!= nil
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
