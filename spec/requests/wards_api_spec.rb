require 'spec_helper'

describe Api::V1::WardsController do
  include ApiHelpers
  it 'return valid data' do
    get api("/wards/kita")
    expect(response.status).to eq(200)
    expect(json_response["name"]).to eq("北区")
    expect(json_response["roman_name"]).to eq("kita")
  end

  it 'return 404' do
    get api("/wards/yodogawa") # this one is osaka!
    expect(response.status).to eq(404)
  end
end
