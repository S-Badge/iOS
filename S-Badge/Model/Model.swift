//
//  Model.swift
//  S-Badge
//
//  Created by ram on 2023/08/02.
//

import Foundation
public struct CoordinateInfo{
    var lat: Double //경도
    var lng: Double //위도
    init(lat: Double, lng: Double) {
        self.lat = lat
        self.lng = lng
    }
    
}
//let NTower = NMGLatLng(lat: 37.5512164, lng: 126.9882487)
//var cameraUpdate = NMFCameraUpdate(scrollTo: NTower, zoomTo: 2)
