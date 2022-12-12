//
//  SwiftUIView.swift
//  Carousel
//
//  Created by Jundan Harish on 10/12/22.
//

import SwiftUI

struct SwiftUIView: View {
    let colors = [Color.red, Color.green, Color.blue]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        ForEach(colors, id: \.self) { color in
              Text(color.description)
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
