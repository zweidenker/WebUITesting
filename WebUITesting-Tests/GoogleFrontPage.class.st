Class {
	#name : #GoogleFrontPage,
	#superclass : #WebUIView,
	#category : #'WebUITesting-Tests'
}

{ #category : #'typing/selecting keys' }
GoogleFrontPage >> search: aString [
	| input |
	input := self driver findElementByClassName: 'gLFyf'.
	input click.
	self fillInput: aString.
	^ self 
		nextView: GoogleResultPage
		doing: [ (self driver findElementByXPath: '//input[@value="Google-Suche"]') click ]
]
