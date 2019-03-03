import Vapor

struct Stage<T: StepProtocol>: Content {
    var name: String;
    var description: String;
    var checklist: [T]?;
    var mustComplete: Bool?;
    
    init(name: String, description: String, steps: [T]?, mustComplete: Bool?) {
        self.name = name;
        self.description = description;
        self.checklist = steps;
        self.mustComplete = mustComplete;
    }
}
