//
//  BottomTabBar.swift
//  SangamBeta
//
//  Created by Emily Nan on 2020/02/11.
//  Copyright © 2020 Emily Nan. All rights reserved.
//

import SwiftUI

struct BottomTabBar: View {
    
    @State var selected = 0
    
    var body: some View {
        
        VStack{
  
                        if self.selected == 0 {
                            POIList()
                               // .offset(y: 10)
                        }
                        else if self.selected == 1 {
                             RouteDetail()
                           // .offset(y: 10)
                        }
                        else if self.selected == 2 {
                            SlideView()
                           // .offset(y: 10)
                        }
//                        else if self.selected == 3 {
//                            SlideView()
//                           // .offset(y: 10)
//                        }
//                        else if self.selected == 4 {
//                            CommentDetails()
//                           // .offset(y: 10)
//                        }
            Bottom(selected: self.$selected)
                .padding()
                .padding(.horizontal, 20)
                .background(Shape())
                //.shadow(radius: 5)
            
        }//.background(Color("Color").edgesIgnoringSafeArea(.top))
                  
           .edgesIgnoringSafeArea(.bottom)
    }
}

struct BottomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBar()
    }
}


struct Shape : View {
    @State var size : Double = 2
    
    var body : some View{
        
        Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 100))
            
            //   path.addArc(center: CGPoint(x: UIScreen.main.bounds.width / CGFloat(size), y: 55), radius: 30, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
            
            path.addLine(to: CGPoint(x: 0, y: 100))
            
        }.fill(Color.white)
            .rotationEffect(.init(degrees: 180))
        
    }
}


struct Bottom : View {
    
    @Binding var selected : Int
    
    var body : some View{
        
        HStack{
            
            Button(action: {
                
                self.selected = 0
                
            }) {
                if self.selected == 0 {
                 
                    Image(systemName: "magnifyingglass")
                        .padding(18)
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .clipShape(Circle())
                          .offset(y: -10)
                        .shadow(radius: 5)
//                        .animation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5))
                    
                } else {
                    VStack{
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 22))
                        .foregroundColor(.gray)
                    Text("Insperation")
                        .font(.system(size: 10))
                         .foregroundColor(.gray)
                        
                    }
                }
                
            } //.foregroundColor(self.selected == 0 ? Color("Color") : .gray)
            
            Spacer(minLength: 15)


            Button(action: {

                self.selected = 1

            }) {
                if self.selected == 1 {

                    Image(systemName:  "arrow.up.arrow.down")
                        .padding(18)
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .clipShape(Circle())
                          .offset(y: -10)
                        .shadow(radius: 5)
                } else {
                    VStack{
                    Image(systemName:  "arrow.up.arrow.down")
                        .font(.system(size: 22))
                        .foregroundColor(.gray)
                    Text("Plan")
                         .font(.system(size: 10))
                        .foregroundColor(.gray)
                    }
                }
            }

            Spacer(minLength: 15)

            Button(action: {

                self.selected = 2

            }) {
                if self.selected == 2 {
                    Image(systemName:  "square.stack.3d.up.fill")
                        .padding(18)
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.yellow)
                        .clipShape(Circle())
                          .offset(y: -10)
                        .shadow(radius: 5)
                } else {
                    VStack{
                    Image(systemName:  "square.stack.3d.up.fill")
                        .font(.system(size: 22))
                        .foregroundColor(.gray)
                    Text("Map")
                         .font(.system(size: 10))
                         .foregroundColor(.gray)
                    }
                }
            }
//
//            Spacer(minLength: 15)
//
//            Button(action: {
//
//                self.selected = 3
//
//            }) {
//
//                if self.selected == 3 {
//                    Image(systemName:   "square.stack.3d.up.fill")
//                        .padding(18)
//                        .font(.title)
//                        .foregroundColor(.white)
//                        .background(Color.yellow)
//                        .clipShape(Circle())
//                        .offset(y: -10)
//                        .shadow(radius: 5)
//                } else {
//                    VStack{
//                    Image(systemName:  "square.stack.3d.up.fill")
//                        .font(.system(size: 22))
//                        .foregroundColor(.gray)
//                    Text("My Trips")
//                         .font(.system(size: 10))
//                        .foregroundColor(.gray)
//                    }
//                }
//
//
//            }
//            Spacer(minLength: 15)
////
//            Button(action: {
//
//                self.selected = 4
//
//            }) {
//
//                if self.selected == 4 {
//                    Image(systemName:   "person.crop.circle")
//                        .padding(18)
//                        .font(.title)
//                        .foregroundColor(.white)
//                        .background(Color.yellow)
//                        .clipShape(Circle())
//                        .offset(y: -10)
//                        .shadow(radius: 5)
////                        .animation(Animation.easeOut(duration: 0.7).delay(0.7))
//                } else {
//                    VStack{
//                    Image(systemName:  "person.crop.circle")
//                        .font(.system(size: 22))
//                        .foregroundColor(.gray)
//                    Text("Profile")
//                         .font(.system(size: 10))
//                        .foregroundColor(.gray)
//                    }
//                }
//            }
        }
//       .padding(.top, (UIApplication.shared.windows.last?.safeAreaInsets.top)! + 10)
           // .background(Color.red)
            .offset( y: -25)
        
        
    }
}




