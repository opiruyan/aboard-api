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
    let firstStage = Stage(name: "Introduction", description: "New colleagues' on-boarding FAQ", steps:firstStageSteps.checklist)
    return [firstStage];
}
