"
I represent a tile in a mine field. 
I display either a bomb, or a number indicating the number of bombs around me.
I start displaying an unknown status.
"
Class {
	#name : #MoocBoxElement,
	#superclass : #BlElement,
	#instVars : [
		'box',
		'size',
		'text',
		'field'
	],
	#classVars : [
		'icons'
	],
	#category : #'MoocMineSweeper-Bloc'
}

{ #category : #'accessing - icons' }
MoocBoxElement class >> flag [
	"Private - Generated method"

	^ self icons at: #flag ifAbsentPut: [
		  Form fromBinaryStream:
			  self flagContents base64Decoded asByteArray readStream ]
]

{ #category : #'private - contents' }
MoocBoxElement class >> flagContents [
	"Private - Method generated with the content of the file"

	^ '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'
]

{ #category : #accessing }
MoocBoxElement class >> icons [
	^ icons ifNil: [ icons := Dictionary new ]
]

{ #category : #'class initialization' }
MoocBoxElement class >> initialize [

	"(FileLocator imageDirectory / 'flag.png') exists ifTrue: [ ^ self ].

	ZnClient new
		url:
			'https://github.com/Enzo-Demeulenaere/MineSweeper/blob/master/repository/flag.png?raw=true';
		downloadTo: FileLocator imageDirectory"
]

{ #category : #' tests' }
MoocBoxElement class >> inspectionIcons [
	<inspectorPresentationOrder: 0 title: 'icons'>
	<script: 'self inspect'>
	^ SpTablePresenter new
		  addColumn: (SpImageTableColumn title: 'Icon' evaluated: #value);
		  addColumn: (SpStringTableColumn title: 'Name' evaluated: #key);
		  items:
			  ((self class selectorsInCategory: 'accessing - icons') sorted
				   collect: [ :each | each -> (self perform: each) ]);
		  yourself
]

{ #category : #'accessing - reset' }
MoocBoxElement class >> resetIcons [
	<script>
	^ icons := nil
]

{ #category : #accessing }
MoocBoxElement >> backgroundPaint [ 
	^ Color lightGray 
]

{ #category : #accessing }
MoocBoxElement >> box [ 
	^ box
]

{ #category : #accessing }
MoocBoxElement >> box: aMBox [

	box := aMBox.

	box announcer
		when: MoocBoxClickAndReplaceAnnouncement
		send: #click: 
		to: self.
	box announcer when: MoocBoxFlaggedAnnouncement send: #flag to: self.
	box announcer
		when: MoocBoxExplosionAnnouncement
		send: #explosion
		to: self
]

{ #category : #public }
MoocBoxElement >> click: anAnnouncement [

	|boxPosX boxPosY|
	self box isFlagged ifTrue: [
		self field gameEnded
			ifFalse: [ ^ self ]
			ifTrue: [ self background: Color transparent ] ].

	self background: Color transparent.
	
	boxPosX := self position x // self width + 1.
	boxPosY := self position y // self height + 1.


	self box isMineBox
		ifTrue: [ text text: 'M' asRopedText ]
		ifFalse: [
			self box announcer unsubscribe: self.
			self box: anAnnouncement box.
			text text:
				(self field mineCountAroundBoxAt: boxPosY at: boxPosX) asString
					asRopedText. ].

	text text fontSize: self width.
	text text fontName: 'Source Sans Pro'
]

{ #category : #animation }
MoocBoxElement >> explosion [

	| explosionCenter |
	explosionCenter := self width / 2 @ (self height / 2).

	0 to: 359 by: 12 do: [ :angle |
		| anElement relativeFinalPosition |
		relativeFinalPosition := 0 @ 400
			                         rotateBy: angle degreesToRadians
			                         about: 0 @ 0.
		anElement := self explosionStar.
		self addChild: anElement.
		anElement
			position: explosionCenter;
			addAnimation: (BlTransformAnimation new
					 duration: 1 second;
					 transformDo: [ :t |
						 t translateBy: relativeFinalPosition.
						 t rotateBy: 180 ];
					 onFinishedDo: [
						 anElement removeFromParent ];
					 yourself) yourself ]
]

{ #category : #animation }
MoocBoxElement >> explosionStar [

	| outerSize innerSize numberOfPoints angleStep vertices |
	outerSize := 20.
	innerSize := 8.
	numberOfPoints := (4 to: 7) atRandom.
	angleStep := 360.0 / numberOfPoints.

	vertices := OrderedCollection new.
	0 to: 360 by: angleStep do: [ :angle |
		vertices
			add: (0 @ innerSize
					 rotateBy: (angle - (angleStep * 0.5)) degreesToRadians
					 about: 0 asPoint);
			add:
				(0 @ outerSize rotateBy: angle degreesToRadians about: 0 asPoint);
			add: (0 @ innerSize
					 rotateBy: (angle + (angleStep * 0.5)) degreesToRadians
					 about: 0 asPoint) ].

	^ BlElement new
		  geometry: (BlPolygonGeometry vertices: vertices);
		  background: Color random;
		  constraintsDo: [ :c | c ignoreByLayout ];
		  yourself
]

{ #category : #accessing }
MoocBoxElement >> field [ 
	^field 
]

{ #category : #accessing }
MoocBoxElement >> field: aMField [
	field:= aMField 
]

{ #category : #accessing }
MoocBoxElement >> flag [

	| pngElement |
	pngElement := BlElement new.
	pngElement background: self class flag.

	pngElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].

	self box isFlagged
		ifFalse: [ self addChild: pngElement as: 'png' ]
		ifTrue: [ self removeChildNamed: 'png' ]
]

{ #category : #initialization }
MoocBoxElement >> initialize [

	| posX posY |
	super initialize.
	self background: self backgroundPaint.
	self geometry: (BlRoundedRectangleGeometry cornerRadius: 5).
	self size: 150 @ 150.
	self clipChildren: false.

	self initializeText.

	self layout: BlFrameLayout new.

	text constraintsDo: [ :c |
		c frame vertical alignCenter.
		c frame horizontal alignCenter ].

	self addEventHandlerOn: BlMouseUpEvent do: [ :anEvent |
		posX := anEvent position x
		        // (self width + self parent layout cellSpacing) + 1.
		posY := anEvent position y
		        // (self height + self parent layout cellSpacing) + 1.

		anEvent secondaryButtonPressed
			ifTrue: [ box announceFlag ]
			ifFalse: [
				self box isFlagged ifFalse: [
					box clickIn: field at: posY at: posX ] ] ]
]

{ #category : #initialization }
MoocBoxElement >> initializeText [

	text := BlTextElement new.
	self addChild: text.
	text text: '' asRopedText.
]
