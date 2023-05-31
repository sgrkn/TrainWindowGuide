//
//  SearchResultsViewController.swift
//  TrainWindowGuide
//
//  Created by Kana Fujitani on 2023/05/24.
//

import UIKit
import CoreLocation
import MapKit

class SearchResultsViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    var myLock = NSLock()
    let goldenRatio = 1.618
    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
      
    @IBAction func clickZoomin(_ sender: Any) {
        print("[DBG]clickZoomin")
        myLock.lock()
        if (0.005 < mapView.region.span.latitudeDelta / goldenRatio) {
            print("[DBG]latitudeDelta-1 : " + mapView.region.span.latitudeDelta.description)
            var regionSpan:MKCoordinateSpan = MKCoordinateSpan()
            regionSpan.latitudeDelta = mapView.region.span.latitudeDelta / goldenRatio
            mapView.region.span = regionSpan
            print("[DBG]latitudeDelta-2 : " + mapView.region.span.latitudeDelta.description)
        }
        myLock.unlock()
    }
    
    @IBAction func clickZoomout(_ sender: Any) {
        print("[DBG]clickZoomout")
        myLock.lock()
        if (mapView.region.span.latitudeDelta * goldenRatio < 150.0) {
            print("[DBG]latitudeDelta-1 : " + mapView.region.span.latitudeDelta.description)
            var regionSpan:MKCoordinateSpan = MKCoordinateSpan()
            regionSpan.latitudeDelta = mapView.region.span.latitudeDelta * goldenRatio
            // regionSpan.latitudeDelta = mapView.region.span.longitudeDelta * GoldenRatio
            mapView.region.span = regionSpan
            print("[DBG]latitudeDelta-2 : " + mapView.region.span.latitudeDelta.description)
        }
        myLock.unlock()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegateをセット
        mapView.delegate = self
        
        locationManager = CLLocationManager()  // 変数を初期化
        locationManager.delegate = self  // delegateとしてself(自インスタンス)を設定
        
        locationManager.startUpdatingLocation()  // 位置情報更新を指示
        locationManager.requestWhenInUseAuthorization()  // 位置情報取得の許可を得る
        
        mapView.showsUserLocation = true
        
        // ピンを立てる
        // ピンを立てたい緯度・経度をセット
        //let coordinate = CLLocationCoordinate2DMake(36.3922466621714, 139.057872435089)
        // 現在地の場合
        // let coordinate = mapView.userLocation.coordinate
        // ピンを生成
        //let pin = MKPointAnnotation()
        // ピンのタイトル・サブタイトルをセット
        //pin.title = "利根川"
        //pin.subtitle = "流域面積日本一の河川"
        // ピンに一番上で作った位置情報をセット
        //pin.coordinate = coordinate
        // mapにピンを表示する
        //mapView.addAnnotation(pin)
        
        //配列・for文で複数のピンを立てる
        //structの定義
        struct PinData {
            var longitude:Double;
            var latitude:Double;
            var title:Int;
            var subtitle:Int;
        }
        
        let pinDatas: [[Any]] = [[36.3922466621714, 139.057872435089, "利根川", "流域面積が日本一の河川"],
                                 [36.3911018795263, 139.060328833722, "群馬県庁", "33階建て。高さ153m。"],
                                 [36.5629115, 139.1969948, "赤城山", "群馬県のほぼ中央に位置する上州の名山。晴天時によく見える。"],
                                 [36.050584,  138.085549, "諏訪湖", "日本で23番目に広い湖。"],
                                 [36.32883716, 138.9189998, "東邦亜鉛安中精錬所", "夜景が綺麗。"],
                                 [36.33427411, 138.924529, "ベイシア安中店", "群馬発祥のスーパー"],
                                 [36.2992921, 138.7486621, "妙義山", "上毛三山のひとつ。荒々しい岩肌が特徴。" ],
                                 [35.97163084, 138.3701287, "八ヶ岳", "山。"],
                                 [35.91030682, 138.2504178, "中央線旧立場川橋梁跡", "中央本線の橋が架橋した際に廃止された橋。"],
                                 [34.982594, 136.658337, "四日市コンビナート", "日本で初めて形成された石油化学コンビナート"],
                                 [35.36149952247431, 138.72736334024125, "富士山", "日本一の山"]]

        for pin in pinDatas {
            let longitude = pin[0] as! Double
            let latitude = pin[1] as! Double
            let coordinate = CLLocationCoordinate2DMake(longitude, latitude)

            // ピンを生成
            let pinAnnotation = MKPointAnnotation()
            // ピンのタイトル・サブタイトルをセット
            pinAnnotation.title = pin[2] as? String
            pinAnnotation.subtitle = pin[3] as? String
            // ピンに一番上で作った位置情報をセット
            pinAnnotation.coordinate = coordinate
            // mapにピンを表示する
            mapView.addAnnotation(pinAnnotation)
        }

    }
    
    // ピンがタップされた時の処理
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            // タップされたピンの位置情報
            print(view.annotation?.coordinate)
            // タップされたピンのタイトルとサブタイトル
            print(view.annotation?.title)
            print(view.annotation?.subtitle)
        }
    

    
    func locationManager2(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        let longitude = (locations.last?.coordinate.longitude.description)!
        let latitude = (locations.last?.coordinate.latitude.description)!
        // print("[DBG]longitude : " + longitude)
        // print("[DBG]latitude : " + latitude)

    }
}
