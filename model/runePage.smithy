namespace league.runePage

use league.common#ChampionName
use league.common#NoSuchChampion
use aws.apigateway#integration

/// A rune page suggestion for a champion
resource RunePage {
    identifiers: { 
        championName: ChampionName
    },
    read: GetRunePage,
}

/// Get A rune page for a champion 
@readonly
@integration(
    type: "aws_proxy",
    uri: "arn:aws:apigateway:${AWS::Region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${AWS::Region}:${AWS::AccountId}:function:${AWS::StackName}-GetRunePageLambda/invocations",
    httpMethod: "POST"
)
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
    championName: ChampionName
}

structure GetRunePageOutput {
    // "required" is used on output to indicate if the service
    // will always provide a value for the member.
    @required
    name: String,

    @required
    runes: RuneList,

    @required
    juliOmeter: Integer
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
