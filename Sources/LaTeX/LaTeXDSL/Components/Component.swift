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
    
}

infix operator --

public extension LaTeXComponent {
    
    static func + (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: plus, rhs: rhs)
    }
    
    static func - (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: minus, rhs: rhs)
    }
    
    static func * (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: times, rhs: rhs)
    }
    
    static func / (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: divide, rhs: rhs)
    }
    
    static func == (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: equal, rhs: rhs)
    }
    
    static func != (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: equal.not, rhs: rhs)
    }
    
    static func > (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: greater, rhs: rhs)
    }
    
    static func >= (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: greaterEqual, rhs: rhs)
    }
    
    static func < (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: less, rhs: rhs)
    }
    
    static func <= (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: lessEqual, rhs: rhs)
    }
    
    static func ^ (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: "^", rhs: rhs)
    }
    
    static func -- (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: "_", rhs: rhs)
    }
    
}
 
extension String: LaTeXComponent {
    
    public var latexExpression: String {
        self
    }
    
}

extension Double: LaTeXComponent {
    
    public var latexExpression: String {
        self.description
    }
    
}

extension Int: LaTeXComponent {
    
    public var latexExpression: String {
        self.description
    }
    
}

extension Never: LaTeXComponent {
    
    public var latexExpression: String { "" }
    
}
