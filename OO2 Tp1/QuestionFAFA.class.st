Class {
	#name : #QuestionFAFA,
	#superclass : #PostFAFA,
	#instVars : [
		'answers',
		'topics'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #acccessing }
QuestionFAFA >> answers [ 
^answers
]

{ #category : #acccessing }
QuestionFAFA >> answersBy:aUser [ 
^answers select:[:each | each author == aUser username ]
]

{ #category : #initialization }
QuestionFAFA >> initialize [ 
	super initialize.
	answers := OrderedCollection new.
	topics  := Set new.
]

{ #category : #acccessing }
QuestionFAFA >> orderedAnswers [
	^ answers asSortedCollection: [:answer1 :answer2 |  answer1 score  <= answer2 score]
]

{ #category : #acccessing }
QuestionFAFA >> topics [
^topics
]
