import Vapor

struct FirstStageSteps: Content {
    var name = "Very First Thing to do"
    var checklist = [checklistStep(item: "Do first thing", status: nil),
                     checklistStep(item: "Do second", status: nil),
                     checklistStep(item: "Do third", status: nil)];
}
