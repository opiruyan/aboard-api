import Vapor

struct FirstStageSteps: Content {
    var name = "Very First Thing to do"
    var checklist = [ChecklistStep(item: "Get hardware, unpack, connect everything", status: nil),
                     ChecklistStep(item: "All passwords have to be more than 14 characters. Please use numbers, letters, symbols.", status: nil),
                     ChecklistStep(item: "All screen name format for 3rd party accounts is firstname.lastname", status: nil)];
}
