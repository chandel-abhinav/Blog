class Post < ActiveRecord::Base 
	extend FriendlyId 
	friendly_id :slug_candidates, use: [:slugged, :finders]
	#attr_accessor :slug
	acts_as_commentable class_name: 'Comment'
	acts_as_taggable
	acts_as_taggable_on :tag

	def slug_candidates
    [
      :title,
      [:title, :body],
    ]
  	end
end
