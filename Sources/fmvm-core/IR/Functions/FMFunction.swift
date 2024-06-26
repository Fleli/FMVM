
/// Represents a function in an FMVM program
/// All functions are globally accessible and must have unique names.
public class FMFunction: FMVMEmittable {
    
    
    // MARK: Properties
    
    
    /// The (unique) name of the function.
    public let name: String
    
    /// The parameter type of the function.
    public let paramType: FMType
    
    /// The return type of the function.
    public let returnType: FMType
    
    /// The list of labels included in this function. A function is essentially just a collection of labels that work together on a achieving a goal, for example writing something to memory or returning a value.
    public var labels: Set<FMFunctionLabel>
    
    /// The function's entry label.
    /// When the function is called, the caller jumps to this label.
    private let entryLabel: FMFunctionLabel
    
    /// The function's attribute list. This includes attributes guaranteed (forced) by the user (compiler), and attributes inferred by the FMVM optimization engine.
    /// Attributes guaranteed (forced) by the compiler will be assumed to hold, even if they actually don't.
    public var attributes: Set<FMFunctionAttribute>
    
    
    // MARK: Initializer
    
    
    /// Initialize a function with a name, parameter type and return type.
    /// The attribute list is initialized to be empty.
    /// The same goes for the statement list.
    /// The user may add elements to these lists after initialization.
    public init(_ name: String, _ paramType: FMType, _ returnType: FMType) {
        
        self.name = name
        self.paramType = paramType
        self.returnType = returnType
        
        self.entryLabel = FMFunctionLabel(FMVMNames.entryLabel(name))
        self.labels = [entryLabel]
        
        self.attributes = []
        
    }
    
    
    // MARK: Protocol Conformance
    
    
    public func emit() -> String {
        return name + ": " + paramType.emit() + " -> " + returnType.emit()
        + " attrs: " + attributes.description
        + " entry @ " + entryLabel.name
        + " {\n"
        + labels.reduce("") { $0 + $1.emit() }
        + "}"
    }
    
    
}
