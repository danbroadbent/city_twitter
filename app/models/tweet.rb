class Tweet
  def self.find_by_city(query)
    TwitterService.tweet_search(query)
  end
end
