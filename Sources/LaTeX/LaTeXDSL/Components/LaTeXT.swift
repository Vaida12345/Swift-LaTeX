//
//  Text.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct LaTeXT: LaTeXComponent {
    
    private let value: String
    
    private let font: Font?
    
    public var latexExpression: String {
        if let font {
            var symbol: String {
                switch font {
                case .roman:
                    return "textrm"
                case .typewriter:
                    return "texttt"
                case .medium:
                    return "textmd"
                case .upright:
                    return "textup"
                case .slanted:
                    return "textsl"
                case .emphasized:
                    return "emph"
                case .sansSerif:
                    return "textsf"
                case .bold:
                    return "textbf"
                case .italic:
                    return "textit"
                case .smallCaps:
                    return "textsc"
                case .normal:
                    return "textnormal"
                default:
                    return font.rawValue
                }
            }
            
            return "\\\(symbol){\(value)}"
        } else {
            return "\\text{\(value)}"
        }
    }
    
    private init(_ value: String, font: Font?) {
        self.value = value
        self.font = font
    }
    
    public init(_ value: String) {
        self.init(value, font: nil)
    }
    
    public func font(_ font: Font) -> LaTeXT {
        LaTeXT(value, font: font)
    }
    
    public enum Font: String {
        case roman
        case typewriter
        case medium
        case upright
        case slanted
        case emphasized
        
        case sansSerif
        case bold
        case italic
        case smallCaps
        case normal
        
        case mathcal
        case mathrm
        case mathbf
        case mathsf
        case mathtt
        case mathnormal
        case mathit
    }
    
}
