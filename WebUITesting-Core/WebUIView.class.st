"
I model a UI in a web application. I am the result of an interaction that starts on the FrontPage.

"
Class {
	#name : #WebUIView,
	#superclass : #Object,
	#instVars : [
		'context',
		'previousUI'
	],
	#category : 'WebUITesting-Core'
}

{ #category : #accessing }
WebUIView class >> context: aWebUIContext [ 
	^ self new 
		context: aWebUIContext 
]

{ #category : #'instance creation' }
WebUIView class >> driver: aDriver [
	^ self new
		driver: aDriver
]

{ #category : #'as yet unclassified' }
WebUIView >> confirmSelectOption [
	self driver getKeyboard sendKeys: (BPKeys enter) asString.
]

{ #category : #accessing }
WebUIView >> context: anObject [
	context := anObject
]

{ #category : #accessing }
WebUIView >> delay: aDuration [
	aDuration wait
]

{ #category : #'reflective operations' }
WebUIView >> doesNotUnderstand: aMessage [
	| alternateSelector |
	alternateSelector := context specialSelectorFor: aMessage selector.
	^ (self class includesSelector: alternateSelector)
		ifTrue: [ self perform: alternateSelector ]
		ifFalse: [ super doesNotUnderstand: aMessage ]
]

{ #category : #accessing }
WebUIView >> driver [
	^ context driver
]

{ #category : #'misc. keys' }
WebUIView >> enterView [
]

{ #category : #'as yet unclassified' }
WebUIView >> fillInput: aString [
	self driver getKeyboard sendKeys: (aString).
]

{ #category : #accessing }
WebUIView >> findElementByDataTest: aString [
	^ self driver findElementByCSSSelector:  ( '[data-test="{1}"]' format: {aString})
]

{ #category : #accessing }
WebUIView >> findNestedElementByDataTest: anArray [
	| nestedSelector |
	nestedSelector := String streamContents: [ :stream |
		anArray do: [ :el |
			stream 
				nextPutAll: ('[data-test="{1}"] ' format: {el}) ]
				separatedBy: [ stream nextPut: Character space  ] ].
	^ self driver findElementByCSSSelector: nestedSelector
]

{ #category : #accessing }
WebUIView >> firstInput [
	(self driver findElementByCSSSelector: 'input') click.
]

{ #category : #'misc. keys' }
WebUIView >> leaveView [
]

{ #category : #'as yet unclassified' }
WebUIView >> nextInput [
	self driver getKeyboard sendKeys: (BPKeys tab) asString.
]

{ #category : #'object creation' }
WebUIView >> nextView: aClass [
	^ self nextView: aClass doing: [ ] 
 
]

{ #category : #'object creation' }
WebUIView >> nextView: aClass doing: aBlock [
	"we remember the previus UI, this will make it easier to debug navigation paths
	Idea for later: save a screenshot of the UI for each"
	^ context 
		changeViewFrom: self 
		to: ((self as: aClass) 
			previousUI: self;
			yourself)
		doing: aBlock
 
]

{ #category : #'as yet unclassified' }
WebUIView >> openSelectDropdown [
	self driver getKeyboard sendKeys: (BPKeys enter) asString.
]

{ #category : #accessing }
WebUIView >> previousUI [
	^ previousUI
]

{ #category : #accessing }
WebUIView >> previousUI: anObject [
	previousUI := anObject
]

{ #category : #accessing }
WebUIView >> screenshot [
	^ context screenshot
]

{ #category : #'as yet unclassified' }
WebUIView >> selectionDown [
	self driver getKeyboard sendKeys: (BPKeys arrowDown) asString.
]

{ #category : #accessing }
WebUIView >> webDriver [
	^ context driver
]
