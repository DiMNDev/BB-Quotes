//
//  QuoteView.swift
//  BB Quotes
//
//  Created by Joshua Arnold on 4/29/24.
//

import SwiftUI

struct QuoteView: View {
    @StateObject private var viewModel = ViewModel(controller: FetchController())
    @State private var detail: Bool = false
    let show: String
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(show.lowerNoSpaces)
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                VStack {
                VStack {
                    Spacer(minLength: 150)
                    switch viewModel.status {
                    case .success(data: let data): Text("\"\(data.quote.quote)\"")
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .padding()
                            .background(.black.opacity(0.5))
                            .clipShape(.rect(cornerRadius: 25))
                            .padding(.horizontal)
                        
                        ZStack(alignment: .bottom) {
                            //                            Image("jessepinkman")
                            //                                .resizable()
                            //                                .scaledToFit()
                            AsyncImage(url: data.character.images[0]) { Image in
                                Image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                            .onTapGesture {
                                detail.toggle()
                            }
                            .sheet(isPresented: $detail, content: {
                                CharacterView(show: show, character: data.character)
                            })
                            
                            Text("\(data.quote.character)")
                                .foregroundStyle(.white)
                                .padding(10)
                                .frame(maxWidth: .infinity)
                                .background(.ultraThinMaterial)
                        }
                        .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                        .clipShape(.rect(cornerRadius: 80))
                        
                    case .fetching:
                        ProgressView()
                        
                    default:
                        EmptyView()
                    }
                    Spacer()
                }
                    Button {
                        Task {
                            await viewModel.getData(for: show)
                        }
                    }
                    label: {
                        Text("Get Random Quote")
                            .font(.title)
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color("\(show.trimWhiteSpace)Button"))
                            .clipShape(.rect(cornerRadius: 12))
                            .shadow(color: Color("\(show.trimWhiteSpace)Shadow"), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    Spacer(minLength: 180)
                }
                .frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView(show: Constants.bbName).preferredColorScheme(.dark)
}
