//
//  Profile_count.swift
//  View3
//
//  Created by Emily Nan on 2020/02/03.
//  Copyright © 2020 Emily Nan. All rights reserved.
//
import SwiftUI
struct User : Identifiable,Decodable{
    let id = UUID()
    var traveling : Bool
    var traveling_country:String
    var countries:Int
    var cities:Int
    var routes:Int
    var moments:Int
}
class UserModel:ObservableObject{
    @Published var users=User(traveling:true,traveling_country:"Germany",countries:20,cities:52,routes:38,moments:15)
}
struct Profile_count: View {
    @ObservedObject var usersVM = UserModel()
    var body: some View {
        VStack{
        HStack(alignment:.center,spacing:50,content:{
            VStack{
                Text(String(usersVM.users.countries))
                    .font(.system(size:18))
                 Text("Country")
                     .font(.system(size:16))
                    .foregroundColor(.secondary)
             }
            VStack{
                   Text(String(usersVM.users.cities))
                     .font(.system(size:18))
                   Text("City")
                   .font(.system(size:16))
                  .foregroundColor(.secondary)
                }
            VStack{
               Text(String(usersVM.users.routes))
                  .font(.system(size:18))
               Text("Routes")
                .font(.system(size:16))
                .foregroundColor(.secondary)
            }
            VStack{
               Text(String(usersVM.users.moments))
                  .font(.system(size:18))
               Text("Moments")
                .font(.system(size:16))
               .foregroundColor(.secondary)
            }
        }).padding(.horizontal,5)
            
                    ScrollView(.horizontal,content:{
                        VStack(alignment:.leading,spacing:5){
                    HStack{
                    ForEach(0..<10){item in
                        Image("flag")
                        .resizable()
                        .frame(width:50,height:30)
                        .opacity(1.0)
                        .padding(4)
                        }
                    }
                   HStack{
                     ForEach(0..<10){item in
                     Image("flag")
                    .resizable()
                    .frame(width:50,height:30)
                    .opacity(1.0)
                    .padding(4)
                    }
                  }
            }
            .padding(5)
                })
        }.padding(.top,10)
        }
    }
  
struct Profile_count_Previews: PreviewProvider {
    static var previews: some View {
        Profile_count()
    }
}
