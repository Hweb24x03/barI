require 'net/http'
require 'uri'

class Barnavi
  # sample:
  # json = b.search(:pattern => 1, :pref => 34, :lat => 34.391911, :lng => 132.467794)
  def search
    query_string = params.map{|k,v|
      URI.encode(k.to_s) + "=" + URI.encode(v.to_s)
    }.join("&")

    uri = URI.parse("http://webapi.suntory.co.jp")
    res = Net::HTTP.start(uri.host, uri.port) {|http|

      url = URI.encode("http://example.com")
      key = BAR_NAVI_KEY

      http.get("/barnavi/v2/shops?key=#{key}&url=#{url}&format=jsonp&#{query_string}")
    }

    res.body
  end

  def url
    url = "http://example.com"
    key = BAR_NAVI_KEY
    "http://webapi.suntory.co.jp/barnavi/v2/shops?key=#{key}&pref=26&url=#{url}}"
  end
end
