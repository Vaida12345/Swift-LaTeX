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

$$ {{\nabla\times{\overrightarrow{\mathbf{B}}}}-{{\color{3a81f6} \frac{1}{C}}} \frac{\delta \overrightarrow{\mathbf{E}}}{\delta t}}={4 \pi \rho} $$

```swift
let formula = LaTeXBuilder.build {
    Equals {
        Subtraction {
            Multiplication {
                nabla
            } by: {
                "B".font(.mathbf).overRightArrowed()
            }
        } by: {
            Fraction(1, "C")
                .colored(.blue)
        }
        
        Fraction {
            delta
            "E".font(.mathbf).overRightArrowed()
        } denominator: {
            delta
            "t"
        }
    } with: {
        4
        pi
        rho
    }
}
```

Note that the `Components` are translated to LaTeX only when `.latexExpression` is called.
```swift
print(formula)
// TupleComponents<...>(...)

print(formula.latexExpression)
// {{\nabla\times{\overrightarrow{\mathbf{B}}}}-{{\color{3a81f6} \frac{1}{C}}} \frac{\delta \overrightarrow{\mathbf{E}}}{\delta t}}={4 \pi \rho}
```

$$ \int\_{-N}^N {e^x \\, \mathrm{d}x} $$

```swift
Integral("x", from: "-N", to: "N") { variable in
    Power {
        "e"
    } with: {
        variable
    }
}
```

$$ {R\_\theta}={\begin{bmatrix}\cos\theta & -\sin\theta \\\\ \sin\theta & \cos\theta\end{bmatrix}} $$

```swift
Equals {
    Subscript {
        "R"
    } with: {
        theta
    }
} with: {
    LaTeXMatrix {
        [
            [cos(theta), -sin(theta)],
            [sin(theta),  cos(theta)]
        ]
    }
}
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
