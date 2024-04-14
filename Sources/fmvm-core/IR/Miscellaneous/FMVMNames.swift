
/// `FMVMNames` is a name factory used to generate consistent names among the whole program.
internal enum FMVMNames {
    
    
    /// Generate a name for the entry label of a function.
    static func entryLabel(_ functionName: String) -> String {
        return "function_" + functionName + "_entry"
    }
    
    
}
