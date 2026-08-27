# swift-pair-equation

Cross-domain integration between Pair and Equation.

This package owns `Pair`'s conditional retroactive conformance to
`Equation.Protocol`. Two pairs are equal exactly when their corresponding first
and second values are equal; both component types must themselves satisfy the
Equation contract.
