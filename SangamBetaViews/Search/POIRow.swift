//
//  POIRow.swift
//  POI4
//
//  Created by Emily Nan on 2019/10/31.
//  Copyright © 2019 Emily Nan. All rights reserved.
//

import SwiftUI

struct POIRow: View {
    
    @EnvironmentObject var userdata: UserData
    
    var item : POIItem
    
    var body: some View {
        NavigationLink(destination: POIDetail(item: item)) {
            HStack {
                Image(item.imageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                VStack(alignment: .leading) {
                    Text(item.placeName)
                        .font(.headline)
                    Text(item.city)
                        .font(.caption)
                        .foregroundColor(.gray)
                }.layoutPriority(1)
                
                Spacer()

                Image(systemName:
                    userdata.categ[item.category.rawValue, default: "star.fill"])
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(userdata.color[item.category.rawValue, default:.black])
                
            }.padding(.leading, 6)
                .padding(.trailing, 6)
        }
    }
}



struct POIRow_Previews: PreviewProvider {
    
    static let userdata = UserData()
    static var previews: some View {
        POIRow(item: POIItem.example)
            .environmentObject(userdata)
            .previewLayout(.fixed(width: 350, height: 60))
        
        
    }
}
