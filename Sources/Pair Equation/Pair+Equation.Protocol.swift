public import enum Equation.Equation
public import struct Pair.Pair

extension Pair: @retroactive Equation.`Protocol`
where
    First: Equation.`Protocol` & ~Copyable,
    Second: Equation.`Protocol` & ~Copyable
{

    @inlinable
    public static func == (lhs: borrowing Pair, rhs: borrowing Pair) -> Bool {
        lhs.first == rhs.first && lhs.second == rhs.second
    }
}
