Class {
	#name : #WebUITestcase,
	#superclass : #TestCase,
	#instVars : [
		'context'
	],
	#category : 'WebUITesting-Core'
}

{ #category : #asserting }
WebUITestcase >> assertAbsentElement: aXPath [
	self 
		should: [ self webDriver findElementByXPath: aXPath ] 
	 	raise: BPNoSuchElementException
]

{ #category : #asserting }
WebUITestcase >> assertElement: aXPath [
	self 	
		shouldnt: [	self webDriver findElementByXPath: aXPath ] 
	 	raise: BPNoSuchElementException
]

{ #category : #initialization }
WebUITestcase >> back [
	self webDriver executeScript: 'window.history.go(-1)' with: #().
]

{ #category : #initialization }
WebUITestcase >> disableCssTransitions [
	| script |
	script := 'var css = document.createElement("style"); css.type = "text/css"; css.innerHTML = "* { transition: unset !important; }"; document.body.appendChild(css);'.
	self webDriver executeScript: script with: #().
]

{ #category : #running }
WebUITestcase >> driver [
	^ BPRemoteWebDriver withCapabilities: (
		BPDesiredCapabilities chrome )
]

{ #category : #initialization }
WebUITestcase >> frontPageClass [
	^ WebUIView
]

{ #category : #initialization }
WebUITestcase >> frontPageUrl [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
WebUITestcase >> openFrontPage [
	context get: self frontPageUrl.
	^ self frontPageClass context: context
]

{ #category : #running }
WebUITestcase >> setUp [
	super setUp.
	context := WebUIContext new
		driver: self driver;
		window: self window.
	context setWindowSize
]

{ #category : #running }
WebUITestcase >> tearDown [
	super tearDown.
	"context wireframe inspect."
	context tearDown
]

{ #category : #accessing }
WebUITestcase >> webDriver [
	^ context driver
]

{ #category : #accessing }
WebUITestcase >> window [
	^ WebUIWindow defaultBig
]
