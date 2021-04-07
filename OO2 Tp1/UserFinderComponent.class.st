Class {
	#name : #UserFinderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'searchText'
	],
	#category : #'OO2 Tp1-ui'
}

{ #category : #callbacks }
UserFinderComponent >> befriend: anUser [
	self session user addFollower: anUser
]

{ #category : #initialization }
UserFinderComponent >> initialize [
	super initialize.
	searchText := ''
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
		"ifNotEmpty:
			[ self renderUsers: users on: aCanvas ]"
]

{ #category : #rendering }
UserFinderComponent >> renderUsers: users on: aCanvas [
	^ aCanvas
		unorderedList: [ users
				do: [ :each | 
					(self session user canBefriend: each)
						ifTrue: [ aCanvas
								listItem: [ aCanvas
										text: each name;
										space.
									aCanvas anchor
										callback: [ self befriend: each ];
										with: [ aCanvas button: 'Befriend' ] ] ] ] ]
]

{ #category : #accessing }
UserFinderComponent >> searchText [
	^ searchText
]

{ #category : #accessing }
UserFinderComponent >> searchText: anObject [
	searchText := anObject
]
