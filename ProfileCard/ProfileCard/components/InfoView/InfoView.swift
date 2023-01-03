//
//  SwiftUIView.swift
//  ProfileCard
//
//  Created by HaBV on 09/12/2022.
//

import SwiftUI

struct InfoView: View {
    let iconName: String
    let text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: iconName).foregroundColor(.green)
                Text(text).foregroundColor( Color.black)
            })
            .padding(8)
    }
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(iconName: "phone", text: "0919191919").previewLayout(.sizeThatFits)
    }
}
