Class {
	#name : #WebUISnapshot,
	#superclass : #Object,
	#instVars : [
		'view',
		'form'
	],
	#category : 'WebUITesting-Core'
}

{ #category : #accessing }
WebUISnapshot >> form [
	^ form
]

{ #category : #accessing }
WebUISnapshot >> form: anObject [
	form := anObject
]

{ #category : #'as yet unclassified' }
WebUISnapshot >> gtInspectorFormIn: composite [
    <gtInspectorPresentationOrder: 90>
    ^ composite morph
        title: 'Morph';
        display: [ form asMorph ]
]

{ #category : #accessing }
WebUISnapshot >> view [
	^ view
]

{ #category : #accessing }
WebUISnapshot >> view: anObject [
	view := anObject
]
