//
//  SearchResultsViewController.swift
//  TrainWindowGuide
//
//  Created by Kana Fujitani on 2023/05/24.
//

import UIKit
import CoreLocation
import MapKit

class SearchResultsViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate {
    var myLock = NSLock()
    let goldenRatio = 1.618
    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager!
    @IBOutlet weak var inputText: UITextField!
    
    var initialLocationSet = false // 初期位置が設定されたかどうかを追跡するフラグ
    
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
        inputText.delegate = self // TextField のdelegate通知先を設定
        
        // 初期表示範囲の縮小
        let initialSpan = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5) // 適宜値を調整
        let initialRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: initialSpan)
        mapView.setRegion(initialRegion, animated: true)
        
        for pin in PinData.DEFAULT_DATAS {
            let longitude = pin.longitude
            let latitude = pin.latitude
            let coordinate = CLLocationCoordinate2DMake(longitude, latitude)
            
            // ピンを生成
            let pinAnnotation = MKPointAnnotation()
            // ピンのタイトル・サブタイトルをセット
            pinAnnotation.title = pin.title
            pinAnnotation.subtitle = pin.subtitle
            // ピンに一番上で作った位置情報をセット
            pinAnnotation.coordinate = coordinate
            // mapにピンを表示する
            mapView.addAnnotation(pinAnnotation)
        }
        
    }
    
    // ピンがタップされたときの処理
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        performSegue(withIdentifier: "toDetail", sender: view.annotation)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let next = segue.destination
            if let sheet = next.sheetPresentationController {
                sheet.detents = [.medium(), .large()]
                sheet.largestUndimmedDetentIdentifier = .medium
                sheet.preferredCornerRadius = 40.0
                sheet.prefersGrabberVisible = true
            }
            if let viewController = segue.destination as? ResultsDetailViewController {
                // ここでモーダルに値をセットする
                if let selectedPin = sender as? MKAnnotation {
                    let title = selectedPin.title as? String ?? ""
                    let pinData = PinData.DEFAULT_DATAS.first(where: { $0.title == title })
                    viewController.pinData = pinData
                }
            }
        }
    }
    
    
    //    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
    //        let longitude = (locations.last?.coordinate.longitude.description)!
    //        let latitude = (locations.last?.coordinate.latitude.description)!
    //        // print("[DBG]longitude : " + longitude)
    //        // print("[DBG]latitude : " + latitude)
    //
    //    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let currentLocation = locations.last else { return }
//        let coordinate = currentLocation.coordinate
//
//        // 現在地を地図の表示範囲に反映させる
//        let currentRegion = MKCoordinateRegion(center: coordinate, span: mapView.region.span)
//        mapView.setRegion(currentRegion, animated: true)
//    }
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//            guard let currentLocation = locations.last else { return }
//
//            if !initialLocationSet { // 初期位置がまだ設定されていない場合のみ処理を行う
//                let coordinate = currentLocation.coordinate
//
//                // 現在地を地図の表示範囲に反映させる
//                let currentRegion = MKCoordinateRegion(center: coordinate, span: mapView.region.span)
//                mapView.setRegion(currentRegion, animated: true)
//
//                initialLocationSet = true // 初期位置が設定されたことをマークする
//            }
//        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let currentLocation = locations.last else { return }
            
            if !initialLocationSet {
                let coordinate = currentLocation.coordinate
                let currentRegion = MKCoordinateRegion(center: coordinate, span: mapView.region.span)
                mapView.setRegion(currentRegion, animated: true)
                initialLocationSet = true // 初期位置が設定されたことをマークする
            }
        }
        
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // 位置情報の取得が許可されていない場合の初期位置を指定する
        let initialCoordinate = CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917)
        // 例として東京の座標を使用
        let initialRegion = MKCoordinateRegion(center: initialCoordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
        mapView.setRegion(initialRegion, animated: true)
            
            initialLocationSet = true
        }
    
    
    
    //    // 検索機能
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //            textField.resignFirstResponder()
    //
    //            if let searchKey = textField.text {
    //
    //            print(searchKey)
    //
    //            let geocoder = CLGeocoder()
    //
    //                geocoder.geocodeAddressString(searchKey, completionHandler: { (placemarks, error) in
    //
    //                    if let unwrapPlacemarks = placemarks {
    //                        if let firstPlacemark = unwrapPlacemarks.first {
    //                            if let location = firstPlacemark.location {
    //                                let targetCoordinate = location.coordinate
    //                                print(targetCoordinate)
    //
    //                                let pin = MKPointAnnotation()
    //
    //                                pin.coordinate = targetCoordinate
    //                                pin.title = searchKey
    //                                self.mapView.addAnnotation(pin)
    //
    //                                self.mapView.region = MKCoordinateRegion(center: targetCoordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
    //                            }
    //                        }
    //                    }
    //                })
    //        }
    //        return true
    //    }
    //
    
//    // 検索機能・フィルター
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        if let searchKey = textField.text {
//            let filteredPins = PinData.DEFAULT_DATAS.filter { pin in
//                if searchKey == pin.title, pin.title.lowercased().contains(searchKey.lowercased()) {
//                    return true
//                }
//                return false
//            }
//
//                for pin in filteredPins {
//                    let coordinate = CLLocationCoordinate2D(latitude: pin.latitude, longitude: pin.longitude)
//                    let pinAnnotation = MKPointAnnotation()
//                    pinAnnotation.coordinate = coordinate
//                    pinAnnotation.title = pin.title
//                    mapView.addAnnotation(pinAnnotation)
//                }
//
//                if let firstPin = filteredPins.first {
//                    let coordinate = CLLocationCoordinate2D(latitude: firstPin.latitude, longitude: firstPin.longitude)
//                    let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
//                    mapView.setRegion(region, animated: true)
//                }
//            }
//
//
//            return true
//        }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let searchKey = textField.text {
            let filteredPins = PinData.DEFAULT_DATAS.filter { pin in
                if searchKey == pin.title, pin.title.lowercased().contains(searchKey.lowercased()) {
                    return true
                }
                return false
            }
            
            // 既存のアノテーションを削除
            mapView.removeAnnotations(mapView.annotations)
            
            for pin in filteredPins {
                let coordinate = CLLocationCoordinate2D(latitude: pin.latitude, longitude: pin.longitude)
                let pinAnnotation = MKPointAnnotation()
                pinAnnotation.coordinate = coordinate
                pinAnnotation.title = pin.title
                mapView.addAnnotation(pinAnnotation)
            }
            
            if let firstPin = filteredPins.first {
                let coordinate = CLLocationCoordinate2D(latitude: firstPin.latitude, longitude: firstPin.longitude)
                let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
                mapView.setRegion(region, animated: true)
            }
        }
        
        return true
    }


    }
