require 'net/http'
require 'uri'

class Barnavi

  def search_ params={}
    params[:key] = BAR_NAVI_KEY
    params[:url] = "http://example.com"
    params[:format] = "json"

    query_string = URI.encode_www_form(params)

    uri = URI.parse("http://webapi.suntory.co.jp")
    res = Net::HTTP.start(uri.host, uri.port) {|http|
      http.get("/barnavi/v2/shops?#{query_string}")
    }

    JSON.parse(res.body)
  end

  def search
    self.search_(:pattern => 1, :pref => 34, :lat => 34.391911, :lng => 132.467794)
  end

  def url
    url = "http://example.com"
    key = BAR_NAVI_KEY
    "http://webapi.suntory.co.jp/barnavi/v2/shops?key=#{key}&pref=26&url=#{url}}"
  end
end
