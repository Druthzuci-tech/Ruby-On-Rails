class User < ApplicationRecord
    after_initialize :set_default_role,if: :new_record?
    private 
    def set_default_role
        self.role ||= :user
    end
end
