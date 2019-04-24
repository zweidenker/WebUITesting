Class {
	#name : #WebUIAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'view'
	],
	#category : 'WebUITesting-Core-Announcemments'
}

{ #category : #'as yet unclassified' }
WebUIAnnouncement >> view [
	^ view
]

{ #category : #accessing }
WebUIAnnouncement >> view: aView [
	view := aView
]
