//
//  MapView.swift
//  mapTest2
//
//  Created by Emily Nan on 2020/01/20.
//  Copyright © 2020 Emily Nan. All rights reserved.
//

import SwiftUI
//import Mapbox

//Create an MGLPointAnnotation extension
extension MGLPointAnnotation {
    convenience init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.init()
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}


////////////////////////////////////////
class CustomPointAnnotation: NSObject, MGLAnnotation {
    // As a reimplementation of the MGLAnnotation protocol, we have to add mutable coordinate and (sub)title properties ourselves.
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    // Custom properties that we will use to customize the annotation's image.
    var image: UIImage?
    var reuseIdentifier: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

// MGLPolyline subclass
class CustomPolyline: MGLPolyline {
    // Because this is a subclass of MGLPolyline, there is no need to redeclare its properties.
    
    // Custom property that we will use when drawing the polyline.
    var color: UIColor?
}

/////////////////////////


struct MapView: UIViewRepresentable {
    
  //  @Binding var annotations: [MGLPointAnnotation]
    @Binding var pointAnnotations : [CustomPointAnnotation]
    @Binding var polylines : [CustomPolyline]
    
    private let mapView: MGLMapView = MGLMapView(frame: .zero, styleURL: MGLStyle.streetsStyleURL)
    
    
    // MARK: - Configuring UIViewRepresentable protocol
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MGLMapView {
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MGLMapView, context: UIViewRepresentableContext<MapView>) {
        updateAnnotations()
    }
    
    func makeCoordinator() -> MapView.Coordinator {
        Coordinator(self)
    }
    
    private func updateAnnotations() {
        if let currentAnnotations = mapView.annotations {
            mapView.removeAnnotations(currentAnnotations)
        }
      //  mapView.addAnnotations(annotations)
        mapView.addAnnotations(polylines)
        mapView.addAnnotations(pointAnnotations)
    }
    
    // MARK: - Configuring MGLMapView
    
    func styleURL(_ styleURL: URL) -> MapView {
        mapView.styleURL = styleURL
        return self
    }
    
    // Set the map’s center coordinate and zoom level.
    func centerCoordinate(_ centerCoordinate: CLLocationCoordinate2D) -> MapView {
        mapView.centerCoordinate = centerCoordinate
        //        mapView.setCenter(CLLocationCoordinate2D(latitude: 40.7326808, longitude: -73.9843407), zoomLevel: 16, animated: false)
        
        return self
    }
    
    func zoomLevel(_ zoomLevel: Double) -> MapView {
        mapView.zoomLevel = zoomLevel
        return self
    }
    
    func setZoomLevel(_ zoomLevel: Double, animated: Bool) {
        
    }

    
    // MARK: - Implementing MGLMapViewDelegate
    
    //Coordinator can be used with delegates, data sources, and user events. In this example, you'll use a delegate, MGLMapViewDelegate, to add the annotation view to the map. In order for a SwiftUI view to implement MGLMapViewDelegate it must declare a Coordinator class.
    final class Coordinator: NSObject, MGLMapViewDelegate {
        var control: MapView
        
