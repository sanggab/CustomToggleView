//
//  SwiftUIView.swift
//  
//
//  Created by Gab on 2024/05/09.
//

import SwiftUI

final class CustomToggleViewModel: ObservableObject {
    
    struct State: Equatable {
        var model: ToggleModel = ToggleModel()
        
        var isOnBgColor: Color = .yellow
        var isOffBgColor: Color = .gray
        
//        var isOnKnobEdge: EdgeInsets = EdgeInsets(top: .zero, leading: .zero, bottom: .zero, trailing: .zero)
//        var isOffKnobEdge: EdgeInsets = EdgeInsets(top: .zero, leading: .zero, bottom: .zero, trailing: .zero)
        
        var knobModel: KnobModel = KnobModel()
    }
    
    @Published var state: State = State()
    
    
    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<CustomToggleViewModel.State, V>) -> V {
        return state[keyPath: keyPath]
    }

}
