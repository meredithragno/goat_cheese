class Cheese < ApplicationRecord
  # Direct associations

  has_many   :tastings,
             :foreign_key => "cheeses_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
