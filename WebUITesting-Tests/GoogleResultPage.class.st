Class {
	#name : #GoogleResultPage,
	#superclass : #WebUIView,
	#category : #'WebUITesting-Tests'
}

{ #category : #'as yet unclassified' }
GoogleResultPage >> containsLinks [
	^ (self webDriver findElementsByTagName: 'a') notEmpty
]
