//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by m1 on 07/11/2024.
//

import SwiftUI

struct ContentView: View {

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US", ].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    func flagTap(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    var body: some View {
        ZStack {
            
            RadialGradient(stops: [
                .init(color: Color("CustomPurple"), location: 0.3),
                .init(color: Color("CustomPink"), location: 0.8),
            ], center: .top, startRadius: 100, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of:")
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.bold))
                    }.foregroundStyle(.white)
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTap(number)
                        } label : {
                            Image(countries[number])
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 10)
                        }
                    }
                    .alert(scoreTitle, isPresented: $showingScore) {
                        Button("Play again", action: askQuestion)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score : \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

// let c1 = Color(red: 0.4, green: 0.4, blue: 0.8)
// let c2 = Color(red: 0.7, green: 0.5, blue: 0.8)
// let c3 = Color(red: 0.6, green: 0.5, blue: 0.8)


