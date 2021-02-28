namespace league.runePage

use league.common#ChampionName
use league.common#NoSuchChampion

/// A rune page suggestion for a champion
resource RunePage {
    identifiers: { 
        championName: String
    },
    read: GetRunePage,
}

/// Get A rune page for a champion 
@readonly
@http(
    method: "GET", 
    uri: "/runePage/{championName}"
)
operation GetRunePage {
    input: GetRunePageInput,
    output: GetRunePageOutput,
    errors: [NoSuchChampion]
}

structure GetRunePageInput {
    @required
    @httpLabel
    championName: String
}

structure GetRunePageOutput {
    // "required" is used on output to indicate if the service
    // will always provide a value for the member.
    @required
    name: String,

    @required
    runes: RuneList
}

list RuneList {
    member: Rune
}

structure Rune { 
    @required
    name: String,

    @required
    effect: String,

    @required
    type: RuneType
}

@enum([
    { 
        value: "PRECISION",
        name: "PRECISION"
    },
    { 
        value: "DOMINATION",
        name: "DOMINATION"
    },
    { 
        value: "SORCERY",
        name: "SORCERY"
    },
    { 
        value: "RESOLVE",
        name: "RESOLVE"
    },
    { 
        value: "INSPIRATION",
        name: "INSPIRATION"
    }
])
string RuneType
