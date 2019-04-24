Class {
	#name : #WebUILocalSiteTestcase,
	#superclass : #WebUITestcase,
	#instVars : [
		'server',
		'port'
	],
	#category : 'WebUITesting-Core'
}

{ #category : #initialization }
WebUILocalSiteTestcase >> frontPageUrl [
	^ 'http://', self selfIP, ':', self randomPort asString, '/'
]

{ #category : #initialization }
WebUILocalSiteTestcase >> openLoginPage [
	context get: self frontPageUrl.
	self disableCssTransitions.
	^ LoginPage context: context.
]

{ #category : #initialization }
WebUILocalSiteTestcase >> randomPort [
	^ port ifNil: [
		port := 27000 + 1000 atRandom ]
]

{ #category : #initialization }
WebUILocalSiteTestcase >> selfIP [
	^ NetNameResolver stringFromAddress: (NetNameResolver addressForName: NetNameResolver localHostName)
]

{ #category : #'as yet unclassified' }
WebUILocalSiteTestcase >> serverDelegate [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
WebUILocalSiteTestcase >> setUp [
	super setUp.
	self setupServer 
]

{ #category : #'as yet unclassified' }
WebUILocalSiteTestcase >> setupServer [
	| delegate |
	delegate := self webRootPath 
		ifNotNil: [ :path |
			(StaticFileDecoratorDelegate 
				decorate: self serverDelegate  
				servingFilesFrom: path) ]
		ifNil: [ self serverDelegate  ].
	server := (ZnServer on: self randomPort)
		delegate: delegate;
		debugMode: true;
		start.
]

{ #category : #running }
WebUILocalSiteTestcase >> tearDown [
	super tearDown.
	server stop.
]

{ #category : #initialization }
WebUILocalSiteTestcase >> webRootPath [
	^ nil
]
