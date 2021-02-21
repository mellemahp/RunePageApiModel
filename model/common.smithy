namespace league.common

// Name of a League of Legends champion 
@pattern("^[A-Za-z0-9 ]+$")
string ChampionName

// Unable to find champion with specified name
@error("client")
structure NoSuchChampion {
    @required
    championName: String
}