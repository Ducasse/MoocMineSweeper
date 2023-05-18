Class {
	#name : #MoocFieldElement,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #'MoocMineSweeper-Bloc'
}

{ #category : #'test ressources' }
MoocFieldElement class >> matrixForField [  
	|aGameElement space|
	"Create the game model and the Bloc element."
	aGameElement := self new game: MoocField matrixForField ; yourself.
	
	"The space represents the window"
	space := BlSpace new.
	space addChild: aGameElement. 

	"Calculate the extent of the game board for the first time, to set it to the window."
	space pulse.
	space extent: aGameElement extent.

	"Show the window"

	space show. 
]

{ #category : #execution }
MoocFieldElement class >> matrixTest5x5 [

	| aGameElement space |
	"Create the game model and the Bloc element."
	aGameElement := self new
		                game: MoocField matrixTest5x5;
		                yourself.

	"The space represents the window"
	space := BlSpace new.
	space addChild: aGameElement.

	"Calculate the extent of the game board for the first time, to set it to the window."
	space pulse.
	space extent: aGameElement extent.

	"Show the window"
	space show.
	^ space
]

{ #category : #accessing }
MoocFieldElement >> game [ 
	^ game
]

{ #category : #accessing }
MoocFieldElement >> game: aMField [

	game := aMField.
	self layout columnCount: game width.
	game matrix do: [ :aBox |
		| boxElement |
		boxElement := (MoocBoxElement new box: aBox) field: aMField.
		self addChild: boxElement ]
]

{ #category : #initialization }
MoocFieldElement >> initialize [

	super initialize.
"	self padding: (BlInsets all: 20)."
	self background: (BlBackground paint: Color white darker).
	self layout: (BlGridLayout horizontal cellSpacing: 5).
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal fitContent.
		aLayoutConstraints vertical fitContent ]
]
