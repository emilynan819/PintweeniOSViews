//
//  CommentDetails.swift
//  SangamBeta
//
//  Created by Emily Nan on 2020/01/15.
//  Copyright © 2020 Emily Nan. All rights reserved.
//

import SwiftUI

struct CommentDetails: View {
    
    
    @State private var usedWords = [String]()
    @State private var rootWord = "Comments"
    @State private var newWord = ""
    
    //  @Binding var isPresented : Bool
    
    let names = ["Ford", "Mark", "Lily", "Rose", "Jhon"]
    var number = 3
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                friendComments()
                
                List(usedWords, id: \.self) {
                    //    Image(self.names[Int(arc4random_uniform(5))])
                    
                    Image(self.names[self.number])
                        .resizable()
                        .frame(width: 40, height: 40)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                    //  Text(self.names[Int(arc4random_uniform(5))])
                    Text($0)
                    //  Text("\(type(of: Date()).init())")
                }.padding(5)
                
                
            }
            .navigationBarTitle(rootWord)
        }
    }
    
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // exit if the remaining string is empty
        guard answer.count > 0 else {
            return
        }
        
        // new word appeared at the top of the list
        //usedWords.insert(answer, at: 0)
        
        // new word appeared at the end of the list
        usedWords.append(answer)
        newWord = ""
    }
}

struct CommentDetails_Previews: PreviewProvider {
    
    
    static var previews: some View {
        CommentDetails()
    }
}

struct friendComments : View {
    
    var body : some View {
        VStack(alignment: .leading){
            HStack{
                Image("Mark")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                Text("It sounds great!!!")
                Spacer()
            }
            HStack{
                Image("Jhon")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                Text("I like it !!!")
                Spacer()
            }
            HStack{
                Image("Lily")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                Text("I like it, too !!!")
                Spacer()
            }
            
        }.padding(.leading, 18)
        
    }
}
