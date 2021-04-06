Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'username',
		'password',
		'followers'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #initialization }
User class >> newUsername: aUsername password: aPassword [
	^ self new username: aUsername password: aPassword
]

{ #category : #accessing }
User >> addFollower: aUser [
	| previousFollower |
	previousFollower := followers detect: [ :follower | follower username  = aUser username ].
	previousFollower ifNotNil: [ followers remove: previousFollower ].
	followers add: aUser
]

{ #category : #accessing }
User >> followers [
^followers 
]

{ #category : #initialization }
User >> initialize [ 
	followers := Set new.
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
