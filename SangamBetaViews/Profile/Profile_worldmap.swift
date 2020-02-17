//
//  Profile_worldmap.swift
//  View3
//
//  Created by Emily Nan on 2020/02/03.
//  Copyright © 2020 Emily Nan. All rights reserved.
//
import SwiftUI

struct Profile_worldmap: View {
    let poi = Bundle.main.decode([POIItem].self,from:"poiData.json")
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
//    @State var lat : Double
//    @State var long : Double
    var body: some View {
            ZStack{
                Image("map-1")
                .resizable()
                .frame(width:screenWidth,height:screenHeight/4)
                    .foregroundColor(.secondary)
                    .opacity(1.0)
                ForEach(self.poi){item in
                    Image("pin")
                    .frame(width:3,height:3)
                        .position(x: self.normalizedLng(longitude:item.coordinates.longitude), y:
                            self.normalizedLat(latitude: item.coordinates.latitude))
                   
                }
            }
    }
       func normalizedLat(latitude:Double) -> CGFloat{
              let normalizedLat = (Float(latitude) + 90.0)/180
              let height = screenHeight/4 * (1-CGFloat(normalizedLat))
              return height
            }
          func normalizedLng(longitude:Double) -> CGFloat{
              let normalizedLng = (Float(longitude)+180)/360
              let width = screenWidth * CGFloat(normalizedLng)
              return width
        }
        
   }
  




  


    
              
                    
             
    
    

struct Profile_worldmap_Previews: PreviewProvider {
    static var previews: some View {
        Profile_worldmap()
    }
}
