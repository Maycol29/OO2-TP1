Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'username',
		'password',
		'creationDate'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #'instance creation' }
User class >> name: aName email: anEmail password: aClearTextPassword [
	^ self new
		name: aName;
		email: anEmail;
		password: aClearTextPassword;
		yourself
]

{ #category : #'instance creation' }
User class >> newUsername: aUsername password: aPassword [
	^ self new username: aUsername password: aPassword
]

{ #category : #accessing }
User >> befriend: aUser [
	(friends includes: aUser)
		ifTrue: [ ^ self ].
	friends add: aUser.
	aUser befriend: self
]

{ #category : #initialization }
User >> canBefriend: aUser [
	aUser == self
		ifTrue: [ ^ false ].
	(friends includes: aUser)
		ifTrue: [ ^ false ].
	^ true
]

{ #category : #accessing }
User >> email [
	^ email
]

{ #category : #accessing }
User >> email: anObject [
	email := anObject
]

{ #category : #accessing }
User >> friends [
	^ friends
]

{ #category : #initialization }
User >> initialize [
	creationDate := DateAndTime  today .
	
	
]

{ #category : #accessing }
User >> name [
	^ name
]

{ #category : #accessing }
User >> name: anObject [
	name := anObject
]

{ #category : #accessing }
User >> password [
	^ password
]

{ #category : #accessing }
User >> password: anObject [
	password := anObject
]

{ #category : #accessing }
User >> post: aPost [
	posts add: aPost 
]

{ #category : #accessing }
User >> posts [
	^ posts
]

{ #category : #accessing }
User >> postsInNetwork [
	^ (friends flatCollect: [ :each | each posts ]) , posts
		asSortedCollection: [ :a :b | a timeStamp > b timeStamp ]
]

{ #category : #initialization }
User >> username: aUsername password: aPassword [
	username:= aUsername .
	password := aPassword .
]
