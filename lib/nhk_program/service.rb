# coding: utf-8

require 'nhk_program/enumeration'

module NHKProgram
  class Service < Enumeration
    define 'g1', 'ＮＨＫ総合１'
    define 'e1', 'ＮＨＫＥテレ１'
    define 'e4', 'ＮＨＫワンセグ２'
    define 's1', 'ＮＨＫＢＳ１'
    define 's3', 'ＮＨＫＢＳプレミアム'
    define 'r1', 'ＮＨＫラジオ第1'
    define 'r2', 'ＮＨＫラジオ第2'
    define 'r3', 'ＮＨＫＦＭ'
  end
end
