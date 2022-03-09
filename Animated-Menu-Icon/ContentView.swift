//
//  ContentView.swift
//  Menu-Icon
//
//  Created by simge on 9.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isRotating = false
    @State private var isHidden = false
    
    var body: some View {
        VStack{
            
            Rectangle() //top
                .frame(width: 64, height: 10)
                .cornerRadius(4)
                .rotationEffect(.degrees(isRotating ? 48:0),anchor:.leading)
            
            Rectangle() //middle
                .frame(width:64,height:10)
                .cornerRadius(4)
                .scaleEffect(isHidden ? 0:1 , anchor: isHidden ? .trailing : .leading)
                .opacity(isHidden ? 0:1)
            
            Rectangle() //bottom
                .frame(width:64 , height:10)
                .cornerRadius(4)
                .rotationEffect(.degrees(isRotating ? -48:0) , anchor: .leading)
        }
        .onTapGesture {
            withAnimation(.interpolatingSpring(stiffness: 300, damping: 15)){
                isRotating.toggle()
                isHidden.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
