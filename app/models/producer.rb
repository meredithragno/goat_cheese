class Producer < ApplicationRecord
  # Direct associations

  belongs_to :regions,
             :class_name => "Region"

  # Indirect associations

  # Validations

end
