class User
  include Mongoid::Document
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
    field :email, type: String, default: ''
  end
