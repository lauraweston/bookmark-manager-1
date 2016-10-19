require_relative './../app/models/link'

describe Link do
  subject(:link) {described_class.new}

  it {is_expected.to have_property :id}
  it {is_expected.to have_property :title}
  it {is_expected.to have_property :url}
  it {is_expected.to have_many :tags}
end
