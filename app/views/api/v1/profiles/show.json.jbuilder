if @profile.present?
  json.name @profile.name
  json.job_title @profile.job_title
  json.summary @profile.summary
  json.paternal_name @profile.paternal_name
  json.maternal_name @profile.maternal_name
  json.sex @profile.sex
  json.date_of_birth @profile.date_of_birth
  json.avatar url_for(@profile.avatar) if @profile.avatar.present?
  json.url "https://#{@host}"
end
