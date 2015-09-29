class Post < ActiveRecord::Base
	acts_as_commentable :public
	acts_as_taggable
	acts_as_taggable_on :tag
end
