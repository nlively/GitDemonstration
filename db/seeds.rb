# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if PatientStatus.all.count == 0
  PatientStatus.create! :label => 'Alert'
  PatientStatus.create! :label => 'Confused'
  PatientStatus.create! :label => 'Irritable'
  PatientStatus.create! :label => 'Sleeping'
  PatientStatus.create! :label => 'Oriented'
  PatientStatus.create! :label => 'Agitated'
  PatientStatus.create! :label => 'Emergency'
end

if CaregiverTask.all.count == 0
  CaregiverTask.create! :label => 'Bathing'
  CaregiverTask.create! :label => 'Toileting'
  CaregiverTask.create! :label => 'Cooking'
  CaregiverTask.create! :label => 'Cleaning'
  CaregiverTask.create! :label => 'Exercise'
  CaregiverTask.create! :label => 'Medication Management'
  CaregiverTask.create! :label => 'Education'
end