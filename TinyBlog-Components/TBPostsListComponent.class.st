Class {
	#name : #TBPostsListComponent,
	#superclass : #TBScreenComponent,
	#instVars : [
		'currentCategory'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #actions }
TBPostsListComponent >> basicRenderCategoriesOn: html [
html render: self categoriesComponent

]

{ #category : #actions }
TBPostsListComponent >> basicRenderPostsOn: html [
self readSelectedPosts do: [ :p |
html render: (self postComponentFor: p) ]

]

{ #category : #accessing }
TBPostsListComponent >> categoriesComponent [
^ TBCategoriesComponent
categories: self blog allCategories
postsList: self
]

{ #category : #accessing }
TBPostsListComponent >> currentCategory [
^ currentCategory

]

{ #category : #accessing }
TBPostsListComponent >> currentCategory: anObject [
currentCategory := anObject

]

{ #category : #accessing }
TBPostsListComponent >> postComponentFor: aPost [
^ TBPostComponent new post: aPost

]

{ #category : #actions }
TBPostsListComponent >> readSelectedPosts [
^ self currentCategory
ifNil: [ self blog allVisibleBlogPosts ]
ifNotNil: [ self blog allVisibleBlogPostsFromCategory: self
currentCategory ]

]

{ #category : #accessing }
TBPostsListComponent >> renderCategoryColumnOn: html [
html tbsColumn
extraSmallSize: 12;
smallSize: 2;
mediumSize: 4;
with: [ self basicRenderCategoriesOn: html ]
]

{ #category : #accessing }
TBPostsListComponent >> renderContentOn: html [
super renderContentOn: html.
html
tbsContainer: [
html tbsRow
showGrid;
with: [ self renderCategoryColumnOn: html.
self renderPostColumnOn: html ] ]

]

{ #category : #accessing }
TBPostsListComponent >> renderPostColumnOn: html [
html tbsColumn
extraSmallSize: 12;
smallSize: 10;
mediumSize: 8;
with: [ self basicRenderPostsOn: html ]

]
