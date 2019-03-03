import Vapor

struct Jorney: Content {
    var name: String;
    var team: String;
    var steps: [Stage<ChecklistStep>];
    
    init(user name: String, ofTeam: String, stages: [Stage<ChecklistStep>]) {
        self.name = name;
        self.team = ofTeam;
        self.steps = stages;
    }
}
