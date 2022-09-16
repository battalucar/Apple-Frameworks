//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Battal Uçar on 12.07.2022.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework: Framework
    
    @Binding var isShowingDetail: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        ScrollView {
            VStack {
                    HStack {
                        Spacer()
                        
                        Button {
                            isShowingDetail = false
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(Color(.label))
                        }
                        .padding()
                    }
                FrameworkView(framework: framework)
                Text(framework.description)
                    .font(.body)
                    .padding()
                Spacer()
                
                Button {
                    isShowingSafariView = true
                } label: {
                    AFButton(buttonText: "Learn More")
                }
                .fullScreenCover(isPresented: $isShowingSafariView) {
                    SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
                }
            }
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetail: .constant(false))
            .preferredColorScheme(.dark)
    }
}
