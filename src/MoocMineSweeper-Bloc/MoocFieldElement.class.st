"
I'm the board of the game. 
For now you can launch the game doing

```
MoocFieldElement withMatrixForField
```

Or more generally 

```
MoocFieldElement openWithModel: anInstance of MoocField
```
"
Class {
	#name : #MoocFieldElement,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #'MoocMineSweeper-Bloc'
}

{ #category : #execution }
MoocFieldElement class >> openWithModel: aModel [

	| aGameElement space |
	"Create the game model and the Bloc element."
	aGameElement := self new
		                game: aModel;
		                yourself.

	"The space represents the window"
	space := BlSpace new.
	space addChild: aGameElement.

	"Calculate the extent of the game board for the first time, to set it to the window."
	space pulse.
	space extent: aGameElement extent.
	space show.
	^ space
]

{ #category : #'test ressources' }
MoocFieldElement class >> withMatrixForField [

	<script>
	^ self openWithModel: MoocField matrixForField
	
]

{ #category : #execution }
MoocFieldElement class >> withMatrixTest5x5 [

	<script>
	^ self openWithModel: MoocField matrixTest5x5 
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
