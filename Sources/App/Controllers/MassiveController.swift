import Vapor

class MassiveController {
    private let router: Router;
    public var userName: String?;
    private var userTeam: String? {
        didSet {
            userTeam = userTeam!.uppercased()
            let teamPoint = self.userTeam!.lowercased();
            self.router.get("api", "dashboard/\(teamPoint)", use: self.showDashboard);
        }
    };
    
    init(router: Router) {
        self.router = router;
    }
    
    func showDashboard(_ req: Request) -> DashboardResponse {
        return dashboard(self.userTeam!);
    }
    
    func startWizard(_ req: Request) throws -> Future<Jorney> {
        let wizardFuture = try req.content.decode(WizardRequest.self)
        return wizardFuture.map(to: Jorney.self) { loginRequest in
            self.userName = loginRequest.name;
            self.userTeam = loginRequest.team;
            let jorney = onBoardJorney(for: self.userName!, team: self.userTeam!);
            return jorney;
        }
    }
}
