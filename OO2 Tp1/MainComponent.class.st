Class {
	#name : #MainComponent,
	#superclass : #WAComponent,
	#category : #'OO2 Tp1-ui'
}

{ #category : #callbacks }
MainComponent >> createNewPost [
	self call: NewPostComponent new
]

{ #category : #callbacks }
MainComponent >> findFriend [
	self call: UserFinderComponent new
]

{ #category : #model }
MainComponent >> model [ 
^CuOOra soleInstance 
]

{ #category : #callbacks }
MainComponent >> negativeLike: aQuestion [
	aQuestion
		addVote: (Vote newBelongsTo: self session user username value: false)
]

{ #category : #callbacks }
MainComponent >> positiveLike: aQuestion [
	aQuestion
		addVote: (Vote newBelongsTo: self session user username value: true)
]

{ #category : #rendering }
MainComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Welcome ' , self session user username.
	self renderPostsOn: aCanvas.
	aCanvas horizontalRule.
	self renderFriendsOn: aCanvas.
	aCanvas horizontalRule.
	self renderLogoutButtonOn: aCanvas.
]

{ #category : #rendering }
MainComponent >> renderFriendsOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Following'.
	aCanvas
		unorderedList: [ self session user following do: [ :each | aCanvas listItem: each username ] ].
	aCanvas anchor
		callback: [ self findFriend ];
		with: [ aCanvas button: 'Find User' ]
]

{ #category : #rendering }
MainComponent >> renderLogoutButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self session user: nil.
					self call: LogInComponent new ];
				with: [ aCanvas button with: 'Logout' ] ]
]

{ #category : #rendering }
MainComponent >> renderPostsOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Following Posts'.
	self renderQuestion: aCanvas .
	aCanvas anchor
		callback: [ self createNewPost ];
		with: [ aCanvas button: 'Create new post' ]
]

{ #category : #rendering }
MainComponent >> renderQuestion: aCanvas [
	aCanvas
		unorderedList: [ (self model getPostInNetwork: self session user following)
				do: [ :each | 
					aCanvas paragraph
						with:
							[ aCanvas heading
								level: 2;
								with: each title ] .
							aCanvas paragraph 
								style: 'font-size: 20px';
						with: [ aCanvas text: 'Do it for:'.
							aCanvas strong with: each author.
							aCanvas break.
							aCanvas text: 'Description:'.
							aCanvas space.
							aCanvas text: each text.
							aCanvas break.
							aCanvas text: 'Topics:'.
							each topics
								do: [ :topic | 
									aCanvas text: '_' , topic name , '_'.
									aCanvas space ].
							aCanvas break.	
							aCanvas text:each positiveScore.
							aCanvas space.
							aCanvas text: 'Likes'.
							aCanvas text: ' | '.
							aCanvas text:each negativeScore.
							aCanvas space.
							aCanvas text: 'Dislikes'. 
							aCanvas break.	
							aCanvas anchor 
							style:'color: green';
							callback:[self positiveLike:each];
							with:'Like'.
							aCanvas text: ' | '.
							aCanvas anchor 
							style:'color: red';
							callback:[self negativeLike:each];
							with:'Dislike'.
							aCanvas horizontalRule  
							] ] ]
]
