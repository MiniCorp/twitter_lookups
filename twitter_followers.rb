# Requires version 5 or above of the twitter gem
require 'twitter'

def twitter_client
  @twitter_client ||= Twitter::REST::Client.new do |config|
    config.consumer_key = 'TWITTER_APP_CONSUMER_KEY'
    config.consumer_secret = 'TWITTER_APP_CONSUMER_SECRET'
    config.access_token = 'TWITTER_USER_TOKEN'
    config.access_token_secret = 'TWITTER_USER_TOKEN_SECRET'
  end
end

def grab_followers(twitter_username)
	twitter_friends = Array.new
  twitter_client.friend_ids(twitter_username).each_slice(100).with_index do |slice, i|
    twitter_client.users(slice).each_with_index do |f, j|
      twitter_friends << f
    end
  end
  twitter_friends
end

followers_array = grab_followers('bkenny')