
/// The condition for a jump to take place
public enum FMJumpCondition: FMVMEmittable {
    
    
    // MARK: Cases
    
    /// Always jump to the given label.
    case always
    
    /// Jump to a label if `expression` is evaluated to `true`. Otherwise, jump to the label specified in `otherwise`.
    /// The reason an `otherwise` label must be supplied, is that all blocks should contain and end with exactly one `ret` or `jump` statement.
    case ifTrue(expression: FMAtomicExpression, otherwise: FMFunctionLabel)
    
    // TODO: Need to somehow capture the carry flag, so jump on carry becomes an option.
    // Investigate how this can be done later ... It does NOT exactly have top priority.
    
    
    // MARK: Protocol Conformance
    
    
    public func emit() -> String {
        
        switch self {
            
        case .always:
            return "always"
            
        case .ifTrue(let expression, let otherwise):
            return "if " + expression.emit() + " otherwise " + otherwise.name
            
        }
        
    }
    
    
}
