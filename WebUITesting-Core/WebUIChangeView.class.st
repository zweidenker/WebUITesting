Class {
	#name : #WebUIChangeView,
	#superclass : #WebUIAnnouncement,
	#instVars : [
		'next'
	],
	#category : 'WebUITesting-Core-Announcemments'
}

{ #category : #accessing }
WebUIChangeView >> next [
	^ next
]

{ #category : #accessing }
WebUIChangeView >> next: anObject [
	next := anObject
]

{ #category : #accessing }
WebUIChangeView >> previous [
	^ view
]

{ #category : #accessing }
WebUIChangeView >> previous: anObject [
	view := anObject
]
