
/// Represents a local variable
public struct FMLocal: CustomStringConvertible {
    
    /// The name of the variable.
    public let name: String
    
    /// The type of the variable.
    public let type: FMType
    
    /// The value of the local variable.
    public let rhs: FMExpression
    
    /// Initialize a new local variable with name and type.
    public init(_ name: String, _ type: FMType, _ rhs: FMExpression) {
        self.name = name
        self.type = type
        self.rhs = rhs
    }
    
    /// A readable description of the declaration
    public var description: String {
        return "declare " + name + ": " + type.description
    }
    
}
