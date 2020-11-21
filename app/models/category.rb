class Category < ActiveHash::Base
  self.data = [
    {id: 1, name: "---"},
    {id: 2, name: "ビジネス・経済"}, {id: 3, name: "小説・エッセイ"}, {id: 4, name: "暮らし"},
    {id: 5, name: "ホビー"}, {id: 6, name: "旅行・留学"}, {id: 7, name: "語学・学習"},
    {id: 8, name: "科学・技術"},{id: 9, name: "医学"}, {id: 10, name: "PC・システム開発"},
    {id: 11, name: "人文・思想・社会"}, {id: 12, name: "資格試験"}
  ]
end