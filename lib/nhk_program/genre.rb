# coding: utf-8

require 'nhk_program/enumeration'

module NHKProgram
  class Genre < Enumeration
    # @attribute [r] id
    # @return [String] Genre ID (4 bytes)

    # @attribute [r] name
    # @return [String] Genre name

    define '0000', 'ニュース／報道(定時・総合)'
    define '0100', 'スポーツ(スポーツニュース)'
    define '0205', '情報／ワイドショー(グルメ・料理)'
    define '0300', 'ドラマ(国内ドラマ)'
    define '0409', '音楽(童謡・キッズ)'
    define '0502', 'バラエティ(トークバラエティ)'
    define '0600', '映画(洋画)'
    define '0700', 'アニメ／特撮(国内アニメ)'
    define '0800', 'ドキュメンタリー／教養(社会・時事)'
    define '0903', '劇場／公演(落語・演芸)'
    define '1000', '趣味／教育(旅・釣り・アウトドア)'
    define '1100', '福祉(高齢者)'
  end
end
