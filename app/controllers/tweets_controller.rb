class TweetsController < ApplicationController
  def index
    geocode = GoogleService.convert_to_coords(params['query'])
    @tweets = TwitterService.tweet_search(params['query'], geocode)
    render json: @tweets
  end
end
