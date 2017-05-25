# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

website = Website.create({link: 'http://www.wellingtonvicioso.com/'})

website.html_items.create({tag: 'h1', content: 'Wellington Vicioso'})
website.html_items.create({tag: 'h1', content: 'Projects'})
website.html_items.create({tag: 'h1', content: 'Wellington Vicioso'})

website.html_items.create({tag: 'h2', content: 'wellington.vicioso@gmail.com'})
website.html_items.create({tag: 'h2', content: 'Tic Tac Toe'})
website.html_items.create({tag: 'h2', content: 'HackOverflow'})
website.html_items.create({tag: 'h2', content: 'Temo'})
website.html_items.create({tag: 'h2', content: 'Dapr'})
website.html_items.create({tag: 'h2', content: 'Scale'})
website.html_items.create({tag: 'h2', content: 'Full-Stack Software Engineer'})

website.html_items.create({tag: 'h3', content: '310.367.2608'})
website.html_items.create({tag: 'h3', content: 'Track your tic-tac-toe skill!'})
website.html_items.create({tag: 'h3', content: 'StackOverflow clone.'})
website.html_items.create({tag: 'h3', content: 'Bringing emotions to text.'})
website.html_items.create({tag: 'h3', content: 'Always know how to dress for any weather.'})
website.html_items.create({tag: 'h3', content: 'Build financial freedom through the support of a community. Manage your budget, share goals, and get rewarded for meeting them.'})
website.html_items.create({tag: 'h3', content: 'Methodologies'})
website.html_items.create({tag: 'h3', content: 'Technologies'})
