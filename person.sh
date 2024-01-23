curl -k -XGET  'https://salesfueldata:df0e4910e506@219.90.64.120:9203/persons/_search'  -d'
   {
   "query": {
    "bool": {
      "must": [],
      "filter": [
        {
          "range": {
            "createdAt": {
              "format": "strict_date_optional_time",
              "gte": "2023-09-17",
              "lte": "2024-01-18"
            }
          }
        },
        {
          "exists": {
            "field": "emails.email"
          }
        },
        {
          "exists": {
            "field": "companies.companyWebsite"
          }
        },
        {
          "exists": {
            "field": "companies.companyName"
          }
        }
      ],
      "should": [],
      "must_not": [
        {
          "bool": {
            "minimum_should_match": 1,
            "should": [
              {
                "match_phrase": {
                  "emails.email": "*gmail.com"
                }
              }
            ]
          }
        }
      ]
  }
  }
  }' | jq -r 'to_entries|map(.value)|@csv'
