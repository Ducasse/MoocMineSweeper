Class {
	#name : #MoocAbstractTest,
	#superclass : #TestCase,
	#category : #'MoocMineSweeper-Tests'
}

{ #category : #'test ressources' }
MoocAbstractTest >> matrixForField [
	^ (Array2D rows: 5 columns: 5)
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
			yourself
]
