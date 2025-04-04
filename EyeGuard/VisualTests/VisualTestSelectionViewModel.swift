//
//  VisualTestSelectionViewModel.swift
//  NavigationControl
//
//  Created by Alumno on 03/04/25.
//

import Foundation
import SwiftUI

enum VisualTestNames: String {
    case snellen = "Astigmatismo"
    case visualAcuity = "Agudeza visual"
    case ocularFatigue = "Fatiga ocular"
    case colorBlindness = "Daltonismo"
}

struct VisualTest: Hashable {
    let id: UUID = UUID()
    let name: VisualTestNames
    var view: AnyView? = nil

    static func == (lhs: VisualTest, rhs: VisualTest) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    mutating func addView(view: AnyView) {
        self.view = view
    }
}

struct VisualTestsResults {
    var snellen: Snellen?
    var visualAcuity: VisualAcuity?
    var colorBlindness: ColorBlindness?
    var ocularFatigue: OcularFatigue?
}

final class VisualTestSelectionViewModel: ObservableObject {
    @Published var selectedTests: Set<VisualTest> = []
    @Published var startTests: Bool = false
    @Published var currentIndex = 0
    @Published var results = VisualTestsResults()
    
    let availableTests: Set<VisualTest> = [
        VisualTest(name: .visualAcuity),
        VisualTest(name: .snellen),
        VisualTest(name: .colorBlindness),
        VisualTest(name: .ocularFatigue)
    ]
    
    func selectTest(_ visualTest: VisualTest, wtih view: AnyView) {
        var mutatingVisualTest = visualTest
        mutatingVisualTest.addView(view: view)
        self.selectedTests.insert(mutatingVisualTest)    }
    
    func toggleSelectedTest(_ visualTest: VisualTest, view: AnyView) {
        if self.selectedTests.contains(visualTest) {
            self.selectedTests.remove(visualTest)
        } else {
            selectTest(visualTest, wtih: view)
        }
    }
    
    func nextTest() {
        currentIndex += 1
    }
    
    func getResults() -> VisualTestsResults {
        results
    }
    
    func resetSelection() {
        currentIndex = 0
        selectedTests.removeAll()
        results = VisualTestsResults()
    }
}
