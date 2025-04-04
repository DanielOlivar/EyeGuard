//
//  VisualTestsSelection.swift
//  NavigationControl
//
//  Created by Alumno on 03/04/25.
//

import SwiftUI

struct VisualTestsSelection: View {
    
    @ObservedObject var viewModel = VisualTestSelectionViewModel()
    @State private var seleccionCompleta = true
        
    var body: some View {
            VStack {
                Text("Evalúa mi visión")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.colorEyeGuard)
                    .padding(.top, 30)
    
                Spacer()
    
                VStack(spacing: 20) {
                    Text("¿Quieres hacer una evaluación completa o pruebas individuales?")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
    
                    HStack(spacing: 10) {
                        Button(action: {
                            seleccionCompleta = true
                            viewModel.availableTests.forEach { test in
                                viewModel.selectTest(test, wtih: renderVisualTest(for: test.name))
                            }
                        }) {
                            Text("Evaluación completa")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.white)
                                .background(seleccionCompleta ? Color.colorEyeGuard : Color.colorEyeGuard.opacity(0.5))
                                .cornerRadius(10)
                        }
    
                        Button(action: {
                            seleccionCompleta = false
                        }) {
                            Text("Pruebas individuales")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(Color.colorEyeGuard)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.colorEyeGuard, lineWidth: 2)
                                )
                        }
                    }
                    .padding(.horizontal)

                    if !seleccionCompleta {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Elige")
                                .font(.headline)
                                .foregroundColor(.black)
    
                            ForEach(Array(viewModel.availableTests), id: \.self) { test in
                                HStack {
                                    Button(action: {
                                        viewModel.toggleSelectedTest(test, view: renderVisualTest(for: test.name))
                                    }) {
                                        Image(
                                            systemName: viewModel.selectedTests.contains(test)
                                            ? "checkmark.square.fill"
                                            : "square"
                                        )
                                        .foregroundColor(.colorEyeGuard)
                                    }
                                    Text(test.name.rawValue)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    Button(action: {
                            viewModel.startTests = true
                    }) {
                        Text("Comenzar")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                            .background(Color.colorEyeGuard)
                            .cornerRadius(10)
                            .padding(.top, 20)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(radius: 4)
                .padding()
    
                Spacer()
                Button("Reiniciar selección") {
                    viewModel.resetSelection()
                }.font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.colorEyeGuard)
                    .cornerRadius(10)
                    .padding(.top, 20)
            }.navigationDestination(isPresented: $viewModel.startTests) {
                VisualTestRunner(viewModel: viewModel)
            }
    }
    
    func renderVisualTest(for visualTestName: VisualTestNames) -> AnyView {
        switch visualTestName {
        case .colorBlindness:
            let colorBlindnessViewModel = ColorBlindnessViewModel()
            return AnyView(ColorBlindnessView(
                viewModel: colorBlindnessViewModel,
                results: $viewModel.results.colorBlindness,
                onNext: viewModel.nextTest)
            )
        case .snellen:
            let snellenViewModel = SnellenViewModel()
            return AnyView(SnellenView(
                viewModel: snellenViewModel,
                results: $viewModel.results.snellen,
                onNext: viewModel.nextTest
            ))
        case .visualAcuity:
            let visualAcuityViewModel = VisualAcuityViewModel()
            return AnyView(VisualAcuityView(
                viewModel: visualAcuityViewModel,
                results: $viewModel.results.visualAcuity,
                onNext: viewModel.nextTest
            ))
        case .ocularFatigue:
            let ocularFatigueViewModel = OcularFatigueViewModel()
            return AnyView(OcularFatigueView(
                viewModel: ocularFatigueViewModel,
                results: $viewModel.results.ocularFatigue,
                onNext: viewModel.nextTest
            ))
        default:
            return AnyView(EmptyView())
        }
    }
}

#Preview {
    VisualTestsSelection()
}
