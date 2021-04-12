Class {
	#name : #AnswersComponent,
	#superclass : #PostComponent,
	#instVars : [
		'reply',
		'vamo',
		'seeR'
	],
	#category : #'OO2 Tp1-ui'
}

{ #category : #callback }
AnswersComponent >> createAnswer: aQuestion [
	aQuestion
		addAnswer: (Answer newAuthor: self session user text: reply).
]

{ #category : #initialize }
AnswersComponent >> initialize [ 
super initialize.
vamo:=false.
seeR:=true.
]

{ #category : #rendering }
AnswersComponent >> renderAnswers: aCanvas [
	aCanvas
		unorderedList: [ question orderedAnswers
				do: [ :each | 
					aCanvas paragraph
						style: 'font-size: 20px';
						with: [ aCanvas text: 'Answer By '.
							aCanvas anchor 
								callback: [ parent showProfileOf: each author  ]; 
								with: each author username ].
							aCanvas text: each text.
							aCanvas break.
							super renderFeedback: aCanvas value:each]].
	aCanvas text: 'No more answers'.
	aCanvas break.
	aCanvas submitButton 
		callback: [ self answer ];
		with: 'Back' .
	seeR ifTrue:[aCanvas
		submitButton   
		callback: [vamo:=true.seeR:=false.];
		with:'reply'].
	aCanvas break.
	vamo
		ifFalse: [ ^ self ].
	vamo
		ifTrue: [ self renderCreateAnAnswer: aCanvas ].
]

{ #category : #rendering }
AnswersComponent >> renderContentOn: aCanvas [
	|dato|
	dato:=QuestionComponent new question: question parent:parent .
	dato seeA:true.
	aCanvas heading: 'CuOOra'.
	aCanvas horizontalRule.
	aCanvas
		form: [ aCanvas render: (QuestionComponent new question: question parent:parent).
			self renderAnswers: aCanvas ]
]

{ #category : #rendering }
AnswersComponent >> renderCreateAnAnswer: aCanvas [
	(aCanvas textArea on: #reply of: self)
		columns: 50;
		rows: 5.
	aCanvas break.
	aCanvas submitButton 
		callback: [ seeR:=true.vamo:=false ];
		with: 'Cancel' .
	aCanvas space.
	aCanvas submitButton
		callback: [ self createAnswer:question.seeR:=true.vamo:=false.reply:='' ];
		with:'Confirm post' .
]

{ #category : #accesing }
AnswersComponent >> reply [
^reply
]

{ #category : #accesing }
AnswersComponent >> reply:aReply [ 
reply:=aReply 
]

{ #category : #accessing }
AnswersComponent >> vamo [
^vamo
]

{ #category : #accessing }
AnswersComponent >> vamo:vac [
vamo:=vac
]
