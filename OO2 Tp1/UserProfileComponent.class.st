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
UserProfileComponent >> model [ 
^CuOOra soleInstance 
]

{ #category : #callback }
UserProfileComponent >> negativeLike: aVote [
	aVote
		addVote: (Vote newBelongsTo: self session user username value: false)
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

{ #category : #rendering }
UserProfileComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'CuOOra'.
	aCanvas break.
	aCanvas horizontalRule.
	aCanvas heading: profileUser username , ' questions'.
	aCanvas anchor
		callback: [ self befriend: profileUser ];
		with: [ aCanvas button: 'Follow' ].
		
	self renderQuestion: aCanvas 
]

{ #category : #rendering }
UserProfileComponent >> renderQuestion: aCanvas [
	aCanvas
		unorderedList: [ (self model getPostInNetwork: self session user following)
				do: [ :post | 
					aCanvas paragraph
						with:
							[ aCanvas heading
								level: 2;
								with: post title ] .
							aCanvas paragraph 
								style: 'font-size: 20px';
						with: [ aCanvas text: 'Asked by: '.
							aCanvas strong with:[  
								aCanvas anchor 
								callback: [ self showProfileOf: post author ]; 
								with:post author username ].
							aCanvas text: ' | '.
							aCanvas text: post cantAnswers .
							aCanvas space.
							aCanvas text: 'answers'.
							aCanvas break.
							aCanvas text: 'Description:'.
							aCanvas space.
							aCanvas text: post text.
							aCanvas break.
							aCanvas text: 'Topics: '.
							post topics do: 
								[ :topic | 
									aCanvas text: ' ',topic name , ' '.
									aCanvas space ].
							aCanvas break.	
							aCanvas text: post positiveScore.
							aCanvas space.
							aCanvas text: 'Likes'.
							aCanvas text: ' | '.
							aCanvas text: post negativeScore.
							aCanvas space.
							aCanvas text: 'Dislikes'. 
							aCanvas break.	
							aCanvas anchor 
							style:'color: green';
							callback:[self positiveLike:post];
							with:'Like'.
							aCanvas text: ' | '.
							aCanvas anchor 
							style:'color: red';
							callback:[self negativeLike:post];
							with:'Dislike'.
							aCanvas break.
							aCanvas anchor 
							style:'color: black';
							callback:[self seeAnswers:post];
							with:'See Answers'.
							aCanvas horizontalRule  
							] ] ]
]

{ #category : #callbacks }
UserProfileComponent >> showProfileOf: aUser [
|instance|

instance := UserProfileComponent new .
instance profileUser: aUser.
self call: instance.

]
