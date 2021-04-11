Class {
	#name : #UserProfileComponent,
	#superclass : #WAComponent,
	#instVars : [
		'profileUser'
	],
	#category : #'OO2 Tp1-ui'
}

{ #category : #callbacks }
UserProfileComponent >> befriend: anUser [
	self session user addFollowing: anUser
]

{ #category : #accessing }
UserProfileComponent >> profileUser: aUser [
profileUser := aUser
]

{ #category : #rendering }
UserProfileComponent >> renderContentOn: aCanvas [
	aCanvas heading: [profileUser username  , ' questions. ' , aCanvas anchor
										callback: [ self befriend: profileUser];
										with: [ aCanvas button: 'Follow' ] ].
	
]
