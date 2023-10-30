//
//  Group Component.swift
//  
//
//  Created by Vaida on 10/19/22.
//


/// A group of LaTeX components.
public struct Group<Source: LaTeXComponent>: LaTeXComponent {
    
    internal let source: Source
    
    private let includeRoundBrackets: Bool
    
    private let shouldIncludeCurlyBrackets: Bool?
    
    public var latexExpression: String {
        var shouldIncludeBrackets: Bool {
            if let shouldIncludeCurlyBrackets { return shouldIncludeCurlyBrackets }
            
            if source is Double || source is Int { return false }
            if let value = source as? String { if value.count == 1 { return false } }
            if source is LaTeXSymbol { return false }
            
            return true
        }
        
        if includeRoundBrackets && shouldIncludeBrackets {
            return "{\\left( \(self.source.latexExpression) \\right)}"
        } else if includeRoundBrackets {
            return "\\left( \(self.source.latexExpression) \\right)"
        } else if shouldIncludeBrackets {
            return "{\(self.source.latexExpression)}"
        } else {
            return self.source.latexExpression
        }
    }
    
    public var pyDescription: String {
        self.source.pyDescription
    }
    
    public func evaluated() -> EvaluatedResult<Source.EvaluatedResultType> {
        self.source.evaluated()
    }
    
    internal init(_ source: Source, includeRoundBrackets: Bool = false, shouldIncludeCurlyBrackets: Bool? = nil) {
        self.source = source
        self.includeRoundBrackets = includeRoundBrackets
        self.shouldIncludeCurlyBrackets = shouldIncludeCurlyBrackets
    }
    
    /// Create a new group.
    ///
    /// - Parameters:
    ///   - source: The content contained.
    ///   - includeRoundBrackets: A bool determining whether it should be contained in round brackets.
    public init(_ source: Source, includeRoundBrackets: Bool = false) {
        self.init(source, includeRoundBrackets: includeRoundBrackets, shouldIncludeCurlyBrackets: nil)
    }
    
    /// Create a new group.
    ///
    /// - Parameters:
    ///   - source: The content contained.
    ///   - includeRoundBrackets: A bool determining whether it should be contained in round brackets.
    public init(_ source: Group<Source>, includeRoundBrackets: Bool = false) {
        self.init(source.source, includeRoundBrackets: includeRoundBrackets)
    }
    
    
    /// Create a new group.
    ///
    /// - Parameters:
    ///   - source: The content contained.
    ///   - includeRoundBrackets: A bool determining whether it should be contained in round brackets.
    public init(includeRoundBrackets: Bool = false, @LaTeXBuilder _ source: () -> Source) {
        self.init(source(), includeRoundBrackets: includeRoundBrackets)
    }
    
    public func includeRoundBrackets(_ bool: Bool) -> Group<Source> {
        Group(self.source, includeRoundBrackets: bool)
    }
    
}
