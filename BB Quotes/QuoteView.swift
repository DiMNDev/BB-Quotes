//
//  QuoteView.swift
//  BB Quotes
//
//  Created by Joshua Arnold on 4/29/24.
//

import SwiftUI

struct QuoteView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("breakingbad")
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                VStack {
                    Text("\"You either run from things, or you face them, Mr. White.\"")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.black.opacity(0.5))
                        .clipShape(.rect(cornerRadius: 25))
                        .padding(.horizontal)

                    ZStack(alignment: .bottom) {
                        Image("jessepinkman")
                            .resizable()
                            .scaledToFit()
                        Text("Jesse Pinkman")
                            .foregroundStyle(.white)
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                    }
                    .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                    .clipShape(.rect(cornerRadius: 80))
                }
                .frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView().preferredColorScheme(.dark)
}
