//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Dathan Wong on 5/29/20.
//  Copyright © 2020 Dathan Wong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let options = ["Rock", "Paper", "Scissors"]
    let winOptions = ["Paper", "Scissors", "Rock"]
    let loseOptions = ["Scissors", "Rock", "Paper"]
    @State private var randomOption = Int.random(in: 0...2)
    @State private var win = Bool.random()
    @State private var score = 0
    
    var body: some View {
        VStack(spacing: 30){
            Text(options[randomOption] + " : " + (win ? "Win" : "Lose"))
            Text("Score:" + String(score))
            Button(action: {
                self.checkAnswer("Rock")
            }) {
                Image(systemName:"circle.fill")
                    .frame(width: 100, height: 50)
                    .background(Color.red)
                    .cornerRadius(15)
                    .foregroundColor(.white)
            }
            Button(action: {
                self.checkAnswer("Paper")
            }) {
                Image(systemName:"doc.fill")
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .foregroundColor(.white)
            }
            Button(action: {
                self.checkAnswer("Scissors")
            }) {
                Image(systemName: "scissors")
                    .frame(width: 100, height: 50)
                    .background(Color.green)
                    .cornerRadius(15)
                    .foregroundColor(.white)
            }
        }
    }
    
    func startRound(){
        randomOption = Int.random(in: 0...2)
        win = Bool.random()
    }
    
    func checkAnswer(_ action:String){
        if(win){
            if(action == winOptions[randomOption]){
                score += 1
            }else{
                score -= 1
            }
        }else{
            if(action == loseOptions[randomOption]){
                score += 1
            }else{
                score -= 1
            }
        }
        startRound()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
