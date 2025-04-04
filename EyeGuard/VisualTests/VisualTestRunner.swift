//
//  VisualTestRunner.swift
//  NavigationControl
//
//  Created by Alumno on 03/04/25.
//

import SwiftUI

struct VisualTestRunner: View {
    @ObservedObject var viewModel: VisualTestSelectionViewModel
    
    var body: some View {
        let selectedTestsArray = Array(viewModel.selectedTests)
        if viewModel.currentIndex < selectedTestsArray.count {
            let test = selectedTestsArray[viewModel.currentIndex]
            test.view
        } else {
            TestsResults(results: viewModel.results, onFinish: viewModel.resetSelection)
        }
    }
}

#Preview {
    VisualTestRunner(viewModel: VisualTestSelectionViewModel())
}
