//
//  ContentView.swift
//  TicTacToe
//
//  Created by PM Student on 9/19/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15) {
                    
                    ForEach(0..<9, id: \.self) { index in
                        Color.white
                            .frame(width: getWidth(),
                            height: getWidth())
                            .cornerRadius(15)
                    }
                    
                }
                .padding()
            }
            .navigationTitle("Tic Tac Toe")
            .preferredColorScheme(.dark)
        }
    }
    
    func getWidth() -> CGFloat {
        let width = UIScreen.main.bounds.width - (60)
        
        return width / 3
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
