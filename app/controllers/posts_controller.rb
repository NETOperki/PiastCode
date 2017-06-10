class PostsController < ApplicationController
  def create
    event = Event.find_by(id: params[:event_id])
    @post = event.posts.new posts_params
    @post.user = User.first
    @post.save

    redirect_to event
  end

  private
    def posts_params
      params.require(:post).permit(:content)
    end
end
