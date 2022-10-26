//
//  LaTeXBuilder.swift
//
//
//  Created by Vaida on 10/19/22.
//


@resultBuilder
public struct LaTeXBuilder {

    /// The components used to build the result.
    public typealias Component = LaTeXComponent

    public static func buildBlock<C: Component>(_ component: C) -> C {
        component
    }
    
    public static func buildOptional<T: Component>(_ component: T?) -> OptionalComponent<T> {
        .init(wrapped: component)
    }
    
    public static func buildBlock<C0: LaTeXComponent,
                                  C1: LaTeXComponent> (_ c0: C0, _ c1: C1) -> TupleComponents<(C0, C1)> {
        TupleComponents((c0, c1))
    }
    
    public static func buildBlock<C0: LaTeXComponent,
                                  C1: LaTeXComponent,
                                  C2: LaTeXComponent> (_ c0: C0, _ c1: C1, _ c2: C2) -> TupleComponents<(C0, C1, C2)> {
        TupleComponents((c0, c1, c2))
    }
    
    public static func buildBlock<C0: LaTeXComponent,
                                  C1: LaTeXComponent,
                                  C2: LaTeXComponent,
                                  C3: LaTeXComponent> (_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> TupleComponents<(C0, C1, C2, C3)> {
        TupleComponents((c0, c1, c2, c3))
    }
    
    public static func buildBlock<C0: LaTeXComponent,
                                  C1: LaTeXComponent,
                                  C2: LaTeXComponent,
                                  C3: LaTeXComponent,
                                  C4: LaTeXComponent> (_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> TupleComponents<(C0, C1, C2, C3, C4)> {
        TupleComponents((c0, c1, c2, c3, c4))
    }
    
    public static func buildBlock<C0: LaTeXComponent,
                                  C1: LaTeXComponent,
                                  C2: LaTeXComponent,
                                  C3: LaTeXComponent,
                                  C4: LaTeXComponent,
                                  C5: LaTeXComponent> (_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> TupleComponents<(C0, C1, C2, C3, C4, C5)> {
        TupleComponents((c0, c1, c2, c3, c4, c5))
    }
    
    public static func buildBlock<C0: LaTeXComponent,
                                  C1: LaTeXComponent,
                                  C2: LaTeXComponent,
                                  C3: LaTeXComponent,
                                  C4: LaTeXComponent,
                                  C5: LaTeXComponent,
                                  C6: LaTeXComponent> (_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> TupleComponents<(C0, C1, C2, C3, C4, C5, C6)> {
        TupleComponents((c0, c1, c2, c3, c4, c5, c6))
    }
    
    public static func buildBlock<C0: LaTeXComponent,
                                  C1: LaTeXComponent,
                                  C2: LaTeXComponent,
                                  C3: LaTeXComponent,
                                  C4: LaTeXComponent,
                                  C5: LaTeXComponent,
                                  C6: LaTeXComponent,
                                  C7: LaTeXComponent> (_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> TupleComponents<(C0, C1, C2, C3, C4, C5, C6, C7)> {
        TupleComponents((c0, c1, c2, c3, c4, c5, c6, c7))
    }
    
    public static func buildBlock<C0: LaTeXComponent,
                                  C1: LaTeXComponent,
                                  C2: LaTeXComponent,
                                  C3: LaTeXComponent,
                                  C4: LaTeXComponent,
                                  C5: LaTeXComponent,
                                  C6: LaTeXComponent,
                                  C7: LaTeXComponent,
                                  C8: LaTeXComponent> (_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> TupleComponents<(C0, C1, C2, C3, C4, C5, C6, C7, C8)> {
        TupleComponents((c0, c1, c2, c3, c4, c5, c6, c7, c8))
    }
    
    public static func buildBlock<C0: LaTeXComponent,
                                  C1: LaTeXComponent,
                                  C2: LaTeXComponent,
                                  C3: LaTeXComponent,
                                  C4: LaTeXComponent,
                                  C5: LaTeXComponent,
                                  C6: LaTeXComponent,
                                  C7: LaTeXComponent,
                                  C8: LaTeXComponent,
                                  C9: LaTeXComponent> (_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> TupleComponents<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)> {
        TupleComponents((c0, c1, c2, c3, c4, c5, c6, c7, c8, c9))
    }
    
    public static func build(@LaTeXBuilder _ body: () -> some LaTeXComponent) -> some LaTeXComponent {
        body()
    }
    
}
