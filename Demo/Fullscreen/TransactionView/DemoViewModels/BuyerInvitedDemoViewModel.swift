//
//  Copyright © 2020 FINN AS. All rights reserved.
//

extension TransactionDemoViewDefaultData {
    static var BuyerInvitedDemoViewModel = TransactionModel(
        title: "Salgsprosess",

        header: TransactionHeaderModel(
            adId: "171529672",
            title: "BMW i3",
            registrationNumber: "CF40150",
            imageUrlString: "2020/2/vertical-0/26/2/171/529/672_525135443.jpg"),

        warning: TransactionWarningModel(
            title: "AlertTitle",
            message: "You have multiple contracts open"),

        steps: [
            TransactionStepModel(
                state: .completed,
                title: "Annonsen er lagt ut",
                primaryButton: TransactionStepPrimaryButtonModel(
                    text: "Se annonsen",
                    style: "flat",
                    action: "see_ad",
                    fallbackUrlString: "www.finn.no/171529672")),

            TransactionStepModel(
                state: .active,
                title: "Kontrakt",
                body: "Kjøper har blitt invitert.",
                primaryButton: TransactionStepPrimaryButtonModel(
                    text: "Signer kontrakt",
                    style: "call_to_action",
                    urlString: "https://www.google.com/search?q=contract+signed"
                )),

            TransactionStepModel(
                state: .notStarted,
                title: "Betaling",
                body: "Kjøper betalte 1. februar 2020",
                detail: "Dere kan betale trygt gjennom FINN ved å velge det i kontrakten."),

            TransactionStepModel(
                state: .notStarted,
                title: "Overlevering",
                body: "<p>Velger dere å betale gjennom FINN, må overleveringen skje innen 7 dager etter kjøper har betalt.</p><p>Registrering av eierskiftet bør gjøres når dere møtes for overlevering.</p>"),

            TransactionStepModel(
                state: .notStarted,
                title: "Gratulerer med salget!",
                body: "Du kan finne igjen bilen i Mine kjøretøy under «Eide før».")
    ])
}