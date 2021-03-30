Class {
	#name : #CuOOra,
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
CuOOra class >> clearSoleInstance [
soleInstance:=nil.

]

{ #category : #'instance creation' }
CuOOra class >> soleInstance [
^soleInstance ifNil:[soleInstance:=self new].

]

{ #category : #accessing }
CuOOra >> addTopic:aTopic [
topics add:aTopic.

]

{ #category : #accessing }
CuOOra >> addUser:aUser [
users add:aUser.

]

{ #category : #accessing }
CuOOra >> getTopicQuestion:aTopic [    "deberia pasarla x parametro un topico q existe"
^aTopic questions.

]

{ #category : #initialize }
CuOOra >> initialize [
users:=OrderedCollection new.
topics:=OrderedCollection new.

]

{ #category : #accessing }
CuOOra >> interestingTopicOf:aUser [
^ topics detectMax: [ :each | each mostInteresting:aUser  ]. 
]

{ #category : #accessing }
CuOOra >> topics [
^topics

]

{ #category : #accessing }
CuOOra >> users [
^users

]
