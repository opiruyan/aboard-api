struct ChecklistFactory {
    static func checklist(with steps: [String]) -> Array<ChecklistStep> {
        return steps.map { ChecklistStep(item: $0, status: nil) }
    }
}
