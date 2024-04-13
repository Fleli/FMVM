
/// The condition for a jump to take place
public enum FMJumpCondition: FMVMEmittable {
    
    
    // MARK: Cases
    
    case always
    
    case ifTrue(expression: FMAtomicExpression)
    
    // TODO: Need to somehow capture the carry flag, so jump on carry becomes an option.
    // Investigate how this can be done later ... It does NOT exactly have top prioritu.
    
    
    // MARK: Protocol Conformance
    
    
    public func emit() -> String {
        
        switch self {
            
        case .always:
            return "always"
        case .ifTrue(let expression):
            return "if " + expression.emit()
        }
        
    }
    
    
}
