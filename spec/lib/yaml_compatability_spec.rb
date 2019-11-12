require 'spec_helper'
require Rails.root.join('lib/yaml_compatibility')

RSpec.describe YAMLCompatibility do
  describe '.load' do
    subject(:output_hash) { described_class.load(content) }
    let(:hash) { YAML.load(yaml_compatibility_fixture('5_1')) }

    context 'with Rails 5.1 YAML file' do
      let(:content) { yaml_compatibility_fixture('5_1') }

      it 'correctly loads YAML file' do
        is_expected.to eq hash
      end
    end
  end

  private

  def yaml_compatibility_fixture(file)
    load_file_fixture("yaml_compatibility_#{file}.yml")
  end
end