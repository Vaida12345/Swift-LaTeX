//
//  LaTeX Component.swift
//  
//
//  Created by Vaida on 10/19/22.
//


/// A component that makes up LaTeX.
public protocol LaTeXComponent {
    
    /// The expression in LaTeX.
    var latexExpression: String { get }
    
    /// The syntax in python.
    var pyDescription: String { get }
    
    associatedtype EvaluatedResultType: LaTeXComponent
    
    /// Evaluate the current expression.
    func evaluated() -> EvaluatedResult<EvaluatedResultType>
    
}
 
extension String: LaTeXComponent {
    
    public var latexExpression: String {
        self
    }
    
    public var pyDescription: String {
        self.latexExpression
    }
    
    public func evaluated() -> EvaluatedResult<String> {
        .symbolic(self)
    }
    
}

extension Double: LaTeXComponent {
    
    public var latexExpression: String {
        self.description
    }
    
    public var pyDescription: String {
        self.latexExpression
    }
    
    public func evaluated() -> EvaluatedResult<Never> {
        .numeric(self)
    }
    
}

extension Int: LaTeXComponent {
    
    public var latexExpression: String {
        self.description
    }
    
    public var pyDescription: String {
        self.latexExpression
    }
    
    public func evaluated() -> EvaluatedResult<Never> {
        .numeric(Double(self))
    }
    
}

extension Never: LaTeXComponent {
    
    public var latexExpression: String {
        fatalError()
    }
    
    public var pyDescription: String {
        self.latexExpression
    }
    
    public func evaluated() -> EvaluatedResult<String> {
        fatalError()
    }
    
}
