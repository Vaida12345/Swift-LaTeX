//
//  Wrapper.swift
//  
//
//  Created by Vaida on 10/19/22.
//


private struct Wrapper<Source: LaTeXComponent>: LaTeXComponent {
    
    private let source: Source
    
    private let name: Name
    
    enum Name: String {
        case overLine = "overline"
        case underLine = "underline"
        
        case overRightArrow = "overrightarrow"
        case overLeftArrow = "overleftarrow"
    }
    
    init(_ name: Name, @LaTeXBuilder source: () -> Source) {
        self.name = name
        self.source = source()
    }
    
    var latexExpression: String {
        "\\\(name.rawValue){\(self.source.latexExpression)}"
    }
    
}


public extension LaTeXComponent {
    
    func overLined() -> some LaTeXComponent {
        Wrapper(.overLine, source: { self })
    }
    
    func underLined() -> some LaTeXComponent {
        Wrapper(.underLine, source: { self })
    }
    
    func overRightArrowed() -> some LaTeXComponent {
        Wrapper(.overRightArrow, source: { self })
    }
    
    func overLeftArrowed() -> some LaTeXComponent {
        Wrapper(.overLeftArrow, source: { self })
    }
    
}
