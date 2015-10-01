class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    can :read, :all
    can :create, :all
    #File.write('current_user_authorization_test', 'Last written')
    cannot [:update,:destroy], Post
    can [:update,:destroy], Post, :user_id => user.id

    cannot [:update,:destroy], Comment
    can [:update,:destroy], Comment, :user_id => user.id
    #@user_id=user.id
    #can :update, Post
    #cannot :update, Post do |post|
    #    File.write('current_user_authorization_test', 'Only Here...')
    #    post.try(:user_id) != @user_id
    #end
    #cannot :update, Post
    #can :update, Post, :user => {:id => @user_id}

    #    File.write('current_user_authorization_test', 'Here...')
    #    post.try(:user_id) == user.id
    #end
    #can :update, Comment do |comment|
    #    comment.try(:user) == user
    #end
    #can :destroy, Post do |post|
    #    post.try(:user) == user
    #end
    #can :destory, Comment do |comment|
    #    comment.try(:user) == user
    #end
  end
end
