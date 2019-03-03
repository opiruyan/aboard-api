import Vapor

struct ChecklistStep: StepProtocol, Content {
    var id: Int;
    var item: String;
    var status: String?;
}
