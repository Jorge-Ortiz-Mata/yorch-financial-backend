if @profile.present?
  json.name @profile.name
  json.job_title @profile.job_title
  json.email @profile.user.email
  json.summary @profile.summary
  json.paternal_name @profile.paternal_name
  json.maternal_name @profile.maternal_name
  json.sex @profile.sex
  json.date_of_birth @profile.date_of_birth
end
