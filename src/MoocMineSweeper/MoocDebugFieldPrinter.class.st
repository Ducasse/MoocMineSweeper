"
I do the same thing as my mother class but I show mines on the field by printing a M.
"
Class {
	#name : #MoocDebugFieldPrinter,
	#superclass : #MoocFieldPrinter,
	#category : #'MoocMineSweeper-Visitors'
}

{ #category : #visiting }
MoocDebugFieldPrinter >> visitMMine: aMMine [
	self writeStream << $M
]
