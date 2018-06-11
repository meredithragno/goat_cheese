class Producer < ApplicationRecord
  # Direct associations

  has_many   :tastings,
             :foreign_key => "producers_id",
             :dependent => :destroy

  belongs_to :regions,
             :class_name => "Region"

  # Indirect associations

  # Validations

end
