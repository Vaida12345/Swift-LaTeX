# Swift LaTeX

![LaTeX_project_logo_bird Medium](https://user-images.githubusercontent.com/91354917/196522108-766c7286-d726-4bca-bbfe-b8ba64774175.png)


Display LaTeX using [MathJax](https://github.com/mathjax/MathJax). The package also provides a custom LaTeX DSL, which enables you write LaTeX the way you write SwiftUI Views.

## LaTeX with SwiftUI

A View called `LaTeXView` is avaiable to display formulas in LaTeX. 

```swift
import LaTeX
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        LaTeXView(formula: "\\pi")
    }
    
}
```
---
As a javascript package was used to render LaTeX, the Outgoing network Connections needs to be enabled in Project Sandbox.

## LaTeX DSL

This part was designed with the goal of writing LaTeX the way you write SwiftUI.

```swift
let formula = LaTeXBuilder.build {
    Greek.varepsilon * sqrt(Limit("x", to: MiscSymbols.infinity) { variable in
        variable ^ 2
    })

    BinaryRelation.equal
        .not()
        .stackrel("?")

    0
}
```
<img width="135" alt="equation" src="https://user-images.githubusercontent.com/91354917/196680356-54bc33a1-77c6-4249-991c-105319c892a8.png">

Note that the `Components` are translated to LaTeX only when `.latexExpression` is called.
```swift
print(formula)
// TupleComponents<(BinaryComponent<Greek, BinaryOperator, Sqrt<Limit<String, MiscSymbols, BinaryComponent<String, String, Int>>>>, LaTeXModifiedContent<LaTeXModifiedContent<BinaryRelation, NotComponent>, Stackrel<String>>, Int)>(value: (LaTeX.BinaryComponent<LaTeX.Greek, LaTeX.BinaryOperator, LaTeX.(unknown context at $105604b44).Sqrt<LaTeX.Limit<Swift.String, LaTeX.MiscSymbols, LaTeX.BinaryComponent<Swift.String, Swift.String, Swift.Int>>>>(lhs: LaTeX.Group<LaTeX.Greek>(source: LaTeX.Greek(latexExpression: "\\varepsilon"), includeBrackets: false), operator: LaTeX.BinaryOperator(latexExpression: "\\times"), rhs: LaTeX.Group<LaTeX.(unknown context at $105604b44).Sqrt<LaTeX.Limit<Swift.String, LaTeX.MiscSymbols, LaTeX.BinaryComponent<Swift.String, Swift.String, Swift.Int>>>>(source: LaTeX.(unknown context at $105604b44).Sqrt<LaTeX.Limit<Swift.String, LaTeX.MiscSymbols, LaTeX.BinaryComponent<Swift.String, Swift.String, Swift.Int>>>(showLine: true, power: 2, source: LaTeX.Group<LaTeX.Limit<Swift.String, LaTeX.MiscSymbols, LaTeX.BinaryComponent<Swift.String, Swift.String, Swift.Int>>>(source: LaTeX.Limit<Swift.String, LaTeX.MiscSymbols, LaTeX.BinaryComponent<Swift.String, Swift.String, Swift.Int>>(lowerBound: LaTeX.Group<LaTeX.BinaryComponent<Swift.String, LaTeX.Arrow, LaTeX.MiscSymbols>>(source: LaTeX.BinaryComponent<Swift.String, LaTeX.Arrow, LaTeX.MiscSymbols>(lhs: LaTeX.Group<Swift.String>(source: "x", includeBrackets: false), operator: LaTeX.Arrow(latexExpression: "\\to"), rhs: LaTeX.Group<LaTeX.MiscSymbols>(source: LaTeX.MiscSymbols(latexExpression: "\\infty"), includeBrackets: false)), includeBrackets: false), body: LaTeX.Group<LaTeX.BinaryComponent<Swift.String, Swift.String, Swift.Int>>(source: LaTeX.BinaryComponent<Swift.String, Swift.String, Swift.Int>(lhs: LaTeX.Group<Swift.String>(source: "x", includeBrackets: false), operator: "^", rhs: LaTeX.Group<Swift.Int>(source: 2, includeBrackets: false)), includeBrackets: false)), includeBrackets: false)), includeBrackets: false)), LaTeX.LaTeXModifiedContent<LaTeX.LaTeXModifiedContent<LaTeX.BinaryRelation, LaTeX.NotComponent>, LaTeX.Stackrel<Swift.String>>(content: LaTeX.LaTeXModifiedContent<LaTeX.BinaryRelation, LaTeX.NotComponent>(content: LaTeX.BinaryRelation(latexExpression: "="), modifier: LaTeX.NotComponent()), modifier: LaTeX.Stackrel<Swift.String>(content: "?")), 0), buildStrategy: (Function))

print(formula.latexExpression)
// \varepsilon\times{\sqrt{\lim_{x\to\infty} x^2}} \stackrel{?}{\not =} 0
```


## Using Swift LaTeX

If you are working on a Swift Package, use
```swift
// inside Package.swift
dependencies: [
    .package(url: "https://github.com/Vaida12345/Swift-LaTeX.git")
],
```
Otherwise, use the project link to find this package in Xcode.


## Credits
- [MathJax](https://github.com/mathjax/MathJax).
