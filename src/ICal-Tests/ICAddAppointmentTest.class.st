Class {
	#name : 'ICAddAppointmentTest',
	#superclass : 'ICTest',
	#instVars : [
		'calendar'
	],
	#category : 'ICal-Tests',
	#package : 'ICal-Tests'
}

{ #category : 'running' }
ICAddAppointmentTest >> setUp [
	calendar := ICCalendar name: 'the calendar'
]

{ #category : 'testing' }
ICAddAppointmentTest >> testSave [
	| savedEvent event |
	event := ICEvent new
				location: 'bern';
				start: (self dateAndTimeClass 
							year: 2005
							month: 4
							day: 18
							hour: 21
							minute: 1
							second: 0);
				end: (self dateAndTimeClass  
							year: 2005
							month: 4
							day: 18
							hour: 22
							minute: 1
							second: 0);
				addCategory: (ICCategory summary: 'first');
				summary: 'sleep';
				beMediumPriority;
				textualDescription: 'because I''m always tired';
				yourself.
	calendar addEvent: event.
	savedEvent := calendar events first.
	self assert: calendar events size equals: 1.
	self assert: savedEvent location equals: 'bern'.
	self assert: savedEvent categories anyOne equals: (ICCategory summary: 'first').
	self assert: savedEvent summary equals: 'sleep'.
	self assert: savedEvent isMediumPriority.
	self assert: savedEvent textualDescription equals: 'because I''m always tired'.
]
