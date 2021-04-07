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

{ #category : #utility }
NewPostComponent >> addTopicToSystem [
|systemTopics|
systemTopics :=CuOOra soleInstance topics.
systemTopics addAll:(newTopics reject:[:each | systemTopics detect: each]).
self call:self createPost.
]

{ #category : #callbacks }
NewPostComponent >> post [
	postText ifEmpty: [ ^ self ].
	self session user
		post: (Post text: postText , ' (' , self session user name , ')').
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
	aCanvas form: [ aCanvas strong with: 'Title'.
			aCanvas space.
			aCanvas textInput on: #title of: self ].
	aCanvas break.
	aCanvas
		form: [ (aCanvas textArea on: #postText of: self)
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
		form: [ aCanvas strong with: 'Topics related to question'.
			aCanvas space.
			aCanvas textInput on: #topics of: self ]
]
