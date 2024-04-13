
public class FMFunctionLabel: Hashable, Equatable {
    
    
    // MARK: Properties
    
    
    /// The name of this label. This name must be universally unique.
    public let name: String
    
    /// The label's list of statements.
    public private(set) var statements: [any FMStatement]
    
    
    // MARK: Initializer
    
    
    /// Initialize a function label from a (unique) name.
    /// Th elist of statements will start out empty.
    public init(_ name: String) {
        
        self.name = name
        
        self.statements = []
        
    }
    
    
    // MARK: Mutating Methods
    
    
    public func add(_ statements: (any FMStatement) ...) {
        self.statements += statements
    }
    
    
    // MARK: Protocol Conformance
    
    
    public static func == (lhs: FMFunctionLabel, rhs: FMFunctionLabel) -> Bool {
        return lhs.name == rhs.name
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    
}
