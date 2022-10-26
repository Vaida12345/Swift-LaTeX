//
//  Tuple Components.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct TupleComponents<T>: LaTeXComponent {
    
    var value: T
    
    internal var components: [AnyComponent] {
        if let tuple = self.value as? (Any, Any) {
            return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!]
        } else if let tuple = self.value as? (Any, Any) {
            return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!]
        } else if let tuple = self.value as? (Any, Any, Any) {
            return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!, AnyComponent(from: tuple.2)!]
        } else if let tuple = self.value as? (Any, Any, Any, Any) {
            return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!, AnyComponent(from: tuple.2)!, AnyComponent(from: tuple.3)!]
        } else if let tuple = self.value as? (Any, Any, Any, Any, Any) {
            return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!, AnyComponent(from: tuple.2)!, AnyComponent(from: tuple.3)!, AnyComponent(from: tuple.4)!]
        } else if let tuple = self.value as? (Any, Any, Any, Any, Any, Any) {
            return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!, AnyComponent(from: tuple.2)!, AnyComponent(from: tuple.3)!, AnyComponent(from: tuple.4)!, AnyComponent(from: tuple.5)!]
        } else if let tuple = self.value as? (Any, Any, Any, Any, Any, Any, Any) {
            return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!, AnyComponent(from: tuple.2)!, AnyComponent(from: tuple.3)!, AnyComponent(from: tuple.4)!, AnyComponent(from: tuple.5)!, AnyComponent(from: tuple.6)!]
        } else if let tuple = self.value as? (Any, Any, Any, Any, Any, Any, Any, Any) {
            return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!, AnyComponent(from: tuple.2)!, AnyComponent(from: tuple.3)!, AnyComponent(from: tuple.4)!, AnyComponent(from: tuple.5)!, AnyComponent(from: tuple.6)!, AnyComponent(from: tuple.7)!]
        } else if let tuple = self.value as? (Any, Any, Any, Any, Any, Any, Any, Any, Any) {
            return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!, AnyComponent(from: tuple.2)!, AnyComponent(from: tuple.3)!, AnyComponent(from: tuple.4)!, AnyComponent(from: tuple.5)!, AnyComponent(from: tuple.6)!, AnyComponent(from: tuple.7)!, AnyComponent(from: tuple.8)!]
        } else if let tuple = self.value as? (Any, Any, Any, Any, Any, Any, Any, Any, Any, Any) {
            return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!, AnyComponent(from: tuple.2)!, AnyComponent(from: tuple.3)!, AnyComponent(from: tuple.4)!, AnyComponent(from: tuple.5)!, AnyComponent(from: tuple.6)!, AnyComponent(from: tuple.7)!, AnyComponent(from: tuple.8)!, AnyComponent(from: tuple.9)!]
        } else {
            return [AnyComponent(from: self.value)!]
        }
    }
    
    public var latexExpression: String {
        self.components.map(\.latexExpression).joined(separator: " ")
    }
    
    public func evaluated() -> EvaluatedResult<Self> {
        .symbolic(self)
    }
    
    internal init(_ value: T) {
        self.value = value
    }
    
}
