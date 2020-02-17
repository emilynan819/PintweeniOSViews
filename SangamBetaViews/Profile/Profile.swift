//
//  Profile.swift
//  View3
//
//  Created by Emily Nan on 2020/02/03.
//  Copyright © 2020 Emily Nan. All rights reserved.
//
import SwiftUI

struct Profile: View {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
     var body: some View {
      VStack{
                Profile_title()
                    .frame(height:310)
                Profile_count()
                    .frame(height:screenHeight*2/10)
                Profile_worldmap()
                    .frame(height:screenHeight/4)
             //   Spacer()
               
               
            }
     }
}
struct Profile_Previews: PreviewProvider {
        static var previews: some View {
            Profile()
        }
    }
