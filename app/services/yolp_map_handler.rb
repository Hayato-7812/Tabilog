require 'net/http'
require 'uri'
require 'json'
require 'dotenv/load'
require 'nokogiri'

class YOLPMapHandler
  YOLP_CLIENT_ID = ENV['YOLP_CLIENT_ID']

  def contents_geocoder(query, category="landmark")
    # コンテンツジオコーダAPIは、場所を表すキーワードを検出し、その位置情報（緯度、経度など）を出力します。
    # https://developer.yahoo.co.jp/webapi/map/openlocalplatform/v1/contentsgeocoder.html

    url = "https://map.yahooapis.jp/geocode/cont/V1/contentsGeoCoder?"
    url += URI.encode_www_form([["appid", YOLP_CLIENT_ID], ["query", query], ["category", category]])
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
  
    if response.code == '200'
      return xml_to_hash(response.body)[:YDF][:Feature]
    else
      return nil
    end
  end

  private

  def xml_to_hash(xml_string)
    doc = Nokogiri::XML(xml_string)
    result = {}

    # ルート要素（YDF）を取得
    root = doc.root
    result[root.name.to_sym] = {}

    # ルート要素の属性をハッシュに追加
    root.attributes.each do |name, value|
        result[root.name.to_sym][name.to_sym] = value.value
    end

    # ルート要素の子要素を再帰的に処理
    parse_element(root.children, result[root.name.to_sym])

    result
    end

    def parse_element(elements, result)
    elements.each do |element|
        next if element.text.strip.empty?  # 空のテキストノードは無視

        # 要素名をシンボルに変換
        element_name = element.name.to_sym

        if element.element?  # 子要素を持つ場合
        if result.key?(element_name)  # 既に同じ名前のキーが存在する場合
            if result[element_name].is_a?(Array)  # 既に配列として処理されている場合
            result[element_name] << parse_element(element.children, {})
            else
            result[element_name] = [result[element_name], parse_element(element.children, {})]
            end
        else
            result[element_name] = parse_element(element.children, {})
        end
        else  # 子要素を持たない場合
        result[element_name] = element.text
        end
    end

    result
    end
end

handler = YOLPMapHandler.new
result = handler.contents_geocoder("長野の善光寺")
puts result