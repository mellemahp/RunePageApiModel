namespace league.recommender

use league.runePage#RunePage
use league.itemSet#ItemSet
use aws.protocols#restJson1
use aws.apigateway#requestValidator
use aws.apigateway#integration

/// Provides recommendations for runepages and item sets for a champion
@restJson1
@title("Recommender")
@requestValidator("full")
service RecommenderService {
    version: "2006-03-01", 
    resources: [ 
        RunePage, 
        ItemSet
    ]
}