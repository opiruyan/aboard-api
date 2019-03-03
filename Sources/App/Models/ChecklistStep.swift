import Vapor

struct checklistStep: StepProtocol, Content {
    var item: String;
    var status: String?
}
