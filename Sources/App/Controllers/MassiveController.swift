import Vapor

class MassiveController {
    private let router: Router;
    public var userName: String? {
        didSet {
            self.router.get("api", "dashboard/\(self.userName!)", use: self.showDashboard);
        }
    };
    private var userTeam: String?;
    
    init(router: Router) {
        self.router = router;
    }
    
    func showDashboard(_ req: Request) -> DashboardResponse {
        return dashboard(req);
    }
    
    func startWizard(_ req: Request) throws -> Future<Jorney> {
        let wizardFuture = try req.content.decode(WizardRequest.self)
        let jorney = onBoardJorney();
        return wizardFuture.map(to: Jorney.self) { loginRequest in
            self.userName = loginRequest.name;
            self.userTeam = loginRequest.team;
            return jorney;
        }
    }
}
