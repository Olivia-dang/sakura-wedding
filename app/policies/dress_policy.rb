class DressPolicy < ApplicationPolicy
    def edit?
      user == record.user
    end
end