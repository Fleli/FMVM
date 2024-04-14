
/// An atomic expression is one that does not include an operation. It is "simple" and "atomic" in that it's just a single value.
public enum FMAtomicExpression: FMVMEmittable {
    
    /// A literal integer
    case integer(value: Int)
    
    /// A local variable declared in the same function.
    case local(variable: FMLocal)
    
    
    // TODO: Find a clean and general way to allow global variables as well.
    // This is needed for, among other things, string references.
    // Maybe global variables should be their own case in `FMExpression`? Investigate this further ...
    
    
    /// A human-readable description of the atomic expression
    public func emit() -> String {
        
        switch self {
            
        case .integer(let value):
            return value.description
            
        case .local(let variable):
            return variable.name
            
        }
    }
    
}
