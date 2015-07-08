FactoryGirl.define do
  factory :pin do
     id { generate(:string) }
     message 'Your pin is {{pin}}'
     phone { generate(:number) }
     attempts 3
     expire 120
  end
end
