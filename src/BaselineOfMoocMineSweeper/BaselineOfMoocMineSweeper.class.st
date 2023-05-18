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
			spec
		baseline: 'Bloc'
		with: [
		spec repository: 'github://pharo-graphics/Bloc/src' ].
			spec
				package: 'MoocMineSweeper';
				package: 'MoocMineSweeper-Tests' with: [ spec requires: #('MoocMineSweeper') ];
				package: 'MoocMineSweeper-Bloc' with: [ spec requires: #('MoocMineSweeper' 'Bloc') ].
		 ]
]

{ #category : #baseline }
BaselineOfMoocMineSweeper >> defineDependencies: spec [

	spec
		baseline: 'Bloc'
		with: [
		spec repository: 'github://pharo-graphics/Bloc/src' ]
]

{ #category : #baseline }
BaselineOfMoocMineSweeper >> definePackages: spec [

	spec
		package: 'MoocMineSweeper';
		package: 'MoocMineSweeper-Tests' with: [ spec requires: #('MoocMineSweeper') ];
		package: 'MoocMineSweeper-Bloc' with: [ spec requires: #('MoocMineSweeper' 'Bloc') ];
		yourself
]
