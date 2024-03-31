//
//  LocationManager.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.

import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject {
    
    @Published var currentLocation: CLLocation?
    @Published var userCity: String = ""
    @Published var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: 0)
    )
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
    func searchCity(cityName: String) {
        geocoder.geocodeAddressString(cityName) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            
            if let placemark = placemarks?.first, error == nil {
                self.userCity = placemark.locality ?? ""
                self.currentLocation = placemark.location
                self.region = MKCoordinateRegion(
                    center: placemark.location?.coordinate ?? CLLocationCoordinate2D(),
                    latitudinalMeters: 300000,
                    longitudinalMeters: 300000
                )
            } else {
                print("Error geocoding city: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        DispatchQueue.main.async {
            self.currentLocation = location
            self.region = MKCoordinateRegion(
                center: location.coordinate,
                latitudinalMeters: 300000,
                longitudinalMeters: 300000
            )
        }
        
        // You can also remove the duplicate CLGeocoder initialization here.
        self.reverseGeocode(location: location)
    }
    
    func reverseGeocode(location: CLLocation) {
        geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            
            if let placemark = placemarks?.first {
                let userLocation = placemark.locality ?? ""
                DispatchQueue.main.async {
                    self.userCity = userLocation
                }
            } else if let error = error {
                print("Reverse geocoder failed with error: \(error.localizedDescription)")
            }
        }
    }
}

