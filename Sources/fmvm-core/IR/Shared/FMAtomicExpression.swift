
/// An atomic expression is one that does not include an operation. It is "simple" and "atomic" in that it's just a single value.
public enum FMAtomicExpression: CustomStringConvertible {
    
    /// A literal integer
    case integer(value: Int)
    
    /// A local variable declared in the same function.
    case local(variable: FMLocal)
    
    /// A human-readable description of the atomic expression
    public var description: String {
        
        switch self {
            
        case .integer(let value):
            return value.description
            
        case .local(let variable):
            return variable.description
            
        }
    }
    
}
