//
//  Tuple Components.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct TupleComponents<T>: LaTeXComponent {
    
    var value: T
    
    let buildStrategy: (T) -> String
    
    public var latexExpression: String {
        buildStrategy(value)
    }
    
    internal init(_ value: T, buildStrategy: @escaping (T) -> String) {
        self.value = value
        self.buildStrategy = buildStrategy
    }
    
}
