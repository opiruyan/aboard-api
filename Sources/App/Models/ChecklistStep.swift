import Vapor

struct ChecklistStep: StepProtocol, Content {
    var item: String;
    var status: String?
}
