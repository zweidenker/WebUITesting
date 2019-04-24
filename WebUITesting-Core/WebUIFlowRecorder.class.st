Class {
	#name : #WebUIFlowRecorder,
	#superclass : #Object,
	#instVars : [
		'snapshots'
	],
	#category : 'WebUITesting-Core'
}

{ #category : #adding }
WebUIFlowRecorder >> addSnapshot: aScreenShot [
	snapshots add: aScreenShot 
]

{ #category : #'as yet unclassified' }
WebUIFlowRecorder >> forTestClass: aClass selector: aSymbol [ 
	| subscription |
	[ 
		subscription := WebUIContext announcer
			subscribe: WebUIAboutToChangeView 
			do: [ :x | self addSnapshot: (Screenshot new 
				view: x view;
				form: x view screenshot) ].
		aClass run: aSymbol ]
		ensure: [ WebUIContext announcer removeSubscription: subscription ]
]

{ #category : #initialization }
WebUIFlowRecorder >> initialize [
	super initialize.
	snapshots := OrderedCollection new
]

{ #category : #'as yet unclassified' }
WebUIFlowRecorder >> snapshots [
	^ snapshots
]
