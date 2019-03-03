import Vapor

struct FirstStageSteps: Content {
    var name = "Very First Thing to do"
    var checklist = [ChecklistStep(item: "Do first thing", status: nil),
                     ChecklistStep(item: "Do second", status: nil),
                     ChecklistStep(item: "Do third", status: nil)];
}
