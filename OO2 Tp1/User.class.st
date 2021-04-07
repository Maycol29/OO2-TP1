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
	| previousFollower |
	previousFollower := following detect: [ :follower | follower username  = aUser username ].
	previousFollower ifNotNil: [ following remove: previousFollower ].
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

{ #category : #initialization }
User >> initialize [ 
	following := Set new.
	interestTopics := OrderedCollection new.
	creationDate:=DateAndTime today.
]

{ #category : #testing }
User >> isNotFollowing: aUser [

(following detect: [:user| user == aUser ]) ifNil: [ ^true ].
^false

]

{ #category : #accessing }
User >> password [
	^ password
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
