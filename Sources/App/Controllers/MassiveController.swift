import Vapor

class MassiveController {
    private var userName: String?;
    private var userTeam: String?;
    
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