        init(_ control: MapView) {
            self.control = control
        }
        
//        //Camera Animation
//        func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
//        // Wait for the map to load before initiating the first camera movement.
//
//        // Create a camera that rotates around the same center point, rotating 180°.
//        // `fromDistance:` is meters above mean sea level that an eye would have to be in order to see what the map view is showing.
//        let camera = MGLMapCamera(lookingAtCenter: mapView.centerCoordinate, altitude: 4500, pitch: 15, heading: 180)
//
//        // Animate the camera movement over 5 seconds.
//        mapView.setCamera(camera, withDuration: 2, animationTimingFunction: CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut))
//        }
//
//        func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
//
//            let coordinates = [
//                CLLocationCoordinate2D(latitude: 16.469667, longitude: 107.595628),
//                CLLocationCoordinate2D(latitude: 16.371316, longitude: 107.521902),
//                CLLocationCoordinate2D(latitude: 16.094109, longitude: 108.046587),
//                CLLocationCoordinate2D(latitude: 16.070434, longitude: 108.236189),
//                CLLocationCoordinate2D(latitude: 16.469667, longitude: 107.595628),
//            ]
//
//            let buildingFeature = MGLPolygonFeature(coordinates: coordinates, count: 5)
//            let shapeSource = MGLShapeSource(identifier: "buildingSource", features: [buildingFeature], options: nil)
//            mapView.style?.addSource(shapeSource)
//
//            let fillLayer = MGLFillStyleLayer(identifier: "buildingFillLayer", source: shapeSource)
//            fillLayer.fillColor = NSExpression(forConstantValue: UIColor.blue)
//            fillLayer.fillOpacity = NSExpression(forConstantValue: 0.5)
//
//            mapView.style?.addLayer(fillLayer)
//
//        }
        
        
        // MARK: - 1. MGLMapViewDelegate methods
        
        
        // This delegate method is where you tell the map to load a view for a specific annotation. To load a static MGLAnnotationImage, you would use `-mapView:imageForAnnotation:`.
        // Use the default marker. See also: our view annotation or custom marker examples.
//
//        func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
//
//            // This example is only concerned with point annotations.
//            guard annotation is MGLPointAnnotation else {
//                return nil
//            }
//
//            // Use the point annotation’s longitude value (as a string) as the reuse identifier for its view.
//            let reuseIdentifier = "\(annotation.coordinate.longitude)"
//
//            // For better performance, always try to reuse existing annotations.
//            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
//
//          //  symbols.text = NSExpression(forKeyPath: "name")
//
//            // If there’s no reusable annotation view available, initialize a new one.
//            if annotationView == nil {
//
//                annotationView = CustomAnnotationView(reuseIdentifier: reuseIdentifier)
//                annotationView!.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
//
//                // Set the annotation view’s background color to a value determined by its longitude.
//                // let hue = CGFloat(annotation.coordinate.longitude) / 50
//                //                annotationView!.backgroundColor = UIColor(hue: hue, saturation: 0.5, brightness: 0.8, alpha: 0.8)
//                annotationView!.backgroundColor = UIColor(hue: 0.02, saturation: 0.6, brightness: 1.0, alpha: 0.95)
//
//            }
//
//            return annotationView
//        }
   
        // MARK: - 2. Add image on the Map
        //Mark a palce with Image
       
//        func mapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage? {
//
//            let reuseIdentifier = "\(annotation.coordinate.longitude)"
//
//            /////////////////////////////////////
//            // Try to reuse the existing ‘pisa’ annotation image, if it exists.
//            var annotationImage = mapView.dequeueReusableAnnotationImage(withIdentifier: reuseIdentifier)
//
//            if annotationImage == nil {
//
//                   /////////////////////////////////////
//                // Leaning Tower of Pisa by Stefan Spieler from the Noun Project.
//
//                var image = UIImage(named: "purple2")!
//
//                image = image.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: image.size.height/2, right: 0))
//
//                // Initialize the ‘pisa’ annotation image with the UIImage we just loaded.
//                annotationImage = MGLAnnotationImage(image: image, reuseIdentifier: reuseIdentifier)
//
//            }
//            return annotationImage
//
//        }

  
        //////////////////////////////////////////// imageFor ////////////////////////

        
        // MARK: - MGLMapViewDelegate methods
        func mapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage? {
            if let point = annotation as? CustomPointAnnotation,
                let image = point.image,
                let reuseIdentifier = point.reuseIdentifier {

                if let annotationImage = mapView.dequeueReusableAnnotationImage(withIdentifier: reuseIdentifier) {
                    // The annotatation image has already been cached, just reuse it.
                    return annotationImage
                } else {
                    // Create a new annotation image.
                    return MGLAnnotationImage(image: image, reuseIdentifier: reuseIdentifier)
                }
            }

            // Fallback to the default marker image.
            return nil
        }
        
        func mapView(_ mapView: MGLMapView, strokeColorForShapeAnnotation annotation: MGLShape) -> UIColor {
            if let annotation = annotation as? CustomPolyline {
                // Return orange if the polyline does not have a custom color.
                return annotation.color ?? .orange
            }

            // Fallback to the default tint color.
            return mapView.tintColor
        }
        /////////////////////////////////End/////////////////////////
        
        // Allow callout view to appear when an annotation is tapped.
        func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
            return true
        }
    }
    
    // MGLAnnotationView subclass
    class CustomAnnotationView: MGLAnnotationView {
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            // Use CALayer’s corner radius to turn this view into a circle.
            layer.cornerRadius = bounds.width / 2
            layer.borderWidth = 2
            layer.borderColor = UIColor.white.cgColor
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            // Animate the border width in/out, creating an iris effect.
            let animation = CABasicAnimation(keyPath: "borderWidth")
            animation.duration = 0.1
            layer.borderWidth = selected ? bounds.width / 4 : 2
            layer.add(animation, forKey: "borderWidth")
        }

        
    }
    

}


