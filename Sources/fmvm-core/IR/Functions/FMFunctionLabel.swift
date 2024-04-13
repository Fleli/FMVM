
public class FMFunctionLabel: Hashable, Equatable {
    
    
    // MARK: Properties
    
    
    /// The name of this label. This name must be universally unique.
    public let name: String
    
    /// The label's list of statements.
    public let statements: [FMStatement]
    
    // MARK: Initializer
    
    
    /// Initialize a function label from a (unique) name.
    /// Th elist of statements will start out empty.
    init(_ name: String) {
        
        self.name = name
        
        self.statements = []
        
    }
    
    
    // MARK: Mutating Methods
    
    
    // MARK: Protocol Conformance
    
    
    public static func == (lhs: FMFunctionLabel, rhs: FMFunctionLabel) -> Bool {
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        
    }
    
    
}
