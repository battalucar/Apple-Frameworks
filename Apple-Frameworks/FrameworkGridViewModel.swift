//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Battal Uçar on 16.07.2022.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView = false
}
