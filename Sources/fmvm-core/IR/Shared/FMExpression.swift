
/// An RValue expression.
public indirect enum FMExpression: CustomStringConvertible {
    
    /// A literal integer
    case integer(value: Int)
    
    /// A local variable declared in the same function.
    case local(variable: FMLocal)
    
    // ...
    
    
    /// A description of the expression.
    public var description: String {
        
        switch self {
            
        case .integer(let value):
            return value.description
        case .local(let variable):
            return variable.description
        }
        
    }
    
    
}
