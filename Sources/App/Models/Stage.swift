import Vapor

struct Stage<T: StepProtocol>: Content {
    var name: String;
    var description: String;
    var checklist: [T]?
    
    init(name: String, description: String, steps: [T]?) {
        self.name = name;
        self.description = description;
        self.checklist = steps;
    }
}
