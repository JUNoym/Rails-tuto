class StaticPagesController < ApplicationController
  def home
    render html: 'ホームページ'
  end

  def help
    render html: 'ヘルプページ'
  end
end
