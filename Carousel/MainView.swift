//

//  ContentView.swift
//  Carousel
//
//  Created by Jundan Harish on 10/12/22.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - PROPERTIES
    @State var cardView = cardViews
    @State var currentIndex: Int = 0
    @State private var isShowing: Bool = true
    
    // MARK: - BODIES
    var body: some View {
        VStack(alignment: .leading) {
            titleView
            
            if isShowing {
                card
            } else {
                card
            }
            
            Spacer()
        } // VStack
        .padding()
        .onTapGesture {
            withAnimation(Animation.spring()){
                currentIndex = (currentIndex + 1) % cardView.count
                isShowing.toggle()
            }
        }
    }
}

// MARK: - PREVIEW
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

// MARK: - EXTENTION
extension MainView {
    private var titleView: some View {
        VStack(alignment: .leading) {
            Text("Whats new")
            Text("in SwiftUI?")
        }
        .font(.system(size: 50, design: .rounded))
        .fontWeight(.heavy)
    }
} // VStack

extension MainView {
    private var card: some View {
        VStack(alignment: .leading) {
            Image(cardView[currentIndex].image)
                .resizable()
                .scaledToFit()
            VStack(alignment: .leading) {
                Text(cardView[currentIndex].category)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                Text(cardView[currentIndex].heading)
                    .font(.system(size: 35, design: .rounded))
                    .fontWeight(.heavy)
                
                Text(cardView[currentIndex].author.uppercased())
                    .font(.system(size:15))
                    .foregroundColor(.gray)
                
                HStack {
                    ForEach(1...(cardView[currentIndex].rating), id: \.self) { item in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
                .padding(.vertical)
                .foregroundColor(.yellow)
                Text(cardView[currentIndex].excerpt)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.gray)
            }
            .padding()
            
        }// VStack
        .transition(.scaleAndOffset)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray)
                .opacity(0.1)
        }
    }
}

extension AnyTransition {
    static var scaleAndOffset: AnyTransition {
        AnyTransition.asymmetric(insertion: .scale(scale: 0, anchor: .bottomTrailing), removal: .offset(x: 500, y: 1000).combined(with: .scale).combined(with: .opacity))
        }
}
