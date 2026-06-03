// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-brm-mongo.mongodb.js

// Student ID: 35174714
// Student Name: Abdul Hakim Shaon

// ===================================================================================
// DO NOT modify or remove any of the comments below (items marked with //)
// Do not use .pretty() in your code, it is not required
//
// -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
// ===================================================================================

// Use (connect to) your database - you MUST update xyz001
// with your authcate username

//use("abc001");
use("YOUR_AUTHCATE");

// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Drop collection
db.customer_quotes.drop();


// Create collection and insert documents
db.createCollection("customer_quotes");

db.customer_quotes.insertMany(
[
    {
        "_id": 1,
        "customer_name": "Michael Benjamin",
        "customer_business": "FreshBox",
        "customer_address": "55 Lonsdale Street, Melbourne, 3008",
        "customer_phone": "0478901017",
        "customer_stats": {
            "number_of_quotes": 6,
            "number_of_jobs": 6,
            "total_paid_jobcost": "$9,000.00",
            "total_unpaid_jobcost": "$4,200.00"
        },
        "quotes": [
            {
                "quote_no": 1,
                "quote_prepared_on": "02-May-2026",
                "preferred_start_date": "10-May-2026",
                "start_location": "Melbourne",
                "end_location": "Sydney",
                "quote_cost": "$1,500.00",
                "assigned_to_job": "Y",
                "job_cost": "$1,500.00"
            },
            {
                "quote_no": 2,
                "quote_prepared_on": "03-May-2026",
                "preferred_start_date": "12-May-2026",
                "start_location": "Melbourne",
                "end_location": "Geelong",
                "quote_cost": "$2,000.00",
                "assigned_to_job": "Y",
                "job_cost": "$2,000.00"
            },
            {
                "quote_no": 3,
                "quote_prepared_on": "04-May-2026",
                "preferred_start_date": "14-May-2026",
                "start_location": "Sydney",
                "end_location": "Newcastle",
                "quote_cost": "$2,500.00",
                "assigned_to_job": "Y",
                "job_cost": "$2,500.00"
            },
            {
                "quote_no": 4,
                "quote_prepared_on": "05-May-2026",
                "preferred_start_date": "16-May-2026",
                "start_location": "Brisbane",
                "end_location": "Gold Coast",
                "quote_cost": "$1,800.00",
                "assigned_to_job": "Y",
                "job_cost": "$1,800.00"
            },
            {
                "quote_no": 5,
                "quote_prepared_on": "06-May-2026",
                "preferred_start_date": "18-May-2026",
                "start_location": "Adelaide",
                "end_location": "Port Augusta",
                "quote_cost": "$2,200.00",
                "assigned_to_job": "Y",
                "job_cost": "$2,200.00"
            },
            {
                "quote_no": 6,
                "quote_prepared_on": "07-May-2026",
                "preferred_start_date": "20-May-2026",
                "start_location": "Perth",
                "end_location": "Fremantle",
                "quote_cost": "$3,000.00",
                "assigned_to_job": "Y",
                "job_cost": "$3,200.00"
            }
        ]
    },
    {
        "_id": 2,
        "customer_name": "James",
        "customer_business": "J Wood and Gravel",
        "customer_address": "15 George Street, Sydney, 2000",
        "customer_phone": "0412345001",
        "customer_stats": {
            "number_of_quotes": 6,
            "number_of_jobs": 6,
            "total_paid_jobcost": "$8,450.00",
            "total_unpaid_jobcost": "$4,100.00"
        },
        "quotes": [
            {
                "quote_no": 7,
                "quote_prepared_on": "02-May-2026",
                "preferred_start_date": "11-May-2026",
                "start_location": "Sydney",
                "end_location": "Melbourne",
                "quote_cost": "$1,200.00",
                "assigned_to_job": "Y",
                "job_cost": "$1,400.00"
            },
            {
                "quote_no": 8,
                "quote_prepared_on": "03-May-2026",
                "preferred_start_date": "13-May-2026",
                "start_location": "Melbourne",
                "end_location": "Ballarat",
                "quote_cost": "$2,100.00",
                "assigned_to_job": "Y",
                "job_cost": "$2,200.00"
            },
            {
                "quote_no": 9,
                "quote_prepared_on": "04-May-2026",
                "preferred_start_date": "15-May-2026",
                "start_location": "Brisbane",
                "end_location": "Toowoomba",
                "quote_cost": "$1,600.00",
                "assigned_to_job": "Y",
                "job_cost": "$1,750.00"
            },
            {
                "quote_no": 10,
                "quote_prepared_on": "05-May-2026",
                "preferred_start_date": "17-May-2026",
                "start_location": "Adelaide",
                "end_location": "Victor Harbor",
                "quote_cost": "$2,400.00",
                "assigned_to_job": "Y",
                "job_cost": "$2,600.00"
            },
            {
                "quote_no": 11,
                "quote_prepared_on": "06-May-2026",
                "preferred_start_date": "19-May-2026",
                "start_location": "Perth",
                "end_location": "Bunbury",
                "quote_cost": "$1,900.00",
                "assigned_to_job": "Y",
                "job_cost": "$1,900.00"
            },
            {
                "quote_no": 12,
                "quote_prepared_on": "07-May-2026",
                "preferred_start_date": "21-May-2026",
                "start_location": "Melbourne",
                "end_location": "Albury",
                "quote_cost": "$2,700.00",
                "assigned_to_job": "Y",
                "job_cost": "$2,700.00"
            }
        ]
    },
    {
        "_id": 3,
        "customer_name": "Brook",
        "customer_business": "Western Chocolatery",
        "customer_address": "23 Murray Street, Perth, 6000",
        "customer_phone": "0445678004",
        "customer_stats": {
            "number_of_quotes": 6,
            "number_of_jobs": 6,
            "total_paid_jobcost": "$8,200.00",
            "total_unpaid_jobcost": "$4,500.00"
        },
        "quotes": [
            {
                "quote_no": 13,
                "quote_prepared_on": "08-May-2026",
                "preferred_start_date": "22-May-2026",
                "start_location": "Sydney",
                "end_location": "Wollongong",
                "quote_cost": "$1,350.00",
                "assigned_to_job": "Y",
                "job_cost": "$1,350.00"
            },
            {
                "quote_no": 14,
                "quote_prepared_on": "09-May-2026",
                "preferred_start_date": "23-May-2026",
                "start_location": "Brisbane",
                "end_location": "Cairns",
                "quote_cost": "$3,100.00",
                "assigned_to_job": "Y",
                "job_cost": "$3,100.00"
            },
            {
                "quote_no": 15,
                "quote_prepared_on": "10-May-2026",
                "preferred_start_date": "24-May-2026",
                "start_location": "Melbourne",
                "end_location": "Bendigo",
                "quote_cost": "$1,750.00",
                "assigned_to_job": "Y",
                "job_cost": "$1,750.00"
            },
            {
                "quote_no": 16,
                "quote_prepared_on": "11-May-2026",
                "preferred_start_date": "25-May-2026",
                "start_location": "Adelaide",
                "end_location": "Mount Gambier",
                "quote_cost": "$2,250.00",
                "assigned_to_job": "Y",
                "job_cost": "$2,250.00"
            },
            {
                "quote_no": 17,
                "quote_prepared_on": "12-May-2026",
                "preferred_start_date": "26-May-2026",
                "start_location": "Perth",
                "end_location": "Geraldton",
                "quote_cost": "$1,400.00",
                "assigned_to_job": "Y",
                "job_cost": "$1,400.00"
            },
            {
                "quote_no": 18,
                "quote_prepared_on": "13-May-2026",
                "preferred_start_date": "27-May-2026",
                "start_location": "Sydney",
                "end_location": "Canberra",
                "quote_cost": "$2,850.00",
                "assigned_to_job": "Y",
                "job_cost": "$2,850.00"
            }
        ]
    },
    {
        "_id": 4,
        "customer_name": "Alexander Noah",
        "customer_business": "-",
        "customer_address": "56 Bourke Street, Melbourne, 3001",
        "customer_phone": "0478901007",
        "customer_stats": {
            "number_of_quotes": 6,
            "number_of_jobs": 2,
            "total_paid_jobcost": "$1,650.00",
            "total_unpaid_jobcost": "$3,200.00"
        },
        "quotes": [
            {
                "quote_no": 19,
                "quote_prepared_on": "14-May-2026",
                "preferred_start_date": "28-May-2026",
                "start_location": "Melbourne",
                "end_location": "Mildura",
                "quote_cost": "$1,650.00",
                "assigned_to_job": "Y",
                "job_cost": "$1,650.00"
            },
            {
                "quote_no": 20,
                "quote_prepared_on": "15-May-2026",
                "preferred_start_date": "29-May-2026",
                "start_location": "Brisbane",
                "end_location": "Mackay",
                "quote_cost": "$3,200.00",
                "assigned_to_job": "Y",
                "job_cost": "$3,200.00"
            },
            {
                "quote_no": 21,
                "quote_prepared_on": "16-May-2026",
                "preferred_start_date": "30-May-2026",
                "start_location": "Sydney",
                "end_location": "Tamworth",
                "quote_cost": "$1,850.00",
                "assigned_to_job": "N",
                "job_cost": "-"
            },
            {
                "quote_no": 22,
                "quote_prepared_on": "17-May-2026",
                "preferred_start_date": "01-Jun-2026",
                "start_location": "Adelaide",
                "end_location": "Whyalla",
                "quote_cost": "$2,350.00",
                "assigned_to_job": "N",
                "job_cost": "-"
            },
            {
                "quote_no": 23,
                "quote_prepared_on": "18-May-2026",
                "preferred_start_date": "02-Jun-2026",
                "start_location": "Perth",
                "end_location": "Kalgoorlie",
                "quote_cost": "$1,250.00",
                "assigned_to_job": "N",
                "job_cost": "-"
            },
            {
                "quote_no": 24,
                "quote_prepared_on": "19-May-2026",
                "preferred_start_date": "03-Jun-2026",
                "start_location": "Melbourne",
                "end_location": "Shepparton",
                "quote_cost": "$2,950.00",
                "assigned_to_job": "N",
                "job_cost": "-"
            }
        ]
    },
    {
        "_id": 5,
        "customer_name": "Jack Ethan",
        "customer_business": "-",
        "customer_address": "61 Ann Street, Brisbane, 4101",
        "customer_phone": "0434567013",
        "customer_stats": {
            "number_of_quotes": 6,
            "number_of_jobs": 0,
            "total_paid_jobcost": "-",
            "total_unpaid_jobcost": "-"
        },
        "quotes": [
            {
                "quote_no": 25,
                "quote_prepared_on": "20-May-2026",
                "preferred_start_date": "04-Jun-2026",
                "start_location": "Brisbane",
                "end_location": "Rockhampton",
                "quote_cost": "$1,550.00",
                "assigned_to_job": "N",
                "job_cost": "-"
            },
            {
                "quote_no": 26,
                "quote_prepared_on": "21-May-2026",
                "preferred_start_date": "05-Jun-2026",
                "start_location": "Sydney",
                "end_location": "Dubbo",
                "quote_cost": "$3,300.00",
                "assigned_to_job": "N",
                "job_cost": "-"
            },
            {
                "quote_no": 27,
                "quote_prepared_on": "22-May-2026",
                "preferred_start_date": "06-Jun-2026",
                "start_location": "Adelaide",
                "end_location": "Renmark",
                "quote_cost": "$1,950.00",
                "assigned_to_job": "N",
                "job_cost": "-"
            },
            {
                "quote_no": 28,
                "quote_prepared_on": "23-May-2026",
                "preferred_start_date": "07-Jun-2026",
                "start_location": "Perth",
                "end_location": "Albany",
                "quote_cost": "$2,450.00",
                "assigned_to_job": "N",
                "job_cost": "-"
            },
            {
                "quote_no": 29,
                "quote_prepared_on": "24-May-2026",
                "preferred_start_date": "08-Jun-2026",
                "start_location": "Melbourne",
                "end_location": "Warrnambool",
                "quote_cost": "$1,150.00",
                "assigned_to_job": "N",
                "job_cost": "-"
            },
            {
                "quote_no": 30,
                "quote_prepared_on": "25-May-2026",
                "preferred_start_date": "09-Jun-2026",
                "start_location": "Brisbane",
                "end_location": "Bundaberg",
                "quote_cost": "$3,050.00",
                "assigned_to_job": "N",
                "job_cost": "-"
            }
        ]
    },
    {
        "_id": 18,
        "customer_name": "Victoria Ella",
        "customer_business": "Flintstone Store",
        "customer_address": "94 Henley Beach Road, Adelaide, 5095",
        "customer_phone": "0401234020",
        "customer_stats": {
            "number_of_quotes": 1,
            "number_of_jobs": 0,
            "total_paid_jobcost": "-",
            "total_unpaid_jobcost": "-"
        },
        "quotes": [
            {
                "quote_no": 300,
                "quote_prepared_on": "17-May-2026",
                "preferred_start_date": "25-May-2026",
                "start_location": "29 Kuranda Road, Adelaide SA 5030",
                "end_location": "9 Albatros Drive, Mount Gambier SA 5270",
                "quote_cost": "$1,000.00",
                "assigned_to_job": "N",
                "job_cost": "-"
            }
        ]
    }
]
);


