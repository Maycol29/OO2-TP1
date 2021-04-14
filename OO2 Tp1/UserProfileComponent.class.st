Class {
	#name : #UserProfileComponent,
	#superclass : #WAComponent,
	#instVars : [
		'profileUser',
		'parent',
		'follow'
	],
	#category : #'OO2 Tp1-ui'
}

{ #category : #accessing }
UserProfileComponent >> follow [
^follow
]

{ #category : #accessing }
UserProfileComponent >> model [ 
^CuOOra soleInstance 
]

{ #category : #accessing }
UserProfileComponent >> parent [ 
^parent
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
	aCanvas heading style:' background-color: black; color:white'; with:'CuOOra '.
	aCanvas horizontalRule.
	aCanvas
		heading: profileUser username , ' questions'.
	aCanvas anchor
		callback: [ self answer ];
		with: [ aCanvas button: 'Back' ].
	aCanvas space.
	(self session user == profileUser) ifFalse:[self renderFollowButton: aCanvas].
	aCanvas
		unorderedList: [ (self model questionsBy: profileUser)
				do: [ :post | 
					aCanvas
						listItem: [ aCanvas
								render: (QuestionComponent new question: post parent: parent) ] ] ]
]

{ #category : #rendering }
UserProfileComponent >> renderFollow:aCanvas [
aCanvas anchor
		callback: [ parent befriend: profileUser ];
		with: [ aCanvas button: 'Follow' ].
]

{ #category : #rendering }
UserProfileComponent >> renderFollowButton: aCanvas [
	follow:=self session user isFollowing:profileUser . 
	follow=profileUser ifTrue:[^self answer].
	follow
		ifFalse: [ self renderFollow: aCanvas ].
	follow
		ifTrue: [ self renderUnfollow: aCanvas ]
]

{ #category : #rendering }
UserProfileComponent >> renderUnfollow:aCanvas [
aCanvas anchor
		callback: [ parent notBefriend: profileUser ];
		with: [ aCanvas button: 'Unfollow' ].
]
