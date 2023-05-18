"
A MMineTest is a test class for testing the behavior of MMine
"
Class {
	#name : #MoocMineTest,
	#superclass : #MoocAbstractTest,
	#instVars : [
		'field'
	],
	#category : #'MoocMineSweeper-Tests'
}

{ #category : #running }
MoocMineTest >> setUp [
	field := MoocField matrix: self matrixForField
]

{ #category : #'tests-clicking' }
MoocMineTest >> testClickInAtAt [
	| loose |
	loose := false.
	field announcer when: MoocPlayerLoose do: [ loose := true ].
	(field boxAt: 1 at: 3) clickIn: field at: 1 at: 3.
	self assert: loose
]
