class Region < ApplicationRecord
  # Direct associations

  has_many   :producers,
             :foreign_key => "regions_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :cheeses,
             :through => :producers,
             :source => :cheeses

  # Validations

end
