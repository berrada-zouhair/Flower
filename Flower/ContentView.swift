//
//  ContentView.swift
//  Flower
//
//  Created by BERRADA on 25/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    let colors: [Color] = [
        .red,
        .blue,
        .yellow,
        .green,
        .orange,
        .brown,
        .pink,
        .mint,
    ]
    
    @State var rotations: [Angle] = (0...7).map { index in
            .zero
    }
    
    var body: some View {
        ZStack {
            ForEach(0...7, id: \.self) { index in
                Capsule()
                    .fill(colors[index])
                    .opacity(0.3)
                    .frame(width: 100, height: 55)
                    .offset(x: 55, y: 0)
                    .rotationEffect(rotations[index])
                    .zIndex(Double(index))
            }
        }
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
                withAnimation(.easeInOut(duration: 2)) {
                    rotations = (0...7).map { index in
                            .init(degrees: Double(360 / colors.count * index))
                    }
                }
            }
            Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { timer in
                withAnimation(.easeInOut(duration: 2)) {
                    rotations = (0...7).map { index in
                            .zero
                    }
                }
                timer.invalidate()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