// List all documents you added
db.customer_quotes.find({});


// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer
db.customer_quotes.find(
    {
        "$and": [
            { "customer_stats.number_of_quotes": { "$gte": 2 } },
            { "customer_address": { "$regex": "Melbourne" } }
        ]
    },
    {
        "customer_name": 1,
        "customer_address": 1,
        "customer_phone": 1,
        "customer_stats.number_of_quotes": 1,
        "customer_stats.number_of_jobs": 1,
        "customer_stats.total_paid_jobcost": 1,
        "customer_stats.total_unpaid_jobcost": 1
    }
);



// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// (i)  Add the new customer
db.customer_quotes.insertOne(
    {
        "_id": 1001,
        "customer_name": "Patrick Bosse",
        "customer_business": "Bosse Catering",
        "customer_address": "18 King Street, Melbourne, 3000",
        "customer_phone": "0498765432",
        "customer_stats": {
            "number_of_quotes": 0,
            "number_of_jobs": 0,
            "total_paid_jobcost": "-",
            "total_unpaid_jobcost": "-"
        },
        "quotes": []
    }
);


// Show the customer details
db.customer_quotes.find({ "_id": 1001 });


// (ii) Add new quote
db.customer_quotes.updateOne(
    { "_id": 1001 },
    {
        "$set": {
            "customer_stats.number_of_quotes": 1,
            "customer_stats.number_of_jobs": 1,
            "customer_stats.total_paid_jobcost": "$3,200.00",
            "customer_stats.total_unpaid_jobcost": "-"
        },
        "$push": {
            "quotes": {
                "quote_no": 2002,
                "quote_prepared_on": "03-Jun-2026",
                "preferred_start_date": "04-Jun-2026",
                "start_location": "Adelaide SA",
                "end_location": "Melbourne VIC",
                "quote_cost": "$3,200.00",
                "assigned_to_job": "Y",
                "job_cost": "$3,200.00"
            }
        }
    }
);


// Show the customer details
db.customer_quotes.find({ "_id": 1001 });


// End of file - do not remove
