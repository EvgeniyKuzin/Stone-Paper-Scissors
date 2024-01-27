//
//  ContentView.swift
//  Stone Paper Scissors
//
//  Created by Evgeniy Kuzin on 26.01.2024.
//

import SwiftUI

private let figures = ["scissors", "newspaper", "square"]

struct ContentView: View {
    
    @State private var pointsCountOne = 0
    @State private var pointsCountTwo = 0
    
    @State private var imageOne = "square"
    @State private var imageTwo = "square"
 
    
    var body: some View {
        VStack {
            Text("Очки: \(pointsCountOne)")
                .font(.system(size: 24))
                .bold()
                .rotationEffect(.degrees(180))
            
            Image(systemName: imageOne)
                .resizable()
                .scaledToFit()
            
            Image(systemName: imageTwo )
                .resizable()
                .scaledToFit()
            
            Text("Очки: \(pointsCountTwo)")
                .font(.system(size: 24))
                .bold()
        }
        .onTapGesture {
            imageOne = figures.randomElement() ?? ""
            imageTwo = figures.randomElement() ?? ""
            getTheWinner()
        }
        
        .padding()
    }

    func getTheWinner() {
        if imageOne == "scissors" && imageTwo == "newspaper" {
            pointsCountOne += 1
        } else if imageOne == "newspaper" && imageTwo == "square" {
            pointsCountOne += 1
        } else if imageOne == "square" && imageTwo == "scissors" {
            pointsCountOne += 1
            
        } else if imageTwo == "scissors" && imageOne == "newspaper" {
            pointsCountTwo += 1
        } else if imageTwo == "newspaper" && imageOne == "square" {
            pointsCountTwo += 1
        } else if imageTwo == "square" && imageTwo == "scissors" {
            pointsCountTwo += 1
        }
    }
}

#Preview {
    ContentView()
}

