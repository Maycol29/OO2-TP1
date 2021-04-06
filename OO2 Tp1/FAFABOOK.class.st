Class {
	#name : #FAFABOOK,
	#superclass : #Object,
	#instVars : [
		'users',
		'topics'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #'instance creation' }
FAFABOOK class >> clearSoleInstance [
	soleInstance := nil
]

{ #category : #'instance creation' }
FAFABOOK class >> soleInstance [
^soleInstance ifNil:[soleInstance:=self new].

]

{ #category : #accessing }
FAFABOOK >> addTopic:aTopic [
topics add:aTopic.
]

{ #category : #accessing }
FAFABOOK >> addUser: aUser [
	users add: aUser
]

{ #category : #accessing }
FAFABOOK >> amountOfQuestionsBy: aUser [
	(topics collect: [:topic| topic questionsInTopicBy: aUser ])size .
]

{ #category : #accessing }
FAFABOOK >> deleteQuestion:aQuestion [
(aQuestion topics)do:[:each | each questions remove:aQuestion].
aQuestion answers removeAll.
aQuestion votes removeAll.
]

{ #category : #accessing }
FAFABOOK >> getTopicQuestions:aTopic [    
^aTopic questions.
]

{ #category : #initialization }
FAFABOOK >> initialize [
	users := OrderedCollection new.
	topics := Set new
]

{ #category : #accessing }
FAFABOOK >> topics [
	^topics
]

{ #category : #accessing }
FAFABOOK >> userWithUsername: aUsername protectedBy: aPassword [
	^ users
		detect: [ :each | each username  = aUsername  & (each password = aPassword) ]
		ifNone: [ nil ]
]

{ #category : #accessing }
FAFABOOK >> users [ 
^users
]
