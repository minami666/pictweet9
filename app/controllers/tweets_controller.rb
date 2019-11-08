class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show

  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
  end

  def edit

  end

  def update

  end

  def detroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  private
    def tweet_params
      params.require(:tweet).permit(:name,:image,:text)
    end

end
