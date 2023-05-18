"
I am an abstract object that can be visited by a subclass of MFieldVisitor.
"
Class {
	#name : #MoocVisitableObject,
	#superclass : #Object,
	#category : #'MoocMineSweeper-Core'
}

{ #category : #visiting }
MoocVisitableObject >> accept: aMFieldVisitor [
	^ self subclassResponsibility
]
