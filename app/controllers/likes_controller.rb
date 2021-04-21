class LikesController < ApplicationController
  before_action :set_tweet

  def create
    count_after = @tweet.likes_count + 1
    @tweet.update(likes_count:count_after)
    redirect_to @tweet
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
