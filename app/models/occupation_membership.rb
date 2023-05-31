class OccupationMembership < ApplicationRecord
  belongs_to :user
  belongs_to :occupation

  validates :user_id, presence: true
  validates :occupation_id, presence: true
  validate :check_duplicate_membership, unless: :rejected?

  def check_duplicate_membership
    if self.class.exists?(user_id: user_id, occupation_id: occupation_id, status: ['pending', 'approved'])
      errors.add(:user_id, 'は既に申請済みです。')
    end
  end

  def rejected?
    status == 'rejected'
  end


  enum status: {
    pending: 'pending',
    approved: 'approved',
    accepted: 'accepted',
    rejected: 'rejected'
  }
end
