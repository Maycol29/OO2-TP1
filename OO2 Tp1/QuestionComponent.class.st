Class {
	#name : #QuestionComponent,
	#superclass : #PostComponent,
	#category : #'OO2 Tp1-ui'
}

{ #category : #'instance creation' }
QuestionComponent class >> newQuestion: aQuestion parent: aParent [
	| instance |
	instance := self new.
	instance question: aQuestion parent: aParent.
	^ instance
]

{ #category : #initialization }
QuestionComponent >> initialize [ 
super initialize .
]

{ #category : #rendering }
QuestionComponent >> renderContentOn: aCanvas [
	aCanvas paragraph
		with: [ aCanvas heading
				level: 2;
				with: [aCanvas anchor style:'color:darkviolet';
					callback: [ parent seeAnswers: question ];
				with: (question title) ]].
	aCanvas paragraph
		style: 'font-size: 20px';
		with: [ aCanvas text: 'Asked by: '.
			aCanvas strong
				with: [ aCanvas anchor
						callback: [ parent showProfileOf: question author ];
						with: question author username ].
			aCanvas text: ' | '.
			aCanvas text: question cantAnswers.
			aCanvas space.
			aCanvas text: 'answers'.
			aCanvas break.
			aCanvas text: 'Description:'.
			aCanvas space.
			aCanvas text: question text.
			aCanvas break.
			aCanvas text: 'Topics: '.
			question topics
				do: [ :topic | 
					aCanvas text: ' ' , topic name , ' '.
					aCanvas space ].
			aCanvas break.
			super renderFeedback: aCanvas value: question.
			aCanvas break.
			aCanvas horizontalRule]
]

{ #category : #rendering }
QuestionComponent >> viewAnswers: aCanvas question: aQuestion [
	aCanvas callback: [ parent seeAnswers: aQuestion ]
	
]
