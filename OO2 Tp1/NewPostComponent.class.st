Class {
	#name : #NewPostComponent,
	#superclass : #WAComponent,
	#instVars : [
		'title',
		'postText',
		'topics'
	],
	#category : #'OO2 Tp1-ui'
}

{ #category : #accessing }
NewPostComponent >> model [
	^ CuOOra soleInstance
]

{ #category : #callbacks }
NewPostComponent >> post [
	| topicList|
	postText ifEmpty: [ self answer ].
	topicList :=self model createTopics: (topics findTokens: ',').
	self model
		addQuestionToSistem:
			(Question
				newAuthor: (self session user username)
				text: postText
				title: title
				topics: topicList).
	self answer
]

{ #category : #accessing }
NewPostComponent >> postText [
	^ postText
]

{ #category : #accessing }
NewPostComponent >> postText: anObject [
	postText := anObject
]

{ #category : #rendering }
NewPostComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'New Question'.
	aCanvas horizontalRule.
	aCanvas
		form: [ aCanvas strong with:'Title'.
			aCanvas space.
			aCanvas textInput on: #title of: self .
			aCanvas break.
			aCanvas break.
			aCanvas strong with:'Description'.
			(aCanvas textArea on: #postText of: self)
				columns: 80;
				rows: 5.
			aCanvas break.
			self renderInputElementsOn: aCanvas.
			aCanvas submitButton
				callback: [ self post ];
				with: 'Post' ]
]

{ #category : #rendering }
NewPostComponent >> renderInputElementsOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas strong with: 'Topics related to question'.
			aCanvas space.
			aCanvas textInput on: #topics of: self ]
]

{ #category : #accessing }
NewPostComponent >> title [ 
^title
]

{ #category : #accessing }
NewPostComponent >> title: aTitle [
	title := aTitle
]

{ #category : #accessing }
NewPostComponent >> topics [
^topics
]

{ #category : #accessing }
NewPostComponent >> topics:aTopics [
topics:=aTopics
]
