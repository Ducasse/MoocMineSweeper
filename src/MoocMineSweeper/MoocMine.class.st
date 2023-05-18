"
I am a box with a mine in the mine field.
If I am clicked by the player, he dies.
"
Class {
	#name : #MoocMine,
	#superclass : #MoocBox,
	#category : #'MoocMineSweeper-Core'
}

{ #category : #visiting }
MoocMine >> accept: aMFieldVisitor [
	^ aMFieldVisitor visitMMine: self
]

{ #category : #clicking }
MoocMine >> clickIn: aMField at: x at: y [

	self isFlagged ifTrue: [ ^self].
	
	self announcer announce: MoocBoxExplosionAnnouncement new.
	aMField gameEnded ifFalse: [ aMField playerLoose ]
]

{ #category : #testing }
MoocMine >> isMineBox [
	^ true
]

{ #category : #printing }
MoocMine >> printOn: aStream [
	aStream << 'o'
]
