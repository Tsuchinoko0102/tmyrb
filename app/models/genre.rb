class Genre
  @@genre = [
                [{id: 101, name: "経済・財政"},{id: 102, name: "経営"}, {id: 103, name: "流通"}, {id: 104, name: "マーケティング"},
                {id: 105, name: "投資・株・資産運用"}, {id: 106, name: "産業"}, {id: 107, name: "マネジメント・人材管理"}, {id: 108, name: "自己啓発"},
                {id: 109, name: "就職・転職"}, {id: 110, name: "経理"}, {id: 199, name: "その他ビジネス・経済"}],
              
                [{id: 201, name: "日本の小説"}, {id: 202, name: "海外の小説"}, {id: 203, name: "ミステリー・サスペンス"},
                {id: 204, name: "SF・ホラー"}, {id: 205, name: "エッセイ"}, {id: 206, name: "ノンフィクション"}, {id: 207, name: "ロマンス"},
                {id: 208, name: "ライトノベル"}, {id: 299, name: "その他小説・エッセイ"}],
              
                [{id: 301, name: "恋愛"}, {id: 302, name: "妊娠・出産・子育て"}, {id: 303, name: "ペット"}, {id: 304, name: "住まい・インテリア"},
                {id: 305, name: "ガーデニング・花"}, {id: 306, name: "健康"}, {id: 307, name: "料理"}, {id: 308, name: "ドリンク・お酒"},
                {id: 309, name: "冠婚葬祭・マナー"}, {id: 310, name: "ファッション・美容"}, {id: 311, name: "占い"}, {id: 312, name: "雑貨"}, {id: 399, name: "その他暮らし"}],
              
                [{id: 401, name: "スポーツ"}, {id: 402, name: "格闘技"}, {id: 403, name: "車・バイク"}, {id: 404, name: "自転車"},
                {id: 405, name: "鉄道"}, {id: 406, name: "登山・釣り・アウトドア"}, {id: 407, name: "カメラ・写真"}, {id: 408, name: "囲碁・将棋"},
                {id: 409, name: "麻雀"}, {id: 410, name: "美術・工芸・工作"}, {id: 411, name: "美術"}, {id: 412, name: "茶道・華道・香道"},
                {id: 413, name: "音楽"}, {id: 414, name: "芸能・タレント"}, {id: 415, name: "アニメ・漫画・ゲーム"}, {id: 499, name:"その他ホビー"}],
              
                [{id: 501, name: "旅行"}, {id: 502, name: "温泉"}, {id: 503, name: "テーマパーク"}, {id: 504, name: "ガイドブック"},
                {id: 505, name: "地図"}, {id: 506, name: "紀行・旅行エッセイ"}, {id: 507, name: "留学・海外赴任"}, {id: 599, name: "その他旅行・留学"}],
              
                [{id: 601, name: "英語"}, {id: 602, name: "中国語"}, {id: 603, name: "韓国語"}, {id: 604, name: "ドイツ語"}, {id: 605, name: "フランス語"},
                {id: 606, name: "その他言語"}, {id: 607, name: "辞典"}, {id: 608, name: "TOEIC・TOEFL・英検"}, {id: 609, name: "その他語学資格"},
                {id: 610, name: "小学生向け参考書・問題集"}, {id: 611, name: "中学生向け参考書・問題集"}, {id: 612, name: "高校生向け三個遺書・問題集"},
                {id: 613, name: "図鑑・資料集"}, {id: 699, name: "その他語学・学習"}],
              
                [{id: 701, name: "自然科学全般"}, {id: 702, name: "数学"}, {id: 703, name: "物理学"}, {id: 704, name: "化学"},
                {id: 705, name: "地学・天文学"}, {id: 706, name: "生物学"}, {id: 707, name: "植物学"}, {id: 708, name: "動物学"},
                {id: 709, name: "数学"}, {id: 710, name: "工学"}, {id: 711, name: "建築学"}, {id: 799, name: "その他科学・技術"}],
              
                [{id: 801, name: "基礎医学"}, {id: 802, name: "臨床医学一般"}, {id: 803, name: "臨床医学内科"}, {id: 803, name: "臨床医学外科"},
                {id: 804, name: "臨床医学専門科別"}, {id: 805, name: "基礎看護学"}, {id: 806, name: "臨床看護"}, {id: 807, name: "保健・助産"},
                {id: 808, name: "薬学"}, {id: 809, name: "歯科医学"}, {id: 899, name: "その他医学"}],
              
                [{id: 901, name: "ハードウェア"}, {id: 902, name: "インターネット・webデザイン"}, {id: 903, name: "ネットワーク"},
                {id: 904, name: "プログラミング"}, {id: 905, name: "アプリケーション"}, {id: 906, name: "OS"}, {id: 907, name: "デザイン・グラフィックス"},
                {id: 908, name: "MOUS・MOT"}, {id: 909, name: "IT・eコマース"}, {id: 999, name: "その他PC・システム開発"}],
              
                [{id: 1001, name: "哲学・思想"}, {id: 1002, name: "心理学"}, {id: 1003, name: "宗教・倫理"},
                {id: 1004, name: "歴史"}, {id: 1005, name:  "地理"}, {id: 1006, name: "社会科学"}, {id: 1007, name: "法律"},
                {id: 1008, name: "政治"}, {id: 1009, name: "社会"}, {id: 1010, name: "教育・福祉"}, {id: 1011, name: "民俗"},
                {id: 1012, name: "軍事"}, {id: 1013, name: "ジャーナリズム"}, {id: 1014, name: "言語学"}, {id: 1015, name: "文学"},
                {id: 1016, name: "ノンフィクション"}, {id: 1099, name: "その他人文・思想・社会"}],
              
                [{id: 1101, name: "法律関係資格"}, {id: 1102, name: "ビジネス関係資格"}, {id: 1103, name: "会計関係資格"},
                {id: 1104, name: "不動産関係資格"},{id: 1105, name: "福祉関係資格"}, {id: 1106, name: "看護・医療関係資格"},
                {id: 1107, name: "パソコン関係資格"}, {id: 1108, name: "調理関係資格"}, {id: 1109, name: "教育関係資格"}, {id: 1199, name: "その他資格試験"}]
            ]

  def self.call(num)
    return @@genre.to_a[num]
  end

  def self.all
    return @@genre
  end

  def self.target(id)
    Genre.all.each do |genre|
      if genre.map{|x| x[:id]}.include?(id)
        target = genre.find{|y| y[:id] == id}
        return target
      end
    end
  end

end