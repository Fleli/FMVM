
/// An RValue expression.
public indirect enum FMExpression {
    
    /// A literal integer
    case integer(value: Int)
    
    /// A local variable declared in the same function.
    case local(variable: FMLocal)
    
    // ...
    
}
