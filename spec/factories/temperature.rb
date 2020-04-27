FactoryBot.define do
  factory :temperature do
    city { 'Monterrey' }
    temperature { 10 }
    type_temperature { 'C°' }
  end
end
