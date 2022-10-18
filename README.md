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


## Credits
- [MathJax](https://github.com/mathjax/MathJax).
