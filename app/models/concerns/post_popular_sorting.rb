module PostPopularSorting
  extend ActiveSupport::Concern

  included do
    scope :popular, -> do
      limit_updated_at = Time.now - 2.month
      rank_select = "
        posts.*,
        round(((posts.comments_count + 3 * posts.like_emotions_count)
        /power(((extract(epoch from now()) - extract(epoch from posts.created_at))/200),0.7)
        )::numeric, 8) as rank
      ".gsub(/\s+/, " ").strip

      select(rank_select).where('updated_at >= ?', limit_updated_at).order('rank DESC')
    end
  end
end
