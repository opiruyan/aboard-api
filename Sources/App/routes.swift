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
    
    
    
    let controller = MassiveController(router: router)
    router.post("api", "wizard", use: controller.startWizard);
    router.get("admin", "user-progress", use: controller.adminWizards);
}

func dashboard(_ team: String) -> DashboardResponse {
    return DashboardResponse(teamName: team);
}

func onBoardJorney(for user: String, team: String) -> Jorney {
    let stages = jrn();
    return Jorney(user: user, ofTeam: team, stages: stages);
}

func jrn() -> [Stage<ChecklistStep>] {
    let firstStage = StageFactory.stage(with: "Introduction", description: "New colleagues' on-boarding FAQ", steps: nil);
    let secondStage = StageFactory.stage(with: "Prerequisites", description: "New colleagues' on-boarding FAQ", steps: ChecklistFactory.checklist(with: secondSteps()));
    let thirdStage =
        StageFactory.stage(with: "Network setup", description: "New colleagues' on-boarding FAQ", steps: ChecklistFactory.checklist(with: thirdSteps()));
    let fourthStage =
        StageFactory.stage(with: "Get access to email", description: "New colleagues' on-boarding FAQ", steps: ChecklistFactory.checklist(with: fourthSteps()));
    let fifthStage = StageFactory.beStrict(true).stage(with: "Setup email signature", description: "New colleagues' on-boarding FAQ", steps: ChecklistFactory.checklist(with: fifthSteps()));
    let finalStage = StageFactory.stage(with: "Done", description: "Welcome to our family!", steps: nil)
    return [firstStage, secondStage, thirdStage, fourthStage, fifthStage, finalStage];
}

func secondSteps() -> [String] {
    return ["Get hardware, unpack, connect everything",
            "All passwords have to be more than 14 characters. Please use numbers, letters, symbols.",
            "All screen name format for 3rd party accounts is firstname.lastname"
    ];
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
