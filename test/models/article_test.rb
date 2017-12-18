require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  test "should not save article without a name" do
  	article = Article.new
  	article.author = authors(:panda)
  	resultado = article.save
  	assert_not resultado, "Saved the article without a name"
  end

  test "article title should not have less than 5 chars" do
  	article = Article.new
  	article.title = "abcd"
  	article.author = authors(:panda)
  	assert_not article.save, "Saved article with a title of only 4 chars"
  end

  test "article should always have an author" do
  	article = Article.new
  	article.title = articles(:one).title
  	assert_not article.save, "Saved article without author"
  end
end
