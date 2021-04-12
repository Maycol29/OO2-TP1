Class {
	#name : #UserFinderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'searchText',
		'parent'
	],
	#category : #'OO2 Tp1-ui'
}

{ #category : #initialization }
UserFinderComponent >> initialize [
	super initialize.
	searchText := ''
]

{ #category : #accessing }
UserFinderComponent >> parent [
^parent
]

{ #category : #accessing }
UserFinderComponent >> parent:aComponent [
parent:=aComponent .
]

{ #category : #rendering }
UserFinderComponent >> renderContentOn: aCanvas [
	self renderSearchFormOn: aCanvas.
	self renderSearchResultsOn: aCanvas.
	aCanvas horizontalRule.
	aCanvas anchor
		callback: [ self answer ];
		with: [ aCanvas button: 'Finish' ]
]

{ #category : #rendering }
UserFinderComponent >> renderSearchFormOn: aCanvas [
	aCanvas
		form: [ aCanvas textInput on: #searchText of: self.
			aCanvas space.
			aCanvas submitButton with: 'Search' ]
]

{ #category : #rendering }
UserFinderComponent >> renderSearchResultsOn: aCanvas [
	| users |
	searchText ifEmpty: [ ^ self ]. 
	users := CuOOra soleInstance usersMatchingNamePart: searchText.
	users
		ifEmpty: [ aCanvas
				paragraph: 'Sorry... no matches... no friends for you this time.' ]
		ifNotEmpty:
			[ self renderUsers: users on: aCanvas ]
]

{ #category : #rendering }
UserFinderComponent >> renderUsers: users on: aCanvas [
	^ aCanvas
		unorderedList: [ users
				do: [ :each | 
					(self session user isFollowing: each)
						ifFalse: [ aCanvas
								listItem: [
									aCanvas anchor
										callback: [ parent showProfileOf: each ];
										with: (each username)  .
					aCanvas space.
					aCanvas anchor
						callback: [ parent befriend: each ];
						with: [ aCanvas button: 'Follow' ] ] ]]]
]

{ #category : #accessing }
UserFinderComponent >> searchText [
	^ searchText
]

{ #category : #accessing }
UserFinderComponent >> searchText: anObject [
	searchText := anObject
]
