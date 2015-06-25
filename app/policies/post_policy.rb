class PostPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if user.present?
        if user.admin? || user.moderator? 
          scope.all
        else
          scope.where(:published => true)
        end 
      else
        scope
      end
    end
  end

  def index?
    user.present?
  end

  def update?
    user.admin? or not post.published?
  end
  
end