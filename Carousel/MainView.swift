//
//  ContentView.swift
//  Carousel
//
//  Created by Jundan Harish on 10/12/22.
//

import SwiftUI

struct MainView: View {
    // MARK: - PROPERTIES
    //    private var card : CardView
    @State var card = cardViews
    @State private var isShowing: Bool = false
    
    // MARK: - BODIES
    var body: some View {
        VStack(alignment: .leading) {
            titleView
            
            if isShowing {
                VStack(alignment: .leading) {
                    Image("share")
                        .resizable()
                        .scaledToFit()
                    
                    VStack(alignment: .leading) {
                        Text("iOS")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Text("New Share API")
                            .font(.system(size: 35, design: .rounded))
                            .fontWeight(.heavy)
                        
                        Text("iSwift Bootcamp".uppercased())
                            .font(.system(size:15))
                            .foregroundColor(.gray)
                        
                        HStack {
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                        }
                        .padding(.vertical)
                        .foregroundColor(.yellow)
                        
                        Text("The new Transferable protocol makes your data available for the clipboard, drag and drop, and the Share Sheet, which can now be invoked directly using SwiftUI.")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.gray)
                        
                    }
                    .padding()
                    
                }
                
                .cornerRadius(20)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray)
                        .opacity(0.1)
                }
                .transition(.scaleAndOffset)
            } else {
                VStack(alignment: .leading) {
                    Image("navigation")
                        .resizable()
                        .scaledToFit()
                    
                    VStack(alignment: .leading) {
                        Text("SwiftUI")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Text("Navigation API")
                            .font(.system(size: 35, design: .rounded))
                            .fontWeight(.heavy)
                        
                        Text("iSwift Bootcamp".uppercased())
                            .font(.system(size:15))
                            .foregroundColor(.gray)
                        
                        HStack {
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                        }
                        .padding(.vertical)
                        .foregroundColor(.yellow)
                        
                        Text("Leverage programmatic control over your app’s navigation behavior to set its launch state, manage transitions between size classes, respond to deep links, and more.")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.gray)
                        
                    }
                    .padding()
                    
                    
                }
                .cornerRadius(20)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray)
                        .opacity(0.1)
                    
                }
                .transition(.scaleAndOffset)
            }
            
            Spacer()
        } // VStack
        .padding()
        .onTapGesture {
            withAnimation(Animation.spring()){
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
}

extension AnyTransition {

    static var scaleAndOffset: AnyTransition {
        AnyTransition.asymmetric(insertion: .scale(scale: 0, anchor: .bottomTrailing), removal: .offset(x: 1500, y: 900).combined(with: .scale).combined(with: .opacity))
        }
}
