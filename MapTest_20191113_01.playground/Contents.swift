//: A MapKit based Playground

import MapKit
import PlaygroundSupport


let appleParkWayCoordinates = CLLocationCoordinate2DMake(37.534922, 127.009033)

// Now let's create a MKMapView
let mapView = MKMapView(frame: CGRect(x:0, y:0, width:800, height:1000))
mapView.isZoomEnabled = true

// Define a region for our map view
var mapRegion = MKCoordinateRegion()

let mapRegionSpan = 0.04
mapRegion.center = appleParkWayCoordinates
mapRegion.span.latitudeDelta = mapRegionSpan
mapRegion.span.longitudeDelta = mapRegionSpan * 1.25

mapView.setRegion(mapRegion, animated: true)

// Create a map annotation
let annotation = MKPointAnnotation()
annotation.coordinate = appleParkWayCoordinates
annotation.title = "Apple Inc."
annotation.subtitle = "One Apple Park Way, Cupertino, California."

mapView.addAnnotation(annotation)

// Add the created mapView to our Playground Live View
PlaygroundPage.current.liveView = mapView
