namespace :hn do

  desc 'Import Hacker News frontpage for development'
  task import: :environment do
    result = Unirest.get 'http://api.ihackernews.com/page'
    user = User.first

    abort("""
      Can't import news, there is no user!

      Your must first create a user first by logging in via Github.
    """) unless user

    result.body['items'].each do |post|
      Post.create({
        title: post['title'],
        url: post['url'],
        user_id: user.id
      })
    end
  end

end
