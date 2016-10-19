require_relative './../app/models/tag'

describe Tag do
  subject(:tag) {described_class.new}

  it {is_expected.to have_property :name}
  it {is_expected.to have_many :links}

end
