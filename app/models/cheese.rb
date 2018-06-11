class Cheese < ApplicationRecord
  # Direct associations

  has_many   :tastings,
             :foreign_key => "cheeses_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :tastings,
             :source => :user

  # Validations

end
