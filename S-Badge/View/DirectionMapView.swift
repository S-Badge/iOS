//
//  DirectionMapView.swift
//  S-Badge
//
//  Created by ram on 2023/07/29.
//
import SwiftUI
import MapKit

struct Place : Identifiable {
    var id: UUID = UUID()
    var name: String
    var location: CLLocationCoordinate2D
    var color: Color
}

struct DirectionMapView: View {
    
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.88371, longitude: 127.73947),
            span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        )
        @State private var places = [
            Place(
                name: "장소 1",
                location: CLLocationCoordinate2D(latitude: 37.88371, longitude: 127.73947),
                color: Color.blue
            ),
            Place(
                name: "장소 2",
                location: CLLocationCoordinate2D(latitude: 37.88423, longitude: 127.73974),
                color: Color.blue
            ),
        ]
        @State private var selectedPlace: Place?
        
        var body: some View {
            ZStack {
                Map(coordinateRegion: $region, annotationItems: places) { item in
                    MapAnnotation(coordinate: item.location, anchorPoint: CGPoint(x: 0.5, y: 1)) {
                        VStack {
                            Text(item.name)
                            Circle()
                                .stroke(item.color, lineWidth: 2)
                                .foregroundColor(item.color.opacity(0.3))
                                .frame(width: 26, height: 26)
                        }
                        .onTapGesture {
                            selectedPlace = item
                        }
                    }
                }
            }
        }
}
//struct DirectionMapView: View {
//    @State private var startingAddress = ""
//        @State private var destinationAddress = ""
//        @State private var routes: [MKRoute] = []
//        @State private var showAlert = false
//
//        // 추가: 검색 결과를 담을 배열과 검색어를 입력받기 위한 변수들
//        @State private var searchResults: [MKLocalSearchCompletion] = []
//        @State private var isSearching = false
//        @State private var searchQuery = ""
//
//        var body: some View {
//            VStack {
//                // 출발지 검색 기능 추가
//                TextField("출발점", text: $startingAddress, onEditingChanged: { editing in
//                    self.isSearching = editing
//                })
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//
//                // 검색 결과 리스트 보여주기
//                if isSearching && !searchResults.isEmpty {
//                    List(searchResults, id: \.self) { result in
//                        Button(action: {
//                            self.selectSearchResult(result, isStartingAddress: true)
//                        }) {
//                            Text(result.title)
//                        }
//                    }
//                    .frame(height: 150)
//                    .listStyle(PlainListStyle())
//                }
//
//                // 도착지 검색 기능 추가
//                TextField("도착지", text: $destinationAddress, onEditingChanged: { editing in
//                    self.isSearching = editing
//                })
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//
//                // 검색 결과 리스트 보여주기
//                if isSearching && !searchResults.isEmpty {
//                    List(searchResults, id: \.self) { result in
//                        Button(action: {
//                            self.selectSearchResult(result, isStartingAddress: false)
//                        }) {
//                            Text(result.title)
//                        }
//                    }
//                    .frame(height: 150)
//                    .listStyle(PlainListStyle())
//                }
//
//                Button("길 찾기", action: findDirections)
//                    .padding()
//
//                MapView(routes: routes)
//                    .alert(isPresented: $showAlert) {
//                        Alert(title: Text("경로를 찾을 수 없습니다."),
//                              message: Text("출발지와 도착지를 확인해주세요."),
//                              dismissButton: .default(Text("확인")))
//                    }
//            }
//            .padding()
//            .onChange(of: searchQuery, perform: { query in
//                self.updateSearchResults()
//            })
//        }
//
//        // 추가: 검색 결과 업데이트
//        func updateSearchResults() {
//            let searchCompleter = MKLocalSearchCompleter()
//            searchCompleter.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)) // 서울 지역 설정
//            searchCompleter.queryFragment = searchQuery
//            searchCompleter.resultTypes = .address
//
//            searchResults = searchCompleter.results
//        }
//
//        // 추가: 검색 결과 선택 시 호출될 메서드
//        func selectSearchResult(_ result: MKLocalSearchCompletion, isStartingAddress: Bool) {
//            isSearching = false
//            searchQuery = result.title
//
//            if isStartingAddress {
//                startingAddress = result.title
//            } else {
//                destinationAddress = result.title
//            }
//        }
//
//    func findDirections() {
//        let geocoder = CLGeocoder()
//        let locale = Locale(identifier: "ko_KR") // 대한민국 설정
//        geocoder.geocodeAddressString(startingAddress, in: nil, preferredLocale: locale) { startingPlacemarks, error in
//            guard let startingPlacemark = startingPlacemarks?.first, error == nil else {
//                self.showAlert = true
//                return
//            }
//
//            geocoder.geocodeAddressString(destinationAddress, in: nil, preferredLocale: locale) { destinationPlacemarks, error in
//                guard let destinationPlacemark = destinationPlacemarks?.first, error == nil else {
//                    self.showAlert = true
//                    return
//                }
//
//                let startingItem = MKMapItem(placemark: MKPlacemark(placemark: startingPlacemark))
//                let destinationItem = MKMapItem(placemark: MKPlacemark(placemark: destinationPlacemark))
//
//                let request = MKDirections.Request()
//                request.source = startingItem
//                request.destination = destinationItem
//                request.transportType = .walking
//
//                let directions = MKDirections(request: request)
//                directions.calculate { response, error in
//                    guard let route = response?.routes.first, error == nil else {
//                        self.showAlert = true
//                        return
//                    }
//                    self.routes = [route]
//                }
//            }
//        }
//    }
//
//
//
//}

struct MapView: View {
    var routes: [MKRoute]

    var body: some View {
        Map(coordinateRegion: .constant(getCoordinateRegion()), annotationItems: getAnnotations()) { item in
            MapAnnotation(coordinate: item.coordinate) {
                Image(systemName: "mappin.circle.fill")
                    .foregroundColor(.red)
            }
        }
    }
    
    private func getCoordinateRegion() -> MKCoordinateRegion {
        if let route = routes.first {
            let center = CLLocationCoordinate2D(latitude: (route.polyline.coordinate.latitude + route.polyline.coordinate.latitude) / 2,
                                                longitude: (route.polyline.coordinate.longitude + route.polyline.coordinate.longitude) / 2)
            let span = MKCoordinateSpan(latitudeDelta: abs(route.polyline.coordinate.latitude - route.polyline.coordinate.latitude) * 1.5,
                                        longitudeDelta: abs(route.polyline.coordinate.longitude - route.polyline.coordinate.longitude) * 1.5)
            return MKCoordinateRegion(center: center, span: span)
        } else {
            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
                                      span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        }
    }

    private func getAnnotations() -> [AnnotationItem] {
        var annotations: [AnnotationItem] = []
        if let route = routes.first {
            let startAnnotation = AnnotationItem(coordinate: route.steps.first?.polyline.coordinate ?? CLLocationCoordinate2D(), title: "출발점")
            annotations.append(startAnnotation)

            let endAnnotation = AnnotationItem(coordinate: route.steps.last?.polyline.coordinate ?? CLLocationCoordinate2D(), title: "도착점")
            annotations.append(endAnnotation)
        }
        return annotations
    }
}

struct AnnotationItem: Identifiable {
    var id = UUID()
    var coordinate: CLLocationCoordinate2D
    var title: String
}
