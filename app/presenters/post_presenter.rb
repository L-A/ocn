class PostPresenter < Bourgeois::Presenter
  # Return the domain part of the post URL
  def domain
    url.split('/')[2]
  end

  # Return the localized score
  def points_count
    view.t('.points_count', count: like_emotions_count)
  end

  # Return the localized comments count
  def comments_count
    label = view.t('.comments_count', count: super)
    view.link_to label, view.app_post_path(object)
  end

  # Return a link element to the author profile page
  def author_link
    view.link_to user.username, view.app_user_path(user)
  end
end
