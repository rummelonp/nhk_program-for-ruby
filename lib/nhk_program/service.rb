# coding: utf-8

require 'nhk_program/enumeration'

module NHKProgram
  class Service < Enumeration
    define 'g1', 'ＮＨＫ総合１'
    define 'g2', 'ＮＨＫ総合２'
    define 'e1', 'ＮＨＫＥテレ１'
    define 'e2', 'ＮＨＫＥテレ２'
    define 'e3', 'ＮＨＫＥテレ３'
    define 'e4', 'ＮＨＫワンセグ２'
    define 's1', 'ＮＨＫＢＳ１'
    define 's2', 'ＮＨＫＢＳ１(１０２ｃｈ)'
    define 's3', 'ＮＨＫＢＳプレミアム'
    define 's4', 'ＮＨＫＢＳプレミアム(１０４ｃｈ)'
    define 'r1', 'ＮＨＫラジオ第1'
    define 'r2', 'ＮＨＫラジオ第2'
    define 'r3', 'ＮＨＫＦＭ'
    define 'n1', 'ＮＨＫネットラジオ第1'
    define 'n2', 'ＮＨＫネットラジオ第2'
    define 'n3', 'ＮＨＫネットラジオＦＭ'
    define 'tv', 'テレビ全て'
    define 'radio', 'ラジオ全て'
    define 'netradio', 'ネットラジオ全て'
  end
end
