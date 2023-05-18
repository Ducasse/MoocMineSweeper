"
I am an abstract visitor for a MField object.
"
Class {
	#name : #MoocFieldVisitor,
	#superclass : #Object,
	#category : #'MoocMineSweeper-Visitors'
}

{ #category : #visiting }
MoocFieldVisitor >> visitMClicked: aMClicked [
	^ self subclassResponsibility
]

{ #category : #visiting }
MoocFieldVisitor >> visitMField: aMField [
	^ self subclassResponsibility
]

{ #category : #visiting }
MoocFieldVisitor >> visitMMine: aMMine [
	^ self subclassResponsibility
]

{ #category : #visiting }
MoocFieldVisitor >> visitMUnknown: aMEmpty [
	^ self subclassResponsibility
]
