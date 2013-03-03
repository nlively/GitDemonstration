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

if DailyActivity.all.count == 0
  DailyActivity.create! :label => 'Medication Reminders'
  DailyActivity.create! :label => 'Bathin/Shower/Bed/Bath'
  DailyActivity.create! :label => 'Assist with Toileting'
  DailyActivity.create! :label => 'Incontinent Care'
  DailyActivity.create! :label => 'Skin Care'
  DailyActivity.create! :label => 'Oral Care'
  DailyActivity.create! :label => 'Dressing'
  DailyActivity.create! :label => 'Ambulation/Exercises'
  DailyActivity.create! :label => 'Meal Prep'
  DailyActivity.create! :label => 'Errands/Shopping'
  DailyActivity.create! :label => 'Vacuum/Dust'
  DailyActivity.create! :label => 'Clean Bathroom'
  DailyActivity.create! :label => 'Clean Kitchen'
  DailyActivity.create! :label => 'Laundry'
  DailyActivity.create! :label => 'Linen Change'
  DailyActivity.create! :label => 'Transportation'
  DailyActivity.create! :label => 'Safety Measures'
  DailyActivity.create! :label => 'Socialization'
end