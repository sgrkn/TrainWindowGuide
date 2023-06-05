//
//  pinData.swift
//  TrainWindowGuide
//
//  Created by Kana Fujitani on 2023/06/02.
//

import Foundation

//配列・for文で複数のピンを立てる
//structの定義
struct PinData {
    var longitude:Double
    var latitude:Double
    var title:String
    var subtitle:String
    var rail: String
    var station: String
    var explanation: String
    
    static let DEFAULT_DATAS: [PinData] =
    [
        PinData(longitude: 36.3922466621714,latitude: 139.057872435089, title:"利根川", subtitle: "流域面積が日本一の河川", rail: "両毛線", station: "新前橋〜前橋", explanation: "流域面積が日本一の河川"),
        PinData(longitude: 36.3911018795263,latitude: 139.060328833722, title:"群馬県庁", subtitle: "33階建て。高さ153m。", rail: "両毛線", station: "新前橋〜前橋", explanation: "33階建て。高さ153m。"),
        PinData(longitude: 36.5629115, latitude: 139.1969948, title: "赤城山", subtitle: "群馬県のほぼ中央に位置する上州の名山。晴天時によく見える。", rail: "上越線", station: "新前橋〜渋川", explanation: "群馬県のほぼ中央に位置する上州の名山。晴天時によく見える。"),
        PinData(longitude: 36.050584, latitude: 138.085549, title: "諏訪湖", subtitle: "日本で23番目に広い湖。", rail: "中央本線", station: "岡谷〜茅野", explanation: "日本で23番目に広い湖。"),
        PinData(longitude: 36.32883716, latitude: 138.9189998, title: "東邦亜鉛安中精錬所", subtitle: "夜景が綺麗。", rail: "信越線", station: "安中", explanation: "夜景が綺麗。"),
        PinData(longitude: 36.33427411, latitude: 138.924529, title: "ベイシア安中店", subtitle: "群馬発祥のスーパー"], rail: "信越線", station: "安中", explanation: "群馬発祥のスーパー。割といろんな県にある。"),
        PinData(longitude: 36.2992921, latitude: 138.7486621, title: "妙義山", subtitle: "上毛三山のひとつ。荒々しい岩肌が特徴。", rail: "信越本線", station: "西松井田〜横川", explanation: "上毛三山のひとつ。荒々しい岩肌が特徴。"),
        PinData(longitude: 35.97163084, latitude: 138.3701287, title: "八ヶ岳", subtitle: "山。", rail: "中央本線", station: "茅野〜小淵沢", explanation: "山。"),
        PinData(longitude: 35.91030682, latitude: 138.2504178, title: "中央線旧立場川橋梁跡", subtitle: "中央本線の橋が架橋した際に廃止された橋。", rail: "中央本線", station: "富士見〜信濃境", explanation: "中央本線の橋が架橋した際に廃止された橋。"),
        PinData(longitude: 34.982594, latitude: 136.658337, title: "四日市コンビナート", subtitle: "日本で初めて形成された石油化学コンビナート", rail: "紀勢線", station: "", explanation: "四日市ぜんそくのところ"),
        PinData(longitude: 35.8738667899896, latitude: 138.304213444993, title: "小淵沢の大曲", subtitle: "小淵沢駅を出てすぐの大カーブ。", rail: "小海線", station: "小淵沢駅〜甲斐小泉駅", explanation: "撮影地として有名だが車内から見る景色も勿論綺麗。")
    ]
}
