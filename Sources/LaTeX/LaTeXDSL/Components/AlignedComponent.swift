//
//  Aligned Component.swift
//
//
//  Created by Vaida on 10/26/22.
//


import SwiftUI


/// A set of vertically aligned components.
///
/// The default alignment is `left`, which can be changed by ``aligned(_:)``
///
/// - Note: There is no `HorizontalComponent`, ``Group`` or ``LaTeXBuilder`` would be sufficient.
public struct VerticalComponent<T>: LaTeXComponent {
    
    private let content: TupleComponents<T>
    
    private let alignment: HorizontalAlignment
    
    public var latexExpression: String {
        switch alignment {
        case .center:
            return "\\begin{gather}\n" + content.components.map(\.latexExpression).joined(separator: "\\\\\n") + "\n\\end{gather}\n"
        case .leading:
            return "\\begin{align}\n" + content.components.map { "&\($0.latexExpression)" }.joined(separator: "\\\\\n") + "\n\\end{align}\n"
        case .trailing:
            return "\\begin{align}\n" + content.components.map(\.latexExpression).joined(separator: "\\\\\n") + "\n\\end{align}\n"
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
        self.init(content: content(), alignment: .leading)
    }
    
    /// Note this alignment works independently with SwiftUI.
    ///
    /// - Bug: `.center` is not working as expected.
    public func aligned(_ alignment: HorizontalAlignment) -> VerticalComponent<T> {
        .init(content: self.content, alignment: alignment)
    }
    
}
