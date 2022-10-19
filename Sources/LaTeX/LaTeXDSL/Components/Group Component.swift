//
//  Group Component.swift
//  
//
//  Created by Vaida on 10/19/22.
//


/// A group of LaTeX components.
public struct Group<Source: LaTeXComponent>: LaTeXComponent {
    
    private let source: Source
    
    private let includeBrackets: Bool
    
    public var latexExpression: String {
        if includeBrackets {
            return "{\\left( \(self.source.latexExpression) \\right)}"
        } else {
            return "{\(self.source.latexExpression)}"
        }
    }
    
    /// Create a new group.
    ///
    /// - Parameters:
    ///   - source: The content contained.
    ///   - includeBrackets: A bool determining whether it should be contained in round brackets.
    public init(_ source: Source, includeBrackets: Bool = false) {
        self.source = source
        self.includeBrackets = includeBrackets
    }
    
    /// Create a new group.
    ///
    /// - Parameters:
    ///   - source: The content contained.
    ///   - includeBrackets: A bool determining whether it should be contained in round brackets.
    public init(includeBrackets: Bool = false, _ source: () -> Source) {
        self.source = source()
        self.includeBrackets = includeBrackets
    }
    
}
