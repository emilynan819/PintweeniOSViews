//
//  RouteDetailSection.swift
//  POI4
//
//  Created by Emily Nan on 2019/11/05.
//  Copyright © 2019 Emily Nan. All rights reserved.
//

import SwiftUI

struct RouteDetailSection: View {
    @EnvironmentObject var userdata : UserData
    @State private var showingComments = false
    
    
    var body: some View {
        //    Section {
        ForEach(userdata.items) { item in
            HStack {
                // 6 Points
                VStack{
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                }
                .foregroundColor(.gray)
                .scaleEffect(1.5)
                
                //Place Image
                Image(item.imageName)
                    .resizable()
                    .frame(width: 80, height: 60)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                
                // Place Name
                VStack(alignment: .leading) {
                    Text(item.placeName)
                        .font(.headline)
                    Text(item.city)
                        .font(.caption)
                        .foregroundColor(.gray)
                }.layoutPriority(1)
                Spacer()
                
                //Coment Icon
//                Image(systemName: "ellipses.bubble")
//                    .padding(5)
                Button(action: {
                    self.showingComments.toggle()
                }) {
                    //Text("Show Details")
                    Image(systemName: "ellipses.bubble")
                }.sheet(isPresented: self.$showingComments){
                    CommentDetails()
                }
                //Category Icon
                Image(systemName:
                    self.userdata.categ[item.category.rawValue, default: "smiley.fill"])
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(self.userdata.color[item.category.rawValue, default:.black])
                 //   .padding(5)
                
                
            }
            .padding(.leading, 6)
            .padding(.trailing, 6)
            
            HStack {
                Text("by Car, 13.1 km, 10 min")
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.leading, 9)
            .padding(.trailing, 6)
        }
         .onMove(perform: move)
         .onDelete(perform: deleteItems)
        
    }
    func deleteItems(at offsets: IndexSet) {
        userdata.items.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        userdata.items.move(fromOffsets: source, toOffset: destination)
    }
}


struct RouteDetailSection_Previews: PreviewProvider {
    static let userdata = UserData()
    
    static var previews: some View {
        RouteDetailSection()
            .environmentObject(userdata)
        
    }
}
