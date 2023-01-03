//
//  ContentView.swift
//  ProfileCard
//
//  Created by HaBV on 09/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    
    var body: some View {
        ZStack{
            Color(red: 0.09, green: 0.63, blue: 0.52, opacity: 0.52).edgesIgnoringSafeArea(.all)
            VStack {
                Image("mrBean")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                Text("Mr Bean")
                    .font(Font.custom("Pacifico-Regular", size: 32))
                    .bold()
                    .foregroundColor(.white)
                Text("ios Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                Divider()
                InfoView(iconName: "phone.fill", text: "0986458888")
                
                Divider()
                InfoView(iconName: "envelope", text: "abc@gmail.com")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
    }
}


