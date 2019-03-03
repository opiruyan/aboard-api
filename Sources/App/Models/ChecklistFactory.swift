struct ChecklistFactory {
    static var stepsCounter = 0;
    
    static func checklist(with steps: [String]) -> Array<ChecklistStep> {
        return steps.map {
            stepsCounter += 1;
            return ChecklistStep(id:stepsCounter, item: $0, status: nil);
        }
    }
}
