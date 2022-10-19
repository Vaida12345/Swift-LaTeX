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
        BinaryComponent(lhs: lhs, operator: BinaryOperator.plus, rhs: rhs)
    }
    
    static func - (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: BinaryOperator.minus, rhs: rhs)
    }
    
    static func * (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: BinaryOperator.times, rhs: rhs)
    }
    
    static func / (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: BinaryOperator.divide, rhs: rhs)
    }
    
    static func == (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: BinaryRelation.equal, rhs: rhs)
    }
    
    static func > (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: BinaryRelation.greater, rhs: rhs)
    }
    
    static func >= (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: BinaryRelation.greaterEqual, rhs: rhs)
    }
    
    static func < (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: BinaryRelation.less, rhs: rhs)
    }
    
    static func <= (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: BinaryRelation.lessEqual, rhs: rhs)
    }
    
    static func ^ (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: "^", rhs: rhs)
    }
    
    static func -- (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: "_", rhs: rhs)
    }
    
}

public func sqrt(_ x: some LaTeXComponent) -> some LaTeXComponent {
    x.accent(.init("sqrt"))
}
 
extension String: LaTeXComponent {
    
    public var latexExpression: String {
        self
    }
    
}
