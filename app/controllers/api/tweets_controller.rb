class Api::TweetsController < ApplicationController
  def index
    render json: TwitterClient.home_timeline
  end

  def search
    render json: TwitterClient.search(params[:term])
  end

  def tweet
    TwitterClient.tweet(params[:tweet])
  end
end

# WORKING WITH 3rd Party API:
# -  Don't commit credentials
#    - dot-env rails gem
#    - make .env.example
#    - .gitignore we add .env
# -  No credentials in JavaScript (client)
#    - if Api requires auth, all requests are routed through the server
# -  Most popular apis have Gems
#    - If not
#      - Use httparty
#      - build a wrapper for the API
# STEPS:
# 1.  Add dotenv rails gem
# 2.  Make .env.example
# 3.  Add .env to .gitignore
# 4.  Create app on service (twitter, fb, google, etc) 
# 5.  Add credentials to .env
# 6.  Set up rails endpoints
# 7.  Optional create a helper class for the client