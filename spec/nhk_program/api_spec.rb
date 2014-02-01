# coding: utf-8

require 'spec_helper'

describe NHKProgram::API do
  let(:api_key) { 'api_key' }
  let(:client) { NHKProgram.new(api_key: api_key) }

  describe '#list' do
    it 'should request the correct resource' do
      stub_get("list/010/g1/#{Date.today.to_s}.json")
        .with(query: {key: api_key})
      client.list('札幌', 'ＮＨＫ総合１')
    end
  end

  describe '#genre' do
    it 'should request the correct resource' do
      stub_get("genre/010/g1/0000/#{Date.today.to_s}.json")
        .with(query: {key: api_key})
      client.genre('札幌', 'ＮＨＫ総合１', 'ニュース／報道(定時・総合)')
    end
  end

  describe '#info' do
    it 'should request the correct resource' do
      stub_get("info/010/g1/2014010112345.json")
        .with(query: {key: api_key})
      client.info('札幌', 'ＮＨＫ総合１', 2014010112345)
    end
  end

  describe '#now' do
    it 'should request the correct resource' do
      stub_get("now/010/g1.json")
        .with(query: {key: api_key})
      client.now('札幌', 'ＮＨＫ総合１')
    end
  end
end
