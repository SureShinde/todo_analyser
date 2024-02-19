# frozen_string_literal: true

RSpec.describe TodoAnalyser do
  fixtures :all

  it 'has a version number' do
    expect(TodoAnalyser::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
