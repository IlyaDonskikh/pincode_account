FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@example.com"
  end

  sequence :string do |n|
    "string-#{n}"
  end

  sequence :url do |n|
    "http://url-#{n}.com"
  end

  sequence :number do
    (9_999 * rand).to_i
  end
end
