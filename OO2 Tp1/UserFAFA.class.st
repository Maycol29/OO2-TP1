Class {
	#name : #UserFAFA,
	#superclass : #Object,
	#instVars : [
		'username',
		'password',
		'followers'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #initialization }
UserFAFA class >> newUsername: aUsername password: aPassword [
	^ self new username: aUsername password: aPassword
]

{ #category : #accessing }
UserFAFA >> addFollower: aUser [
	| previousFollower |
	previousFollower := followers detect: [ :follower | follower username  = aUser username ].
	previousFollower ifNotNil: [ followers remove: previousFollower ].
	followers add: aUser
]

{ #category : #accessing }
UserFAFA >> followers [
^followers 
]

{ #category : #initialization }
UserFAFA >> initialize [ 
	followers := Set new.
]

{ #category : #accessing }
UserFAFA >> username [ 
	^username 
]

{ #category : #initialization }
UserFAFA >> username: aUsername password: aPassword [
	username:= aUsername .
	password := aPassword .
]
