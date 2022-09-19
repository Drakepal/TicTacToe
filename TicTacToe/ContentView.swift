//
//  ContentView.swift
//  TicTacToe
//
//  Created by PM Student on 9/19/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var moves: [String] = Array(repeating: "", count: 9)
    @State var isPlaying = true
    @State var gameOver = false
    @State var msg = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15) {
                    
                    ForEach(0..<9, id: \.self) { index in
                        ZStack {
                            
                            Color.blue
                            
                            Color.white
                                .opacity(moves[index] == "" ? 1 : 0)
                            
                            Text(moves[index])
                                .font(.system(size: 55))
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .opacity(moves[index] != "" ? 1 : 0)
                            
                        }
                        .frame(width: getWidth(),
                        height: getWidth())
                    .cornerRadius(15)
                    .rotation3DEffect(
                        .init(degrees: moves[index] != "" ? 180 : 0), axis: (x:0.0, y: 1.0, z: 0.0),
                        anchor: .center,
                        anchorZ: 0.0,
                        perspective: 1.0
                        )
                        
                    .onTapGesture(perform : {
                                    withAnimation(Animation.easeIn(duration: 0.5)) {
                                        
                                        if moves[index] == "" {
                                        
                                        moves[index] = isPlaying ? "X" : "O"
                                        isPlaying.toggle()
                                            
                                }
                            }
                        })
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
