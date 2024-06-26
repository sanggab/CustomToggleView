//
//  SwiftUIView.swift
//  
//
//  Created by Gab on 2024/05/09.
//

import SwiftUI

/// Knob Padding
///
/// Switch의 Knob의 Padding 모델
/// 잡는 방식은 padding() modifier랑 동일하다
///
/// - Parameters:
///   - edges: The set of edges to pad for this view. The default
///     is ``Edge/Set/all``.
///   - length: An amount, given in points, to pad this view on the
///     specified edges. The default value of this parameter is `zero`.
struct KnobPadding: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(edges.rawValue)
        hasher.combine(length)
    }
    
    var edges: Edge.Set
    var length: CGFloat
    
    init(_ edges: Edge.Set = .all, _ length: CGFloat = .zero) {
        self.edges = edges
        self.length = length
    }
}

/// Toggle Model
///
/// 기본적인 글자하고 버튼의 간격, 버튼 사이즈, 버튼 radius를 다룬다
///
/// - Parameters:
///   - spacing: Label하고 Switch 사이의 간격. 기본값은 `zero`.
///   - buttonSize: Switch의 사이즈. 기본값은 `CGSize(width: 36, height: 20)`.
///   - buttonRadius: Switch의 CorenrRadius. 기본값은 `20`.
@frozen
public struct ToggleModel: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(spacing)
        hasher.combine(size.width)
        hasher.combine(size.height)
        hasher.combine(radius)
        hasher.combine(isOnColor)
        hasher.combine(isOffColor)
    }
    
    public var spacing: CGFloat
    
    public var size: CGSize
    
    public var radius: CGFloat
    
    public var isOnColor: Color
    
    public var isOffColor: Color
    
    public init(spacing: CGFloat = .zero,
                size: CGSize = CGSize(width: 36, height: 20),
                radius: CGFloat = 20,
                isOnColor: Color = .yellow,
                isOffColor: Color = .gray) {
        self.spacing = spacing
        self.size = size
        self.radius = radius
        self.isOnColor = isOnColor
        self.isOffColor = isOffColor
    }
}

struct KnobModel: Equatable {
    
    struct Edge: Equatable {
        var isOn: EdgeInsets
        
        var isOff: EdgeInsets
        
        init(isOn: EdgeInsets = EdgeInsets(top: .zero, leading: .zero, bottom: .zero, trailing: .zero),
             isOff: EdgeInsets = EdgeInsets(top: .zero, leading: .zero, bottom: .zero, trailing: .zero)) {
            self.isOn = isOn
            self.isOff = isOff
        }
    }
    
    var edge: Edge
    
    var isOnColor: Color
    
    var isOffColor: Color
    
    init(edge: Edge = Edge(),
         isOnColor: Color = .white,
         isOffColor: Color = .white) {
        self.edge = edge
        self.isOnColor = isOnColor
        self.isOffColor = isOffColor
    }
}
