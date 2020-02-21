class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients_used
    require "pry"; binding.pry

  end

end
