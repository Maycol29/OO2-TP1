Class {
	#name : #UserProfileComponent,
	#superclass : #WAComponent,
	#instVars : [
		'profileUser',
		'parent'
	],
	#category : #'OO2 Tp1-ui'
}

{ #category : #callbacks }
UserProfileComponent >> befriend: anUser [
	self session user addFollowing: anUser
]

{ #category : #accessing }
UserProfileComponent >> model [ 
^CuOOra soleInstance 
]

{ #category : #callback }
UserProfileComponent >> negativeLike: aVote [
	aVote
		addVote: (Vote newBelongsTo: self session user username value: false)
]

{ #category : #accessing }
UserProfileComponent >> parent [ 
^parent
]

{ #category : #callback }
UserProfileComponent >> positiveLike: aVote [
	aVote
		addVote: (Vote newBelongsTo: self session user username value: true)
]

{ #category : #accessing }
UserProfileComponent >> profileUser: aUser [
profileUser := aUser
]

{ #category : #accessing }
UserProfileComponent >> profileUser: aUser parent:aComponent [
profileUser := aUser.
parent:=aComponent.
]

{ #category : #rendering }
UserProfileComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'CuOOra'.
	aCanvas break.
	aCanvas horizontalRule.
	aCanvas heading: profileUser username , ' questions'.
	aCanvas anchor
		callback: [ self befriend: profileUser ];
		with: [ aCanvas button: 'Follow' ].
	aCanvas
		unorderedList: [ (self model questionsBy:(self session user))
		do: [ :post | 
					aCanvas render:(QuestionComponent new question: post parent:parent) ]].
]
