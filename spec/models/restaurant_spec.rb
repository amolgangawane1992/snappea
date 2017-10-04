require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  
  it { should have_many(:menus)}
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:address) }
 
end
 