# == Schema Information
#
# Table name: houses
#
#  id            :bigint           not null, primary key
#  firstname     :string(255)
#  lastname      :string(255)
#  city          :string(255)
#  num_of_people :integer
#  has_child     :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :house do
    firstname { "MyString" }
    lastname { "MyString" }
    city { "MyString" }
    num_of_people { 1 }
    has_child { false }
  end
end
