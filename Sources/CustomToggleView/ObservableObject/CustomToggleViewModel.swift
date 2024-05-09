//
//  SwiftUIView.swift
//  
//
//  Created by Gab on 2024/05/09.
//

import SwiftUI

final class CustomToggleViewModel: ObservableObject {
    
    struct KnobState: Equatable {
        var knobModel: KnobModel = KnobModel()
    }
    
    struct State: Equatable {
        var model: ToggleModel = ToggleModel()
        
        var isOnColor: Color = .yellow
        var isOffColor: Color = .gray
    }
    
    @Published var state: State = State()
    
    @Published var knobState: KnobState = KnobState()
    
    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<CustomToggleViewModel.State, V>) -> V {
        return state[keyPath: keyPath]
    }
    
    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<CustomToggleViewModel.KnobState, V>) -> V {
        return knobState[keyPath: keyPath]
    }

    func updateMyProperties<V: Equatable>(_ keyPath: WritableKeyPath<CustomToggleViewModel.State, V>, _ newValue: V) {
        state[keyPath: keyPath] = newValue
    }
    
    func updateMyProperties<V: Equatable>(_ keyPath: WritableKeyPath<CustomToggleViewModel.KnobState, V>, _ newValue: V) {
        knobState[keyPath: keyPath] = newValue
    }
}
