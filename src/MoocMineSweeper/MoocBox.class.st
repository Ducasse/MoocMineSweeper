"
I am an abstract box held by the mine field.
"
Class {
	#name : #MoocBox,
	#superclass : #MoocVisitableObject,
	#instVars : [
		'announcer',
		'flagged',
		'position'
	],
	#category : #'MoocMineSweeper-Core'
}

{ #category : #'subclass instance creation' }
MoocBox class >> clicked [
	^ MoocClicked new
]

{ #category : #'subclass instance creation' }
MoocBox class >> mine [
	^ MoocMine new
]

{ #category : #'random subclass instance creation' }
MoocBox class >> randomCase [
	^ (1 to: 7) atRandom > 6
			ifTrue: [ self mine ]
			ifFalse: [ self unknown ].
]

{ #category : #'subclass instance creation' }
MoocBox class >> unknown [
	^ MoocUnknown new
]

{ #category : #accessing }
MoocBox >> announceFlag [

	self announcer announce: MoocBoxFlaggedAnnouncement new.
	self flagged: flagged not
]

{ #category : #accessing }
MoocBox >> announcer [ 
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #clicking }
MoocBox >> clickIn: aMField at: x at: y [
	self subclassResponsibility
]

{ #category : #accessing }
MoocBox >> flagged: aBoolean [
	flagged:= aBoolean 
]

{ #category : #initialization }
MoocBox >> initialize [ 
	flagged := false
]

{ #category : #testing }
MoocBox >> isClickedBox [
	^ false
]

{ #category : #testing }
MoocBox >> isFlagged [ 
	^ flagged
]

{ #category : #testing }
MoocBox >> isMineBox [
	^ false
]

{ #category : #testing }
MoocBox >> isUnknownBox [
	^ false
]
