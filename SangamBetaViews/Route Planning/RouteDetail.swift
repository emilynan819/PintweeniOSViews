//
//  RouteDetail.swift
//  POI4
//
//  Created by Emily Nan on 2019/11/05.
//  Copyright © 2019 Emily Nan. All rights reserved.
//

import SwiftUI

struct RouteDetail: View {
    @EnvironmentObject var userdata : UserData
    @State private var showingSlide = false
    
    var item : POIItem
    var body: some View {
        
        VStack{
           
            ZStack {
                //MapView(coordinate: POIItem.example.locationCoordinate)
                ContentView(item: item)
                    .frame(height: 230)
                    .edgesIgnoringSafeArea(.top)
                // NavigationLink 방식으로 다음 페이지 넘어가기
//                NavigationLink(destination: SlideView()){
//                    Image(systemName: "doc.text.viewfinder")
//                }
                
                //Button 클릭 방식으로 다음페이지 넘어 가기
//                Button(action: {
//                    self.showingSlide.toggle()
//                }) {
//                    //Text("Show Details")
//                    Image(systemName: "doc.text.viewfinder")
//                        .background(Color.white)
//                }.sheet(isPresented: self.$showingSlide){
//                    SlideView()
//                }
                
            }
            
            NavigationView {
                List {
                    
                    RouteDetailSection()
                }
                .navigationBarTitle("My Route", displayMode: .inline)
                    // .listStyle(GroupedListStyle())
                    .navigationBarItems(trailing: EditButton())
            }
        }
    }
    
    
}


struct RouteDetail_Previews: PreviewProvider {
    static let userdata = UserData()
    
    static var previews: some View {
        RouteDetail(item: POIItem.example).environmentObject(userdata)
    }
}
