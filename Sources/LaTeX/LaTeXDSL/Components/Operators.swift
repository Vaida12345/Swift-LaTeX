//
//  Operators.swift
//  
//
//  Created by Vaida on 10/20/22.
//


public extension LaTeXComponent {
    
    @available(*, unavailable, message: "Use Addition instead.")
    static func + (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: plus, rhs: rhs)
    }
    
    @available(*, unavailable, message: "Use Subtraction instead.")
    static func - (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: minus, rhs: rhs)
    }
    
    @available(*, unavailable, message: "Use Multiplication instead.")
    static func * (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: times, rhs: rhs)
    }
    
    @available(*, unavailable, message: "Use Division instead.")
    static func / (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: divide, rhs: rhs)
    }
    
    @available(*, unavailable, message: "Use Equals instead.")
    static func == (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: equal, rhs: rhs)
    }
    
    @available(*, unavailable, message: "Use Equals and `not` instead.")
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
    
    @available(*, unavailable, message: "Use Power instead.")
    static func ^ (lhs: Self, rhs: some LaTeXComponent) -> some LaTeXComponent {
        BinaryComponent(lhs: lhs, operator: "^", rhs: rhs)
    }
    
}


public func Addition(@LaTeXBuilder lhs: () -> some LaTeXComponent, @LaTeXBuilder with rhs: () -> some LaTeXComponent) -> some LaTeXComponent {
    BinaryComponent(lhs: lhs(), operator: plus, rhs: rhs())
}

public func Subtraction(@LaTeXBuilder lhs: () -> some LaTeXComponent, @LaTeXBuilder by rhs: () -> some LaTeXComponent) -> some LaTeXComponent {
    BinaryComponent(lhs: lhs(), operator: minus, rhs: rhs())
}

public func Multiplication(@LaTeXBuilder lhs: () -> some LaTeXComponent, @LaTeXBuilder by rhs: () -> some LaTeXComponent) -> some LaTeXComponent {
    BinaryComponent(lhs: lhs(), operator: times, rhs: rhs())
}

public func Division(@LaTeXBuilder lhs: () -> some LaTeXComponent, @LaTeXBuilder by rhs: () -> some LaTeXComponent) -> some LaTeXComponent {
    BinaryComponent(lhs: lhs(), operator: divide, rhs: rhs())
}

public func Equals(@LaTeXBuilder lhs: () -> some LaTeXComponent, @LaTeXBuilder with rhs: () -> some LaTeXComponent) -> some LaTeXComponent {
    BinaryComponent(lhs: lhs(), operator: equal, rhs: rhs())
}

public func Power(@LaTeXBuilder lhs: () -> some LaTeXComponent, @LaTeXBuilder with rhs: () -> some LaTeXComponent) -> some LaTeXComponent {
    BinaryComponent(lhs: Group(lhs()), operator: "^", rhs: Group(rhs()))
}

public func Subscript(@LaTeXBuilder lhs: () -> some LaTeXComponent, @LaTeXBuilder with rhs: () -> some LaTeXComponent) -> some LaTeXComponent {
    BinaryComponent(lhs: Group(lhs()), operator: "_", rhs: Group(rhs()))
}
