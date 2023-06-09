Class {
	#name : #TBBlog,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #TinyBlog
}

{ #category : #'as yet unclassified' }
TBBlog class >> createDemoPosts [
"TBBlog createDemoPosts"
self current
writeBlogPost: ((TBPost title: 'Welcome in TinyBlog' text:
'TinyBlog is a small blog engine made with Pharo.' category:
'TinyBlog') visible: true);
writeBlogPost: ((TBPost title: 'Report Pharo Sprint' text:
'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a
nice event with more than 15 motivated sprinters. With the help
of candies, cakes and chocolate, huge work has been done'
category: 'Pharo') visible: true);
writeBlogPost: ((TBPost title: 'Brick on top of Bloc -
Preview' text: 'We are happy to announce the first preview
version of Brick, a new widget set created from scratch on top
of Bloc. Brick is being developed primarily by Alex Syrel
(together with Alain Plantec, Andrei Chis and myself), and the
work is sponsored by ESUG.
Brick is part of the Glamorous Toolkit effort and will provide
the basis for the new versions of the development tools.'
category: 'Pharo') visible: true);
writeBlogPost: ((TBPost title: 'The sad story of unclassified
blog posts' text: 'So sad that I can read this.') visible: true);
writeBlogPost: ((TBPost title: 'Working with Pharo on the
Raspberry Pi' text: 'Hardware is getting cheaper and many new
small devices like the famous Raspberry Pi provide new
computation power that was one once only available on regular
desktop computers.' category: 'Pharo') visible: true)

]

{ #category : #'as yet unclassified' }
TBBlog class >> createPosts [
self current
writeBlogPost: ((TBPost title: 'Harry Potter' text:
'An orphaned boy enrolls in a school of wizardry, where he learns the truth about himself, his family and the terrible evil that haunts the magical world.' category:
'Movies') visible: true);
writeBlogPost: ((TBPost title: 'The Batman' text:
'When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate the city''s hidden corruption and question his family''s involvement.'
category: 'Movies') visible: true);
writeBlogPost: ((TBPost title: 'Game of Thrones' text: 'Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia.'
category: 'TV Shows') visible: true);
writeBlogPost: ((TBPost title: 'Black Mirror' text: 'An anthology series exploring a twisted, high-tech multiverse where humanity''s greatest innovations and darkest instincts collide.' category: 'TV Shows') visible: true);
writeBlogPost: ((TBPost title: 'Attack on Titan' text: 'After his hometown is destroyed and his mother is killed, young Eren Jaeger vows to cleanse the earth of the giant humanoid Titans that have brought humanity to the brink of extinction.' category: 'Anime') visible: true)

]

{ #category : #initialization }
TBBlog class >> current [
"answer the instance of the TBRepository"
^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #initialization }
TBBlog class >> initialize [
self reset

]

{ #category : #initialization }
TBBlog class >> reset [
uniqueInstance := nil
]

{ #category : #'as yet unclassified' }
TBBlog >> allBlogPosts [
^ posts
]

{ #category : #'as yet unclassified' }
TBBlog >> allBlogPostsFromCategory: aCategory [
^ posts select: [ :p | p category = aCategory ]
]

{ #category : #private }
TBBlog >> allCategories [
^ (self allBlogPosts collect: [ :p | p category ]) asSet
]

{ #category : #'as yet unclassified' }
TBBlog >> allVisibleBlogPosts [
^ posts select: [ :p | p isVisible ]
]

{ #category : #'as yet unclassified' }
TBBlog >> allVisibleBlogPostsFromCategory: aCategory [
^ posts select: [ :p | p category = aCategory
and: [ p isVisible ] ]

]

{ #category : #initialization }
TBBlog >> initialize [
super initialize.
posts := OrderedCollection new
]

{ #category : #removing }
TBBlog >> removeAllPosts [
posts := OrderedCollection new
]

{ #category : #removing }
TBBlog >> size [
^ posts size

]

{ #category : #removing }
TBBlog >> writeBlogPost: aPost [
"Add the blog post to the list of posts."
posts add: aPost

]
