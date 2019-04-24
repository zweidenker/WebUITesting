"
TODO: implement context object so we can double dispatch over the screen size in the WebUI hierarchy.
"
Class {
	#name : #WebUIContext,
	#superclass : #Object,
	#instVars : [
		'driver',
		'window',
		'announcer',
		'lastView'
	],
	#classInstVars : [
		'announcer'
	],
	#category : 'WebUITesting-Core'
}

{ #category : #accessing }
WebUIContext class >> announcer [
	^ announcer ifNil: [
		announcer := Announcer new ]
]

{ #category : #initialization }
WebUIContext class >> resetAnnouncer [
	announcer := nil
]

{ #category : #accessing }
WebUIContext >> announce: anAnnouncement [
	self announcer announce: anAnnouncement 
]

{ #category : #accessing }
WebUIContext >> announcer [
	^ self class announcer
]

{ #category : #'as yet unclassified' }
WebUIContext >> changeViewFrom: currentView to: nextView doing: aBlock [
	self announce: (WebUIAboutToChangeView new view: currentView).
	aBlock value.
	currentView leaveView.
	self announce: (WebUIChangeView new previous: currentView; next: nextView).
	nextView enterView.
	self announce: (WebUIViewChanged new view: nextView). 
	lastView := nextView.
	^ nextView	
]

{ #category : #accessing }
WebUIContext >> driver [
	^ driver
]

{ #category : #accessing }
WebUIContext >> driver: anObject [
	driver := anObject
]

{ #category : #requesting }
WebUIContext >> get: aString [ 
	^ driver get: aString
]

{ #category : #initialization }
WebUIContext >> initialize [
	super initialize.

]

{ #category : #accessing }
WebUIContext >> screenshot [
	^ ImageReadWriter formFromStream: driver getScreenshotAsByteArray readStream
]

{ #category : #settins }
WebUIContext >> setWindowSize [
	driver manage window setSize: window size
]

{ #category : #selectors }
WebUIContext >> specialSelectorFor: aString [ 
	^ (aString, window selectorExtension) asSymbol
]

{ #category : #running }
WebUIContext >> tearDown [
	self announce: (WebUIAboutToChangeView new view: lastView).
	"Try to use quit first and if it fails try close. There are two different scenarios for testing.
	In the first a browser needs to be started and quitted every test. In the second a browser is
	running all the time and the window needs to be closed. "
	driver ifNil: [ ^ self ].
	[	driver quit ]
		on: BPUnsupportedCommandException 
		do: [:quitErr | 
			[	driver close ]
				on: BPUnsupportedCommandException 
				do: [:closeErr| ] ]
	
	

]

{ #category : #accessing }
WebUIContext >> window: aWebUIWindow [ 
	window := aWebUIWindow 
]
