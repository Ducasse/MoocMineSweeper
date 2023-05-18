"
I am an abstract visitor exporting the MField on the stream in #writeStream instance variable.
"
Class {
	#name : #MoocStreamExporter,
	#superclass : #MoocFieldVisitor,
	#instVars : [
		'writeStream'
	],
	#category : #'MoocMineSweeper-Visitors'
}

{ #category : #'instance creation' }
MoocStreamExporter class >> on: aWriteStream [
	^ self writeStream: aWriteStream
]

{ #category : #'instance creation' }
MoocStreamExporter class >> writeStream: aWriteStream [
	^ self new
		writeStream: aWriteStream;
		yourself
]

{ #category : #accessing }
MoocStreamExporter >> streamContents [
	^ self writeStream contents
]

{ #category : #accessing }
MoocStreamExporter >> writeStream [
	^ writeStream
]

{ #category : #accessing }
MoocStreamExporter >> writeStream: anObject [
	writeStream := anObject
]
