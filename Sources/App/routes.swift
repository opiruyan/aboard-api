import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
    
    
    router.post("api", "wizard") { req -> Future<Jorney> in
        let wizardFuture = try req.content.decode(WizardRequest.self);
        let jorney = onBoardJorney();
        return wizardFuture.map(to: Jorney.self) { loginRequest in
            return jorney
        }
    }
}

func onBoardJorney() -> Jorney {
    let stages = jrn();
    return Jorney(stages: stages);
}

func jrn() -> [Stage<ChecklistStep>] {
    let firstStageSteps = FirstStageSteps()
    let firstStage = Stage<ChecklistStep>(name: "Introduction", description: "New colleagues' on-boarding FAQ", steps:nil)
    let secondStage = Stage<ChecklistStep>(name: "Prerequisites", description: "New colleagues' on-boarding FAQ", steps: firstStageSteps.checklist)
    let thirdStage = Stage<ChecklistStep>(name: "Network setup", description: "New colleagues' on-boarding FAQ", steps:ChecklistFactory.checklist(with: thirdSteps()))
    let fourthStage = Stage<ChecklistStep>(name: "Get access to email", description: "New colleagues' on-boarding FAQ", steps:ChecklistFactory.checklist(with: thirdSteps()))
    let fifthStage = Stage<ChecklistStep>(name: "Setup email signature", description: "New colleagues' on-boarding FAQ", steps:ChecklistFactory.checklist(with: thirdSteps()))
    return [firstStage, secondStage, thirdStage, fourthStage, fifthStage];
}

func thirdSteps() -> [String] {
    return ["Disable location services; Use USA location (but you can select LT timezone).",
            "Use Harbortouch Wi-Fi (if it does not work, connect to Harbortouch-guest for initial set up). Use Windows account and password (password you can find in your email. If any questions, ask Robert Zibert).",
            "Harbortouch-Guest Wi-Fi. Password:  YouDecide!"
    ];
}

func fourthSteps() -> [String] {
    return ["Open Safari",
            "Go to gmail.com",
            "Use email/password you got from IT (If not, ask Robert Zibert rzibert@shift4.com )",
            "Do not allow access to other apps."
    ];
}

func fifthSteps() -> [String] {
    return ["Open Safari",
            "Go to gmail.com",
            "Go to Settings > Upload Profile picture.",
            "Go to Settings > Signature (The template can be copied from another employee)",
            "Go to Gmail My Account > Sign-in & Security > Enable 2 Factor authentication",
            " Tick \"Insert this signature before quoted text in replies and remove the \"--\" line that precedes it.\""
    ];
}
