class Post < ActiveRecord::Base
	acts_as_commentable class_name: 'Comment'
	acts_as_taggable
	acts_as_taggable_on :tag
end
