"
I am a mine field.

I you want to play with me, have a look at 'player api' protocol.

You may want to subscribe to my announcer to react to what is going on during the game. Access it using #announcer accessor. See MFieldAnnouncement to know what I can announce.
"
Class {
	#name : #MoocField,
	#superclass : #MoocVisitableObject,
	#instVars : [
		'matrix',
		'round',
		'gameEnded',
		'playerWon',
		'announcer'
	],
	#category : #'MoocMineSweeper-Core'
}

{ #category : #'instance creation' }
MoocField class >> matrix: aMatrix [
	^ self new
		matrix: aMatrix;
		yourself
]

{ #category : #'test ressources' }
MoocField class >> matrixForField [
	^ self matrix: ((Array2D rows: 5 columns: 5)
			at: 1 at: 1 put: MoocBox unknown;
			at: 1 at: 2 put: MoocBox unknown;
			at: 1 at: 3 put: MoocBox mine;
			at: 1 at: 4 put: MoocBox unknown;
			at: 1 at: 5 put: MoocBox unknown;
			at: 2 at: 1 put: MoocBox unknown;
			at: 2 at: 2 put: MoocBox unknown;
			at: 2 at: 3 put: MoocBox mine;
			at: 2 at: 4 put: MoocBox unknown;
			at: 2 at: 5 put: MoocBox unknown;
			at: 3 at: 1 put: MoocBox mine;
			at: 3 at: 2 put: MoocBox mine;
			at: 3 at: 3 put: MoocBox mine;
			at: 3 at: 4 put: MoocBox unknown;
			at: 3 at: 5 put: MoocBox unknown;
			at: 4 at: 1 put: MoocBox unknown;
			at: 4 at: 2 put: MoocBox unknown;
			at: 4 at: 3 put: MoocBox unknown;
			at: 4 at: 4 put: MoocBox mine;
			at: 4 at: 5 put: MoocBox mine;
			at: 5 at: 1 put: MoocBox mine;
			at: 5 at: 2 put: MoocBox unknown;
			at: 5 at: 3 put: MoocBox unknown;
			at: 5 at: 4 put: MoocBox unknown;
			at: 5 at: 5 put: MoocBox unknown;
			yourself)
]

{ #category : #'as yet unclassified' }
MoocField class >> matrixTest5x5 [ 
	^ self matrix: ((Array2D rows: 5 columns: 5) collect: [ :e | MoocBox randomCase ])
]

{ #category : #visiting }
MoocField >> accept: aMFieldVisitor [
	^ aMFieldVisitor visitMField: self
]

{ #category : #accessing }
MoocField >> announcer [
	^ announcer
]

{ #category : #enumerating }
MoocField >> anyBoxSatisfy: aBlock [
	^ matrix anySatisfy: aBlock
]

{ #category : #accessing }
MoocField >> boxAt: x at: y [
	^ matrix at: x at: y
]

{ #category : #enumerating }
MoocField >> boxesAroundBoxAt: x at: y anySatisfy: aBlock [
	self boxesAroundBoxAt: x at: y do: [ :box |
		(aBlock value: box)
			ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #enumerating }
MoocField >> boxesAroundBoxAt: x at: y collect: aBlock [
	| collected |
	collected := OrderedCollection new.
	self boxesAroundBoxAt: x at: y do: [ :box |
		collected add: (aBlock value: box) ].
	^ collected
]

{ #category : #enumerating }
MoocField >> boxesAroundBoxAt: x at: y do: aBlock [
	self boxesAroundBoxAt: x at: y doWithIndexes: [ :box :i :j |
		aBlock value: box ]
]

{ #category : #enumerating }
MoocField >> boxesAroundBoxAt: x at: y doWithIndexes: aBlock [
	^ (x - 1 to: x + 1) collect: [ :i |
			(y - 1 to: y + 1) collect: [ :j |
				((i = x and: [ j = y ])
					or: [ i < 1
					or: [ j < 1
					or: [ i > self height
					or: [ j > self width ] ] ] 
				])
					ifFalse: [ 
						aBlock
							value: (self boxAt: i at: j)
							value: i
							value: j ] ] ]
]

{ #category : #enumerating }
MoocField >> boxesAroundBoxAt: x at: y select: aBlock [
	| collected |
	collected := OrderedCollection new.
	self boxesAroundBoxAt: x at: y do: [ :box |
		(aBlock value: box)
			ifTrue: [ collected add: box ] ].
	^ collected
]

{ #category : #enumerating }
MoocField >> boxesDoWithIndices: aBlock [
	1 to: self height do: [ :i |
		1 to: self width do: [ :j |
			aBlock value: (self boxAt: i at: j) value: i value: j ] ]
]

{ #category : #enumerating }
MoocField >> boxesSelect: aBlock [
	| selected |
	selected := OrderedCollection new.
	matrix do: [ :box |
		(aBlock value: box)
			ifTrue: [ selected add: box ] ].
	^ selected
]

{ #category : #'player api' }
MoocField >> clickOnBoxAt: x at: y [
	gameEnded ifTrue: [ ^ self ].
	(self boxAt: x at: y) clickIn: self at: x at: y
]

{ #category : #'debug api' }
MoocField >> debugTextualRepresentation [
	| visitor |
	visitor := MoocDebugFieldPrinter new.
	self accept: visitor.
	^ visitor streamContents
]

{ #category : #'box api' }
MoocField >> fieldUpdate [
	self announcer announce: (MoocFieldUpdate field: self)
]

{ #category : #'box api' }
MoocField >> flagCountAroundBoxAt: x at: y [
	^ (self boxesAroundBoxAt: x at: y collect: [ :box | 
		box isFlagged
			ifTrue: [ 1 ]
			ifFalse: [ 0 ] ]) sum
]

{ #category : #accessing }
MoocField >> gameEnded [
	^ gameEnded
]

{ #category : #testing }
MoocField >> hasClickedBoxAroundBoxAt: x at: y [
	^ self boxesAroundBoxAt: x at: y anySatisfy: #isClickedBox
]

{ #category : #testing }
MoocField >> hasMineBoxAroundBoxAt: x at: y [
	^ (self mineCountAroundBoxAt: x at: y) > 0
]

{ #category : #testing }
MoocField >> hasUnknownBox [
	^ self anyBoxSatisfy: #isUnknownBox
]

{ #category : #accessing }
MoocField >> height [
	^ matrix numberOfRows
]

{ #category : #'box api' }
MoocField >> incrementRound [
	round := round + 1
]

{ #category : #initialization }
MoocField >> initialize [
	super initialize.
	round := 0.
	announcer := Announcer new.
	gameEnded := false.
	playerWon := false
]

{ #category : #accessing }
MoocField >> matrix [ 
	^ matrix
]

{ #category : #'private - accessing' }
MoocField >> matrix: anObject [

	matrix := anObject.
	
]

{ #category : #'player api' }
MoocField >> mineCount [
	^ (self boxesSelect: #isMineBox) size
]

{ #category : #'box api' }
MoocField >> mineCountAroundBoxAt: x at: y [
	^ (self boxesAroundBoxAt: x at: y collect: [ :box | 
		box isMineBox
			ifTrue: [ 1 ]
			ifFalse: [ 0 ] ]) sum
]

{ #category : #'box api' }
MoocField >> playerLoose [

	playerWon := false.
	gameEnded := true.
	self announcer announce: (MoocPlayerLoose field: self).

	Transcript
		clear;
		show: 'Defaite';
		open.

	self boxesDoWithIndices: [ :aBox :i :j |
		aBox announcer announce:
			(MoocBoxClickAndReplaceAnnouncement replaceBy: MoocClicked new) ]
]

{ #category : #accessing }
MoocField >> playerLost [
	^ self playerWon not
]

{ #category : #'box api' }
MoocField >> playerWin [
	gameEnded ifTrue: [ ^self ].
	playerWon := true.
	gameEnded := true.
	self announcer announce: (MoocPlayerWin field: self).
	Transcript
		clear;
		show: 'Victoire';
		open.
	self boxesDoWithIndices: [ :aBox :i :j |
		aBox announcer announce:
			(MoocBoxClickAndReplaceAnnouncement replaceBy:
				 (MoocClicked new)) ]
]

{ #category : #accessing }
MoocField >> playerWon [
	^ playerWon
]

{ #category : #printing }
MoocField >> printOn: aStream [
	aStream
		<< self width asString;
		<< self height asString;
		<< Smalltalk os lineEnding.
	1 to: self width do: [ :i |
		1 to: self height do: [ :j |
			|box|
			box := self boxAt: i at: j.
			box printOn: aStream ].
		i = self width ifFalse: [ aStream	<< Smalltalk os lineEnding ] ]
]

{ #category : #'player api' }
MoocField >> readableTextualRepresentation [
	| visitor |
	visitor := MoocFieldPrinter new.
	self accept: visitor.
	^ visitor streamContents
]

{ #category : #'box api' }
MoocField >> replaceBoxAtRow: x column: y by: aMBox [
	matrix at: x at: y put: aMBox
]

{ #category : #accessing }
MoocField >> rightFlagCountAroundAt: x at: y [ 
	^ (self flagCountAroundBoxAt: x at: y) = (self mineCountAroundBoxAt: x at: y)
]

{ #category : #accessing }
MoocField >> round [
	^ round
]

{ #category : #accessing }
MoocField >> width [
	^ matrix numberOfColumns
]
