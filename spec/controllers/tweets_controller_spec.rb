require 'rails_helper'

describe TweetsController, type: :controller do
# newアクション：newビューに遷移できるか
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
# editアクション：editビューに遷移できるか
  describe 'GET #edit' do
#      インスタンス変数の値を確かめる↓
    it "assigns the requested tweet to @tweet" do
      tweet = create(:tweet)
      get :edit, params: {id: tweet}
      expect(assigns(:tweet)).to eq tweet
      # …(:tweet)は、editアクション内で定義されてる「@tweet」
      #…「eq tweet」は、it do~end内で定義している「tweet」
    end
#      editアクションをリクエストした後、edit.html.erbに遷移するか
    it "renders the :edit template" do
      tweet = create(:tweet)
      get :edit, params: {id: tweet}
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do

    it "populates an array of tweets ordered by created_at DESC" do
      tweets = create_list(:tweet, 3)
      get :index
      expect(assigns(:tweets)).to match(tweets.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

end