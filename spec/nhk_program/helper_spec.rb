# coding: utf-8

require 'spec_helper'

describe NHKProgram::Helper do
  let(:helper) do
    Class.new do
      extend NHKProgram::Helper
    end
  end

  describe '#parse_area' do
    it 'should convert to area from string of id' do
      expect(helper.parse_area('010')).to be_is_a(NHKProgram::Area)
    end

    it 'should convert to area from symbol of id' do
      expect(helper.parse_area(:'010')).to be_is_a(NHKProgram::Area)
    end

    it 'should convert to area from string of area name' do
      expect(helper.parse_area('札幌')).to be_is_a(NHKProgram::Area)
    end

    it 'should convert to area from symbol of area name' do
      expect(helper.parse_area(:'札幌')).to be_is_a(NHKProgram::Area)
    end

    it 'should raise error if given invalid id' do
      expect { helper.parse_area('000') }.to raise_error
    end

    it 'should raise error if given invalid area name' do
      expect { helper.parse_area('ハワイ') }.to raise_error
    end
  end

  describe '#parse_service' do
    it 'should convert to service from string of id' do
      expect(helper.parse_service('g1')).to be_is_a(NHKProgram::Service)
    end

    it 'should convert to service from symbol of id' do
      expect(helper.parse_service(:g1)).to be_is_a(NHKProgram::Service)
    end

    it 'should convert to service from string of service name' do
      expect(helper.parse_service('ＮＨＫ総合１')).to be_is_a(NHKProgram::Service)
    end

    it 'should convert to service from symbol of service name' do
      expect(helper.parse_service(:'ＮＨＫ総合１')).to be_is_a(NHKProgram::Service)
    end

    it 'should raise error if given invalid id' do
      expect { helper.parse_service(:nyan) }.to raise_error
    end

    it 'should raise error if given invalid service name' do
      expect { helper.parse_service('にゃーん') }.to raise_error
    end
  end

  describe '#parse_genre' do
    it 'should convert to genre from string of id' do
      expect(helper.parse_genre('0000')).to be_is_a(NHKProgram::Genre)
    end

    it 'should convert to genre from symbol of id' do
      expect(helper.parse_genre(:'0000')).to be_is_a(NHKProgram::Genre)
    end

    it 'should convert to genre from string of genre name' do
      expect(helper.parse_genre('ニュース／報道(定時・総合)')).to be_is_a(NHKProgram::Genre)
    end

    it 'should convert to genre from symbol of genre name' do
      expect(helper.parse_genre(:'ニュース／報道(定時・総合)')).to be_is_a(NHKProgram::Genre)
    end

    it 'should raise error if given invalid id' do
      expect { helper.parse_genre('9999') }.to raise_error
    end

    it 'should raise error if given invalid genre name' do
      expect { helper.parse_genre('にゃーん') }.to raise_error
    end
  end

  describe '#parse_date' do
    it 'should convert to date from date' do
      expect(helper.parse_date(Date.today)).to be_is_a(Date)
    end

    it 'should convert to date from time' do
      expect(helper.parse_date(Time.now)).to be_is_a(Date)
    end

    it 'should convert to date from string' do
      expect(helper.parse_date('2014-01-01')).to be_is_a(Date)
    end

    it 'should convert to date from symbol :today' do
      expect(helper.parse_date(:today)).to be_is_a(Date)
    end

    it 'should convert to date from symbol :tomorrow' do
      expect(helper.parse_date(:tomorrow)).to be_is_a(Date)
    end

    it 'should raise error if given invalid symbol' do
      expect { helper.parse_date(:nyan) }.to raise_error
    end

    it 'should raise error if given invalid arguments' do
      expect { helper.parse_date(nil) }.to raise_error
    end
  end
end
