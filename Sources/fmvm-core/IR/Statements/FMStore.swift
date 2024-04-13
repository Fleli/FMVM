
/// Represents a `store` statement, which stores an atomic value at an atomic location.
public struct FMStore: FMStatement {
    
    
    // MARK: Fields
    
    
    /// The value to store
    public let value: FMAtomicExpression
    
    /// The location at which to store the value
    public let location: FMAtomicExpression
    
    
    // MARK: Initializer
    
    
    init(_ value: FMAtomicExpression, _ location: FMAtomicExpression) {
        self.value = value
        self.location = location
    }
    
    
    // MARK: Protocol Conformance
    
    
    public func emit() -> String {
        return "store " + value.emit() + " at " + location.emit()
    }
    
    
}
