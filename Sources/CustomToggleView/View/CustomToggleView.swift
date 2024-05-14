// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct CustomToggleView<Content: View>: View {
    @Binding public var isOn: Bool
    private var label: () -> Content
    
    @ObservedObject private var viewModel: CustomToggleViewModel = CustomToggleViewModel()
    
    private var customBackgroundView: AnyView?
    private var aboveKnobView: AnyView?
    
    public init(isOn: Binding<Bool>,
                @ViewBuilder label: @escaping () -> Content) {
        self._isOn = isOn
        self.label = label
    }
    
    public var body: some View {
        HStack(spacing: viewModel(\.toggleModel.spacing)) {
            label()
                .animation(nil, value: UUID())
            
            RoundedRectangle(cornerRadius: viewModel(\.toggleModel.radius))
                .fill(isOn ? viewModel(\.toggleModel.isOnColor) : viewModel(\.toggleModel.isOffColor))
                .frame(width: viewModel(\.toggleModel.size.width), height: viewModel(\.toggleModel.size.height))
                .overlay(backgroundView, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .overlay(knobView, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .overlay {
//                    if let customBackgroundView {
//                        customBackgroundView
//                    }
//                }
//                .overlay {
//                    knobView
//                }
                .onTapGesture {
                    withAnimation {
                        isOn.toggle()
                    }
                }
        }
    }
    
    @ViewBuilder
    private var backgroundView: some View {
        if let customBackgroundView {
            customBackgroundView
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var knobView: some View {
        ZStack {
            circleView
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: isOn ? .trailing : .leading)
    }
    
    @ViewBuilder
    private var circleView: some View {
        Circle()
            .fill(isOn ? viewModel(\.knobModel.isOnColor) : viewModel(\.knobModel.isOffColor))
            .overlay(customAboveKnobView, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//            .overlay {
//                if let aboveKnobView {
//                    aboveKnobView
//                }
//            }
            .padding(isOn ? viewModel(\.knobModel.edge.isOn) : viewModel(\.knobModel.edge.isOff))
    }
    
    @ViewBuilder
    private var customAboveKnobView: some View {
        if let aboveKnobView {
            aboveKnobView
        } else {
            EmptyView()
        }
    }
}

// MARK: Helper
public extension CustomToggleView {
    func custom(_ model: ToggleModel) -> CustomToggleView {
        let view = self
        view.viewModel.update(\.toggleModel, model)
        return view
    }
    
    func changeColor(on: Color = .yellow, off: Color = .gray) -> CustomToggleView {
        let view = self
        view.viewModel.update(\.toggleModel.isOnColor, on)
        view.viewModel.update(\.toggleModel.isOffColor, off)
        return view
    }
    // button의 background를 content로 교체한다
    func replaceCustomBackgroundView<V: View>(@ViewBuilder content: @escaping () -> V) -> CustomToggleView {
        var view = self
        view.customBackgroundView = AnyView(erasing: content())
        return view
    }
}

// MARK: Knob Method
public extension CustomToggleView {
    func knobColor(_ color: Color = .white) -> CustomToggleView {
        let view = self
        view.viewModel.update(\.knobModel.isOnColor, color)
        view.viewModel.update(\.knobModel.isOffColor, color)
        return view
    }
    
    func knobColor(on: Color = .white, off: Color = .white) -> CustomToggleView {
        let view = self
        view.viewModel.update(\.knobModel.isOnColor, on)
        view.viewModel.update(\.knobModel.isOffColor, off)
        return view
    }
    
    func knobPadding(_ edges: Edge.Set = .all, _ length: CGFloat = .zero) -> CustomToggleView {
        var view = self
        view.calIsOnKnobEdge(KnobPadding(edges, length))
        view.calIsOffKnobEdge(KnobPadding(edges, length))
        return view
    }
    
    func isOnKnobPadding(_ edges: Edge.Set = .all, _ length: CGFloat = .zero) -> CustomToggleView {
        var view = self
        view.calIsOnKnobEdge(KnobPadding(edges, length))
        return view
    }
    
    func isOffKnobPadding(_ edges: Edge.Set = .all, _ length: CGFloat = .zero) -> CustomToggleView {
        var view = self
        view.calIsOffKnobEdge(KnobPadding(edges, length))
        return view
    }
    
    func addViewAboveKnob<V: View>(@ViewBuilder content: @escaping () -> V) -> CustomToggleView {
        var view = self
        view.aboveKnobView = AnyView(erasing: content())
        return view
    }
    
}

private extension CustomToggleView {
    
    mutating func calIsOnKnobEdge(_ padding: KnobPadding) {
        var edge = viewModel(\.knobModel.edge.isOn)
        
        switch padding.edges {
        case .all:
            edge += EdgeInsets(top: padding.length, leading: padding.length, bottom: padding.length, trailing: padding.length)
        case .leading:
            edge.leading += padding.length
        case .trailing:
            edge.trailing += padding.length
        case .top:
            edge.top += padding.length
        case .bottom:
            edge.bottom += padding.length
        case .horizontal:
            edge.leading += padding.length
            edge.trailing += padding.length
        case .vertical:
            edge.top += padding.length
            edge.bottom += padding.length
        default:
            edge += EdgeInsets(top: padding.length, leading: padding.length, bottom: padding.length, trailing: padding.length)
        }
        
        viewModel.update(\.knobModel.edge.isOn, edge)
    }
    
    mutating func calIsOffKnobEdge(_ padding: KnobPadding ) {
        var edge = viewModel(\.knobModel.edge.isOff)
        
        switch padding.edges {
        case .all:
            edge += EdgeInsets(top: padding.length, leading: padding.length, bottom: padding.length, trailing: padding.length)
        case .leading:
            edge.leading += padding.length
        case .trailing:
            edge.trailing += padding.length
        case .top:
            edge.top += padding.length
        case .bottom:
            edge.bottom += padding.length
        case .horizontal:
            edge.leading += padding.length
            edge.trailing += padding.length
        case .vertical:
            edge.top += padding.length
            edge.bottom += padding.length
        default:
            edge += EdgeInsets(top: padding.length, leading: padding.length, bottom: padding.length, trailing: padding.length)
        }
        
        viewModel.update(\.knobModel.edge.isOff, edge)
    }
}
