# -*- coding: utf-8 -*-
class BarsController < ApplicationController
  respond_to :json

  def index
    if login?
      #render json: call_barnavi_api
      render json: stub
    else
      render json: { error: "ログインしてください" }, status: 400
    end
  end

  def show
  end

  def create
  end

  def add_going
    if login?
      @current_user
    end
  end

  def call_barnavi_api
    barnavi = Barnavi.new

    #params[:pref] = @current_user.pref_code
    #params[:address] = @current_user.pref_code

    # default値(パラメータが入ってない場合)
    params[:pref] = "34" if params[:pref] == nil
    params[:address] = barnavi.get_pref_name("34") if params[:address] == nil
    params[:access]  = "広島系" if params[:access] == nil

    shops = barnavi.search(params)

    shops['shops']['shop'].each{|shop|
      shop['num_of_matches'] = shop['capacity'] #マッチした人数
      shop['num_of_persons'] = shop['capacity'] #今日行く人数

      if Bar.find(:first, :conditions=>[ "shop_id=?", shop['id'] ]) == nil
        bar = Bar.new
        bar.shop_id = shop['id']
        bar.json    = shop.to_json

        bar.save
      end
    }

    shops
  end

  def stub
<<JSON
{
    "shops": {
        "api_version": "2", 
        "results_available": "18", 
        "results_returned": "10", 
        "results_start": "1", 
        "shop": [
            {
                "access": "広島電鉄市内線　銀山町駅より徒歩3分", 
                "address": "広島県広島市中区銀山町11-9カナダ館3Ｆ", 
                "budget": "2,000円以上～3,000円未満", 
                "capacity": "9", 
                "close": "無休／盆・正月を除く", 
                "id": "0X00173892", 
                "lat_tokyo": "34.388305555555554", 
                "lat_world": "34.39154286217576", 
                "lng_tokyo": "132.46884444444444", 
                "lng_world": "132.46630066538407", 
                "name": "ＢＡＲ　ＭＡＸＩＭＵＭ", 
                "name_kana": "バー　マキシマム", 
                "num_of_matches": "9", 
                "num_of_persons": "9", 
                "open": "21：00～05：00", 
                "private_room": "なし", 
                "type": "ショットバー", 
                "url_mobile": "http://m.suntory.co.jp/bar-navi/shop/0X00173892/", 
                "url_pc": "http://www.suntory.co.jp/gourmet/bar-navi/shop/0X00173892/", 
                "url_photo_k1": "http://www.suntory.co.jp/shop_img/k/0X00173892_k1.jpg", 
                "url_photo_l1": "http://www.suntory.co.jp/shop_img/l/0X00173892_l1.jpg", 
                "url_photo_l2": "http://www.suntory.co.jp/shop_img/l/0X00173892_l2.jpg", 
                "url_photo_s1": "http://www.suntory.co.jp/shop_img/s/0X00173892_s1.jpg", 
                "url_photo_s2": "http://www.suntory.co.jp/shop_img/s/0X00173892_s2.jpg", 
                "url_photo_s3": "http://www.suntory.co.jp/shop_img/s/0X00173892_s3.jpg", 
                "url_photo_s4": "http://www.suntory.co.jp/shop_img/s/0X00173892_s4.jpg"
            }, 
            {
                "access": "山陽新幹線　広島駅正面出口より路面電車で10分／山陽本線　広島駅正面出口よりタクシーで5分", 
                "address": "広島県広島市中区銀山町11-25第1ダイヤモンドビル4Ｆ", 
                "budget": "3,000円以上～5,000円未満", 
                "capacity": "40", 
                "close": "第2・第4日曜日、12/31～1/2休業", 
                "id": "0822476147", 
                "lat_tokyo": "34.38874722222222", 
                "lat_world": "34.39198447845296", 
                "lng_tokyo": "132.4686638888889", 
                "lng_world": "132.46612010448897", 
                "name": "ｍａｉｎ　Ｂａｒ　Ｂｒａｓｄ’ｏｒ", 
                "name_kana": "メイン　バー　ブラドール", 
                "num_of_matches": "40", 
                "num_of_persons": "40", 
                "open": "月～土　18：00～03：00　ＬＯ02:30 ／日・祝　18：00～00：00　ＬＯ23:30", 
                "private_room": "あり", 
                "type": "オーセンティックバー", 
                "url_mobile": "http://m.suntory.co.jp/bar-navi/shop/0822476147/", 
                "url_pc": "http://www.suntory.co.jp/gourmet/bar-navi/shop/0822476147/", 
                "url_photo_k1": "http://www.suntory.co.jp/shop_img/k/0822476147_k1.jpg", 
                "url_photo_l1": "http://www.suntory.co.jp/shop_img/l/0822476147_l1.jpg", 
                "url_photo_l2": "http://www.suntory.co.jp/shop_img/l/0822476147_l2.jpg", 
                "url_photo_s1": "http://www.suntory.co.jp/shop_img/s/0822476147_s1.jpg", 
                "url_photo_s2": "http://www.suntory.co.jp/shop_img/s/0822476147_s2.jpg", 
                "url_photo_s3": "http://www.suntory.co.jp/shop_img/s/0822476147_s3.jpg", 
                "url_photo_s4": "http://www.suntory.co.jp/shop_img/s/0822476147_s4.jpg"
            }, 
            {
                "access": "", 
                "address": "広島県広島市中区胡町2-18グレイスビル2Ｆ", 
                "budget": "3,000円以上～5,000円未満", 
                "capacity": "18", 
                "close": "日曜", 
                "id": "0822460496", 
                "lat_tokyo": "34.38933055555555", 
                "lat_world": "34.392567748477084", 
                "lng_tokyo": "132.4686111111111", 
                "lng_world": "132.4660673042385", 
                "name": "カマラード", 
                "name_kana": "カマラード", 
                "num_of_matches": "18", 
                "num_of_persons": "18", 
                "open": "月～土　19:00～02:00 ／祝　19:00～00:00", 
                "private_room": "なし", 
                "type": "ショットバー", 
                "url_mobile": "http://m.suntory.co.jp/bar-navi/shop/0822460496/", 
                "url_pc": "http://www.suntory.co.jp/gourmet/bar-navi/shop/0822460496/", 
                "url_photo_k1": "http://www.suntory.co.jp/shop_img/k/0822460496_k1.jpg", 
                "url_photo_l1": "http://www.suntory.co.jp/shop_img/l/0822460496_l1.jpg", 
                "url_photo_l2": "http://www.suntory.co.jp/shop_img/l/0822460496_l2.jpg", 
                "url_photo_s1": "http://www.suntory.co.jp/shop_img/s/0822460496_s1.jpg", 
                "url_photo_s2": "http://www.suntory.co.jp/shop_img/s/0822460496_s2.jpg", 
                "url_photo_s3": "http://www.suntory.co.jp/shop_img/s/0822460496_s3.jpg", 
                "url_photo_s4": "http://www.suntory.co.jp/shop_img/s/0822460496_s4.jpg"
            }, 
            {
                "access": "広島電鉄1・2・6号線　銀山町駅より徒歩5分／ＪＲ山陽本線　広島駅南口よりタクシーで10分", 
                "address": "広島県広島市中区薬研堀1-21ユブタビル", 
                "budget": "2,000円以上～3,000円未満", 
                "capacity": "40", 
                "close": "無休", 
                "id": "0X00009265", 
                "lat_tokyo": "34.38777777777778", 
                "lat_world": "34.39101513628378", 
                "lng_tokyo": "132.46858333333333", 
                "lng_world": "132.46603960025425", 
                "name": "ＢＡＲ　陀陀", 
                "name_kana": "バー　ダダ", 
                "num_of_matches": "40", 
                "num_of_persons": "40", 
                "open": "月～土　19:00～04:00　ＬＯ　（フード）03:30 ／日・祝　19:00～02:00　ＬＯ　（フード）01:30※週末の祝日は04:00まで営業", 
                "private_room": "あり", 
                "type": "ダイニングバー", 
                "url_mobile": "http://m.suntory.co.jp/bar-navi/shop/0X00009265/", 
                "url_pc": "http://www.suntory.co.jp/gourmet/bar-navi/shop/0X00009265/", 
                "url_photo_k1": "http://www.suntory.co.jp/shop_img/k/0X00009265_k1.jpg", 
                "url_photo_l1": "http://www.suntory.co.jp/shop_img/l/0X00009265_l1.jpg", 
                "url_photo_l2": "http://www.suntory.co.jp/shop_img/l/0X00009265_l2.jpg", 
                "url_photo_s1": "http://www.suntory.co.jp/shop_img/s/0X00009265_s1.jpg", 
                "url_photo_s2": "http://www.suntory.co.jp/shop_img/s/0X00009265_s2.jpg", 
                "url_photo_s3": "http://www.suntory.co.jp/shop_img/s/0X00009265_s3.jpg", 
                "url_photo_s4": "http://www.suntory.co.jp/shop_img/s/0X00009265_s4.jpg"
            }, 
            {
                "access": "広島電鉄1・2・6号線　銀山町駅より徒歩5分／ＪＲ山陽本線　広島駅南口よりタクシーで5分", 
                "address": "広島県広島市中区薬研堀1-8ｓｗａｌｌｏｗｔａｉｌビル", 
                "budget": "2,000円以上～3,000円未満", 
                "capacity": "10", 
                "close": "不定休", 
                "id": "0822469266", 
                "lat_tokyo": "34.387655555555554", 
                "lat_world": "34.39089292514427", 
                "lng_tokyo": "132.46846944444445", 
                "lng_world": "132.4659257264499", 
                "name": "Ｂａｒ　ｓｗａｌｌｏｗｔａｉｌ", 
                "name_kana": "バー　スワロウテイル", 
                "num_of_matches": "10", 
                "num_of_persons": "10", 
                "open": "21:00～06:00", 
                "private_room": "なし", 
                "type": "ショットバー", 
                "url_mobile": "http://m.suntory.co.jp/bar-navi/shop/0822469266/", 
                "url_pc": "http://www.suntory.co.jp/gourmet/bar-navi/shop/0822469266/", 
                "url_photo_k1": "http://www.suntory.co.jp/shop_img/k/0822469266_k1.jpg", 
                "url_photo_l1": "http://www.suntory.co.jp/shop_img/l/0822469266_l1.jpg", 
                "url_photo_l2": "http://www.suntory.co.jp/shop_img/l/0822469266_l2.jpg", 
                "url_photo_s1": "http://www.suntory.co.jp/shop_img/s/0822469266_s1.jpg", 
                "url_photo_s2": "http://www.suntory.co.jp/shop_img/s/0822469266_s2.jpg", 
                "url_photo_s3": "http://www.suntory.co.jp/shop_img/s/0822469266_s3.jpg", 
                "url_photo_s4": "http://www.suntory.co.jp/shop_img/s/0822469266_s4.jpg"
            }, 
            {
                "access": "山陽本線　広島駅南口よりタクシーで5分／市内電車線　銀山町駅・胡町駅より徒歩2分", 
                "address": "広島県広島市中区堀川町1-4小川ビル", 
                "budget": "3,000円以上～5,000円未満", 
                "capacity": "15", 
                "close": "無休", 
                "id": "0822495624", 
                "lat_tokyo": "34.388688888888886", 
                "lat_world": "34.391926141268065", 
                "lng_tokyo": "132.46808611111112", 
                "lng_world": "132.46554237737712", 
                "name": "サロン・ド　まつ本", 
                "name_kana": "サロン　ド　マツモト", 
                "num_of_matches": "15", 
                "num_of_persons": "15", 
                "open": "月～土　18:00～02:00 ／日・祝　18:00～00:00", 
                "private_room": "なし", 
                "type": "ショットバー", 
                "url_mobile": "http://m.suntory.co.jp/bar-navi/shop/0822495624/", 
                "url_pc": "http://www.suntory.co.jp/gourmet/bar-navi/shop/0822495624/", 
                "url_photo_k1": "http://www.suntory.co.jp/shop_img/k/0822495624_k1.jpg", 
                "url_photo_l1": "http://www.suntory.co.jp/shop_img/l/0822495624_l1.jpg", 
                "url_photo_l2": "http://www.suntory.co.jp/shop_img/l/0822495624_l2.jpg", 
                "url_photo_s1": "http://www.suntory.co.jp/shop_img/s/0822495624_s1.jpg", 
                "url_photo_s2": "http://www.suntory.co.jp/shop_img/s/0822495624_s2.jpg", 
                "url_photo_s3": "http://www.suntory.co.jp/shop_img/s/0822495624_s3.jpg", 
                "url_photo_s4": "http://www.suntory.co.jp/shop_img/s/0822495624_s4.jpg"
            }, 
            {
                "access": "広電路面電車　胡町駅より徒歩5分", 
                "address": "広島県広島市中区胡町3-9レインボービル2Ｆ", 
                "budget": "3,000円以上～5,000円未満", 
                "capacity": "20", 
                "close": "日曜", 
                "id": "0825412255", 
                "lat_tokyo": "34.389361111111114", 
                "lat_world": "34.392598289073554", 
                "lng_tokyo": "132.46794166666666", 
                "lng_world": "132.46539791397998", 
                "name": "ＢＡＲ　Ｓｌａｉｎｔｈｅｖａ", 
                "name_kana": "バー　スランジーバ", 
                "num_of_matches": "20", 
                "num_of_persons": "20", 
                "open": "月～土　19:00～02:00", 
                "private_room": "なし", 
                "type": "ショットバー", 
                "url_mobile": "http://m.suntory.co.jp/bar-navi/shop/0825412255/", 
                "url_pc": "http://www.suntory.co.jp/gourmet/bar-navi/shop/0825412255/", 
                "url_photo_k1": "", 
                "url_photo_l1": "", 
                "url_photo_l2": "", 
                "url_photo_s1": "", 
                "url_photo_s2": "", 
                "url_photo_s3": "", 
                "url_photo_s4": ""
            }, 
            {
                "access": "銀山町駅より徒歩5分", 
                "address": "広島県広島市中区堀川町1-10ゴトービル5Ｆ", 
                "budget": "3,000円以上～5,000円未満", 
                "capacity": "", 
                "close": "日曜／祝日", 
                "id": "0X00221654", 
                "lat_tokyo": "34.38858611111111", 
                "lat_world": "34.3918233693887", 
                "lng_tokyo": "132.46779444444445", 
                "lng_world": "132.46525073966305", 
                "name": "まほろ", 
                "name_kana": "マホロ", 
                "num_of_matches": "", 
                "num_of_persons": "", 
                "open": "20:00～02:00", 
                "private_room": "なし", 
                "type": "ダイニングバー", 
                "url_mobile": "http://m.suntory.co.jp/bar-navi/shop/0X00221654/", 
                "url_pc": "http://www.suntory.co.jp/gourmet/bar-navi/shop/0X00221654/", 
                "url_photo_k1": "http://www.suntory.co.jp/shop_img/k/0X00221654_k1.jpg", 
                "url_photo_l1": "http://www.suntory.co.jp/shop_img/l/0X00221654_l1.jpg", 
                "url_photo_l2": "http://www.suntory.co.jp/shop_img/l/0X00221654_l2.jpg", 
                "url_photo_s1": "http://www.suntory.co.jp/shop_img/s/0X00221654_s1.jpg", 
                "url_photo_s2": "http://www.suntory.co.jp/shop_img/s/0X00221654_s2.jpg", 
                "url_photo_s3": "http://www.suntory.co.jp/shop_img/s/0X00221654_s3.jpg", 
                "url_photo_s4": "http://www.suntory.co.jp/shop_img/s/0X00221654_s4.jpg"
            }, 
            {
                "access": "広島駅表出口よりタクシーで5分／広島駅新幹線出口よりタクシーで10分", 
                "address": "広島県広島市中区胡町3-25バイオレットビル5Ｆ", 
                "budget": "3,000円以上～5,000円未満", 
                "capacity": "28", 
                "close": "無休", 
                "id": "0822470622", 
                "lat_tokyo": "34.389472222222224", 
                "lat_world": "34.3927093873311", 
                "lng_tokyo": "132.4678861111111", 
                "lng_world": "132.46534235792262", 
                "name": "Ｓｔｅｐ＆ＡＧ", 
                "name_kana": "ステップアンドエージー", 
                "num_of_matches": "28", 
                "num_of_persons": "28", 
                "open": "月～土　18:00～02:00 ／日・祝　18:00～00:00", 
                "private_room": "なし", 
                "type": "ショットバー", 
                "url_mobile": "http://m.suntory.co.jp/bar-navi/shop/0822470622/", 
                "url_pc": "http://www.suntory.co.jp/gourmet/bar-navi/shop/0822470622/", 
                "url_photo_k1": "http://www.suntory.co.jp/shop_img/k/0822470622_k1.jpg", 
                "url_photo_l1": "http://www.suntory.co.jp/shop_img/l/0822470622_l1.jpg", 
                "url_photo_l2": "http://www.suntory.co.jp/shop_img/l/0822470622_l2.jpg", 
                "url_photo_s1": "http://www.suntory.co.jp/shop_img/s/0822470622_s1.jpg", 
                "url_photo_s2": "http://www.suntory.co.jp/shop_img/s/0822470622_s2.jpg", 
                "url_photo_s3": "http://www.suntory.co.jp/shop_img/s/0822470622_s3.jpg", 
                "url_photo_s4": "http://www.suntory.co.jp/shop_img/s/0822470622_s4.jpg"
            }, 
            {
                "access": "広電　胡町駅より徒歩5分", 
                "address": "広島県広島市中区薬研堀2-2", 
                "budget": "3,000円以上～5,000円未満", 
                "capacity": "15", 
                "close": "無休", 
                "id": "0822435558", 
                "lat_tokyo": "34.38788611111111", 
                "lat_world": "34.391123445223926", 
                "lng_tokyo": "132.46785", 
                "lng_world": "132.46530632283165", 
                "name": "ＫＡＷＡＳＡＫＩ", 
                "name_kana": "カワサキ", 
                "num_of_matches": "15", 
                "num_of_persons": "15", 
                "open": "18:30～02:00", 
                "private_room": "なし", 
                "type": "オーセンティックバー", 
                "url_mobile": "http://m.suntory.co.jp/bar-navi/shop/0822435558/", 
                "url_pc": "http://www.suntory.co.jp/gourmet/bar-navi/shop/0822435558/", 
                "url_photo_k1": "http://www.suntory.co.jp/shop_img/k/0822435558_k1.jpg", 
                "url_photo_l1": "http://www.suntory.co.jp/shop_img/l/0822435558_l1.jpg", 
                "url_photo_l2": "http://www.suntory.co.jp/shop_img/l/0822435558_l2.gif", 
                "url_photo_s1": "http://www.suntory.co.jp/shop_img/s/0822435558_s1.jpg", 
                "url_photo_s2": "http://www.suntory.co.jp/shop_img/s/0822435558_s2.jpg", 
                "url_photo_s3": "http://www.suntory.co.jp/shop_img/s/0822435558_s3.jpg", 
                "url_photo_s4": "http://www.suntory.co.jp/shop_img/s/0822435558_s4.jpg"
            }
        ]
    }
}
JSON
  end
end
