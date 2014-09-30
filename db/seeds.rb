# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([{ email: "peter@meta-review.com", password: "password123", username: "Peter!" },
             { email: "dennis@meta-review.com", password: "password123", username: "dennis" },
             { email: "nick@meta-review.com", password: "password123", username: "NickS" },
             { email: "alex@meta-review.com", password: "password123", username: "ALEX" }])

Site.create([{ title: "Yelp", url: "http://yelp.com", description: "This is a site that reviews restaurants.", user_id: 1  },
             { title: "Amazon", url: "http://amazon.com", description: "A site where you can buy pretty much anything: movies, books, music, tanks, etc. There are reviews of all those items. As well as reviews of sellers.", user_id: 2  },
             { title: "Rotten Tomatoes", url: "http://rottentomatoes.com", description: "Movie review site. Reviews movies and stuff", user_id: 3  },
             { title: "Caturday Funtime", url: "https://caturday-funtime.herokuapp.com/", description: "Reviews of cats. Nothing more important than that.", user_id: 4  },
             { title: "Trip Advisor", url: "http://www.tripadvisor.com/", description: "Reviews locations, beaches, bed and breakfasts, hotels, and stuff like that.", user_id: 1  },
             { title: "metacritic", url: "http://www.metacritic.com/", description: "Entertainment reviews. Music, movies, tv, video games, you get the idea.", user_id: 3  },
             { title: "Meta-Review", url: "http://meta-review.herokuapp.com/", description: "Also know as the best review site in modern history. Reviews other review sites. Superior to all other sites in every aspect.", user_id: 2  },
             { title: "goodreads", url: "https://www.goodreads.com/", description: "Book review site.", user_id: 1 }])

Review.create([{ rating: 5, site_id: 1, user_id: 1, body: "This site is great. I always find solid reviews on the restaurant in my area." },
               { rating: 3, site_id: 1, user_id: 2, body: "I don't trust this site. Sometimes the reviews are good, but I keep hearing that they force restaurants to pay them to post the good reviews." },
               { rating: 1, site_id: 3, user_id: 3, body: "HATE HATE HATE this site. Bunch of snobs." },
               { rating: 4, site_id: 2, user_id: 4, body: "Good variety of reviews. Good layout. Plus there are reviews for pretty much everything." },
               { rating: 4, site_id: 4, user_id: 1, body: "KITTIES!" },
               { rating: 2, site_id: 4, user_id: 2, body: "I WANT MORE KITTIES" },
               { rating: 5, site_id: 5, user_id: 3, body: "Really like this site. It's sleek and I find the answers I want." },
               { rating: 5, site_id: 7, user_id: 4, body: "The guys who created this site really know their stuff. I am so impressed with them." },
               { rating: 2, site_id: 1, user_id: 4, body: "Bad site. Bad everything. Never go there." },
               { rating: 3, site_id: 1, user_id: 3, body: "Seen better, seen worse." },
               { rating: 5, site_id: 3, user_id: 2, body: "Oh such a good site. The reviews are spot on. A very good review community. The site is sleek and easy to navigate." },
               { rating: 3, site_id: 2, user_id: 1, body: "Meh. Just meh. Super meh. Unbelievably meh." },
               { rating: 3, site_id: 4, user_id: 3, body: "KITTIES! KITTIES. My only complaint is that there aren't more KITTIES!" },
               { rating: 5, site_id: 4, user_id: 4, body: "SO CUTE!" },
               { rating: 4, site_id: 5, user_id: 2, body: "I am very picky and I like this site. That should tell you something. Two thumbs WAY up from me." },
               { rating: 5, site_id: 7, user_id: 1, body: "Have you ever been on the best site? If you are reading this review, then you have." }])

Comment.create([{ user_id: 1, review_id: 1, body: "Great review bro" },
                { user_id: 2, review_id: 2, body: "Are you crazy? I disagree." },
                { user_id: 3, review_id: 3, body: "Can someone post a link to google?" },
                { user_id: 4, review_id: 4, body: "I agree. This site has some good points, but some bad ones too." },
                { user_id: 1, review_id: 5, body: "BEST REVIEW EVER. COULD HAVE USED MORE CAPS LOCK!" },
                { user_id: 3, review_id: 1, body: "Very meh review. Try to be less meh." },
                { user_id: 3, review_id: 2, body: "I liked that site." },
                { user_id: 4, review_id: 3, body: "Spot on chap." },
                { user_id: 1, review_id: 6, body: "Good. Very good." }])
