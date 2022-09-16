//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Battal Uçar on 11.07.2022.
//

import SwiftUI

extension Image {
    func iconModifier() -> some View {
        self
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 110, height: 110)
    }
}

extension Text {
    func textModifier() -> some View {
        self
            .font(.title2)
            .fontWeight(.semibold)
            .scaledToFit()
            .minimumScaleFactor(0.6)
    }
}

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks, id: \.id) { framework in
                        FrameworkView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetail: $viewModel.isShowingDetailView)
            }
        }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
    }
}

struct FrameworkView: View {
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .iconModifier()
            Text(framework.name)
                .textModifier()
        }
        .padding()
    }
}
