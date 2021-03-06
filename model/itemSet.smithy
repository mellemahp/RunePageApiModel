namespace league.itemSet

use league.common#ChampionName
use league.common#NoSuchChampion
use aws.apigateway#integration

/// An item set recommendation for a champion
resource ItemSet {
    identifiers: { 
        championName: ChampionName
    },
    read: GetItemSet,
}

/// Get A rune page for a champion 
@readonly
@integration(
    type: "aws_proxy",
    uri: "arn:aws:apigateway:${AWS::Region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${AWS::Region}:${AWS::AccountId}:function:${AWS::StackName}-GetItemSetLambda/invocations",   
    httpMethod: "POST"
)
@http(
    method: "GET", 
    uri: "/itemSet/{championName}"
)
operation GetItemSet {
    input: GetItemSetInput,
    output: GetItemSetOutput,
    errors: [NoSuchChampion]
}

structure GetItemSetInput {
    @required
    @httpLabel
    championName: ChampionName
}

structure GetItemSetOutput {
    // "required" is used on output to indicate if the service
    // will always provide a value for the member.
    @required
    name: String,

    @required
    startingItems: ItemList,

    @required
    mythicItem: Item,

    @required
    items: ItemList
}

list ItemList {
    member: Item
}

structure Item { 

    @required
    itemTier: ItemTier, 

    @required
    uniqueEffects: String,

    abilityPower: Integer,

    attackDamage: Integer, 

    armor: Integer, 

    magicResist: Integer, 

    health: Integer, 

    mana: Integer, 

    abilityHaste: Integer,

    adaptiveForce: Integer, 

    magicPenetration: Integer, 

    cooldownReduction: Integer, 

    manaRegeneration: Integer, 

    armorPenetration: Integer, 

    attackSpeed: Integer,

    criticalStrikeChance: Integer, 

    lifeSteal: Integer, 

    omniVamp: Integer, 

    physicalVamp: Integer,

    healthRegen: Integer, 

    tenacity: Integer, 

    energy: Integer, 

    energyRegeneration: Integer,

    goldGeneration: Integer, 

    moveSpeed: Integer, 

    range: Integer

}

@enum([
    { 
        value: "STARTER",
        name: "STARTER"
    },
    { 
        value: "BASIC",
        name: "BASIC"
    },
    { 
        value: "EPIC",
        name: "EPIC"
    },
    { 
        value: "LEGENDARY",
        name: "LEGENDARY"
    },
    { 
        value: "MYTHIC",
        name: "MYTHIC"
    }
])
string ItemTier