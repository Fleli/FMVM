
/// Represents a jump to another label within the same function.
public struct FMJump: FMStatement {
    
    
    // MARK: Fields
    
    
    /// The label to jump to if the condition evaluates to `true`
    public let label: FMFunctionLabel
    
    /// The condition to evaluate
    public let condition: FMJumpCondition
    
    
    // MARK: Initializer
    
    
    init(_ label: FMFunctionLabel, _ condition: FMJumpCondition) {
        self.label = label
        self.condition = condition
    }
    
    
    // MARK: Protocol Conformance
    
    
    public func emit() -> String {
        return "jump " + label.name + " " + condition.emit()
    }
    
    
}
