class Poll
  class OfficerAssignment < ActiveRecord::Base
    belongs_to :officer
    belongs_to :booth_assignment
    has_one :recount
    has_many :final_recounts
    has_many :voters

    validates :officer_id, presence: true
    validates :booth_assignment_id, presence: true
    validates :date, presence: true, uniqueness: { scope: [:officer_id, :booth_assignment_id] }

    delegate :poll_id, :booth_id, to: :booth_assignment

    scope :voting_days, -> { where(final: false) }
    scope :final,       -> { where(final: true) }
  end
end
