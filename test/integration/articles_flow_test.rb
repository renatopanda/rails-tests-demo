require 'test_helper'

class ArticlesFlowTest < ActionDispatch::IntegrationTest
  
  test "check if homepage loads correctly" do
  	get '/'
  	assert_select "h1", "Articles"
  end

  test "create a new article" do
  	get '/articles/new'
  	assert_response :success

  	post "/articles", params: {article: { title: "tatulo", body: "corpo do artigo", author_id: authors(:panda).id } }
  	assert_response :redirect
  	follow_redirect!
  	assert_response :success
  	assert_select "p", {:count=>1, :text=>/.*Title:.*tatulo.*/m}
  end


end
