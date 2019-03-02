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
    
    
    router.post("api", "wizard") { req -> Future<Response> in
        let wizardFuture = try req.content.decode(WizardRequest.self);
        let _ = wizardFuture.do({ wizard in
            print(wizard);
        });
        return Stage(name: "welcome", description: "start you jorney").encode(status: .created, for: req);
        
    }
}
