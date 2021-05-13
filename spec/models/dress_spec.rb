require 'rails_helper'

RSpec.describe Dress, type: :model do
  it "should be a Dress" do
    expect(subject).to be_a_kind_of(Dress)
  end

  describe "attributes" do
    it "should respond to #name" do
      expect(subject).to respond_to :name
    end
    it "should respond to #color" do
        expect(subject).to respond_to :color
    end
    it "should respond to #size" do
        expect(subject).to respond_to :size
    end
    it "should respond to #description" do
        expect(subject).to respond_to :description
    end
    it "should respond to #price_cents" do
        expect(subject).to respond_to :price
    end
  end
end