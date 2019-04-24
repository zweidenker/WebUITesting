Class {
	#name : #WebUIWindow,
	#superclass : #Object,
	#instVars : [
		'size',
		'name',
		'selectorExtension'
	],
	#category : 'WebUITesting-Core'
}

{ #category : #'as yet unclassified' }
WebUIWindow class >> defaultBig [
	^ WebUIWindow new
		name: 'Default Big window';
		selectorExtension: 'Big';
		size: 	1280@1024
]

{ #category : #'as yet unclassified' }
WebUIWindow class >> defaultSmall [
	^ WebUIWindow new
		name: 'Default small window';
		selectorExtension: 'Small';
		size: 360@640
]

{ #category : #accessing }
WebUIWindow >> name [
	^ name
]

{ #category : #accessing }
WebUIWindow >> name: anObject [
	name := anObject
]

{ #category : #accessing }
WebUIWindow >> selectorExtension [
	^ selectorExtension
]

{ #category : #accessing }
WebUIWindow >> selectorExtension: anObject [
	selectorExtension := anObject
]

{ #category : #accessing }
WebUIWindow >> size [
	^ size
]

{ #category : #accessing }
WebUIWindow >> size: anObject [
	size := anObject
]
