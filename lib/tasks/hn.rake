namespace :hn do

  desc 'Import Hacker News frontpage for development'
  task import: :environment do
    result = Unirest.get 'http://api.ihackernews.com/page'
    user = User.first

    unless user
      abort "Can't import news, there is no user! Your must first create a user first by logging in via Github."
    end

    result.body['items'].each do |post|
      user.posts.create({
        title: post['title'],
        url: post['url']
      })
    end
  end

end
