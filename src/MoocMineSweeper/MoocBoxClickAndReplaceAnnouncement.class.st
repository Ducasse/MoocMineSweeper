Class {
	#name : #MoocBoxClickAndReplaceAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'box'
	],
	#category : #'MoocMineSweeper-Announcements'
}

{ #category : #replacement }
MoocBoxClickAndReplaceAnnouncement class >> replaceBy: aMClickedBox [
	^ self new box: aMClickedBox 
]

{ #category : #accessing }
MoocBoxClickAndReplaceAnnouncement >> box [
	^ box
]

{ #category : #accessing }
MoocBoxClickAndReplaceAnnouncement >> box: aMBox [
	box:= aMBox 
]
