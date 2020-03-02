//
//  Created by Saleh-Jan, Robin on 28/02/2020.
//

extension TransactionDemoViewDefaultData {
    static var BothPartiesConfirmedHandoverDemoViewModel = TransactionModel(
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
                state: .completed,
                title: "Kontrakt",
                body: "Begge har signert kontrakten.",
                primaryButton: TransactionStepPrimaryButtonModel(
                    text: "Gå til kontrakt",
                    style: "flat",
                    urlString: "https://www.google.com/search?q=contract+signed"
                )),

            TransactionStepModel(
                state: .completed,
                title: "Betaling",
                body: "Kjøper betalte 1. februar 2020.",
                detail: "Utbetalingen starter først når begge har bekreftet at overleveringen har skjedd."),

            TransactionStepModel(
                state: .completed,
                title: "Overlevering",
                body: "Dere har bekreftet at overleveringen har skjedd."),

            TransactionStepModel(
                state: .completed,
                title: "Gratulerer med salget!",
                body: "Du kan finne igjen bilen i Mine kjøretøy under «Eide før».",
                detail: "Det kan ta noen dager før pengene dukker opp på kontoen din.")
    ])
}