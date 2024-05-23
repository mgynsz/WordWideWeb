//
//  LaunchView.swift
//  WordWideWeb
//
//  Created by David Jang on 5/23/24.
//

import SwiftUI

public struct LaunchView: View {
    
    @State private var positions: [CGPoint]
    let words: [String]
    
    public init() {
        self.words =  "Hello,World,Swift,Programming,Apple,Code,Develop,App,Design,Function,Variable,Constant,Array,Dictionary,String,Int,Double,Float,Bool,Class,Struct,Enum,Protocol,Extension,Framework,Library,Package,Manager,Xcode,Simulator,Interface,Builder,Preview,Playground,Project,File,Folder,Commit,Push,Pull,Merge,Branch,Debug,Release,Profile,Test,Deploy,Version,Control,Git,Repository,Clone,Fetch".components(separatedBy: ",")
        self._positions = State(initialValue: Array(repeating: .zero, count: words.count))
    }
    
    public var body: some View {
        ZStack {
            GeometryReader { proxy in
                ZStack {
                    Color.clear
                    ForEach(Array(self.words.enumerated()), id: \.offset) { index, word in
                        Text(word)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(index % 2 == 0 ? Color.secondary : Color.primary)
                            .position(positions[index])
                            .onAppear {
                                moveWord(index: index, in: proxy.size)
                            }
                    }
                }
                .onAppear {
                    for index in 0..<positions.count {
                        positions[index] = CGPoint(x: CGFloat.random(in: 0...proxy.size.width),
                                                   y: CGFloat.random(in: 0...proxy.size.height))
                    }
                }
            }
        }
        .background(Color.bg)
    }
    
    private func moveWord(index: Int, in size: CGSize) {
        withAnimation(Animation.linear(duration: Double.random(in: 4...6)).repeatForever(autoreverses: true)) {
            positions[index] = CGPoint(x: CGFloat.random(in: 0...size.width), y: CGFloat.random(in: 0...size.height))
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}

