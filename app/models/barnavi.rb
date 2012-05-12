class Barnavi
  def search
    "hoge"
  end

  def url
    url = "http://example.com"
    key = ""
    "http://webapi.suntory.co.jp/barnavi/v2/shops?key=#{key}&pref=26&url=#{url}}"
  end
end
