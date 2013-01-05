# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if PatientStatus.all.count == 0
  PatientStatus.create! :label => 'Alert'
  PatientStatus.create! :label => 'Oriented'
  PatientStatus.create! :label => 'Forgetful'
  PatientStatus.create! :label => 'Confused'
  PatientStatus.create! :label => 'Lethargic'
  PatientStatus.create! :label => 'Agitated'
  PatientStatus.create! :label => 'Anxious/Restless'
  PatientStatus.create! :label => 'Cooperative'
  PatientStatus.create! :label => 'Combative'
  PatientStatus.create! :label => 'Hard of Hearing'
  PatientStatus.create! :label => 'Poor Vision'
  PatientStatus.create! :label => 'Emergency'
end

if CaregiverTask.all.count == 0
  CaregiverTask.create! :label => 'Medication Reminders'
  CaregiverTask.create! :label => 'Bathin/Shower/Bed/Bath'
  CaregiverTask.create! :label => 'Assist with Toileting'
  CaregiverTask.create! :label => 'Incontinent Care'
  CaregiverTask.create! :label => 'Skin Care'
  CaregiverTask.create! :label => 'Oral Care'
  CaregiverTask.create! :label => 'Dressing'
  CaregiverTask.create! :label => 'Ambulation/Exercises'
  CaregiverTask.create! :label => 'Meal Prep'
  CaregiverTask.create! :label => 'Errands/Shopping'
  CaregiverTask.create! :label => 'Vacuum/Dust'
  CaregiverTask.create! :label => 'Clean Bathroom'
  CaregiverTask.create! :label => 'Clean Kitchen'
  CaregiverTask.create! :label => 'Laundry'
  CaregiverTask.create! :label => 'Linen Change'
  CaregiverTask.create! :label => 'Transportation'
  CaregiverTask.create! :label => 'Safety Measures'
  CaregiverTask.create! :label => 'Socialization'
end