"
I am a visitor that print the MField on a WriteStream  on a String.
"
Class {
	#name : #MoocFieldPrinter,
	#superclass : #MoocStreamExporter,
	#instVars : [
		'field',
		'currentRow',
		'currentColumn'
	],
	#category : #'MoocMineSweeper-Visitors'
}

{ #category : #initialization }
MoocFieldPrinter >> initialize [
	super initialize.
	self writeStream: (WriteStream on: String new)
]

{ #category : #visiting }
MoocFieldPrinter >> visitMClicked: aMClicked [
	|count|
	count := (field mineCountAroundBoxAt: currentRow at: currentColumn).
	count = 0
		ifTrue: [ 
			self writeStream << '_' ]
		ifFalse: [ 
			count printOn: self writeStream ]
]

{ #category : #visiting }
MoocFieldPrinter >> visitMField: aMField [
	field := aMField.
	aMField boxesDoWithIndices: [ :box :row :column |
		currentRow := row.
		currentColumn := column.
		box accept: self.
		currentColumn = aMField width 
			ifFalse: [ self writeStream << Character space ]
			ifTrue: [ self writeStream << Smalltalk os lineEnding ] ]
]

{ #category : #visiting }
MoocFieldPrinter >> visitMMine: aMMine [
	self writeStream << $*
]

{ #category : #visiting }
MoocFieldPrinter >> visitMUnknown: aMEmpty [
	self writeStream << $*
]
