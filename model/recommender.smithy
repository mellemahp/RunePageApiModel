namespace league.recommender

use league.runePage#RunePage
use league.itemSet#ItemSet

/// Provides recommendations for runepages and item sets for a champion
@title("Recommender")
@aws.protocols#restJson1
service RecommenderService {
    version: "2006-03-01", 
    resources: [ 
        RunePage, 
        ItemSet
    ]
}