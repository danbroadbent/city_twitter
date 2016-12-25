class TwitterService
  def self.tweet_search(query, geocode)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV["twitter_consumer_key"]
      config.consumer_secret = ENV["twitter_consumer_secret"]
    end
    client.search("#{query}", geocode: "#{geocode},50km").take(15)
  end
end
