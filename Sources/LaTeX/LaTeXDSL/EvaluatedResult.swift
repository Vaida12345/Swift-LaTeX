//
//  Evaluated Result.swift
//  
//
//  Created by Vaida on 10/25/22.
//


/// The result from evaluation.
///
/// Call ``LaTeXComponent/evaluated()`` to obtain instances of this enumeration.
public enum EvaluatedResult<T: LaTeXComponent> {
    
    /// Represents the result is a numerical value, expressed in Double.
    ///
    /// In this case, ``T`` is `Never`.
    case numeric(_ value: Double)
    
    /// Represents the result contains some unsolvable symbols, such as ``alpha``.
    ///
    /// Otherwise, some unsupported calculations involved, such as ``Integral(_:from:to:body:)``.
    ///
    /// In the cases where the result is symbolic, the result is simply the LaTeX Component itself.
    case symbolic(_ value: T)
    
    /// No result.
    case null
    
    
    /// The result is a numerical value, if result is ``numeric(_:)``
    public var numericValue: Double? {
        switch self {
        case .numeric(let value):
            return value
        default:
            return nil
        }
    }
    
    /// The result is a symbolic value, if result is ``symbolic(_:)``
    public var symbolicValue: T? {
        switch self {
        case .symbolic(let value):
            return value
        default:
            return nil
        }
    }
    
}
