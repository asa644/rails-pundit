class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
      scope.all
      else
      scope.where(published: true)
      end
    end
  end

  def show?
    true  # Anyone can view a restaurant
  end

  def create?
    true  # Anyone can create a restaurant
  end

  def update?
        user.admin? or not post.published?
  end

  def destroy?
    record.user == user  # Only restaurant creator can update it
  end
end
