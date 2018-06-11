class Region < ApplicationRecord
  # Direct associations

  has_many   :producers,
             :foreign_key => "regions_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
