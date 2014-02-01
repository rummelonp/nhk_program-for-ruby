# coding: utf-8

require 'spec_helper'

describe NHKProgram::Client do
  let(:keys) { NHKProgram::Configuration::VALID_OPTIONS_KEYS }

  context 'with module configuration' do
    before do
      NHKProgram.configure do |config|
        keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      NHKProgram.reset
    end

    it 'should inherit module configuration' do
      client = NHKProgram::Client.new
      keys.each do |key|
        expect(client.send(key)).to eql(key)
      end
    end

    context 'with class configuration' do
      let(:configuration) do
        {
          :adapter => :typhoeus,
          :api_key => 'AK',
          :endpoint => 'https://api.twitter.com',
          :proxy => 'http://mitukiii:secret@proxy.example.com:8080',
          :user_agent => 'Custom User Agent'
        }
      end

      context 'during initialization' do
        it 'should override module configuration' do
          client = NHKProgram::Client.new(configuration)
          keys.each do |key|
            expect(client.send(key)).to eql(configuration[key])
          end
        end
      end

      context 'after initilization' do
        it 'should override module configuration after initialization' do
          client = NHKProgram::Client.new
          configuration.each do |key, value|
            client.send("#{key}=", value)
          end
          keys.each do |key|
            expect(client.send(key)).to eql(configuration[key])
          end
        end
      end
    end
  end
end
