//
//  ContentView.swift
//  SangamBeta
//
//  Created by NANCHUNHUA on 2020/01/22.
//  Copyright © 2020 Emily Nan. All rights reserved.
//

import SwiftUI
import Mapbox

struct ContentView: View {
    
    @EnvironmentObject var userdata: UserData
    
    
    //   var item : POIItem
    
 //   @State var annotations = [MGLPointAnnotation]()
    @State  var pointAnnotations = [CustomPointAnnotation]()
    @State var polylines = [CustomPolyline]()

  
    // MARK: - Annotation View
    
    // Binding with 1. MGLMapViewDelegate methods(viewFor) or 2. Add image on the Map (imageView)
//    func caculate() {
//
//        for item in userdata.items {
//            let dot = MGLPointAnnotation(title: item.placeName, subtitle: item.city, coordinate: CLLocationCoordinate2D(latitude: item.coordinates.latitude, longitude: item.coordinates.longitude))
//
//            annotations.append(dot)
//
//        }
//
//    }
    
    /////////////////////////////////////////////////////////////
    func drop() {
        
        for item in userdata.items {
            
            let count = pointAnnotations.count + 1
            
            let point = CustomPointAnnotation(coordinate: CLLocationCoordinate2D(latitude: item.coordinates.latitude, longitude: item.coordinates.longitude), title: "\(count) \(item.placeName)", subtitle: item.city)
            
//            let polyline = CustomPolyline(coordinates: CLLocationCoordinate2D(latitude: item.coordinates.latitude, longitude: item.coordinates.longitude), count: UInt(count))
                
                //coordinates:, coder: UInt(item.count))

            point.reuseIdentifier = "customAnnotation\(count)"
        
            point.image = UIImage(named: "purple\(count)")
            
            //Use Image Function
              // point.image = dotTest()
             //  point.image = dot(size: 5 * count)
             //  point.image = dot(size: 30)
               
            //   point.image = numberDot(number: count)
            
            pointAnnotations.append(point)
            
//            polyline.color = .orange
//
//            polylines.append(polyline)
            
        }
        
        
      
    }
    //////////////////////////////////////////////////////////////////////////////
    // Set dot : number change
    func numberDot(number: Int) -> UIImage {
        let image : UIImage = UIImage(named: "purple\(number)")!
        
        return image
    }
    
    // Set dot : size change
    func dot(size: Int) -> UIImage {
         let floatSize = CGFloat(size)
         let rect = CGRect(x: 0, y: 0, width: floatSize, height: floatSize)
         let strokeWidth: CGFloat = 2

         UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)

        //Set point Color
         let ovalPath = UIBezierPath(ovalIn: rect.insetBy(dx: strokeWidth, dy: strokeWidth))
         UIColor.systemOrange.setFill()
         ovalPath.fill()

        //Set Stroke
         UIColor.white.setStroke()
         ovalPath.lineWidth = strokeWidth
         ovalPath.stroke()

      //   let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
         UIGraphicsEndImageContext()
        
        let image : UIImage = UIImage(named: "purple1")!

         return image
     }

    
    func SetCenter () -> (latitude: Double, longitude: Double, level: Double) {
 
       var LatiCenter : Double = 0
       var LongiCenter : Double = 0
        
        var maxLati : Double = 0
        var maxLongi : Double = 0
        var minLati : Double = 400
        var minLongi : Double = 400
        
        for item in userdata.items {
            
            LatiCenter = LatiCenter + item.coordinates.latitude
            LongiCenter = LongiCenter + item.coordinates.longitude
            
            if item.coordinates.latitude >= maxLati {
                maxLati = item.coordinates.latitude
            }
            
            if item.coordinates.longitude >= maxLongi {
                maxLongi = item.coordinates.longitude
            }
            
            if item.coordinates.latitude <= minLati {
                minLati = item.coordinates.latitude
            }
            
            if item.coordinates.longitude <= minLongi {
                minLongi = item.coordinates.longitude
            }
        
        }
          
        
        let Lati = LatiCenter / Double(userdata.items.count)
        let Longi = LongiCenter / Double(userdata.items.count)
      
        let zoomLati = log(180*180 / (maxLati - minLati)) / log(4.0)
        let zoomLongi = log(360*360 / (maxLongi - minLongi)) / log(4.0)
        var Level = 0.0
        
        if zoomLati <= zoomLongi {
             Level = zoomLati
        } else {
             Level = zoomLongi
        }
        
      //  let center = (latitude: Lati, longitude: Longi, level: Level)
        let center = (latitude: Lati, longitude: Longi, level: Level)
        return center
        
    }
    

    var body: some View {
        
        ZStack{
          //  MapView(annotations: $annotations)
            MapView(pointAnnotations: $pointAnnotations, polylines: $polylines)
                .centerCoordinate(CLLocationCoordinate2D(latitude: SetCenter().latitude, longitude: SetCenter().longitude))
                .zoomLevel(SetCenter().level)
                .styleURL(MGLStyle.streetsStyleURL)
             //   .setZoomLevel(8, animated: false)
            
//            Button(action: {
//                self.caculate()
//            }) {
//                Text("Show points")
//                    .foregroundColor(.white)
//                    .background(Color.orange)
//            }.offset(x: 130, y: -100)
            Button(action: {
                self.drop()
            }) {
                Text("Show points")
                    .foregroundColor(.white)
                    .background(Color.orange)
            }.offset(x: 130, y: -100)
            
        }
    }
}



