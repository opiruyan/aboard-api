import Vapor

struct AdminWizards: Content {
    var wizards: Array<WizardRecord> = [
        WizardRecord(wizardId: 1, user: "Vaidotas", team: "Lighthouse", completed: 6, questions: 2, total: 10),
        WizardRecord(wizardId: 1, user: "Arunas", team: "HT Support", completed: 7, questions: 1, total: 15),
        WizardRecord(wizardId: 1, user: "Oleg", team: "Lighthouse", completed: 8, questions: 1, total: 12)
    ];
}

struct WizardRecord: Content {
    var wizardId: Int;
    var user: String;
    var team: String;
    var completed: Int;
    var questions: Int;
    var total: Int;
}
