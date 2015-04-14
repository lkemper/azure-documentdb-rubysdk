require 'spec_helper'
require 'documentdb_context'

describe Azure::DocumentDBContext do
  let(:master_token) { gimme(Azure::MasterToken) }
  let(:service_endpoint) { "some_url_for_your_document_db_instance" }
  let(:master_key) { "your_master_key" }
  let(:context) { Azure::DocumentDBContext.new service_endpoint, master_key }

  before(:each) {
    give(Azure::MasterToken).new(master_key) { master_token }
  }

  it "has the service endpoint" do
    expect(context.endpoint).to eq service_endpoint
  end

  it "has the master token" do
    expect(context.master_token).to eq master_token
  end
end