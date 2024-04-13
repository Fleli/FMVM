
/// Represents a mathematical operation on the RHS of a declaration.
public enum FMMath: FMVMEmittable {
    
    /// Addition
    case add
    
    /// Subtraction
    /// _Note:_ FMVM does not support unary minus. Instead, the compiler has to generate the mathematical operation `0 - x` to get `-x`
    /// It's not difficult for later stages of the pipeline to check if the LHS of the subtraction is `0`, in which case it can emit an optimized negate instruction instead of a subtraction.
    /// Thus, the added complexity of another operation probably won't influence the performance of generated programs.
    case sub
    
    /// Bitwise OR
    case bitwiseOR
    
    /// Bitwise AND
    case bitwiseAND
    
    /// Boolean less-than comparison
    /// This is the only ordering operator among the four (`<`, `<=`, `>`, `>=`) supported by FMVM. The four are mostly mirrors of each
    /// other, and `x >= y` is equivalent to `not (x < y)`, which is just `1 - (x < y)` since booleans are (meant to be) closed over `{0 , 1}`.
    /// _Note:_ It is important that the implementation of lowering from FMVM's less-than operator only returns `0` or `1` to satisfy this requirement.
    case lessThan
    
    // ...
    
    /// A human-readable description of the mathematical operation
    public func emit() -> String {
        
        switch self {
            
        case .add:
            return "add"
            
        case .sub:
            return "sub"
            
        case .bitwiseOR:
            return "or"
            
        case .bitwiseAND:
            return "and"
            
        case .lessThan:
            return "lessThan"
            
        // ...
            
        }
        
    }
    
    
}
