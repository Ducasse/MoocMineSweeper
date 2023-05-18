"
A MClickedTest is a test class for testing the behavior of MClicked
"
Class {
	#name : #MoocClickedTest,
	#superclass : #MoocAbstractTest,
	#instVars : [
		'field'
	],
	#category : #'MoocMineSweeper-Tests'
}

{ #category : #running }
MoocClickedTest >> setUp [
	field := MoocField matrix: self matrixForField
]

{ #category : #'tests-clicking' }
MoocClickedTest >> testClickInAtAt [
	| bool |
	bool := false.
	field clickOnBoxAt: 1 at: 1.
	field announcer when: MoocFieldUpdate , MoocPlayerLoose , MoocPlayerWin do: [ 
		bool := true ].
	(field boxAt: 1 at: 1) clickIn: field at: 1 at: 1.
	self deny: bool
]
