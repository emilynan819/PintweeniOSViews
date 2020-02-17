//
//  SlideView.swift
//  SangamBeta
//
//  Created by Emily Nan on 2020/01/13.
//  Copyright © 2020 Emily Nan. All rights reserved.
//

import SwiftUI
//import Mapbox

struct SlideView: View {
    
     @EnvironmentObject var userdata : UserData
    // @State private var showingSlide = false
   
     @State var showWholeMap = false
     @State var showPointMap = false
    
    @State  var pointAnnotations = [CustomPointAnnotation]()
    @State var polylines = [CustomPolyline]()
  //  @State var cardNumber : Int = 0
 
    
    var body: some View {
        ZStack {
           // MapView(coordinate: POIItem.example.locationCoordinate)
               
                //  ContentView()
            MapView(pointAnnotations: $pointAnnotations, polylines: $polylines)
                    .centerCoordinate(CLLocationCoordinate2D(latitude: SetCenter().latitude, longitude: SetCenter().longitude))
                .zoomLevel(SetCenter().level)
                    .styleURL(MGLStyle.streetsStyleURL)
                     .edgesIgnoringSafeArea(.top)
            if showPointMap {
                MapView(pointAnnotations: $pointAnnotations, polylines: $polylines)
                    .centerCoordinate(CLLocationCoordinate2D(
                        latitude: SetPoint().latitude, longitude: SetPoint().longitude
                        )

                )
                    .zoomLevel(14)
                        .styleURL(MGLStyle.streetsStyleURL)
                         .edgesIgnoringSafeArea(.top)
            }
            VStack {
                Spacer()
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 10) {
                       //  SlideCard2()
                        HStack {
                            //Pressed start button to see the whole map.
                                 Button(action: {
                                     print("pressed start button")
                                    // self.showWholeMap.toggle()
                                       self.drop()
                                 }) {
                                     ZStack {
                                         RoundedRectangle(cornerRadius: 25)
                                             .frame(width: 140, height: 200)
                                             .foregroundColor(Color.green.opacity(0.5))
                                         Text("Start!!")
                                     }
                                 }
                            // Each Slide Card
                                 ForEach(userdata.items) { item in
               
                                    ZStack {
                                         
                                         VStack(alignment: .leading) {
                                             
                                             Image(item.imageName)
                                                 .resizable()
                                                 .frame(width: 140, height: 115)
                                                 .cornerRadius(15)
                                             
                                             VStack(alignment: .leading) {
                                                 Text(item.placeName)
                                                 Text("\(9) km")
                                             }.font(.custom("AmericanTypewriter", size: 10))
                                                 // .offset(x: -10, y: 0)
                                                 .padding(.bottom, 10)
                                                 .padding(.leading, 10)
                                             HStack {
                                                 //Green Box: (transportation & taking time)
                                                 HStack(alignment: .center){
                                                     Image(systemName: "car.fill")
                                                         .resizable()
                                                         .frame(width: 12, height: 10)
                                                         .foregroundColor(.white)
                                                     Text("11 min")
                                                         .font(Font.system(size: 11))
                                                         .foregroundColor(.white)
                                                 }.background(Rectangle()
                                                     .fill(Color.green)
                                                     .frame(width: 76, height: 26)
                                                     .cornerRadius(15))
                                                     .padding(.leading, 5)
                                                     .padding(.bottom, 10)
                                                 
                                                 //Comments and number
                                                 HStack {
                                                     Image(systemName: "ellipses.bubble")
                                                         .resizable()
                                                         .frame(width: 10, height: 12)
                                                     Text("7")
                                                         .font(Font.system(size: 10))
                                                         .offset(x: -5, y: -2)
                                                     
                                                 }.padding(.leading, 25)
                                                     .offset(y: -5)
                                             }//.offset(x: 5, y: -5)
                                                 .padding(.bottom, 10)
                                                 .padding(.leading, 15)
                                             
                                         } //End of VStack
                                             .background(
                                                 RoundedRectangle(cornerRadius: 25, style: .continuous)
                                                     .fill(Color.white)
                                                     .shadow(radius: 4))
                                         
                                         ////////////////////////////Add Button///////////////////
                                        Button(action: {
                                            print(item.placeName)
                                            print(item.coordinates)
                                        //    print("\(self.poiIndex)")
                                          
                                            self.showPointMap.toggle()
                                            
                                        }) {
                                             RoundedRectangle(cornerRadius: 25)
                                                 .frame(width: 140, height: 200)
                                            .foregroundColor(Color.yellow.opacity(0.1))
                                         }
                                         //////////////////////////Button End ///////////////////////////
                                     } // End of ZStack
                                    
                                  //  cardNumber = cardNumber + 1
                                     
                                 }  //End of ForEach

                            //End of the Slide Card.
                                 ZStack {
                                     RoundedRectangle(cornerRadius: 25)
                                         .frame(width: 140, height: 200)
                                         .foregroundColor(Color.red.opacity(0.5))
                                     Text("End of Plan!!")
                                 }
                             }
                        
                    }
                }.padding(.bottom, 10)
            }
            

            
        }
    }
    
      // MARK: - Annotation View

        func drop() {
            
            for item in userdata.items {
                
                let count = pointAnnotations.count + 1
              //  let count = userdata.items.count + 1
                
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
    
    func SetPoint () -> (latitude: Double, longitude: Double, level: Double) {
    
          var LatiCenter : Double = 0
          var LongiCenter : Double = 0
          let i : Int = 0
      
           
      //     for item in userdata.items {
               
               LatiCenter = userdata.items[i].coordinates.latitude
               LongiCenter = userdata.items[i].coordinates.longitude
           
    //       }
         
           let Level = 10.0
           

         //  let center = (latitude: Lati, longitude: Longi, level: Level)
           let center = (latitude: LatiCenter, longitude: LongiCenter, level: Level)
           return center
           
       }
        
}




