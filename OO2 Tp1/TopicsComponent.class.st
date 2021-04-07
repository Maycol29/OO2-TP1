Class {
	#name : #TopicsComponent,
	#superclass : #WAComponent,
	#instVars : [
		'topic',
		'newTopics'
	],
	#category : #'OO2 Tp1-ui'
}

{ #category : #adding }
TopicsComponent >> addTopicToList [
topic ifNotNil: [ newTopics add:topic ].
topic:=nil.
]

{ #category : #accessing }
TopicsComponent >> createPost [
self call:NewPostComponent new.
]

{ #category : #accessing }
TopicsComponent >> newTopics [
^newTopics
]

{ #category : #rendering }
TopicsComponent >> renderAddTopicButtonsOn: aCanvas [
	aCanvas submitButton 
	 callback: [ self addTopicToList ] ;
		with: 'Add Topic' 
]

{ #category : #rendering }
TopicsComponent >> renderAddTopicSystemButtonOn:aCanvas [
	aCanvas submitButton
	 callback: [ self addTopicToSystem ]; 
		with: 'Ready'
]

{ #category : #rendering }
TopicsComponent >> renderContentOn: aCanvas [
	aCanvas paragraph
		with: [ self renderInputElementsOn:aCanvas.
			self renderAddTopicButtonsOn: aCanvas.
			self renderAddTopicSystemButtonOn:aCanvas ]
	
]

{ #category : #accessing }
TopicsComponent >> topic [
^topic
]

{ #category : #accessing }
TopicsComponent >> topic:aTopic [
topic:=aTopic
]
