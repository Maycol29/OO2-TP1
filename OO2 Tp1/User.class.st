Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'username',
		'password',
		'following',
		'interestTopics',
		'creationDate'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #initialization }
User class >> newUsername: aUsername password: aPassword [
	^ self new username: aUsername password: aPassword
]

{ #category : #accessing }
User >> addFollowing: aUser [
	following add: aUser
]

{ #category : #accessing }
User >> addInterestTopic:aTopic [
interestTopics add:aTopic
]

{ #category : #accessing }
User >> following [
^following 
]

{ #category : #accessing }
User >> getRelevantQuestions [
^interestTopics flatCollect:[:topic|topic questionsInTopicExcept:self]
]

{ #category : #initialization }
User >> initialize [ 
	following := OrderedCollection new.
	interestTopics := OrderedCollection new.
	creationDate:=DateAndTime now.
]

{ #category : #accessing }
User >> interestTopics [
^interestTopics
]

{ #category : #accessing }
User >> interestTopics: topicList [
	interestTopics := topicList
]

{ #category : #testing }
User >> isFollowing: aUser [
(aUser == self) ifFalse: [ ^(following includes: aUser) ].
^true



]

{ #category : #accessing }
User >> isThisUsername: aUsername password: aPassword [
	((username = aUsername) & (password = aPassword))
		ifTrue: [ ^ true ].
	^ false
]

{ #category : #accessing }
User >> password [
	^ password
]

{ #category : #removing }
User >> removeFollowing:anUser [
following remove:anUser
]

{ #category : #accessing }
User >> username [ 
	^username 
]

{ #category : #initialization }
User >> username: aUsername password: aPassword [
	username:= aUsername .
	password := aPassword .
]

{ #category : #accessing }
User >> usernameWith: aString [
	^ username asLowercase includesSubstring: aString asLowercase
]
