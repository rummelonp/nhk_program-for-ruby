# coding: utf-8

require 'spec_helper'

describe NHKProgram do
  after do
    NHKProgram.reset
  end

  context 'when delegating to a client' do
    before do
      stub_get('now/010/g1.json')
        .to_return(body: '{"nyan":"にゃーん"}')
    end

    it 'should request the correct resource' do
      NHKProgram.now('札幌', 'ＮＨＫ総合１')
    end

    it 'should return the same results as a client' do
      expect(NHKProgram.now('札幌', 'ＮＨＫ総合１')).to eql(NHKProgram::Client.new.now('札幌', 'ＮＨＫ総合１'))
    end
  end

  describe '.new' do
    it 'should return a NHKProgram::Client' do
      expect(NHKProgram.new).to be_is_a(NHKProgram::Client)
    end
  end

  describe '.respond_to?' do
    it 'should take an optional argument' do
      expect(NHKProgram.respond_to?(:new, true)).to be_true
    end
  end

  describe '.adapter' do
    it 'should return the default adapter' do
      expect(NHKProgram.adapter).to eql(NHKProgram::Configuration::DEFAULT_ADAPTER)
    end
  end

  describe '.adapter=' do
    it 'should set the adapter' do
      NHKProgram.adapter = :typhoeus
      expect(NHKProgram.adapter).to eql(:typhoeus)
    end
  end

  describe '.endpoint' do
    it 'should return the default endpoint' do
      expect(NHKProgram.endpoint).to eql(NHKProgram::Configuration::DEFAULT_ENDPOINT)
    end
  end

  describe '.endpoint=' do
    it 'should set the endpoint' do
      NHKProgram.endpoint = 'https://api.twitter.com/'
      expect(NHKProgram.endpoint).to eql('https://api.twitter.com/')
    end
  end

  describe '.user_agent' do
    it 'should return the default user agent' do
      expect(NHKProgram.user_agent).to eql(NHKProgram::Configuration::DEFAULT_USER_AGENT)
    end
  end

  describe '.user_agent=' do
    it 'should set the user_agent' do
      NHKProgram.endpoint = 'Custom User Agent'
      expect(NHKProgram.endpoint).to eql('Custom User Agent')
    end
  end

  describe '.configure' do
    NHKProgram::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "should set the #{key}" do
        NHKProgram.configure do |config|
          config.send("#{key}=", key)
          expect(NHKProgram.send(key)).to eql(key)
        end
      end
    end
  end
end
