//
//  AFButton.swift
//  Apple-Frameworks
//
//  Created by Battal Uçar on 15.07.2022.
//

import SwiftUI

struct AFButton: View {
    let buttonText: String
    
    var body: some View {
        Text(buttonText)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}


struct AFButton_Previews: PreviewProvider {
    static var previews: some View {
        AFButton(buttonText: "Button")
    }
}
