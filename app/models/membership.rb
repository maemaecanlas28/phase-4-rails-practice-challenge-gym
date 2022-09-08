class Membership < ApplicationRecord
    validates :client_id, uniqueness: { scope: :gym_id,
        message: "can only have one membership with a gym" }

    belongs_to :client
    belongs_to :gym
end
