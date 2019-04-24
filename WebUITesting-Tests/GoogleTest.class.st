Class {
	#name : #GoogleTest,
	#superclass : #WebUIRemoteSiteTestcase,
	#category : #'WebUITesting-Tests'
}

{ #category : #initialization }
GoogleTest >> frontPageClass [
	^ GoogleFrontPage 
]

{ #category : #initialization }
GoogleTest >> frontPageUrl [
	^ 'http://google.de'
]

{ #category : #tests }
GoogleTest >> testGoogleSearch [
	| google resultPage |
	google := self openFrontPage.
	resultPage := google search: 'hello world'.
	self assert: resultPage containsLinks
]
