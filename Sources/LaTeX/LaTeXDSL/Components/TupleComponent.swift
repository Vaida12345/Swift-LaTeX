//
//  File.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct TupleComponent<T>: LaTeXComponent {
    
    public var latexExpression: String = ""
    
    private var value: T
    
    public init(_ value: T) {
        self.value = value
    }
    
}
