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
    
    @State private var winner = "arrow.triangle.2.circlepath.circle"
 
    
    var body: some View {
        VStack {
            Text("Очки: \(pointsCountOne)")
                .font(.system(size: 24))
                .bold()
                .rotationEffect(.degrees(180))
            
            Image(systemName: imageOne)
                .resizable()
                .scaledToFit()
            
            Image(systemName: winner)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
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
            showTheWinner()
        }
        
        .padding()
    }

    private func getTheWinner() {
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
    
    private func showTheWinner() {
        if pointsCountOne > pointsCountTwo {
            winner = "arrowshape.up"
        } else if pointsCountOne < pointsCountTwo {
            winner = "arrowshape.down"
        } else {
            winner = "arrow.triangle.2.circlepath.circle"
        }
    }
}

#Preview {
    ContentView()
}

