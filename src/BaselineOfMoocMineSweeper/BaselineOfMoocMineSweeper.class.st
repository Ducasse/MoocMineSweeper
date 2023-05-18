Class {
	#name : #BaselineOfMoocMineSweeper,
	#superclass : #BaselineOf,
	#category : #BaselineOfMoocMineSweeper
}

{ #category : #baseline }
BaselineOfMoocMineSweeper >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self
				definePackages: spec;
				defineDependencies: spec;
				defineGroups: spec ]
]

{ #category : #baseline }
BaselineOfMoocMineSweeper >> defineDependencies: spec [

	spec
		baseline: 'Bloc'
		with: [
		spec repository: 'github://pharo-graphics/Bloc/src' ]
]

{ #category : #baseline }
BaselineOfMoocMineSweeper >> defineGroups: spec [
	spec
		group: 'core' with: #('MoocMineSweeper' 'MoocMineSweeper-Tests');
		"should add the dependencies to the ui"
		yourself
]

{ #category : #baseline }
BaselineOfMoocMineSweeper >> definePackages: spec [

	spec
		  package: 'MoocMineSweeper' with: [ spec requires: #('Bloc') ];
		  package: 'MoocMineSweeper-Tests' with: [ spec requires: #('MoocMineSweeper') ];
			"should add the dependencies to the ui"
		  yourself
]
