
/// Represents a local variable declaration.
public struct FMLocal: FMStatement {
    
    
    // MARK: Fields
    
    
    /// The name of the variable.
    public let name: String
    
    /// The type of the variable.
    public let type: FMType
    
    /// The value of the local variable.
    public let rhs: FMExpression
    
    
    // MARK: Initializer
    
    
    /// Initialize a new local variable with name and type.
    public init(_ name: String, _ type: FMType, _ rhs: FMExpression) {
        self.name = name
        self.type = type
        self.rhs = rhs
    }
    
    
    // MARK: Protocol Conformance
    
    
    public func emit() -> String {
        return "local " + name + ": " + type.emit() + " = " + rhs.emit()
    }
    
    
}
