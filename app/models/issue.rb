class Issue < ActiveRecord::Base
  has_many :propositions
  has_many :statuses
  has_many :comments
  belongs_to :user
  belongs_to :related_proposition, class_name: Proposition

  default_scope { order(id: :desc) }

  def related_issue
    related_proposition.try(:issue)
  end

  def max_stands_count_in_propositions
    20 # fake!
  end
end
