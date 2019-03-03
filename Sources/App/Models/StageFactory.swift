struct StageFactory {
    
    private static var strict = false;
    
    static func beStrict(_ mode: Bool) -> StageFactory.Type {
        self.strict = mode;
        return self;
    }
    
    static func stage(with name: String, description: String, steps: Array<ChecklistStep>?) -> Stage<ChecklistStep> {
        let must = strict ? true : nil;
        strict = false;
        return Stage<ChecklistStep>(name: name, description: description, steps:steps, mustComplete:must)
    }
}
