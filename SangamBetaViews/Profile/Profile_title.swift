//
//  Profile_title.swift
//  View3
//
//  Created by Emily Nan on 2020/02/03.
//  Copyright © 2020 Emily Nan. All rights reserved.
//

import SwiftUI

struct Profile_title: View {
     @State var name="Emilyloves"
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        var body: some View {
            VStack(){
                   ZStack{
                      Image("air")
                         .resizable()
                        .frame(width: screenWidth, height: screenHeight/3.8)
                        .edgesIgnoringSafeArea(.top)
                         .opacity(1.8)
                   VStack{
                         HStack{
                          Button(action: {
                              }){
                                Image(systemName:"chevron.left")
                                .resizable()
                                .frame(width:12,height:12)
                                
                                }
                             Spacer()
                            Button(action:{

                            }){
                            Image("settings2")
                         }
                         }
                            .foregroundColor(Color.white)
                            .padding(.horizontal,20)
                          .frame(width:screenWidth,height:screenHeight/6,alignment: .topLeading)
                    HStack{
                   Image("one")
                    .resizable()
                    .frame(width:80,height:80)
                    .shadow(color:Color.gray,radius:20)
                    .padding(.horizontal,20)
                    .offset(y:15)
                    Spacer()
                     }
                     }.padding(.top,30)
                    }
                    HStack(){
                            Spacer()
                        VStack(alignment:.leading,spacing:2){
                            Text(name)
                            .bold()
                            .font(.system(size:32))
                            HStack{
                                Image("flag3")
                               .foregroundColor(Color.green)

                            Text("여행중")
                                .foregroundColor(Color.green)
                                .font(.system(size:16))
                            Text("독일 여행 6일차")
                                .foregroundColor(.secondary)
                                .font(.system(size:16))
                            }
                            }
                             Image("flag")
                            .resizable()
                            .frame(width:75,height:50)
                            }
                        .padding(.horizontal,15)
                        Divider()

                       }.edgesIgnoringSafeArea(.top)
                }
                
                    }
            
         

        
        



    struct Profile_title_Previews: PreviewProvider {
        static var previews: some View {
            Profile_title()
        }
    }

