"
A MEmptyTest is a test class for testing the behavior of MEmpty
"
Class {
	#name : #MoocUnknownTest,
	#superclass : #MoocAbstractTest,
	#instVars : [
		'field'
	],
	#category : #'MoocMineSweeper-Tests'
}

{ #category : #running }
MoocUnknownTest >> setUp [
	field := MoocField matrix: self matrixForField
]

{ #category : #'tests-clicking' }
MoocUnknownTest >> testClickInAtAtProduceAPropagateTONeighbour [
	field clickOnBoxAt: 1 at: 1.
	self
		assert: (field boxAt: 1 at: 1) isClickedBox;
		assert: (field boxAt: 1 at: 2) isClickedBox;
		assert: (field boxAt: 2 at: 1) isClickedBox;
		assert: (field boxAt: 2 at: 2) isClickedBox
]
