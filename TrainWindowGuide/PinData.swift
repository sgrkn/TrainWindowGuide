//
// pinData.swift
// TrainWindowGuide
//
// Created by Kana Fujitani on 2023/06/02.
//
import Foundation
//配列・for文で複数のピンを立てる
//structの定義
struct PinData {
    var latitude:Double
    var longitude:Double
    var title:String
    var subtitle:String
    var rail: String
    var station: String
    var explanation: String
    var imagePath: String
    static let DEFAULT_DATAS: [PinData] =
    [
        PinData(latitude: 36.3922466621714, longitude: 139.057872435089, title:"利根川", subtitle: "流域面積が日本一の河川", rail: "両毛線", station: "新前橋〜前橋", explanation: "流域面積が日本一の河川", imagePath: "tone_river"),
        PinData(latitude: 36.3911018795263, longitude: 139.060328833722, title:"群馬県庁", subtitle: "33階建て。高さ153m。", rail: "両毛線", station: "新前橋〜前橋", explanation: "33階建て。高さ153m。", imagePath: "gunma_prefecturaloffice"),
        PinData(latitude: 36.5629115, longitude: 139.1969948, title: "赤城山", subtitle: "群馬県のほぼ中央に位置する上州の名山。晴天時によく見える。", rail: "上越線", station: "新前橋〜渋川", explanation: "群馬県のほぼ中央に位置する上州の名山。晴天時によく見える。", imagePath: "mount_akagi"),
        PinData(latitude: 36.050584, longitude: 138.085549, title: "諏訪湖", subtitle: "日本で23番目に広い湖。", rail: "中央本線", station: "岡谷〜茅野", explanation: "日本で23番目に広い湖。", imagePath: "lake_suwa"),
        PinData(latitude: 36.32883716, longitude: 138.9189998, title: "東邦亜鉛安中精錬所", subtitle: "夜景が綺麗。", rail: "信越線", station: "安中", explanation: "安中駅の目の前！夜景が綺麗。", imagePath: "noimage"),
        PinData(latitude: 36.33427411, longitude: 138.924529, title: "ベイシア安中店", subtitle: "群馬発祥のスーパー", rail: "信越線", station: "群馬八幡〜安中", explanation: "群馬発祥のスーパーマーケット。東は福島県から西は滋賀県まで、割といろんな県にある。", imagePath: "noimage"),
        PinData(latitude: 36.2992921, longitude: 138.7486621, title: "妙義山", subtitle: "上毛三山のひとつ。荒々しい岩肌が特徴。", rail: "信越本線", station: "西松井田〜横川", explanation: "上毛三山のひとつ。荒々しい岩肌が特徴。", imagePath: "mount_myogi"),
        PinData(latitude: 35.97163084, longitude: 138.3701287, title: "八ヶ岳", subtitle: "山。", rail: "中央本線", station: "茅野〜小淵沢", explanation: "八ヶ岳という山はない。山梨県・長野県に跨る山々の総称。", imagePath: "yatsugatake"),
        PinData(latitude: 35.91030682, longitude: 138.2504178, title: "中央線旧立場川橋梁跡", subtitle: "中央本線の橋が架橋した際に廃止された橋。", rail: "中央本線", station: "富士見〜信濃境", explanation: "中央本線の橋が架橋した際に廃止された橋。", imagePath: "noimage"),
        PinData(latitude: 34.982594, longitude: 136.658337, title: "四日市コンビナート", subtitle: "日本で初めて形成された石油化学コンビナート", rail: "関西本線", station: "富田浜〜四日市", explanation: "日本で初めて形成された石油化学コンビナート", imagePath: "yokkaichi"),
        PinData(latitude: 35.8738667899896, longitude: 138.304213444993, title: "小淵沢の大曲", subtitle: "小淵沢駅を出てすぐの大カーブ。", rail: "小海線", station: "小淵沢駅〜甲斐小泉", explanation: "撮影地として有名だが、車内から見る景色も勿論綺麗。", imagePath: "kobuchisawa_curve"),
        PinData(latitude: 43.797943, longitude: 142.406576, title: "ジェイアール貨物･北海道物流 旭川支店", subtitle: "貨物が沢山置いてある。", rail: "宗谷本線", station: "新旭川〜永山", explanation: "貨物が沢山置いてある。", imagePath: "asahikawa_cargo"),
        PinData(latitude: 43.42479034623872, longitude: 142.68515305959482, title: "十勝岳連峰", subtitle: "富良野周辺から見える山々。十勝岳は活火山。", rail: "富良野線", station: "鹿討〜ラベンダー畑", explanation: "富良野から見える山々。十勝岳は活火山。", imagePath: "mt_tokachi"),
        PinData(latitude: 36.40829089411049, longitude: 138.52059961054636, title: "浅間山", subtitle: "長野県のイメージが強いが実は群馬県に位置する山。", rail: "しなの鉄道線", station: "信濃追分〜小諸", explanation: "長野県のイメージが強いが実は群馬県に位置する山。", imagePath: "mt_asama")
    ]
}
