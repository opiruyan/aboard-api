import Vapor

struct Jorney: Content {
    var name = "Very First Thing to do"
    var steps: [Stage<ChecklistStep>];
    
    init(stages: [Stage<ChecklistStep>]) {
        self.name = "introduction";
        self.steps = stages;
    }
}
