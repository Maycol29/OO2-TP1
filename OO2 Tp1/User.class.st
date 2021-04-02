Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'username',
		'password',
		'followers',
		'posts'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #'instance creation' }
User class >> newUsername: aUsername password: aPassword [
	^ self new username: aUsername password: aPassword
]

{ #category : #accessing }
User >> addFollower:aUser [
	followers add:aUser.
]

{ #category : #initialization }
User >> initialize [
	followers := OrderedCollection new.
	posts := OrderedCollection new
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
	^ (followers flatCollect: [ :each | each posts ]) , posts
		asSortedCollection: [ :a :b | a timeStamp > b timeStamp ]
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
