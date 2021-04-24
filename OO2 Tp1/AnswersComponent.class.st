Class {
	#name : #AnswersComponent,
	#superclass : #PostComponent,
	#instVars : [
		'reply',
		'showB',
		'seeR'
	],
	#category : #'OO2 Tp1-ui'
}

{ #category : #'instance creation' }
AnswersComponent class >> newQuestion: aQuestion parent: aParent [
	| instance |
	instance := self new.
	instance question: aQuestion parent: aParent.
	^ instance
	

]

{ #category : #callback }
AnswersComponent >> createAnswer: aQuestion [
	aQuestion
		addAnswer: (Answer newAuthor: self session user text: reply).
]

{ #category : #initialize }
AnswersComponent >> initialize [ 
super initialize.
showB :=false.
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
	aCanvas paragraph
						style: 'font-size: 25px';
						with:'No more answers'.
	aCanvas submitButton 
		callback: [ self answer ];
		with: 'Back' .
	seeR ifTrue:[aCanvas
		submitButton   
		callback: [showB :=true.seeR:=false.];
		with:'reply'].
	aCanvas break.
	showB
		ifFalse: [ ^ self ].
	showB
		ifTrue: [ self renderCreateAnAnswer: aCanvas ].
]

{ #category : #rendering }
AnswersComponent >> renderContentOn: aCanvas [
	aCanvas heading style:' background-color: black; color:white'; with:'CuOOra '.
	aCanvas horizontalRule.
	aCanvas
		form: [ aCanvas render: (QuestionComponent newQuestion: question parent:parent).
			self renderAnswers: aCanvas ]
]

{ #category : #rendering }
AnswersComponent >> renderCreateAnAnswer: aCanvas [
	(aCanvas textArea on: #reply of: self)
		columns: 50;
		rows: 5.
	aCanvas break.
	aCanvas submitButton 
		callback: [ seeR:=true.showB :=false ];
		with: 'Cancel' .
	aCanvas space.
	aCanvas submitButton
		callback: [ self createAnswer:question.seeR:=true.showB :=false.reply:='' ];
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
AnswersComponent >> showB [
^showB
]

{ #category : #accessing }
AnswersComponent >> showB:aBollean [
showB:=aBollean 
]
