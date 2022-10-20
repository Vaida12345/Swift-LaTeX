//
//  Group Component.swift
//  
//
//  Created by Vaida on 10/19/22.
//


/// A group of LaTeX components.
public struct Group<Source: LaTeXComponent>: LaTeXComponent {
    
    internal let source: Source
    
    private let includeBrackets: Bool
    
    public var latexExpression: String {
        var shouldIncludeBrackets: Bool {
            if source is Double || source is Int || source is String { return false }
            if source is Arrow || source is LaTeXSymbol { return false }
            
            return true
        }
        
        if includeBrackets && shouldIncludeBrackets {
            return "{\\left( \(self.source.latexExpression) \\right)}"
        } else if includeBrackets {
            return "(\(self.source.latexExpression))"
        } else if shouldIncludeBrackets {
            return "{\(self.source.latexExpression)}"
        } else {
            return self.source.latexExpression
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
    public init(_ source: Group<Source>, includeBrackets: Bool = false) {
        self.init(source.source, includeBrackets: includeBrackets)
    }
    
    
    /// Create a new group.
    ///
    /// - Parameters:
    ///   - source: The content contained.
    ///   - includeBrackets: A bool determining whether it should be contained in round brackets.
    public init(includeBrackets: Bool = false, @LaTeXBuilder _ source: () -> Source) {
        self.init(source(), includeBrackets: includeBrackets)
    }
    
    func includeBrackets(_ bool: Bool) -> Group<Source> {
        Group(self.source, includeBrackets: bool)
    }
    
}
