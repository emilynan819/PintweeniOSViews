//
//  POIDetail.swift
//  POI4
//
//  Created by Emily Nan on 2019/11/02.
//  Copyright © 2019 Emily Nan. All rights reserved.
//

import SwiftUI

struct POIDetail: View {
    @EnvironmentObject var userdata: UserData
    
    var item : POIItem
    //Update the POIDetail View to work with User Data
    var poiIndex: Int {
        userdata.pois.firstIndex(where: {$0.id == item.id} )!
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // POI Image and add button
            ZStack(alignment: .bottomTrailing) {
                Image(item.imageName)
                    .resizable()
                    .frame(height: 250)
                
                Button(action: {
                    self.userdata.add(item: self.item)
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.yellow)
                        .offset(x: -10, y: 15)
                        .shadow(radius: 1)
                }
                
//                if userdata.items.isEmpty == true {
//                    NavigationLink(destination: NewTrip2(item: item)) {
//
//                        Image(systemName: "plus.circle.fill")
//                            .resizable()
//                            .frame(width: 50, height: 50)
//                            .foregroundColor(.yellow)
//                            .offset(x: -10, y: 15)
//                            .shadow(radius: 1)
//                    }
//                } else {
//                    NavigationLink(destination: TripList(item: item)) {
//                        Image(systemName: "plus.circle.fill")
//                            .resizable()
//                            .frame(width: 50, height: 50)
//                            .foregroundColor(.yellow)
//                            .offset(x: -10, y: 15)
//                            .shadow(radius: 1)
//                    }
//                }
            }

            //placeName and Favorite(heart)
            HStack {
                Text(item.placeName)
                    .font(.title)
                    .fontWeight(.bold)
                Button(action: {
                    self.userdata.pois[self.poiIndex].isFavorite.toggle()
                }) {
                    if self.userdata.pois[self.poiIndex].isFavorite {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.red)
                    } else {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.gray)
                    }
                }
                
                
            } .padding(.leading, 8)
            HStack {
                //category icon
                //                Image(systemName: userdata.categ[item.category.rawValue, default: "star.fill"])
                //                    .resizable()
                //                    .frame(width: 25, height: 25)
                //                    .foregroundColor(userdata.color[item.category.rawValue, default:.black])
                //                    .padding(.leading, 15)
                // category name
                Text(item.category.rawValue)
                    .font(.caption)
                    .padding(5)
                    .background(Color.gray)
                    .foregroundColor(.white)
            }.padding(.leading, 5)
            
            Divider()
            // Address icon and text
            HStack {
                Image(systemName: "location.circle.fill" )
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.green)
                Text(item.address)
                    .font(.system(size: 16))
                Spacer()
            }
            Divider()
            // Phone icon and number
            HStack {
                Image(systemName: "phone.circle.fill" )
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.green)
                Text(item.phoneNumber)
                    .font(.system(size: 16))
                Spacer()
            }
            Divider()
            
            //Description
            VStack(alignment: .leading) {
                Text("About this place")
                    .font(.body)
                    .fontWeight(.semibold)
                Text("   ")
                Text(item.description)
                    .font(.system(size: 15))
            }.padding(8)
            
            
            Spacer()
        }.navigationBarTitle(Text(item.placeName), displayMode: .inline)
        
    }
}

struct POIDetail_Previews: PreviewProvider {
    static let userdata = UserData()
    
    static var previews: some View {
        //   NavigationView {
        POIDetail(item: POIItem.example).environmentObject(UserData())
        //   }
    }
}
