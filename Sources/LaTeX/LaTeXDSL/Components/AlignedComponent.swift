//
//  Aligned Component.swift
//
//
//  Created by Vaida on 10/26/22.
//


import SwiftUI


public struct VerticalComponent<T>: LaTeXComponent {
    
    private let content: TupleComponents<T>
    
    private let alignment: HorizontalAlignment
    
    public var latexExpression: String {
        switch alignment {
        case .center:
            return content.components.map(\.latexExpression).joined(separator: "\\\\\n")
        case .leading:
            return "\\begin{align}" + content.components.map { "&\($0.latexExpression)" }.joined(separator: "\\\\\n") + "\\end{align}"
        case .trailing:
            return "\\begin{align}" + content.components.map(\.latexExpression).joined(separator: "\\\\\n") + "\\end{align}"
        default:
            fatalError()
        }
    }
    
    public func evaluated() -> EvaluatedResult<TupleComponents<T>.EvaluatedResultType> {
        self.content.evaluated()
    }
    
    private init(content: TupleComponents<T>, alignment: HorizontalAlignment) {
        self.content = content
        self.alignment = alignment
    }
    
    public init(@LaTeXBuilder content: () -> TupleComponents<T>) {
        self.init(content: content(), alignment: .center)
    }
    
    /// Note this alignment works independently with SwiftUI.
    public func aligned(_ alignment: HorizontalAlignment) -> VerticalComponent<T> {
        .init(content: self.content, alignment: alignment)
    }
    
}
