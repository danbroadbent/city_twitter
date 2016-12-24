class TweetsController < ApplicationController
  def index
    @tweets = Tweet.find_by_city(params['query'])
    byebug
    render json: @tweets
  end
end
