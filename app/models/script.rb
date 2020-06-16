class Script < ApplicationRecord

    validates :name, :body, presence: true

end
