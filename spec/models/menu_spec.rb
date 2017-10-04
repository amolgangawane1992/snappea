require 'rails_helper'

RSpec.describe Menu, type: :model do
 
 
  it { should belong_to (:restaurant)}
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description)}
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:restaurant_id)}
end
