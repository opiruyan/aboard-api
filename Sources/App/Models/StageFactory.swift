struct StageFactory {
    static func stage(with name: String, description: String, steps: Array<ChecklistStep>?) -> Stage<ChecklistStep> {
        return Stage<ChecklistStep>(name: name, description: description, steps:steps)
    }
}
