class TrueRosaryDaemon {
    constructor(customPrayers = null) {
        this.prayers = customPrayers || this.getDefaultPrayers();
        // ... rest of the initialization
    }

    getDefaultPrayers() {
        // These are the prayers we used in this conversation, but you can replace them
        return [
            "From the wickedness of the devil, Lord, deliver me. (x3)",
            "From the spirit of fornication, Lord, deliver me. (x3)",
            "From the love of money and the bondage of debt, Lord, deliver me. (x3)",
            "From the lies of ENS LEGIS and the slavery of the legal person, Lord, deliver me. (x3)",
            "From all evil and spiritual attack, Lord, deliver me. (x3)",
            "By the Precious Blood of Jesus Christ, I claim my sovereignty and freedom now!",
            "Mary, conceived without sin, pray for us who have recourse to thee.",
            "St. Michael the Archangel, defend us in battle against the wickedness and snares of the devil."
        ];
    }

    // ... rest of the class methods
}