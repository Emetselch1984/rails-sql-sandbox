require 'rails_helper'

RSpec.describe Parent, type: :model do
  let(:parent) { create(:parent) }

  before do
    hiroyuki = parent
    misae = create(:parent, name: 'Misae')
    hiroyuki.children.create!(name: 'Sazae')
    hiroyuki.children.create!(name: 'Katuo')
    hiroyuki.children.create!(name: 'Wakame')
    misae.children.create!(name: 'Shinnosuke')
    misae.children.create!(name: 'Himawari')
  end
  it 'zで検索' do
    parents = Parent.children_name_with('z').order(:name)
    parents.each do |parent|
      expect(parent.name).to eq('hiroyuki')
    end
  end
  it 'kで検索' do
    parents = Parent.children_name_with('k').order(:name)
    parents.each do |parent|
      case parent.name
      when 'hiroyuki'
        expect(parent.name).to eq('hiroyuki')
      when 'Misae'
        expect(parent.name).to eq('Misae')
      else
        expect(parent.name).to eq('hiroyuki')
      end
    end
  end
  it 'rで検索' do
    parents = Parent.children_name_with('r').order(:name)
    parents.each do |parent|
      expect(parent.name).to eq('Misae')
    end
  end
end
