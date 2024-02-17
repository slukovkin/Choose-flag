//
//  ContentView.swift
//  Choose Flags
//
//  Created by Sergey Lukovkin on 16.02.2024.
//

import SwiftUI

struct ContentView: View {

    @State private var countries = [
        "brazil",
        "canada",
        "china",
        "germany",
        "ireland",
        "italy",
        "sweden",
        "turkey",
        "uk",
        "ukraine"
    ].shuffled()

    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var totalScore = 0

    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

            VStack {
                
                Text(countries[correctAnswer].uppercased())
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.regular)

                ForEach(0..<3) { idx in
                    Button(action: {
                        if idx == self.correctAnswer {
                            incrementScore()
                        } else {
                            decrementScore()
                        }
                    }, label: {
                        Image(self.countries[idx])
                            .resizable()
                            .clipShape(Capsule())
                            .frame(maxWidth: .infinity, maxHeight: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .overlay(Capsule()
                                        .stroke(Color.black, lineWidth: 2))
                            .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .padding(.horizontal, 50)
                    })
                }

                Text("Общий счёт: \(totalScore)")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding(.vertical, 20)
                Spacer()
            }
        }
    }

    private func incrementScore() {
        totalScore += 1
        askQuestion()
    }

    private func decrementScore() {
        totalScore -= 1
        askQuestion()
    }

    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
