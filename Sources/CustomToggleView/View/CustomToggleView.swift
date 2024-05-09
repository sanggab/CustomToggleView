// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct CustomToggleView<V: View>: View {
    @StateObject private var viewModel: CustomToggleViewModel = CustomToggleViewModel()
    
    @Binding public var isOn: Bool
    private var label: () -> V
    
    var customBackgroundView: AnyView?
    var aboveKnobView: AnyView?
    
    public init(isOn: Binding<Bool>,
                @ViewBuilder label: @escaping () -> V) {
        self._isOn = isOn
        self.label = label
    }
    
    public var body: some View {
        Text("hi")
    }
}
