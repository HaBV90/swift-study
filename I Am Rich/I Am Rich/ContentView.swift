//
//  ContentView.swift
//  I Am Rich
//
//  Created by HaBV on 09/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(UIColor.systemTeal).edgesIgnoringSafeArea(.all)
            VStack {
                Text("I Am Rich")
                    .padding()
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}
