//
//  MapViewVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 22/05/23.
//

import UIKit
import CoreLocation
import MapKit

class MapViewVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var mapView: MKMapView!
    @IBOutlet weak private var locationPicker: UIPickerView!
    
    //MARK: - Variables
    private var locationManager = CLLocationManager()
    private let locationList = LocationModel.getLocations()
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupView()
    }
}

//MARK: - setupView
extension MapViewVC {
    private func setupView() {
        mapView.delegate = self
        locationManager.delegate = self
        locationPicker.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

//MARK: - CLLocationManagerDelegate
extension MapViewVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            manager.stopUpdatingLocation()
            render(location, title: locationList.first?.name)
        }
    }
}

//MARK: - View Methods
extension MapViewVC {
    private func render(_ location: CLLocation, title: String? = nil) {
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center:location.coordinate , span: span)
        mapView.setRegion(region, animated: true)
        let pin = MKPointAnnotation()
        if let title = title {
            pin.title = title
            pin.subtitle = AppConstants.mapViewCallOutSubtitle + title
        }
        pin.coordinate = location.coordinate
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(pin)
    }
}

//MARK: - UIPickerViewDataSource
extension MapViewVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return AppConstants.singleComponentInPickerView
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locationList.count
    }
    
}

//MARK: - UIPickerViewDelegate
extension MapViewVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locationList[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let locationFromPicker = CLLocation(latitude: locationList[row].coordinate.latitude, longitude: locationList[row].coordinate.longitude)
        render(locationFromPicker, title: locationList[row].name)
    }
}

//MARK: - Actions
extension MapViewVC {
    @IBAction func onClickCurrentLocation(_ sender: UIButton) {
        let currentLocation = CLLocation(latitude: locationList.first?.coordinate.latitude ?? AppConstants.defaultLatLong, longitude: (locationList.first?.coordinate.longitude) ?? AppConstants.defaultLatLong)
    }
}

//MARK: - MKMapViewDelegate
extension MapViewVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let customAnnotation = MKAnnotationView(annotation: annotation, reuseIdentifier:  AppConstants.customAnnotationIdentifier)
        customAnnotation.image = UIImage(imageLiteralResourceName: AppConstants.customAnnotationImage )
        customAnnotation.canShowCallout = true
        return customAnnotation
    }
}
