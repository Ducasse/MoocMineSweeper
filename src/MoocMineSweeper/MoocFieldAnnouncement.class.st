"
I am an abstract announcement from a mine field.
"
Class {
	#name : #MoocFieldAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'field'
	],
	#category : #'MoocMineSweeper-Announcements'
}

{ #category : #'instance creation' }
MoocFieldAnnouncement class >> field: aMField [
	^ self new
		field: aMField;
		yourself
]

{ #category : #accessing }
MoocFieldAnnouncement >> field [
	^ field
]

{ #category : #accessing }
MoocFieldAnnouncement >> field: anObject [
	field := anObject
]
