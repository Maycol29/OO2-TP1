Class {
	#name : #AnswersComponent,
	#superclass : #WAComponent,
	#instVars : [
		'question',
		'reply'
	],
	#category : #'OO2 Tp1-ui'
}

{ #category : #callback }
AnswersComponent >> createAnswer: aQuestion [
	aQuestion
		addAnswer: (Answer newAuthor: self session user text: reply).
	self answer
]

{ #category : #callback }
AnswersComponent >> negativeLike: aVote [
	aVote
		addVote: (Vote newBelongsTo: self session user username value: false)
]

{ #category : #callback }
AnswersComponent >> positiveLike:aVote [
	aVote
		addVote: (Vote newBelongsTo: self session user username value: true)
]

{ #category : #accesing }
AnswersComponent >> question [
^question
]

{ #category : #accesing }
AnswersComponent >> question: aQuestion [
question:=aQuestion.
]

{ #category : #rendering }
AnswersComponent >> renderAnswers:aCanvas [
aCanvas
		unorderedList: [ (question orderedAnswers)
			do: [ :each | 
			aCanvas paragraph
								style: 'font-size: 20px';
						with: [ aCanvas text: 'Answer By '.
							aCanvas strong with: each author.
							aCanvas break.
							aCanvas text: each text.
							aCanvas break.
							aCanvas text: each positiveScore.
							aCanvas space.
							aCanvas text: 'Likes'.
							aCanvas text: ' | '.
							aCanvas text: each negativeScore.
							aCanvas anchor 
							style:'color: green';
							callback:[self positiveLike:each];
							with:'Like'.
							aCanvas text: ' | '.
							aCanvas anchor 
							style:'color: red';
							callback:[self negativeLike:each];
							with:'Dislike'.
							aCanvas horizontalRule]]].
				aCanvas text:'No more answers'.
				aCanvas callback:[self createAnAnswer:aCanvas];
							with:[aCanvas button with: 'Create new answer' ].
				
]

{ #category : #rendering }
AnswersComponent >> renderContentOn: aCanvas [
	aCanvas heading:'CuOOra'.
"	aCanvas
		form: [ self renderQuestion: aCanvas.
			self renderAnswers: aCanvas.]"


]

{ #category : #rendering }
AnswersComponent >> renderCreateAnAnswer: aCanvas [
	aCanvas horizontalRule.
	aCanvas strong with: 'Answer'.
	(aCanvas textArea on: #reply of: self)
		columns: 50;
		rows: 5.
	aCanvas break.
	aCanvas
		callback: [ self answer ];
		with: [ aCanvas button with: 'Cancel' ].
	aCanvas space.
	aCanvas
		callback: [ self createAnswer:question  ];
		with: [ aCanvas button with: 'Confirm post' ]
]

{ #category : #rendering }
AnswersComponent >> renderQuestion: aCanvas [
aCanvas paragraph
						with:
							[ aCanvas heading
								level: 2;
								with: question title ] .
							aCanvas paragraph 
								style: 'font-size: 20px';
						with: [ aCanvas text: 'Do it for:'.
							aCanvas strong with: question author.
							aCanvas text: ' | '.
							aCanvas text: question cantAnswers .
							aCanvas space.
							aCanvas text: 'answers'.
							aCanvas break.
							aCanvas text: 'Description:'.
							aCanvas space.
							aCanvas text: question text.
							aCanvas break.
							aCanvas text: 'Topics:'.
							question topics do: 
								[ :topic | 
									aCanvas text: ' ',topic name , ' '.
									aCanvas space ].
							aCanvas break.	
							aCanvas text: aCanvas question positiveScore.
							aCanvas space.
							aCanvas text: 'Likes'.
							aCanvas text: ' | '.
							aCanvas text: question negativeScore.
							aCanvas space.
							aCanvas text: 'Dislikes'. 
							aCanvas break.	
							aCanvas anchor 
							style:'color: green';
							callback:[self positiveLike:question];
							with:'Like'.
							aCanvas text: ' | '.
							aCanvas anchor 
							style:'color: red';
							callback:[self negativeLike:question];
							with:'Dislike'.
							aCanvas horizontalRule  
							] 
]

{ #category : #accesing }
AnswersComponent >> reply [
^reply
]

{ #category : #accesing }
AnswersComponent >> reply:aReply [ 
reply:=aReply 
]
