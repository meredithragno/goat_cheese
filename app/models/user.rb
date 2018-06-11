class User < ApplicationRecord
  # Direct associations

  has_many   :tastings,
             :dependent => :nullify

  # Indirect associations

  has_many   :cheeses,
             :through => :tastings,
             :source => :cheeses

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
