Class {
	#name : #BaselineOfWebUITesting,
	#superclass : #BaselineOf,
	#category : #BaselineOfWebUITesting
}

{ #category : #baselines }
BaselineOfWebUITesting >> baseline: spec [
	<baseline>
    
	spec for: #common do: [
				
		spec 
			package: 'WebUITesting-Core' with: [ spec requires: #('Parasol') ];
					
			package: 'WebUITesting-Core-Tests' with: [ 
				spec requires: #( 'WebUITesting-Core' ) ].
			
		spec
			baseline: 'Parasol' with: [ 
				spec 
					repository: 'github://zweidenker/Parasol/repository';
					loads: #( 'core' )] ]
		
]
