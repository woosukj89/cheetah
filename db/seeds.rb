# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


s1 = Story.create(project: "Project 1", sprint: "13.4", title: "Story ABC", story_points: 3, priority: 2, keyword: "hard", acceptance_criteria: "Do it and finish it and make it pretty.", description: "As a programmer, I want this thing to be solved so that I can work in peace.", color: "#ffc", order: 1)
Task.create(description: "Make it work like this", hours_total: 6, hours_left: 5, color: "#ccf", story_id: s1.id)

s2 = Story.create(project: "Project 1", sprint: "13.4", title: "Make timemachine", story_points: 8, priority: 1, keyword: "time", acceptance_criteria: "Verify that time machine can travel back 20 days", description: "As a traveller, I want a time machine so that I can jump time.", color: "#ffc", order: 2)
Task.create(description: "Build the base framework", hours_total: 16, hours_left: 9, color: "#ccf", story_id: s2.id)
Task.create(description: "Make it work like this", hours_total: 6, hours_left: 5, color: "#ccf", story_id: s2.id)
Task.create(description: "Make it work like this", hours_total: 6, hours_left: 5, color: "#ccf", story_id: s2.id)
Task.create(description: "Make it work like this", hours_total: 6, hours_left: 5, color: "#ccf", story_id: s2.id)

s3 = Story.create(project: "Project 1", sprint: "13.4", title: "Story BCD", story_points: 3, priority: 2, keyword: "hard", acceptance_criteria: "Do it and finish it and make it pretty.", description: "As a programmer, I want this thing to be solved so that I can work in peace.", color: "#ffc", order: 1)
Task.create(description: "Make it work like this", hours_total: 6, hours_left: 5, color: "#ccf", story_id: s3.id)

s4 = Story.create(project: "Project 1", sprint: "13.4", title: "Story CDE", story_points: 3, priority: 2, keyword: "hard", acceptance_criteria: "Do it and finish it and make it pretty.", description: "As a programmer, I want this thing to be solved so that I can work in peace.", color: "#ffc", order: 1)
Task.create(description: "Make it work like this", hours_total: 6, hours_left: 5, color: "#ccf", story_id: s4.id)
