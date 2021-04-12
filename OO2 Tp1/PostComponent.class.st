Class {
	#name : #PostComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'question'
	],
	#category : #'OO2 Tp1-ui'
}

{ #category : #callback }
PostComponent >> negativeLike: aVote [
	aVote
		addVote: (Vote newBelongsTo: self session user username value: false)
]

{ #category : #accessing }
PostComponent >> parent [
^parent
]

{ #category : #accessing }
PostComponent >> parent:aComponent [
parent:=aComponent
]

{ #category : #callback }
PostComponent >> positiveLike:aVote [
	aVote
		addVote: (Vote newBelongsTo: self session user username value: true)
]

{ #category : #accesing }
PostComponent >> question [
^question
]

{ #category : #accesing }
PostComponent >> question: aQuestion [
question:=aQuestion.
]

{ #category : #accesing }
PostComponent >> question: aQuestion parent:aComponent [
question:=aQuestion.
parent:=aComponent.
]

{ #category : #rendering }
PostComponent >> renderFeedback: aCanvas value: anObject [
	aCanvas text: anObject positiveScore.
	aCanvas space.
	aCanvas text: 'Likes'.
	aCanvas text: ' | '.
	aCanvas text: anObject negativeScore.
	aCanvas space.
	aCanvas text: 'Dislikes'.
	aCanvas break.
	aCanvas anchor
		style: 'color: green';
		callback: [ self positiveLike: anObject ];
		with: 'Like'.
	aCanvas text: ' | '.
	aCanvas anchor
		style: 'color: red';
		callback: [ self negativeLike: anObject ];
		with: 'Dislike'.
	aCanvas break
]
