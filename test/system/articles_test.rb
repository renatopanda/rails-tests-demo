#test/system/articles_test.rb
require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit articles_url
  	#take_screenshot
    assert_selector "h1", text: "Articles"
  end

  test "creating an article" do
    visit articles_path

    click_on "New Article"

    fill_in "Title", with: "Vão todos reprovar!"
    fill_in "Body", with: "Exemplo de teste de sistema automatizado"
    select authors(:panda).name, from: "article[author_id]" #devia dar com "Author"...
    #take_screenshot
    click_on "Create Article"
   
    assert_text "Article was successfully created."
    assert_text /Title:.*Vão todos reprovar!/m
  end

end
