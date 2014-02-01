# coding: utf-8

require 'spec_helper'

describe NHKProgram::Client do
  context 'with module configuration' do
    let(:keys) { NHKProgram::Configuration::VALID_OPTIONS_KEYS }

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
          adapter: :typhoeus,
          api_key: 'AK',
          endpoint: 'https://api.twitter.com',
          proxy: 'http://mitukiii:secret@proxy.example.com:8080',
          user_agent: 'Custom User Agent'
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

  context 'when have error' do
    let(:client) { NHKProgram.new }

    {
      400 => NHKProgram::BadRequest,
      401 => NHKProgram::NotAuthorized,
      404 => NHKProgram::NotFound,
      499 => NHKProgram::ClientError,
      500 => NHKProgram::InternalServerError,
      503 => NHKProgram::ServiceUnavailable,
      599 => NHKProgram::ServerError,
    }.each do |status, klass|
      context "when HTTP status is #{status}" do
        before do
          stub_get('now/010/g1.json')
            .to_return(status: status, body: '{"error":{"message":"nyan"}}')
        end

        it "should raise #{klass.name} error" do
          expect { client.now('札幌', 'ＮＨＫ総合１') }.to raise_error(klass)
        end
      end
    end
  end
end
