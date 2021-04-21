class RetweetsController < ApplicationController
  before_action :set_tweet

  def create
    count_after = @tweet.retweets_count + 1
    @tweet.update(retweets_count:count_after)
    redirect_to @tweet
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
