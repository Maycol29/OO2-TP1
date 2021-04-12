Class {
	#name : #QuestionComponent,
	#superclass : #PostComponent,
	#instVars : [
		'reply',
		'vamo'
	],
	#category : #'OO2 Tp1-ui'
}

{ #category : #rendering }
QuestionComponent >> renderContentOn: aCanvas [
aCanvas paragraph
						with:
							[ aCanvas heading
								level: 2;
								with: question title ] .
							aCanvas paragraph 
								style: 'font-size: 20px';
						with: [ aCanvas text: 'Asked by:'.
							aCanvas strong with:[  
								aCanvas anchor 
								callback: [ parent showProfileOf: question author ]; 
								with:question author username ].
							aCanvas text: ' | '.
							aCanvas text: question cantAnswers .
							aCanvas space.
							aCanvas text: 'answers'.
							aCanvas break.
							aCanvas text: 'Description:'.
							aCanvas space.
							aCanvas text: question text.
							aCanvas break.
							aCanvas text: 'Topics: '.
							question topics do: 
								[ :topic | 
									aCanvas text: ' ',topic name , ' '.
									aCanvas space ].
							aCanvas break.
							super renderFeedback: aCanvas value:question.
							aCanvas break.
							self viewAnswers: aCanvas question: question].
]

{ #category : #rendering }
QuestionComponent >> viewAnswers: aCanvas question: aQuestion [
	aCanvas anchor
		style: 'color: black';
		callback: [ parent seeAnswers: aQuestion ];
		with: 'See Answers'.
	aCanvas horizontalRule.
]
