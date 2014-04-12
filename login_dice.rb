require 'Mechanize'

#login to dice
agent = Mechanize.new
page = agent.get("http://www.dice.com/profman/servlet/ProfMan?op=3000")
form = page.forms.first
form["SJT_USER_NAME"] = "keith.e.webber@gmail.com"
form["SJT_PASSWD"] = "password1"
form.click_button(form.button_with(:value => /Login/))

# upload resume

page = agent.get("http://www.dice.com/")
page = page.link_with(:text => "Upload Your Resume").click

#fill in second form
uploadform = page.forms.last
uploadform["profileName"] = "Keith's Res"
uploadform["desiredPosition"] = "Software developer"
uploadform["workAuth"] = "USC"
uploadform["resumeType"] = 2
uploadform["resumeText"] = "Super Resume"
uploadform["buttonClicked"] = "submit"
button = uploadform.button_with(:value => "Create Your Profile")
agent.submit(uploadform, button)


# <select id="workAuth" name="workAuth" class="selectWidth">
#   <option value="NTHG">--</option>
#   <option value="H1R">Need H-1 Visa</option>
#   <option value="H1">Have H-1 Visa</option>
#   <option value="EAD">Employment Authorization Document</option>
#   <option value="TNPH">TN Permit Holder</option>
#   <option value="USC">U.S. Citizen</option>
#   <option value="CAN">Canadian Citizen</option>
#   <option value="GCH">Green Card Holder</option>
# </select>

 #  #<Mechanize::Form
 #   {name "createProfile"}
 #   {method "POST"}
 #   {action "createProfile.html"}
 #   {fields
 #    [text:0x3ffbbce79c9c type: text name: profileName value: ]
 #    [text:0x3ffbbce79abc type: text name: desiredPosition value: ]
 #    [hidden:0x3ffbbce7965c type: hidden name: _thirdParty value: on]
 #    [hidden:0x3ffbbce78cfc type: hidden name: buttonClicked value: ]
 #    [textarea:0x3ffbbce78540 type:  name: resumeText value: ]
 #    [selectlist:0x3ffbbce7d3c4 type:  name: workAuth value: NTHG]
 #    [selectlist:0x3ffbbce7d554 type:  name: dayAvailable value: 12]
 #    [selectlist:0x3ffbbce85f24 type:  name: monthAvailable value: 4]
 #    [selectlist:0x3ffbbce88eb8 type:  name: yearAvailable value: 2014]}
 #   {radiobuttons
 #    [radiobutton:0x3ffbbce794cc type: radio name: resumeType value: 1]
 #    [radiobutton:0x3ffbbce79094 type: radio name: resumeType value: 2]}
 #   {checkboxes
 #    [checkbox:0x3ffbbce7992c type: checkbox name: thirdParty value: false]}
 #   {file_uploads
 #    [fileupload:0x3ffbbce7924c type: file name: resumeFile value: ]}
 #   {buttons
 #    [button:0x3ffbbce78ea0 type: button name:  value: Create Your Profile]}>}>

 form = page.forms.first

