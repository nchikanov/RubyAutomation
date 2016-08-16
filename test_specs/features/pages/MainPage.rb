require 'capybara/rspec'

class MainPage < SitePrism::Page

  @@currentUser
  @@currentIdea
  @@currentSite
  @@parentcommunityurl
  @@ideataskduration
  @@phasenames
  @@phasedescriptions
  @@phasenames
  @@phaseendtimes
  @@phaseenddates
  $resetpasswordlink
  $idideainc = ''
  $idideaval = ''
  $idideaeme = ''
  $discussionsviewideas = 0
  $discussionsideapopup = 0

  # region Sign In Elements
  # element :username_field_login, '#j_username'
  # element :password_field_login, '#j_password'
  element :username_field_login, :xpath, ".//input[@id='username' or @id='j_username']"
  element :password_field_login, :xpath, ".//input[@id='password' or @id='j_password']"

  # NINA'S GOOGLE SEARCH v
  element :search_bar, :xpath, "//*[@id='lst-ib' or @id='sb_form_q' or @id='search_form_input_homepage']"
  element :nina_search, :xpath, "//*[@id='sblsbb' or @id='sb_form_go' or @id='search_button_homepage']"

  #AmexTravel Flight
  element :round_trip, :xpath, ".//*[@id='flight_search_trip_type_input']/fieldset/ol/li[1]/label/span"
  element :one_way, :xpath, ".//*[@id='flight_search_trip_type_input']/fieldset/ol/li[2]/label/span"
  element :multi_city, :xpath, ".//*[@id='flight_search_trip_type_input']/fieldset/ol/li[3]/label/span"
  element :dest_travel, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_0_departure_search_for']"
  element :arriv_travel, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_0_arrival_search_for']"
  element :dep_date, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_0_departure_date']"
  element :dep_time, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_0_departure_hour_range_input']/a/span[1]"
  element :ret_date, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_1_departure_date']"
  element :ret_time, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_1_departure_hour_range_input']/a"
  element :nonstop, :xpath, ".//*[@id='flight_search_nonstop_only_input']/label/span"
  element :search_flights, :xpath, ".//*[@id='new_flight_search']/fieldset[13]/ol/li[1]/input"

  # region Date Picker - used for AmexTravel Flight
  element :datepickercurrentyear_label, :xpath, ".//*[@id='ui-datepicker-div']//span[@class='ui-datepicker-year']"
  element :datepickercurrentmonth_label, :xpath, ".//*[@id='ui-datepicker-div']//span[@class='ui-datepicker-month']"
  element :datepickernext_button, :xpath, ".//*[@id='ui-datepicker-div']//a[@title='Next']"
  element :datepickerprevious_button, :xpath, ".//*[@id='ui-datepicker-div']//a[@title='Prev']"
  # endregion

  element :reset_user_link, :xpath, '//*[@id="loginForm"]/div[1]/a'
  element :reset_password_link, :xpath, '//*[@id="loginForm"]/div[2]/a'
  element :reset_username_link, :xpath, "//*[@id='loginForm']/div[1]/a"
  element :logo_link, :xpath, '//*[@id="logo"]/a/img'
  element :home_link, :xpath, ".//li[@role='menuitem']/a[@href='/Page/Home']"
  element :activity_link, :xpath, '//*[@id="navWrap"]/nav/div/ul/li[1]/a'
  element :postidea_link, :xpath, ".//li/a[@href='/Page/PostIdea']"
  element :viewideas_link, :xpath, "//li[@role='menuitem']/a[@href='/Page/ViewIdeas']"
  element :pairwisetab_link, :xpath, "//li[@role='menuitem']/a[@href='/Page/Pairwise']"
  element :pairwisestartvoting_link, :xpath, ".//div[@id='pairwise_vote_ideas']//div[@class='resource']//a[span[contains(text(),'Start Pairwise Voting')]]"
  element :leaderboard_link, :xpath, '//*[@id="navWrap"]/nav/div/ul/li[4]/a'
  element :store_link, :xpath, "//li[@role='menuitem']/a[@href='/Page/Store']"
  element :dashboard_link, :xpath, '//*[@id="navWrap"]/nav/div/ul/li[6]/a'
  element :administration_link,:xpath, "(.//li/a[@href='/Page/Administration'])[1]"
  element :managecommunity_link, :xpath, ".//a[@href='/Admin/Dashboard?orig_url=%2FAdmin%2FManageSitePage']"
  #element :signin_button, :xpath, "//*[@id='loginForm']/div[4]/div/a/span/strong"
  element :signin_button, :xpath, ".//div[button[text()='Sign In'] or a[@title='Sign in']]/*"
  element :signout_link, :xpath, "//a[@href='/User/Logout']"
  element :register_link, :xpath, "//a[@href='/User/Register']"
  element :mainmenumore_tab, :xpath, "//li[ul[@class='moreNav']]/a"
  element :signinerrormessage_container, :xpath, ".//div[@class='message-block']"
  element :emailedusername_text, :xpath, "//*/div[contains(text(),'We have emailed your username to the email address that we have on file.')]"
  element :rememberusername_checkbox, :xpath, "//*[@id='remember_username']"
  element :forgotusername_text, :xpath, "//*[text()='Forgot Username']"
  element :enteremailaddress_text, :xpath, "//*[text()='Please enter your email address to continue.']"
  element :submit_forgotuser_button, :xpath, "//*[@id='resetRequestForm']/div[3]/div[1]/a/span"
  element :forgotusernamecancel_button, :xpath, ".//*[@id='resetRequestForm']//a[@href='/User/Login']"
  element :cancelresetpassword_button, :xpath, ".//*[@id='resetRequestForm']//a[@href='/User/Login']"
  element :signinthirdparty_text, :xpath, "//*[text()='Sign in with other accounts?']"
  element :yammersignin_button, :xpath, "//a/img[@title='Sign in with Yammer']"
  element :forgotusernamemail_field, :xpath, "//*[@id='resetRequestForm']/div[2]/input"
  element :returntosignin_link, :xpath, "//a[text()='Return to sign in']"
  element :edituserusername_field, :xpath, "//*[@id='username']"
  element :challengetemplates_link, :xpath, ".//div/a[@href='/Page/SiteChallengeTemplates']"
  element :communities_link,:xpath, ".//li/a[@href='/Page/CommunitySearch']"
  element :communitiesattributes_link,:xpath, ".//li/a[@href='/Page/CommunityAttributes']"
  element :bulkactions_link, :xpath, ".//li/a[@href='/Page/IdeaList']"
  element :leaderboardeditor_link, :xpath, ".//*[contains(text(), 'Leaderboard')][contains(@href,'/Admin/SiteEditor?page_name=Leaderboard')]"
  element :innomarket_link, :xpath, ".//*[contains(text(), 'InnovationMarket')][contains(@href,'/Admin/SiteEditor?page_name=InnovationMarket')]"
  @@forgotusername_text = "//*[@id='resetRequestForm']/h1"
  @@theemailaddressyouenteredisnotvalidpleasetryagain = '/html/body/div[1]/div'
  @@pleaseenteryouremailaddresstocontinue = "//*[@id='resetRequestForm']/div[1]"
  @@submit_button = "//*[@id='resetRequestForm']/div[3]/div[1]/a/span"
  @@cancel_button = "//*[@id='resetRequestForm']/div[3]/div[2]/a/span"
  @@requestsent_text = '/html/body/div[2]/h1'
  @@passwordsdonotmatch = '/html/body/div[1]/div'
  @@forgotpswerror_container = ".//div[@class='message']"
  @@pswnotmeetrequirements = '//div[contains(text(),"Password doesn\'t meet the requirements. Please try again.")]'
  @@usernameerror = '//*[@id="errorMessage"]/center'
  @@successmesage = '//*[@id="successMessage"]'
  @@passwordchangedsuccessfullydmessage = '//*[@id="successMessage"]'
  @@resetpassword_text = '//*[@id="resetRequestForm"]/div[1]/h1'
  @@registrationmessage = '//*[@id="contents"]/div/table/tbody/tr/td[1]/div/div[2]/div'
  @@postideaerrorsmessage = '//*[@id="error"]/a/h2'
  @@ideacreatedmessage = '//*[@id="idea-detail"]/div[1]/div[2]/div[2]/h2'

  element :submit_forgotpassword_button, :xpath, '//*[@id="resetRequestForm"]/div[2]/div[1]/a/span'
  element :username_reset, '#resetRequestForm > div.reset-password-container > div.form-element > input'
  element :password_reset, '#resetRequestForm > div:nth-child(3) > input'
  element :resetpassword_container, :xpath, ".//div[@class='reset-password-container']"
  element :loginrequest_container, :xpath, ".//div[contains(@class,'login-request-container')]"
  element :followinstructionsonemail_label, :xpath, ".//div[@class='message-heading']"
  element :usernamenotvalid_label, :xpath, ".//div[text()='The username you entered is not valid. Please try again.']"
  element :usernameinvalidcharacter_label, :xpath, ".//div[text()='Your username contains invalid characters. Please use letters, numbers, @ symbol, underscore, hyphen, and period.']"
  # endregion

  # region My Inbox elements
  element :myinbox_link, :xpath, './/a[@id="inboxMessage"]'
  element :inboxtasks_tab, :xpath, './/*[@id="inboxNav"]//a[@class="navTasks"]'
  element :notifications_tab, :xpath, './/*[@id="inboxNav"]//a[@class="navNotifications"]'
  element :messages_tab, :xpath, ".//*[@id='inboxNav']//a[@class='navMessages']"
  element :notification_list, :xpath, ".//*[@id='loadNotifications']//div[@class='notificationsListsWrapper']"
  element :inboxtaskslist_container, :xpath, './/ul[@id="taskLists"]'
  element :inboxtaskdetails_container, :xpath, './/div[@class="tasksDetailsWrapper"]'
  element :newmessage_button, :xpath, './/*[@id="loadConversations"]//span[contains(text(),"New Message")]'
  element :recipients_field, :xpath, ".//*[@id='privatemessageform']/div[1]/input[@type='text']"
  element :cancelmessage_button, :xpath, './/*[@id="privatemessageform"]//span[text()="Cancel"]'
  element :closepopup_icon, :xpath, ".//*[@id='idea-listing']//div[span[@id='ui-id-2']]/button"#".//div[contains(@aria-labelledby,'ui-dialog-title-inboxDialog')]/div/a[@role='close button']"
  # endregion

  # region Community
  element :create_community_option, :xpath, ".//div/a[contains(text(), 'Create Community')]"
  element :community_URL, :xpath, ".//*[@id='subdomain']"
  element :requiredlogin_option, :xpath, "//*[@id='siteaccess']/option[2]"
  element :nextbutton_a, :xpath, ".//*[@id='createCommWidgetFormStep1']/div/a"
  element :community_title, :xpath, "//*[@id='pagetitle']"
  element :select_theme, :xpath, "//*[@id='defaultVisualThemeArea']/div/div[2]/input"
  element :nextbutton_b, :xpath, ".//*[@id='createCommWidgetFormStep2']/div[@class='submit-button']/a"
  element :nextbutton_c, :xpath, "//*[@id='createCommWidgetFormStep3']/div[@class='submit-button']/a"
  element :continuebutton, :xpath, ".//*[@id='createCommWidgetFormStep5']/a[@title='Continue']"
  element :fancy33theme_option, :xpath, "//input[@type='radio' and @value='Fancy33']"
  element :childof_radio, :xpath, ".//*[@id='parentThis']"
  # endregion

  # region Challenges Elements
  element :new_challenge_link, :xpath, "//*[@id='site_challenge_lists']/div[3]/span[4]/a"
  element :challenges_link, :xpath, "//li[@role='menuitem']/a[@href='/Page/SiteChallenges']"
  element :challenge_title, '#title'
  element :challenge_description, '#content'
  element :challengetitle_label, :xpath, ".//*[@id='site_challenge_home']//h1"
  element :challengestartdate_input, :xpath, ".//input[@name='startdate_picker']"
  element :challengestarttime_field, :xpath, ".//div[a/select[@id='startdate_hour']]/a/span[1]"
  element :challengetimezone_field, :xpath, ".//div[a/select[@name='startdate_tz']]/a/span[1]"
  element :challengetimezone_dropdown, :xpath, ".//div[a/select[@name='startdate_tz']]/a"
  element :challengecreate_button, :xpath, "//a[@title='Create Challenge']"
  element :challengeeditsettings_button, :xpath, ".//div[@id='challengeSettingInfo']/descendant::span[text()='Edit Settings']"
  element :challengeexpandphaseeditor_tab, :xpath, ".//*[@id='postsitechallengeform']//div/a[text()='Expand Phase Editor']"
  element :challengecollapsephaseeditor_tab, :xpath, ".//div/a[text()='Collapse Phase Editor']"
  element :addphase_link, :xpath, ".//form[@id='postsitechallengeform']/descendant::a/strong[text()='+ Add Phase']"
  element :challengesettingsdialogclose_button, :xpath, "//a[span[text()='Close']]"
  element :updatechallenge_button, :xpath, ".//form[@id='postsitechallengeform']/descendant::span[text()='Update Challenge']"
  element :firstphasetitle_field, :xpath, ".//input[@id='phase_name']"
  element :challengepreviousmonth_button, :xpath, ".//div[@id='ui-datepicker-div']/div/a[span[text()='Prev']]"
  element :challengenextmonth_button, :xpath, ".//div[@id='ui-datepicker-div']/div/a[span[text()='Next']]"
  element :challengeenddatemonth_label, :xpath, ".//span[@class='ui-datepicker-month']"
  element :challengeenddateyear_label, :xpath, ".//span[@class='ui-datepicker-year']"
  element :challengestatus_combobox, :xpath, ".//a[select[@name='status']]"
  element :challengeerrorpopupclose_button, :xpath, './/div[contains(@class,"popup-notice")]/a[@class="error_close"]'
  element :challengesbillboard_container, :xpath, './/*[@id="siteChallengeViewPort"]'
  element :challengesummarypopup_container, :xpath, ".//div[@id='challengeSettingInfo']"
  element :challengessendemails_checkbox, :xpath, ".//input[@id='shouldSendEmail']"
  @@challengetemplate_combobox = ".//div/a[select[@id='templateSiteId']]"
  element :challengetemplate_field, :xpath, ".//a[select[@id='templateSiteId']]/span[1]"
  element :challengetemplateselector_combobox, :xpath, @@challengetemplate_combobox
  element :challengeselectfilter_combobox, :xpath, ".//span[contains(@class,'challengeStatusSelect')]/a"
  element :challengeStatusFilter_dropdown, :xpath, ".//*[@id='site_challenge_lists']//a[select[@id='select_filter']]"
  element :editchallenge_link, :xpath, ".//a[contains(@href,'/Page/SiteChallengeAdminSettings/EditSiteChallenge')]"
  element :savetemplate_link, :xpath, ".//a[@href='/Page/SiteChallengeAdminSettings/SetChallengeTemplate?']"
  element :settingstemplate_link, :xpath, ".//a[@href='/Page/SiteChallengeAdminSettings/SiteChallengeSettings?']"
  element :layoutcontrolstemplate_link, :xpath, ".//a[@href='/Page/SiteChallengeAdminSettings/TemplateControls?']"
  element :challengetemplatename_field, :xpath, ".//*[@id='title']"
  element :challengetemplatedescription_textarea, :xpath, ".//textarea[@name='description']"
  element :savechallengetemplate_button, :xpath, ".//a[@title='Save Template']"
  element :defaulttemplate_checkbox, :xpath, ".//input[@name='setDefaultTemplate']"
  element :challengeenddate_field, :xpath, ".//input[@id='enddate']"
  element :challengeendtime_field, :xpath, ".//a[select[@name='enddate_hour']]"
  element :challengetemplatedescription, :xpath, ".//div[@class='templateDescr label-descr']"
  element :selectwinnersnow_link, :xpath, ".//a[contains(@href,'/Page/SiteChallengeAdminSettings/SelectWinners')]"
  element :confirmwinnersyes_link, :xpath, ".//div[@class='confirmDialog confirmSelectedWinners']//a[text()='Yes']"
  element :savewinners_button, :xpath, ".//a[@title='Save']"
  element :challengephases_container, :xpath, ".//div[@class='phasesToggleContainer']"
  @@challengeenddatephase
  @@challengeendtimephase
  @@challengetemplateempty_xpath = "//*[@id='themeContainer']/div[4]"
  element :challengetemplatedescription_label, :xpath, ".//form[@id='postsitechallengeform']/div[contains(@class,'siteChallengeTemplateDescr')]/label"
  @@challengenotstartedphaseindexes_labels = ".//div[@class='siteChallengeTemplatePhases']/div[not(contains(@class,'started'))]//descendant::div[@class='value']"
  element :challengecloseddate_label, :xpath, ".//div[contains(@class,'CLOSED') and @style='display: block;']"
  element :challengefilter_dropdown, :xpath,".//*[@id='site_challenge_lists']//a[select[@id='challenge_filter']]" #".//*[@id='challenge_filter']"
  element :challenge_timeline, :xpath, ".//*[@id='postsitechallengeform']//div[@class='bar']" #fa.TC7.20150312
  element :challengeSettingClose_button, :xpath, ".//*[@id='challengeSettingInfo']//span[contains(text(),'Close')]" #fa.CHM024.20150320
  element :challengeEditTitleEditPopup_label, :xpath, ".//*[@id='editDialog']//div[text()='Edit Template']" #fa.CHM063.20150324
  element :challengeCloseEditTemplatePopup_button, :xpath, ".//*[@id='editDialog']//div[@class='speuiSpriteButton']//span[text()='Close']"
  element :challengeSaveEditTemplatePopup_button, :xpath, ".//*[@id='editDialog']//div[@class='speuiSpriteButton']//span[text()='Save']"
  element :challengeXEditTemplatePopup_button, :xpath, ".//*[@aria-labelledby='ui-dialog-title-editDialog']//a[@role='close button']"
  element :challengeXEditTemplatePopup_button1, :xpath, ".//button[@title='close']"
  # endregion

  # region Profile
  element :myprofile_link, :xpath, "//a[@href='/Page/MyProfile' and @class='headerUserProfile']"
  element :editprofile_button, :xpath, ".//a[@title='Edit Profile']"
  element :phone_field, :xpath, ".//input[@id='phone']"
  element :mobile_field, :xpath, ".//input[@id='mobile']"
  element :website_field, :xpath, ".//input[@id='website']"
  element :jobtitle_field, :xpath, ".//*[@id='jobtitle']"
  element :company_field, :xpath, ".//*[@id='company']"
  element :fax_field, :xpath, ".//*[@id='fax']"
  element :address1_field, :xpath, ".//*[@id='address1']"
  element :address2_field, :xpath, ".//*[@id='address2']"
  element :city_field, :xpath, ".//*[@id='city']"
  element :state_field, :xpath, ".//*[@id='state']"
  element :zip_field, :xpath, ".//*[@id='zip']"
  element :country_field, :xpath, ".//*[@id='country']"
  element :im_field, :xpath, ".//*[@id='imname']"
  element :gender_dropdown, :xpath, ".//select[@id='gender']"
  element :userfirstname_field, :xpath, ".//[@id='fname']"
  element :userlastname_field, :xpath, ".//[@id='lname']"
  element :privacypreference_widget, :xpath, ".//*[@id='panel183_1-title']"
  element :updateprofile_button, :xpath, ".//form[@id='updateprofile']/descendant::a[@title='Update']/span"
  element :updatechangepassword_button, :xpath, "//*[@id='resetpasswd']/fieldset/div[2]/div/a/span"
  element :updateprofilesuccess_label, :xpath, ".//div[@id='successMessage']"
  element :privatepreferences_widget, :xpath, ".//div[@class='widget']/descendant::a[text()='Privacy Preferences']"
  element :mysubscriptions_link, :xpath, ".//a[@title='My Subscriptions']"
  # if the pending approval is collapsed it will click due unslidePanel option
  element :pendingapprovals_header, ".//div[*[contains(@onclick,'My Pending Approvals') and contains(@class,'unslidedPanel') ]]"
  element :pendingapprovals_link, :xpath, "//div/table/tbody/tr/td/a[@href='/Page/PendingApprovals?pagename=manageIdeaApprovals']"
  element :managespam_link, :xpath, ".//a[text()='Manage Spam']"
  element :moderateposts_link, :xpath, "//*[@id='contents']/div/div[2]/table/tbody/tr[2]/td[1]/a"
  element :profiletasks_tab, :xpath, ".//div[@id='tabified_user_profile_fresh']//ul[@class='tabs-nav']//a[text()='My Tasks']"
  element :usertasks_container, :xpath, ".//div[@id='user_tasks']"
  element :myprofileemail_label, :xpath, ".//div[@class='contact-details-template']//li[span[text()='Email']]/span[@class='token']"

  @@profilemyideas_widget = '#myideaswidget'
  # endregion

  #Region Edit Profile
  element :nickname_field, :xpath, ".//input[@id='nickname']"
  element :changepassword_section, :xpath, ".//*[@id='change-password']"
  element :changepassword_label, :xpath, ".//*[text()='Change Password']"
  element :currentpassword_field, :xpath, ".//*[@id='change-password']//descendant::input[contains(@name,'oldpw') and not(@type='hidden')]"
  element :newpassword_field, :xpath, ".//input[@id='passwordNew']"
  element :confirmnewpassword_field, :xpath, ".//input[@id='passwordNew2']"
  element :submitchangepassword_button, :xpath, ".//button[text()='Change']" #".//*[@id='change-password']//a[@class='speuiButton_v1 primary']"
  element :profilepwderrormessage_container, :xpath, "//div[@id='error']"
  # endregion

  # region Users
  element :users_link, :xpath, "//a[@href='/Admin/Dashboard?orig_url=%2FPage%2FUserAdmin']"
  element :username_field, :xpath, "//*[@id='username']"
  element :password_field, :xpath, "//*[@id='password']"
  element :resetnewpassword, :xpath, '//*[@id="resetRequestForm"]/div[1]/div[2]/input'
  element :repassword_field, :xpath, "//*[@id='retyped_password']"
  element :firstname_field, :xpath, "//*[@id='firstname']"
  element :lastname_field, :xpath, "//*[@id='lastname']"
  element :email_field, :xpath, "//*[@id='email']"
  element :sendemail_checkbox, :xpath, "//*[@id='sendemail']"
  element :adduser_button, :xpath, "//*[@id='user_admin_fresh']/div[6]/div/a/span"
  element :submit_button, :xpath, ".//*[@id='AdminAddUser']//a[@title='Submit']"
  element :submitresetpassword_button, :xpath, "//*[@id='resetRequestForm']/div[2]/div[1]/a/span"
  element :usercreated_text, :xpath, "//div[contains(@label, 'has been created.')]/a/h2"
  element :usersimplesearch_field, :xpath, "//*[@id='keywords']"
  element :userssimplesearch_button, :xpath, "//a[@title='Search']"
  element :lockuser_checkbox, :xpath, "//*[@id='lockUser']"
  element :edituserupdate_button, :xpath, "//a[@id='edit_user']"
  element :userlocked_text, :xpath, "//h2[contains(text(),'Your user account is locked.  Please email webadmin@spigit.com for more information.')]"
  element :userssimple_tab, :xpath, ".//a[@id='simple-tab']"
  element :usersactions_tab, :xpath, ".//a[@id='actions-tab']"
  element :usersenableuser_option, :xpath, "//*[@id='userActionForm']/div[2]/label/input"
  element :usersgrantaccess_option, :xpath, ".//*[@id='userActionForm']/div[5]/label/input"
  element :usersrevokeaccess_option, :xpath, ".//*[@id='userActionForm']//input[@value='REMOVE_COMMUNITY_ACCESS']"
  element :usersactionssubmit_button, :xpath, "//form[@id='userActionForm']/div/div/a[@title='Submit']"
  element :usersactionsconfirm_link, :xpath, ".//form[@id='userActionForm']//a[text()='Yes']"
  element :update_button, :xpath, "//*[@id='edit_user']/span"
  @@assignedrolesuccessmessage = "//*[@id='successMessage']"
  # endregion

  # region User Experience Management
  element :userexperience_link, :xpath, ".//div/a[contains(text(),'User Experience Management')]"
  element :registrationquestions, :xpath, "//*[@id='config-single-com.spigit.user.UserConfig.userRegistrationQuestions']"
  element :fullnamerequired, :xpath, "//*[@id='config-single-com.spigit.user.UserConfig.firstAndLastNameRequired']"
  element :nousersonline, :xpath, "//*[@id='config-single-com.spigit.user.UserConfig.numUsersOnline']"
  element :uploadslimitmember, :xpath, "//*[@id='config-single-com.spigit.user.UserConfig.numResourcesUser']"
  element :uploadslimitadmin, :xpath, "//*[@id='config-single-com.spigit.user.UserConfig.numResourcesAdmin']"
  element :noideasopenchallenge, :xpath, "//*[@id='config-single-com.spigit.user.UserConfig.numChallengeIdeaInOpenPage']"
  element :differentemailinvite, :xpath, "//*[@id='config-single-com.spigit.user.UserConfig.invitedUserCanChangeEmailAddress']"
  element :shownonmemberprofile, :xpath, "//*[@id='config-single-com.spigit.user.UserConfig.showNonMemberProfile']"
  element :emailregularexpression, :xpath, "//*[@id='config-single-com.spigit.user.UserConfig.invitedUserEmailAddress']"
  element :showuseremail, :xpath, "//*[@id='config-single-com.spigit.user.UserConfig.showUserEmailOnProfile']"
  element :displayusersignature, :xpath, "//*[@id='config-single-com.spigit.user.UserConfig.displayUserSignature']"
  element :showusernetworth, :xpath, "//*[@id='config-single-com.spigit.config.DisplayConfig.showUserNetworth']"
  element :showfullresume, :xpath, "//*[@id='config-single-com.spigit.config.DisplayConfig.showFullResume']"
  element :showuserfullname, :xpath, "//*[@id='config-single-com.spigit.config.DisplayConfig.showUserFullName']"
  element :showprivacypreferences, :xpath, "//*[@id='config-single-com.spigit.config.DisplayConfig.showPrivacyPreferences']"
  element :showuploadavatar, :xpath, "//*[@id='config-single-com.spigit.config.DisplayConfig.showUploadAvatar']"
  element :avatarmaxwidth, :xpth, "//*[@id='config-single-com.spigit.config.DisplayConfig.avatarMaxWidth']"
  element :avatarminwidth, :xpath, "//*[@id='config-single-com.spigit.config.DisplayConfig.avatarMaxHeight']"
  element :showbiography, :xpath, "//*[@id='config-single-com.spigit.config.DisplayConfig.showBiography']"
  element :showuserstats, :xpath, "//*[@id='config-single-com.spigit.config.DisplayConfig.showUserStats']"
  element :showuserattributes, :xpath, "//*[@id='config-single-com.spigit.config.DisplayConfig.showUserAttributes']"
  element :showusernickname, :xpath, "//*[@id='config-single-com.spigit.config.DisplayConfig.showUserNickNameForFirstName']"
  element :shownotificationpreferences, :xpath, "//*[@id='config-single-com.spigit.config.DisplayConfig.enableEmailNotificationPreferences']"
  element :enableyammerlogin, :xpath, "//*[@id='config-single-com.spigit.config.DisplayConfig.enableYammerLogin']"
  element :userexperiencesubmit_button, :xpath, "//a[@title='Submit']"
  element :userexperiencerestore_button, :xpath, "//*[@id='configTbl']/tbody/tr[39]/td[2]/div/a[2]/span"
  # endregion

  # region Idea Management
  element :ideamanagement_link, :xpath, ".//div/a[contains(text(),'Idea Management')]"
  element :hidesummaryfield, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.hideIdeaSummaryField']"
  element :tradewindow, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.tradeSeparationWindowHours']"
  element :buildteamvalstage, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.restrictTeamBuildingToOperation']"
  element :ideasmultipleversions, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.versionHistoryDefault']"
  element :ownercandelete, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.ownersCanDelete']"
  element :expertcandelete, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.expertsCanDelete']"
  element :enablesocialsharing, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.showBookmark']"
  element :showapprovalrating, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.showApprovalRating']"
  element :showidealifecycle, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.showIdeaLifeCycleStage']"
  element :showpermalink, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.showPermalink']"
  element :showsimilarcontent, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.showSimilarDocs']"
  element :teammemberrecruit, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.teamMemberCanRecruit']"
  element :administratorrecruit, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.adminsCanRecruit']"
  element :teammemberdelete, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.ideaOwnerCanDeleteTeamMember']"
  element :showemptyideatemplate, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.showEmptyFieldsOnIdeaHome']"
  element :truncatedidealength, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.truncatedIdeaLength']"
  element :keephtmlformatting, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.keepHtmlFormatting']"
  element :ideaexpirydueperiod, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.ideaExpirationDuePeriod']"
  element :ideaexpirynote, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.ideaExpiryNote']"
  element :ideasubmitmessage, :xpath, ".//*[@id='config-single-com.spigit.idea.IdeaConfig.preSubmitIdeaMessage']"
  element :ideasummarylength, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.ideaSummaryLength']"
  element :showsimilarideasagg, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.showSimilarIdeasFromAggregateSites']"
  element :enableideajobs, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.ideajobEnabled']"
  element :rolesideacoordinator, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.rolesAllowedToAssignIdeaCoordinator']"
  element :showideacoordinator, :xpath, "//*[@id='config-single-com.spigit.idea.IdeaConfig.enableIdeaCoordinatorWidget']"
  element :ideamanagementsubmit_button, :xpath, "//a[@title='Submit']"
  element :ideamanagementrestore_button, :xpath, "//*[@id='configTbl']/tbody/tr[47]/td[2]/div/a[2]/span"
  element :addstage_button, :xpath, "//*[@id='configTbl']/tbody/tr[1]/td[2]/a/span"
  element :showideaid_textfield, :xpath, ".//*[@id='config-single-com.spigit.config.DisplayConfig.showIdeaID']" #as.tc10.fa.20150129
  # endregion

  # region Legal
  element :legal_link, :xpath, ".//div/a[contains(text(),'Legal')]"
  element :shoadditionalterms_checkbox, :xpath, ".//*[@id='config-single-com.spigit.config.DisplayConfig.showAdditionalTerms']"
  element :showsecondcheckboxtoagreetotermsandconditions_checkbox, :xpath, ".//*[@id='config-single-com.spigit.config.DisplayConfig.showSecondAgreementCheckbox']"
  element :submitlegal_button, :xpath, "//a[@title='Submit']"
  element :showadditionalterms_checkbox, :xpath, ".//*[@id='config-single-com.spigit.config.DisplayConfig.showAdditionalTerms']"
  element :showaddtermacrosscomm_checkbox, :xpath, ".//*[@id='config-single-com.spigit.config.SpigitConfig.additionalTermsAccepanceOnlyOnMainSite']"
  # endregion

  # region Terms and Conditions
  element :termsandconditions_form, :xpath, ".//form[@id='AdditionalTermsForm']"
  element :acceptterms_checkbox, :xpath, ".//*[@name='accept']"
  element :acceptsecondterms_checkbox, :xpath, ".//*[@id='accept2']"
  element :submitterms_button, :xpath, ".//a[contains(.,'Submit')]" #".//*[@id='submit']"
  element :agreeterms_checkbox, :xpath, ".//*/form[@id='AdditionalTermsForm']//*[@id='accept']"
  # element :submitterms_button, :xpath, ".//*/form[@id='AdditionalTermsForm']//*[@id='submit']"
  # endregion

  # region Security Page
  element :security_link, :xpath, ".//div/a[contains(text(), 'Security')]"
  element :forcehttpposts_checkbox, :xpath, ".//input[@id='config-single-com.spigit.config.SpigitConfig.forcePostForActions']"
  element :disableexternalredirects_checkbox, :xpath, ".//input[@id='config-single-com.spigit.config.SpigitConfig.disableExternalRedirects']"
  element :separatemail_checkbox, :xpath, ".//input[@id='config-single-com.spigit.config.SpigitConfig.separteMailForPasswordUsername']"
  element :allowloginattempts_textfield, :xpath, ".//*[@id='config-single-com.spigit.user.UserConfig.loginLockAttempts']"
  element :accountlockedduration_textfield, :xpath, ".//*[@id='config-single-com.spigit.user.UserConfig.loginLockPeriodInMin']"
  element :resetloginlock_checkbox, :xpath, ".//*[@id='config-single-com.spigit.user.UserConfig.loginLockResetWithPassword']"
  element :lockoutmessage_textfield, :xpath, ".//*[@id='config-single-com.spigit.user.UserConfig.lockoutTooManyAttemptsMsg']"
  element :passwordexpired_checkbox, :xpath, ".//*[@id='config-single-com.spigit.user.UserConfig.passwordPolicyExpiresOnFirstLogin']"
  element :passwordexpirationfrequency_textfield, :xpath, "//*[@id='resetRequestForm']/div[1]/div[3]/input"
  element :enterpasswordagain_textfield, :xpath, "//*[@id='resetRequestForm']/div[1]/div[3]/input"
  element :addauthenticatorclass_button, :xpath, ".//*[@id='add-array-element-config-single-com.spigit.user.UserConfig.userAuthenticatorClasses']"
  element :addipaddress_button, :xpath, ".//a[@id='add-array-element-config-single-com.spigit.user.UserConfig.restrictedIPAccessForAdmin']"
  element :userswhitelist_textarea, :xpath, ".//textarea[@id='config-single-com.spigit.user.UserConfig.usersWhiteList']"
  element :domainswhitelist_textarea, :xpath, ".//textarea[@id='config-single-com.spigit.user.UserConfig.embeddedUrlDomainWhiteList']"
  element :disableembeddedurl_checkbox, :xpath, ".//*[@id='config-single-com.spigit.user.UserConfig.disableEmbeddedUrl']"
  element :rolestoincludelinks_selector, :xpath, ".//select[@id='config-single-com.spigit.user.UserConfig.embeddedUrlUserWhiteList']"
  element :submitsecuritysettings_button, :xpath, ".//table[@id='configTbl']/descendant::span[text()='Submit']"
  element :restoredefaultsecuritysettings_button, :xpath, ".//table[@id='configTbl']/descendant::span[text()='Restore Defaults']"
  element :settingsappliedmessage_popup, :xpath, ".//div[@id='themeContainer']/div[text()='All settings applied. ' and @style='display: block;']"
  # endregion

  ###Site Themes and Access Settings Page variables
  element :communitytitleeditor_field, :xpath, ".//input[@id='pagetitle']"
  element :sitethemesandaccesssettings_link, :xpath, "//*[@id='contents']/div/div[2]/table/tbody/tr[6]/td/div[1]/a"
  element :communityaccesupdate_button, :xpath, "//a[@value='Update']"
  element :communityaccess_combobox, :xpath, ".//select[@id='siteaccess']"
  element :locksite_checkbox, :xpath, ".//*[@id='locksite']"

  @@communityaccess_combobox = 'siteaccess'
  @@reputationoption_combobox = ''
  # endregion

  # region Post Category
  element :parentcategory_combobox, :xpath, "//*[@id='commentReplyForm']/div[1]/div/select"
  element :categorytitle_field, :xpath, "//*[@id='commentReplyForm']/div[2]/div/input"
  element :categorysummary_field, :xpath, "//*[@id='commentReplyForm']/div[3]/div/input"
  element :categorytags_field, :xpath, "//*[@id='spigit_tags']"
  element :categorydisplayorder_field, :xpath, "//*[@id='display_order']"
  element :categorymoderateidea_checkbox, :xpath, "//*[@id='commentReplyForm']/div[7]/div/input"
  element :categorymoderatethreads_checkbox, :xpath, "//*[@id='commentReplyForm']/div[8]/div/input"
  element :categorysubscribe_checkbox, :xpath, "//*[@id='commentReplyForm']/div[9]/div/input"
  element :categorysavedraft_button, :xpath, "//*[@id='commentReplyForm']/div[10]/a[1]/span"
  element :categorypublish_button, :xpath, "//a[@title='Publish']"
  element :controlpanel_header, :xpath, ".//a[text()='Control Panel']"
  element :postcategory_link, :xpath, ".//a[@href='/Page/PostCategory']"
  element :categorydraftsaved_text, :xpath, "//h2[text()='Draft saved.']"
  @@categoryTitles = Hash.new
  # endregion

  # region Site Editor Elements
  element :site_editor_link, :xpath, ".//div/a[contains(text(),'Site Editor')]"
  element :siteeditorhome_link, :xpath, '//*[@id="sortable"]/li[2]/a[1]'
  element :customHome, :xpath, '//*[@id="sortable"]/li[3]/a[1]'
  element :postIdea, :xpath, '//*[@id="sortable"]/li[4]/a[1]'
  element :viewIdeas, :xpath, "//a[@href='/Admin/SiteEditor?page_name=ViewIdeas']"
  element :pairwise, :xpath, "//a[@href='/Admin/SiteEditor?page_name=Pairwise']"
  element :challenge, :xpath, ".//ul[@id='sortable']/li[a[text()='Challenge']]"
  element :leaderboard, :xpath, '//*[@id="sortable"]/li[8]/a[1]'
  element :storesite, :xpath, ".//a[@href='/Admin/SiteEditor?page_name=Store']"
  element :dashboard, :xpath, '//*[@id="sortable"]/li[10]/a[1]'
  element :invest, :xpath, '//*[@id="sortable"]/li[12]/a[1]'
  element :widgets, :xpath, '//*[@id="sortable"]/li[13]/a[1]'
  element :allBlogs, :xpath, ".//a[@href='/Admin/SiteEditor?page_name=AllBlogs']"
  element :postBlog, :xpath, '//*[@id="sortable"]/li[15]/a[1]'
  element :postBlogComment, :xpath, '//*[@id="sortable"]/li[16]/a[1]'
  element :viewBlog, :xpath, '//*[@id="sortable"]/li[17]/a[1]'
  element :viewBlogDrafts, :xpath, '//*[@id="sortable"]/li[18]/a[1]'
  element :blogSettings, :xpath, '//*[@id="sortable"]/li[19]/a[1]'
  element :blogModerate, :xpath, '//*[@id="sortable"]/li[20]/a[1]'
  element :blogSpam, :xpath, '//*[@id="sortable"]/li[21]/a[1]'
  element :analitycs, :xpath, '//*[@id="sortable"]/li[22]/a[1]'
  element :siteHealth, :xpath, '//*[@id="sortable"]/li[23]/a[1]'
  element :reports, :xpath, '//*[@id="sortable"]/li[24]/a[1]'
  element :adHocReports, :xpath, '//*[@id="sortable"]/li[25]/a[1]'
  element :editReport, :xpath, '//*[@id="sortable"]/li[26]/a[1]'
  element :userAdmin, :xpath, '//*[@id="sortable"]/li[27]/a[1]'
  element :addUser, :xpath, '//*[@id="sortable"]/li[28]/a[1]'
  element :editUser, :xpath, '//*[@id="sortable"]/li[29]/a[1]'
  element :moderatorAdmin, :xpath, '//*[@id="sortable"]/li[30]/a[1]'
  element :emailUsers, :xpath, ".//a[@href='/Admin/Dashboard?orig_url=%2FAdmin%2FEmailMembersPage%3Fpagename%3Demailmembers']"
  element :graduationThersholds, :xpath, '//*[@id="sortable"]/li[32]/a[1]'
  element :inviteUsers, :xpath, '//*[@id="sortable"]/li[33]/a[1]'
  element :emailTemplates, :xpath, '//*[@id="sortable"]/li[34]/a[1]'
  element :colorsAndLogo, :xpath, '//*[@id="sortable"]/li[35]/a[1]'
  element :security, :xpath, '//*[@id="sortable"]/li[36]/a[1]'
  element :displaySettings, :xpath, '//*[@id="sortable"]/li[37]/a[1]'
  element :names, :xpath, '//*[@id="sortable"]/li[38]/a[1]'
  element :legal, :xpath, "//*[@id='sortable']/li[39]/a[1]"
  element :tagSearchResults, :xpath, '//*[@id="sortable"]/li[40]/a[1]'
  element :import, :xpath, '//*[@id="sortable"]/li[41]/a[1]'
  element :userProfile, :xpath, '//*[@id="sortable"]/li[42]/a[1]'
  element :reset, :xpath, '//*[@id="sortable"]/li[43]/a[1]'
  element :myActivities, :xpath, '//*[@id="sortable"]/li[44]/a[1]'
  element :myConnections, :xpath, '//*[@id="sortable"]/li[45]/a[1]'
  element :ideasByUser, :xpath, '//*[@id="sortable"]/li[46]/a[1]'
  element :buddyEdit, :xpath, '//*[@id="sortable"]/li[47]/a[1]'
  element :pendingApprovals, :xpath, '//*[@id="sortable"]/li[48]/a[1]'
  element :manageResources, :xpath, '//*[@id="sortable"]/li[49]/a[1]'
  element :viewIdeaVersion, :xpath, '//*[@id="sortable"]/li[50]/a[1]'
  element :closeIdea, :xpath, '//*[@id="sortable"]/li[51]/a[1]'
  element :reportAbuse, :xpath, '//*[@id="sortable"]/li[52]/a[1]'
  element :commentEdit, :xpath, '//*[@id="sortable"]/li[53]/a[1]'
  element :moveIdea, :xpath, '//*[@id="sortable"]/li[54]/a[1]'
  element :editHome, :xpath, '//*[@id="sortable"]/li[55]/a[1]'
  element :tellAFriend, :xpath, '//*[@id="sortable"]/li[56]/a[1]'
  element :postCategory, :xpath, '//*[@id="sortable"]/li[57]/a[1]'
  element :searchResults, :xpath, '//*[@id="sortable"]/li[58]/a[1]'
  element :mostActiveMarkets, :xpath, '//*[@id="sortable"]/li[59]/a[1]'
  element :store0, :xpath, '//*[@id="sortable"]/li[60]/a[1]'
  element :auction, :xpath, '//*[@id="sortable"]/li[61]/a[1]'
  element :viewIdeaLight, :xpath, '//*[@id="sortable"]/li[62]/a[1]'
  element :innovationMarket, :xpath, '//*[@id="sortable"]/li[63]/a[1]'
  element :itemNotAccessible, :xpath, '//*[@id="sortable"]/li[64]/a[1]'
  element :viewAllTasks, :xpath, '//*[@id="sortable"]/li[65]/a[1]'
  element :addTask, :xpath, '//*[@id="sortable"]/li[66]/a[1]'
  element :viewEvluationScore, :xpath, '//*[@id="sortable"]/li[67]/a[1]'
  element :viewEvaluationScoreDetails, :xpath, '//*[@id="sortable"]/li[68]/a[1]'
  element :approvalTask, :xpath, '//*[@id="sortable"]/li[69]/a[1]'
  element :ideaList, :xpath, "//a[@href='/Admin/SiteEditor?page_name=IdeaList']"
  element :evaluationFormTemplate, :xpath, '//*[@id="sortable"]/li[71]/a[1]'
  element :taskTemplateForm, :xpath, '//*[@id="sortable"]/li[72]/a[1]'
  element :myTasks, :xpath, '//*[@id="sortable"]/li[73]/a[1]'
  element :evaluationTask, :xpath, '//*[@id="sortable"]/li[74]/a[1]'
  element :taskTemplates, :xpath, '//*[@id="sortable"]/li[75]/a[1]'
  element :evaluationFileTemplate, :xpath, '//*[@id="sortable"]/li[76]/a[1]'
  element :evaluationFile, :xpath, '//*[@id="sortable"]/li[77]/a[1]'
  element :postTextTasks, :xpath, '//*[@id="sortable"]/li[78]/a[1]'
  element :taskSummary, :xpath, '//*[@id="sortable"]/li[79]/a[1]'
  element :reviewTaskForm, :xpath, '//*[@id="sortable"]/li[80]/a[1]'
  element :themeEditor, :xpath, '//*[@id="sortable"]/li[81]/a[1]'
  element :themeCssEditor, :xpath, '//*[@id="sortable"]/li[82]/a[1]'
  element :themeImageEditor, :xpath, '//*[@id="sortable"]/li[83]/a[1]'
  element :taskScore, :xpath, '//*[@id="sortable"]/li[84]/a[1]'
  element :taskTemplateScore, :xpath, '//*[@id="sortable"]/li[85]/a[1]'
  element :cloneIdea, :xpath, '//*[@id="sortable"]/li[86]/a[1]'
  element :restoreConfiguration, :xpath, '//*[@id="sortable"]/li[87]/a[1]'
  element :myTasksAll, :xpath, '//*[@id="sortable"]/li[88]/a[1]'
  element :ideasBetting, :xpath, '//*[@id="sortable"]/li[89]/a[1]'
  element :postChallenge, :xpath, '//*[@id="sortable"]/li[90]/a[1]'
  element :communityAttributes, :xpath, "//a[@href='/Admin/SiteEditor?page_name=CommunityAttributes']"
  element :createCommunity, :xpath, '//*[@id="sortable"]/li[92]/a[1]'
  element :communitySearch, :xpath,  ".//a[contains(@href,'page_name=CommunitySearch')]"
  element :newAuction, :xpath, '//*[@id="sortable"]/li[94]/a[1]'
  element :auctionDeliveryInstructions, :xpath, '//*[@id="sortable"]/li[95]/a[1]'
  element :manageBids, :xpath, '//*[@id="sortable"]/li[96]/a[1]'
  element :auctionHistory, :xpath, '//*[@id="sortable"]/li[97]/a[1]'
  element :bidHistory, :xpath, '//*[@id="sortable"]/li[98]/a[1]'
  element :newJob, :xpath, '//*[@id="sortable"]/li[99]/a[1]'
  element :viewJobOffer, :xpath, '//*[@id="sortable"]/li[100]/a[1]'
  element :manageJobOffers, :xpath, '//*[@id="sortable"]/li[101]/a[1]'
  element :wordsInTopics, :xpath, '//*[@id="sortable"]/li[102]/a[1]'
  element :unsubscribe, :xpath, '//*[@id="sortable"]/li[103]/a[1]'
  element :postChallenge, :xpath, ".//ul[@id='sortable']/li[a[text()='PostChallenge']]"
  element :viewChallenge, :xpath, ".//ul[@id='sortable']/li[a[text()='ViewChallenge']]"
  element :chooseChallengeWinner, :xpath, '//*[@id="sortable"]/li[106]/a[1]'
  element :visualization, :xpath, '//*[@id="sortable"]/li[107]/a[1]'
  element :versionInfo, :xpath, '//*[@id="sortable"]/li[108]/a[1]'
  element :viewSector, :xpath, '//*[@id="sortable"]/li[109]/a[1]'
  element :layoutTest, :xpath, '//*[@id="sortable"]/li[110]/a[1]'
  element :viewIdeaFresh, :xpath, '//*[@id="sortable"]/li[111]/a[1]'
  element :emailExpertsFresh, :xpath, '//*[@id="sortable"]/li[112]/a[1]'
  element :postReviewFresh, :xpath, '//*[@id="sortable"]/li[113]/a[1]'
  element :scoresFresh, :xpath, '//*[@id="sortable"]/li[114]/a[1]'
  element :bio, :xpath, '//*[@id="sortable"]/li[115]/a[1]'
  element :recentActivity, :xpath, '//*[@id="sortable"]/li[116]/a[1]'
  element :stockPortfolio, :xpath, '//*[@id="sortable"]/li[117]/a[1]'
  element :myProfile, :xpath, ".//a[@href='/Admin/SiteEditor?page_name=MyProfile']"
  element :comments, :xpath, '//*[@id="sortable"]/li[119]/a[1]'
  element :viewIdea, :xpath, ".//ul[@id='sortable']/li/a[text()='ViewIdea']"
  element :postReview, :xpath, '//*[@id="sortable"]/li[121]/a[1]'
  element :shareIdeas, :xpath, '//*[@id="sortable"]/li[122]/a[1]'
  element :postSiteChallenge, :xpath, '//*[@id="sortable"]/li[123]/a[1]'
  element :siteChallenge, :xpath, '//*[@id="sortable"]/li[124]/a[1]'
  element :myTradeInvestments, :xpath, '//*[@id="sortable"]/li[125]/a[1]'
  element :languageImportExport, :xpath, '//*[@id="sortable"]/li[126]/a[1]'
  element :pairwiseAdminSettings, :xpath, '//*[@id="sortable"]/li[127]/a[1]'
  element :mobilAppAdminSettings, :xpath, '//*[@id="sortable"]/li[128]/a[1]'
  element :siteChallengeTemplates, :xpath, '//*[@id="sortable"]/li[129]/a[1]'
  @@RolesAllowedToViewThisPage = 'roles'
  element :selectwidget1_dropdown, :xpath, ".//*[@id='add_widget_form0']//select[@id='widget_name']"
  element :selectwidget2_dropdown, :xpath, ".//*[@id='add_widget_form1']//select[@id='widget_name']"
  element :topleveltab_checkbox, :xpath, '//*[@id="top_level"]'
  element :content_link, :xpath, '//*[@id="ui-id-2"]'
  element :addwidget1_button, :xpath, ".//*[@id='add_widget_form0']//input[@value='Add Widget']"
  element :addwidget2_button, :xpath, ".//*[@id='add_widget_form1']//input[@value='Add Widget']"
  element :backtoadministration_link, :xpath, "//a[@href='/Page/Administration']"
  element :updatesiteeditor_button, :xpath, ".//input[@title='Update']"
  element :updateattributes_button, :xpath, ".//form[@id='frmTextFlds']/table/tbody/tr/td/div/div/a[@title='Update']"
  # endregion

  # region Email Templates
  element :unsubscribeall_checkbox, :xpath, ".//div[@class='unsubscribe-window']/descendant::input[@id='selectAll']"
  element :subscriptionsuccessmessage_label, :xpath, ".//div[@class='success']/a/h2[contains(text(),'Subscription notification status saved.')]"
  element :submitsubscriptions_button, :xpath, ".//form[@id='unsibscribe-subscriptions-form']/descendant::strong[text()='Submit']"
  element :submitsubscriptionssuccess_label, :xpath, ".//div[@class='success']/a/h2[text()='Subscription notification status saved. ']"
  element :accountactivity_checkbox, :xpath, ".//ul[@id='emailTypeList']/li/input[@id='fakeEmailType_1002']"

  element :emailtemplates_link, :xpath, "//a[@href='/Admin/Dashboard?orig_url=%2FAdmin%2FEmailTemplatesPage']"
  element :emailtemplatesusers_tab, :xpath, "//*[@id='tab-Users']/a"
  element :settingsemailtemplates_tab, :xpath, ".//li[@id='tab-Settings']/a"
  element :newemailtype_button, :xpath, ".//a[@title='Add New']"
  element :newemailtype_textfield, :xpath, ".//*[@id='email-type-editor']/descendant::input[@class='email-type-edit-name new-input']"
  element :submitnewemailtype_button, :xpath, ".//div[@id='contents']/descendant::span[text()='Submit']"
  element :emailtype_combobox, :xpath, ".//select[@id='emailType']"
  element :customtype_checkbox, :xpath, ".//ul[@id='emailTypeList']/li[div[contains(text(),'Custom Type')]]/input[@class='fake']"
  element :forgotpasswordsubject_field, :xpath, "//*[@id='sendResetUserPassword-form']/table/tbody/tr/td/input[@id='subject']"
  element :forgotpasswordemailtype_combobox, :xpath, "//*[@id='sendResetUserPassword-form']/table/tbody/tr/td/select[@id='emailType']"
  element :forgotusernamesubject_field, :xpath, "//*[@id='sendUserName-form']/table/tbody/tr/td/input[@id='subject']"
  element :forgotuseremailtype_combobox, :xpath, "//*[@id='sendUserName-form']/table/tbody/tr/td/select[@id='emailType']"
  element :forgotpasswordtitle_link, :xpath, "//*[@id='sendResetUserPassword-title']"
  element :forgotusernametitle_link, :xpath, "//*[@id='sendUserName-title']"
  element :emailtemplatessubmit_button, :xpath, "//a[@title='Submit']"
  element :emailtemplatescancel_button, :xpath, "//a[@title='Cancel']"
  element :invitationtonewusers_link, :xpath, ".//*[@id='newUserInvite-title']"
  element :invitationnewuserssubject_field, :xpath, ".//form[@id='newUserInvite-form']//input[@id='subject']"
  element :invitationnewusers_iframe, '#newUserInvite-ebody_ifr'
  element :forgotusername_iframe, '#sendUserName-ebody_ifr'
  element :forgotpassword_iframe, '#sendResetUserPassword-ebody_ifr'
  # endregion

  # region Email Users
  element :submitemailusers_button, :xpath, ".//*[contains(@class,'button grey') and contains(@title,'Submit')]"
  element :emailbodyblanck_text, :xpath, ".//*[@id='error']/a/h2"
  # endregion

  # region DPA
  element :enableemaillogin_checkbox, :xpath, "//*[@id='config-single-com.spigit.config.FeatureConfig.emailLoginEnabled']"
  element :logoutredirecturl_field, :xpath, "//*[@id='config-single-com.spigit.user.UserConfig.logoutRedirectUri']"
  element :loginurl_field, :xpath, "//*[@id='config-single-com.spigit.user.UserConfig.loginUrl']"
  element :dpaupdate_button, :xpath, ".//*[@id='configTbl']//a[@title='Submit']"
  element :reviewideasenabled_checkbox, :xpath, "//*[@id='config-single-com.spigit.config.FeatureConfig.reviewIdeasEnabled']"
  @@confirmationmessage_popup = ".//*[@id='themeContainer']/div[4]"
  element :listaggregatedcontent_checkbox, :xpath, ".//*[@id='config-single-com.spigit.config.SpigitConfig.isAggregateSite']"
  element :communitysearchaggregate_checkbox, :xpath, ".//*[@id='config-single-com.spigit.config.FeatureConfig.aggregateSiteCommunitiesSearchEnabled']"
  element :ideaExpiry_checkbox, :xpath, ".//*[@id='config-single-com.spigit.config.FeatureConfig.ideaExpiryEnabled']"
  element :recentActivitiesIncludedNodeTypesFusionEnabled_list, :xpath, ".//*[@id='configIdeaGraduated']/table[@id='array-insert-config-single-com.spigit.config.SpigitConfig.recentActivitiesIncludedNodeTypesFusionEnabled']"
  element :recentActivitiesExcludedNodeTypesForFusionEnabled_list, :xpath, ".//*[@id='configIdeaGraduated']/table[@id='array-insert-config-single-com.spigit.config.SpigitConfig.recentActivitiesExcludedNodeTypesForFusionEnabled']"
  element :ideatradingenabled_checkbox, :xpath, ".//*[@id='config-single-com.spigit.config.FeatureConfig.ideaTradingEnabled']"
  # endregion

  ###Turn On/Off Feature variable
  element :turnonofffeatures_link, :xpath, "//a[@href='/Admin/Dashboard?orig_url=%2FAdmin%2FConfiguration%3Fsection%3DdisplaySettings']"
  element :showchangepasswordsettings_checkbox, :xpath, "//*[@id='config-single-com.spigit.config.DisplayConfig.showChangePasswordButton']"
  element :submitfeaturessettings_button, :xpath, ".//a[@title='Submit']"
  element :currentpassword_textfield, :xpath, "//*[@id='oldpw']"
  element :newpassword_textfield, :xpath, "//*[@id='pw1']"
  element :confirmnewpassword_textfield, :xpath, "//*[@id='pw2']"
  element :showcancelbutton_checkbox, :xpath, "//*[@id='config-single-com.spigit.config.DisplayConfig.showCancelButtonOnPostIdea']"
  element :showsavedraftbutton_checkbox, :xpath, "//*[@id='config-single-com.spigit.config.DisplayConfig.showDraftButtonOnPostIdea']"
  element :showtopcategories_checkbox, :xpath, ".//*[@id='config-single-com.spigit.config.DisplayConfig.showTopCategories']"
  # endregion

  ###Idea Template Editor variables
  element :ideatemplateeditor_link, :xpath, "//a[@href='/Admin/IdeaTemplateEditor']"
  element :saveideatemplate_button, :xpath, "//a/span[text()='Save Template']"
  element :ideatemplatewarningmessage, :xpath, "//div[@class='ui-dialog ui-widget ui-widget-content ui-corner-all ite-warning ui-draggable']"
  element :textfield_label, :xpath, ".//li[contains(@id,'frm-')]/div[span[text()='Text Field']]/following-sibling::div//input[@type='text'][contains(@name,'label')]" #tc33.fa.20150225
  element :textfield_helptext, :xpath, ".//*[@id='description-1']" # ".//li[contains(@id,'frm-')]/div[span[text()='Text Field']]/following-sibling::div//input[@type='text'][contains(@name,'description')]"
  # endregion

  # region Post Idea
  element :postideatitle_textfield, :xpath, "//*[@id='title']"
  element :tags_textfield, :xpath, "//*[@id='postideaform']/div[8]/div/ul"
  element :category_combobox, :xpath, "//*[@id='postideaform']/div[2]/div[2]/a/span[1]"
  element :publishpostidea_button, :xpath, "//a[@title='Publish']"
  element :savedraftidea_button, :xpath, "//a[@id='draft_button']"
  element :cancelpostidea_button, :xpath, "//a[@title='Cancel']"
  element :draftideawassaved_text, :xpath, "//h2[text()='The draft has been saved. You can access your draft idea from your profile page.']"
  element :inappropriatecontentused_text, :xpath, "//h2[contains(text(),'Inappropriate content has been used and is being reviewed by the Site Administrator.')]"
  element :postideacategory_combobox, :xpath, ".//div[@class='options']/div[contains(@class,'option_block marTop13-20 clearfix')]/a"
  @@postideasuccesmessage = ".//div[@class='success']/a/h2"
  @@communitytask_container = "//td[@class='task-name']"
  @@taskprogress_label = "//td[@class='task-name'][contains(text(),'Minimum Review Rating for')]/following-sibling::td[@headers='col-community-tasks-progress']"
  @@ideaTitles = Hash.new
  @@singlequotedIdeaTitles = Hash.new
  @@doublequotedIdeaTitles = Hash.new
  @@closedIdeaTitles = Hash.new
  @@foundIdeaTitles = Hash.new
  # endregion

  # region View Idea Page
  element :editidea_link, :xpath, "//*[@id='idea-detail']/div/ul/li/a[contains(@href,'/Page/PostIdea?ideaid=')][contains(@href,'&EDIT_IDEA=TRUE')]"
  element :confirmationmessage_checkbox, :xpath, "//*[@id='continue']"
  element :approvependingcomments_link, :xpath, "//a[contains(@href,'/Idea/PendingThread?ideaid=')]"
  element :viewideacontrolpanel_header, :xpath, "//*[@id='idea_control_panel']/div[@class='widget-header']/h2/a"
  element :defaultnewideasubscription_checkbox, :xpath, ".//*[@id='config-single-com.spigit.idea.IdeaConfig.defaultSubscriptionIdea']"
  element :recievenotification_checkbox, :xpath, "//*[@id='subscribe']"
  element :postreviewtab_link, :xpath, ".//*[@id='tab3']/a"
  element :evaluation_tab, :xpath, ".//a[text()='Evaluation']"
  element :addtask_button, :xpath, ".//a[@title='Add New Task']"
  element :generalreview_link, :xpath, ".//form[@id='viewAllTaskForm']/table/tbody/tr/td[@class='task-name']/a"
  element :postreviewrating_button, :xpath, ".//a[@title='Post your Rating']"
  element :movetofirststage_link, :xpath, ".//div[@id='idea_control_panel']/div[2]//descendant::a[contains(@href,'idea_stage=0')]"
  element :movetosecondstage_link, :xpath, ".//div[@id='idea_control_panel']/div[2]//descendant::a[contains(@href,'idea_stage=1')]"
  element :movetothirdstage_link, :xpath, ".//div[@id='idea_control_panel']/div[2]//descendant::a[contains(@href,'idea_stage=2')]"
  element :movetocustomstage_link, :xpath, ".//div[@id='idea_control_panel']/div[2]//descendant::a[contains(@href,'idea_stage=3')]"
  element :ideastatsprogress_label, :xpath, ".//ul[@class='idea_Stats_List']/li[strong[text()='Progress:']]"
  element :idea_sort_combobox, :xpath, "//div[@id='ideas-result']/div[1]/ul[@class='filters clearfix']/li[@class='filter-item idea_sort']/a"
  element :idea_stage_combobox, :xpath, "//div[@id='ideas-result']/div[@class='header-results clearfix marTop16-20']/ul[@class='filters clearfix']/li[@class='filter-item idea_stage']/a"
  element :categorytree_combobox, :xpath, "//div[@id='ideas-result']/div[@class='header-results clearfix marTop16-20']/ul[@class='filters clearfix']/li[@class='filter-item categoryTree']/a"
  element :deleteidea_link, :xpath, ".//a[contains(@title,'Delete this idea and all posts under it.')]"
  element :followidea_link, :xpath, ".//div[@id='idea-detail']//ul[@class='action-list']//a[text()='Follow']"
  element :unfollowidea_link, :xpath, ".//div[@id='idea-detail']//ul[@class='action-list']//a[text()='Unfollow']"
  element :closeidea_link, :xpath, ".//div[@id='idea_control_panel']/div/ul/li/a[@title='Close this idea']"
  element :movetostage_link, :xpath, ".//a[@id='MoveIdeaStageDropdownMenuLink']"
  element :movetostage_combobox, :xpath, ".//a[select[@name='MoveIdeaStageDropdownMenu']]"
  element :movetostagecancel_button, :xpath, ".//div[@id='changeStageDialog']//a/span[strong[text()='Cancel']]"
  element :movetostageconfirm_button, :xpath, ".//div[@id='changeStageDialog']//a/span[strong[text()='Confirm']]"
  element :stageselector_combobox, :xpath, ".//div[@class='left stageSelect']/a"
  element :recentactivities_list, :xpath, ".//div[@id='recent_activities']//table[@class='recentActivityFeed alternateRow']"
  element :viewideareviewtext_iframe, '#content_review_ifr'
  element :idea_stage, :xpath,"//span[@title='Incubation' and contains(text(),'Incubation')]"
  element :teammember_link, :xpath,".//*[@id='ideahome_teammember']//a[@class='inviteMember']"
  element :invitemembercancel_button, :xpath,".//*[@id='teamMemberDialog']//strong[text()='Cancel']"
  element :invitememberuser_field, :xpath,".//*[@id='inviteTeamMemberUserName']"
  element :stage_progressbar, :xpath,".//div[contains(@class,'stage-progress-bar')]"
  #Close Idea Popup
  element :ideaimplementedyes_checkbox, :xpath, ".//input[@id='chkSuccessfulClose']"
  element :ideaimplementedno_checkbox, :xpath, ".//input[@id='chkAbortClose']"
  element :submitcloseidea_button, :xpath, ".//form[@id='closeIdea']/div/div/a[contains(@class,'action_closeIdea')]"
  element :cancelcloseidea_button, :xpath, ".//form[@id='closeIdea']/div/div/a[contains(@class,'btnCancel')]"
  element :ideapopupclose_link, :xpath, "//a[@role='close button']"
  element :postcomment_reply_button, :xpath, "//div[@class='speuiSpriteButton'][2]/a"
  # endregion

  # region Idea Information Display
  element :ideainformation_link, :xpath, "//a[@href='/Admin/Dashboard?orig_url=%2FAdmin%2FConfiguration%3Fsection%3DideaDisplay']"
  element :showmoderatethreads_checkbox, :xpath, "//*[@id='config-single-com.spigit.config.DisplayConfig.showModerateThreads']"
  element :ideainformationsubmit_button,:xpath, "//a[@title='Submit']"
  element :moderateideathreads_checkbox, :xpath, "//*[@id='moderate_threads']"
  element :showideasubscription_checkbox, :xpath, ".//*[@id='config-single-com.spigit.config.DisplayConfig.showIdeaSubscription']"
  element :showideastages_checkbox, :xpath, ".//*[@id='config-single-com.spigit.config.DisplayConfig.showIdeaStages']"
  element :ideaexpirationdate_checkbox, :xpath, ".//*[@id='config-single-com.spigit.idea.IdeaConfig.showIdeaExpirationDate']" #as.tc9.fa.20150127
  element :showidearating_checkbox, :xpath, ".//*[@id='config-single-com.spigit.config.DisplayConfig.showIdeaRating']" #as.tc9.fa.20150127
  element :postedat_checkbox, :xpath, ".//*[contains(@id, 'config-array-0-com.spigit.idea.IdeaConfig.ideaStatsElementsDisplayToggle')][@type='checkbox']"
  element :discussionforumposts_checkbox, :xpath, ".//*[contains(@id, 'config-array-1-com.spigit.idea.IdeaConfig.ideaStatsElementsDisplayToggle')][@type='checkbox']"
  element :reviews_checkbox, :xpath, ".//*[contains(@id, 'config-array-2-com.spigit.idea.IdeaConfig.ideaStatsElementsDisplayToggle')][@type='checkbox']"
  element :views_checkbox, :xpath, ".//*[contains(@id, 'config-array-3-com.spigit.idea.IdeaConfig.ideaStatsElementsDisplayToggle')][@type='checkbox']"
  element :approvalrating_checkbox, :xpath, ".//*[contains(@id, 'config-array-4-com.spigit.idea.IdeaConfig.ideaStatsElementsDisplayToggle')][@type='checkbox']"
  element :qualityrating_checkbox, :xpath, ".//*[contains(@id, 'config-array-5-com.spigit.idea.IdeaConfig.ideaStatsElementsDisplayToggle')][@type='checkbox']"
  element :likesdislikes_checkbox, :xpath, ".//*[contains(@id, 'config-array-6-com.spigit.idea.IdeaConfig.ideaStatsElementsDisplayToggle')][@type='checkbox']"
  element :founder_checkbox, :xpath, ".//*[contains(@id, 'config-array-7-com.spigit.idea.IdeaConfig.ideaStatsElementsDisplayToggle')][@type='checkbox']"
  element :teammembers_checkbox, :xpath, ".//*[contains(@id, 'config-array-8-com.spigit.idea.IdeaConfig.ideaStatsElementsDisplayToggle')][@type='checkbox']"
  element :stage_checkbox, :xpath, ".//*[contains(@id, 'config-array-9-com.spigit.idea.IdeaConfig.ideaStatsElementsDisplayToggle')][@type='checkbox']"
  element :price_checkbox, :xpath, ".//*[contains(@id, 'config-array-10-com.spigit.idea.IdeaConfig.ideaStatsElementsDisplayToggle')][@type='checkbox']"
  element :graduationtasks_checkbox, :xpath, ".//*[contains(@id, 'config-array-11-com.spigit.idea.IdeaConfig.ideaStatsElementsDisplayToggle')][@type='checkbox']"
  element :ideaexpirationdatestats_checkbox, :xpath, ".//*[contains(@id, 'config-array-12-com.spigit.idea.IdeaConfig.ideaStatsElementsDisplayToggle')][@type='checkbox']"
  element :sector_checkbox, :xpath, ".//*[contains(@id, 'config-array-13-com.spigit.idea.IdeaConfig.ideaStatsElementsDisplayToggle')][@type='checkbox']"
  # endregion

  ###Moderators variables
  element :moderators_link, :xpath, "//a[@href='/Admin/Dashboard?orig_url=%2FAdmin%2FModeratorManagerPage%3Fpagename%3Dmanagemods']"
  element :moderatorsusername_field, :xpath, "(.//input[contains(@id,'username')])[1]"
  element :moderatorsselectall_checkbox, :xpath, "//*[@id='sectors_all']"
  element :moderatorssubmit_button,:xpath, "//a[@title='Submit']"
  @@useraddedtomoderators_text = "//div[@class='success']/a/h2[contains(text(),'added to the Moderators panel.')]"

  # region Evaluation Templates
  element :evaluationtemplates_link, :xpath, ".//div/a[contains(text(), 'Evaluation Templates')]"
  element :addnewreviewform_button, :xpath, "//div[@class='postIdeaBlockHolder']/a[@title='Add New' and contains(@href,'Review')]"
  element :deletereviewform_button, :xpath, "//div[@class='postIdeaBlockHolder']/a[@title='Delete' and contains(@href,'Review')]"
  element :templatename_field, :xpath, "//*[@id='templateTitle']"
  element :generalreview_checkbox, :xpath, "//*[@id='generalReview']"
  element :showreviewformtext_checkbox, :xpath, "//*[@id='showComment']"
  element :templatedesc_field, :xpath, "//*[@id='templateDesc']"
  element :reviewratings_field, :xpath, "//*[@id='templateRatings']"
  element :addquantitativecriteria_button, :xpath, "//fieldset[legend[text()='Quantitative Criteria']]/a"
  element :addqualitativecriteria_button, :xpath, "//fieldset[legend[text()='Qualitative Criteria']]/a"
  element :evaluationtemplatesave_button, :xpath, ".//*[@id='evalForm']/a[span/strong[text()='Save']]"
  element :reviewform_dropdown, :xpath, ".//*[@id='reviewFormTemplateId']"
  element :reviewformedit_button, :xpath, ".//*[@id='revieEditButttonSpanId']"
  @@evaluationsavedsuccessmessage = ".//*[@id='contents']/div/div[2]"
  #Evaluation Form
  element :evalformlist_combobox, :xpath, ".//select[@id='templateSelId']"
  element :addnewevalform_button, :xpath, "//div[@class='postIdeaBlockHolder'][4]/a[@title='Add New']"
  #Evaluation File
  element :addnewevalfile_button, :xpath, "//div[@class='postIdeaBlockHolder'][2]/a[@title='Add New']"
  element :evaluationfilename_field, :xpath, ".//input[@id='name']"
  element :evaluationTaskFilename_field, :xpath, ".//div/input[@name='ideaid']"
  element :uploadfile_button, :xpath, ".//input[@id='fileNameId']"
  element :submitevalfile_button, :xpath, ".//form[@id='evaluationFileFormId']/div/div/a[@title='Submit']"
  element :submitevalfiletask_button, :xpath, ".//form[@id='evaluationFileFormId']//a[@title='Submit']"
  # endregion

  # region Graduation Thresholds
  element :graduation_thresholds_link, :xpath, ".//div/a[contains(text(), 'Graduation Thresholds')]"
  element :graduationupdate_button, :xpath, '//*[@id="graduationFormId"]/table/tbody/tr[2]/td/a/span'

  #Community and Analytical section
  element :analyticaltasks_fieldset, :xpath, ".//fieldset[@id='communityAnalytical']/legend[text()='Community and Analytical']"
  element :agethreshold_field, :xpath, ".//input[@id='threshold_0']"
  element :qualifiedpageviewsthreshold_field, :xpath, ".//input[@id='threshold_1']"
  element :votesthreshold_field, :xpath, ".//input[@id='threshold_2']"
  element :numberofpoststhreshold_field, :xpath, ".//input[@id='threshold_3']"
  element :conversationlevelthreshold_field, :xpath, ".//input[@id='threshold_4']"
  element :buzzpercentilethreshold_field, :xpath, ".//input[@id='threshold_5']"
  element :approvalraatingthreshold_field, :xpath, ".//input[@id='threshold_6']"
  element :teamsizethreshold_field, :xpath, ".//input[@id='threshold_9']"
  element :pairwiserankingthreshold_field, :xpath, ".//input[@id='threshold_12']"
  element :starratingthreshold_field, :xpath, ".//input[@id='threshold_13']"

  #review section
  element :reviewcount_field, :xpath, ".//*[@id='usrTask1_Count']"
  element :formcount_field, :xpath, ".//*[@id='usrTask2_Count']"  #tc16.fa.20150120
  element :filecount_field, :xpath, ".//*[@id='usrTask3_Count']"  #tc16.fa.20150120
  element :minimumreviewrating_field, :xpath, ".//*[@id='reviewTaskAddId']/td[3]/input"
  element :reviewduedate_field, :xpath, ".//*[@id='reviewTaskAddId']/td[4]/input"
  element :selectreviewform_combobox, :xpath, ".//*[@id='subRvId']"
  element :reviewroles_combobox, :xpath, ".//*[@id='reviewTaskAddId']//select[contains(@name,'roles')]" #Roles new task
  element :reviewrolesUpdate_combobox, :xpath, ".//fieldset[legend[text()='Review']]//select[contains(@id,'roles')]" #Roles existing task

  element :review_fieldset, :xpath, ".//fieldset[@id='graduationThresholdsReview']/legend[text()='Review']"
  element :defaultdeletereview_checkbox, :xpath, ".//tr[@class='showRow']/td/input[contains(@name,'delete')]"
  element :defaultreviewcount_field, :xpath, ".//tr[@class='showRow']/td/input[contains(@name,'count')]"
  element :defaultminreviewrating_field, :xpath, ".//tr[@class='showRow']/td/input[contains(@name,'minCount')]"
  element :defaultduedateperiod_field, :xpath, ".//tr[@class='showRow']/td/input[contains(@name,'dueDate')]"
  element :defaultdelayemailnotification_checkbox, :xpath, ".//tr[@class='showRow']/td/input[contains(@name,'wait')]"
  element :defaultselectreviewform_combobox, :xpath, ".//tr[@class='showRow']/td/select[contains(@name,'form')]"
  element :defaultreviewroles_combobox, :xpath, ".//tr[@class='showRow']/td/select[contains(@name,'roles')]"
  element :defaultaccess_link, :xpath, ".//tr[@class='showRow']/td/a[@title='Review - Access settings']"
  element :reviewaddnew_button, :xpath, ".//*[@id='reviewTaskAddButtonId']/a"
  element :evaluationformaddnew_button, :xpath, ".//*[@id='evFormAddButtonId']/a"
  element :evaluationfileaddnew_button, :xpath, ".//*[@id='evFileAddButtonId']/a"
  # endregion

  #Evaluation Form section
  element :evaluationform_fieldset, :xpath, ".//form[@id='graduationFormId']//descendant::fieldset[legend[text()='Evaluation Form']]"
  element :evalformdelete_checkbox, :xpath, ".//fieldset[legend[text()='Evaluation Form']]//descendant::tr/td/input[contains(@name,'delete')]"
  element :evalformcount_field, :xpath, ".//fieldset[legend[text()='Evaluation Form']]//descendant::tr/td/input[contains(@name,'count')]"
  element :evalformduedateperiod_field, :xpath, ".//fieldset[legend[text()='Evaluation Form']]//descendant::tr/td/input[contains(@name,'dueDate')]"
  element :evalformdelayemailnotification_checkbox, :xpath, ".//fieldset[legend[text()='Evaluation Form']]//descendant::tr/td/input[contains(@name,'wait')]"
  element :evalformselect_combobox, :xpath, ".//fieldset[legend[text()='Evaluation Form']]//descendant::tr/td/select[contains(@name,'form')]"
  element :evalformroles_combobox, :xpath, ".//fieldset[legend[text()='Evaluation Form']]//tr[not(@id)]//select[contains(@name,'roles')]" #Roles existing task
  element :newevalformroles_combobox, :xpath, ".//fieldset[legend[text()='Evaluation Form']]//tr[@id]//select[contains(@name,'roles')]" #Roles new task
  element :evalformaccess_link, :xpath, ".//fieldset[legend[text()='Evaluation Form']]//descendant::tr/td/a[@title='Evaluation Form - Access settings']"
  element :evalformaddnew_button, :xpath, ".//*[@id='evFormAddButtonId']/a/span"
  element :newevalformcount_field, :xpath, ".//fieldset[legend[text()='Evaluation Form']]//descendant::tr/td/input[contains(@name,'Count')]"
  element :newevalformduedateperiod_field, :xpath, ".//fieldset[legend[text()='Evaluation Form']]//descendant::tr/td/input[contains(@name,'DueDate')]"
  element :newevalformselect_combobox, :xpath, ".//fieldset[legend[text()='Evaluation Form']]//descendant::tr/td/select[contains(@name,'Form')]"
  # endregion

  #Evaluation File section
  element :evaluationfile_fieldset, :xpath, ".//form[@id='graduationFormId']//descendant::fieldset[legend[text()='Evaluation File']]"
  element :evalfiledelete_checkbox, :xpath, ".//fieldset[legend[text()='Evaluation File']]//descendant::tr/td/input[contains(@name,'delete')]"
  element :evalfilecount_field, :xpath, ".//fieldset[legend[text()='Evaluation File']]//descendant::tr/td/input[contains(@name,'count')]"
  element :evalfileduedateperiod_field, :xpath, ".//fieldset[legend[text()='Evaluation File']]//descendant::tr/td/input[contains(@name,'dueDate')]"
  element :evalfiledelayemailnotification_checkbox, :xpath, ".//fieldset[legend[text()='Evaluation File']]//descendant::tr/td/input[contains(@name,'wait')]"
  element :evalfileselect_combobox, :xpath, ".//fieldset[legend[text()='Evaluation File']]//descendant::tr/td/select[contains(@name,'form')]"
  element :evalfileroles_combobox, :xpath, ".//fieldset[legend[text()='Evaluation File']]//tr[not(@id)]//select[contains(@name,'roles')]" #Roles existing task
  element :newevalfileroles_combobox, :xpath, ".//fieldset[legend[text()='Evaluation File']]//tr[@id]//select[contains(@name,'roles')]" #Roles new task
  element :evalfileaccess_link, :xpath, ".//fieldset[legend[text()='Evaluation File']]//descendant::tr/td/a[@title='Evaluation File - Access settings']"
  element :evalfileaddnew_button, :xpath, ".//*[@id='evFileAddButtonId']/a/span"
  element :newevalfilecount_field, :xpath, ".//fieldset[legend[text()='Evaluation File']]//descendant::tr/td/input[contains(@name,'Count')]"
  element :newevalfileduedateperiod_field, :xpath, ".//fieldset[legend[text()='Evaluation File']]//descendant::tr/td/input[contains(@name,'DueDate')]"
  element :newevalfileselect_combobox, :xpath, ".//fieldset[legend[text()='Evaluation File']]//descendant::tr/td/select[contains(@name,'Form')]"
  # endregion

  #Approval task section
  element :approvalcount_field, :xpath, ".//*[@id='usrTask4_Count']"
  element :approvalduedate_field, :xpath, ".//*[@id='apprHAddId']/tbody/tr/td/input[@name='usrTask4_DueDate']"
  element :approvalroles_combobox, :xpath, ".//*[@id='apprHAddId']//td/select"

  element :approval_fieldset, :xpath, ".//form[@id='graduationFormId']//descendant::fieldset[legend[text()='Approval']]"
  element :approvaldelete_checkbox, :xpath, ".//fieldset[legend[text()='Approval']]//descendant::tr/td/input[contains(@name,'delete')]"
  element :approvalcount_field, :xpath, ".//fieldset[legend[text()='Approval']]//descendant::tr/td/input[contains(@name,'Count')]"
  element :approvalduedateperiod_field, :xpath, ".//fieldset[legend[text()='Approval']]//descendant::tr/td/input[contains(@name,'DueDate')]"
  element :approvaldelayemailnotification_checkbox, :xpath, ".//fieldset[legend[text()='Approval']]//descendant::tr/td/input[contains(@name,'Wait')]"
  element :approvalroles_combobox, :xpath, ".//fieldset[legend[text()='Approval']]//tr[not(@id)]//select[contains(@name,'roles')]" #Roles existing task
  element :newapprovalroles_combobox, :xpath, ".//fieldset[legend[text()='Approval']]//tr[@id]//select[contains(@name,'roles')]" #Roles new task
  element :approvalaccess_link, :xpath, ".//fieldset[legend[text()='Approval']]//descendant::tr/td/a[@title='Approval - Access settings']"
  element :approvaladdnew_button, :xpath, ".//*[@id='appAddButtonId']/a"
  element :approvaldelete_checkbox, :xpath, ".//*[@id='apprHAddId']/tbody/tr/td/input[@name='usrTask4_delete']"

  element :accessettings_popup, :xpath, ".//*[@id='graduation-settings']/div[contains(@style,'display: block;') and contains(@aria-labelledby,'graduationTaskAccessDialog')]//descendant::h2"
  element :accesssettingsclose_button, :xpath, ".//*[@id='graduation-settings']/div[contains(@style,'display: block;') and contains(@aria-labelledby,'graduationTaskAccessDialog')]/div/a[@role='close button']"
  # endregion

  # region Tasks
  element :taskApproveRadio_checkbox, :xpath, ".//*[@id='taskApproveRadio']"
  element :taskNotApproveRadio_checkbox, :xpath, ".//*[@id='tasknotApproveRadio']"
  element :taskSubmit_button, :xpath, ".//a[@title='Submit' or @title='submit' or @title='Update']"
  #Review task section
  element :taskSubmitReview_button, :xpath, ".//*[@id='reviewTaskForm']//a[@title='Submit']"
  element :updatereview_button, :xpath, ".//*[@id='reviewTaskForm']//input[@value='Update']"
  element :taskreviewnoselection_checkbox, :xpath, ".//*[@type='radio' and @value='0']"
  element :taskreviewpoor_checkbox, :xpath, ".//*[@type='radio' and @value='1']"
  element :taskreviewfair_checkbox, :xpath, ".//*[@type='radio' and @value='2']"
  element :taskreviewgood_checkbox, :xpath, ".//*[@type='radio' and @value='3']"
  element :taskreviewgreat_checkbox, :xpath, ".//*[@type='radio' and @value='4']"
  element :taskreviewoffthecharts_checkbox, :xpath, ".//*[@type='radio' and @value='5']"
  element :approvalTaskSubmit_button, :xpath, ".//*[@id='approvalTaskForm']//a[@title='submit']"
  element :approvalposttext_field, :xpath, ".//*[@id='postTextAreaId']"
  # endregion

  #Add Task
  element :submitreview_option, :xpath, "//input[@type='radio' and @value='Submit Review']"
  element :review_list, :xpath, ".//select[@id='subReviewId']"
  element :switchtoroleassignment_link, :xpath, ".//div[@id='user_assignment_div']/p/a"
  element :submittask_button, :xpath, ".//form[@id='createTaskForm']//a[@title='Add Task']"
  element :uploadfiletemplate_combobox, :xpath, ".//select[@id='uploadFileNameId']"
  element :uploadfiletask_button, :xpath, ".//input[@id='uploadfileNameId']" #fa.IG003.20150408
  element :submitreviewtemplate_combobox, :xpath, ".//select[@id='subReviewId']"
  element :completeevalformtemplate_combobox, :xpath, ".//select[@id='evaluationFormId']"
  element :assigntasktouser_field, :xpath, ".//input[@id='username_autosuggest']"
  element :taskdescription_field, :xpath, ".//textarea[@id='taskDescId']"
  element :taskduedate_field, :xpath, ".//input[@id='duedate']"
  element :viewalltaskform_list, :xpath, ".//*[@id='viewAllTaskForm']"
  element :taskname_field, :xpath, ".//input[@id='taskNameId']"
  element :delaynotification_checkbox, :xpath, './/input[@id="delayNotification"]'
  element :taskforreviewtext_iframe, '#content_ifr'
  element :reqFeedTaskSubmit_button, :xpath, ".//*[@id='submitForm']"
  element :subscribereview_button, :xpath, ".//a[@title='Subscribe to this review']"
  @@reviewText = ".//div[@class='ratingsreview']/p"

  element :subscribetotask_link, :xpath, ".//div[@id='sidebar']//div[@id='subscribeLabel']/a[text()='Subscribe to Task']"
  element :unsubscribetotask_link, :xpath, ".//*[@id='sidebar']//a[text()='Unsubscribe to Task']"
  element :taskcompletedchange_button, :xpath, ".//div[contains(@class,'ideaHolder')]//a[span[contains(text(),'Change')]]"
  element :whohasaccessTask_link, :xpath, ".//*[@id='sidebar']//a[text()='Who Has Access?']"
  element :edittaskTask_link, :xpath, ".//*[@id='sidebar']//a[text()='Edit Task']"
  element :updatetask_button, :xpath,  ".//a[@title='Update Task']"
  element :deletetask_button, :xpath,  ".//a[@title='Delete Task']"
  element :canceltask_button, :xpath,  ".//a[@title='Cancel']"
  element :taskschangereview_button, :xpath, ".//a[span[text()='Change Review']]"
  element :taskupdate_button, :xpath, ".//input[@value='Update']"
  # endregion

  ###Experts
  element :expertssubmit_button,:xpath, "//a[@title='Submit']"
  element :expertsusername_field, :xpath, "(.//input[contains(@id,'username')])[1]"
  element :experts_link, :xpath, "//a[@href='/Admin/Dashboard?orig_url=%2FAdmin%2FExpertManagerPage%3Fpagename%3Dmanageexperts']"
  @@useraddedtoexperts_text = "//div[@class='success']/a/h2[contains(text(),'added to the Experts panel.')]"
  # endregion

  ###Roles variables
  element :roles_link, :xpath, ".//a[@href='/Admin/Dashboard?orig_url=%2FAdmin%2FRolesPage%3Fpagename%3Droles']"
  element :rolename_textfield, :xpath, ".//input[@id='roleName']"
  element :roledescription_textfield, :xpath, ".//input[@id='description']"
  element :rolesubmit_button, :xpath, ".//a[@id='create']"
  # endregion

  ###Permissions variables
  element :permissions_link, :xpath, ".//a[@href='/Admin/Dashboard?orig_url=%2FAdmin%2FPermissions%3Fpagename%3Dpermissions']"
  # endregion

  ###Pairwise variables
  element :pairwise_link, :xpath, ".//a[@href='/Page/PairwiseAdminSettings']"
  # endregion

  # region View Ideas
  element :searchideasadvanced_link, :xpath, ".//*[@id='advanced-tab']"
  element :communities_combobox, :xpath, ".//*[@id='siteid']"
  element :viewideassearch_button, :xpath, ".//*[@id='viewIdeasInput']//a[@title='Search']"
  element :viewideassearch_field, :xpath, ".//input[@id='search_ideas']"
  element :customtextfield_field, :xpath, ".//label[span[text()='Text Field']]/following-sibling::*"
  element :customdropdown_combobox, :xpath, ".//label[span[text()='Drop Down']]/following-sibling::*"
  element :customrichtexteditor_field, :xpath, ".//label[span[text()='Rich Text Editor']]/following-sibling::*"
  element :customcheckbox_field, :xpath, ".//label[span[text()='Checkbox']]/following-sibling::*"
  element :customcheckboxgroup_combobox, :xpath, ".//label[span[text()='Checkbox Group']]/following-sibling::*"
  element :customradiogroup_combobox, :xpath, ".//label[span[text()='Radio Group']]/following-sibling::*"
  element :viewideasusername_field, :xpath, "//*[@id='autosuggest']"
  element :viewideasideaid_field, :xpath, ".//*[@id='nodeid']"
  element :viewideastags_field, :xpath, "//*[@id='spigit_tags']"
  element :viewideasDescrip_field, :xpath, ".//*[@id='idea_field_0']"
  element :viewideaspoststartdate_field, :xpath, "//*[@id='post_date_start']"
  element :viewideaspostenddate_field, :xpath, "//*[@id='post_date_end']"
  element :viewideascategory_combobox, :xpath, ".//select[@id='parentid']"
  element :viewideasrole_combobox, :xpath, ".//select[@id='role']"
  element :viewideasstage_combobox, :xpath, ".//select[@id='idea_stage']"
  element :activestages_combobox, :xpath, ".//li[@class='filter-item idea_stage']" #fa.tc23.20150108
  element :allcategories_combobox, :xpath, ".//li[@class='filter-item categoryTree']" #fa.tc24.20150113
  element :viewideas_container, :xpath, ".//*[@id='viewIdeasViewPort']"
  @@viewideas_container = '#viewIdeasViewPort'
  element :viewideasstageprogressbar, :xpath, ".//ul[contains(@class,'stage-progress-bar')]"
  element :numbercounter_text, :xpath, ".//*[@id='saved_message']//span[text()='0']"
  element :labelcounter_text, :xpath, ".//*[@id='saved_message']//strong[text()='Idea(s)']"
  element :clearsearch_link, :xpath, ".//*[@id='saved_message']//a[@title='Clear Search']"
  # endregion

  # region Activity Stream
  @@activitymyideas_widget = '#myIdeas'
  @@activitystream_widget = '#activityStreamViewPort'
  @@useractivities_widget = ".item-list.border-bottom"

  element :activitymystuff_link, :xpath, ".//li[@id='activityMyStuff']/a/span[1]"
  element :activityall_link, :xpath, ".//li[@id='activityAll']/a[@title='All']"
  element :feedinfo_label, :xpath, ".//ul[@id='activitystream']/li/div[@class='media-body']/p[@class='sp-idea-info']"
  element :feeddetails_label, :xpath, ".//ul[@id='activitystream']/li/div[@class='media-body']/p[@class='sp-idea-details']"
  element :showfeedsfilters_link, :xpath, ".//div[@id='activity_stream_home']//descendant::a[text()='Show Filters']"
  element :feedstype_combobox, :xpath, ".//a[select[@id='activity_filter']]"
  element :ideastatistics_link, :xpath,".//*[@id='ideaDetailsFooterNav']//a[@class='tab-nav navIdeaStats']"
  element :activitystream_container, :xpath, ".//div[@id='activityStreamViewPort']"
  element :activitystreamsearch_field, :xpath, ".//input[@id='sp-search-text']"
  element :activitystreamsearch_button, :xpath, ".//button[@id='sp-search-submit']"
  element :activitystreamreset_link, :xpath, ".//a[contains(@class,'reset-filters') and text()='Reset']"
  # endregion

  # region Idea Popup
  element :ideapopupactivity_tab, :xpath, ".//div[@id='ideaDetailsFooterNav']/ul/li/a[text()='Activity']"
  element :ideapopupstatistics_tab, :xpath, ".//div[@id='ideaDetailsFooterNav']/ul/li/a[text()='Statistics']"
  element :ideapopupcomments_tab, :xpath, ".//div[@id='ideaDetailsFooterNav']/ul/li/a[text()='Comments']"
  element :returnidea_link, :xpath, ".//*[@id='ideaDetailsFooterNav']/div/a"
  # endregion

  ###Display Ideas in Other Communities variables
  element :displayideasothercomm_link, :xpath, ".//a[@href='/Admin/Dashboard?orig_url=%2FPage%2FShareIdeas']"
  element :availablecommunitiessubmit_button, :xpath, ".//*[@id='communityShareIdeasForm']//a[span[text()='Submit']]"
  # endregion

  #region Communities variables
  element :advancedfilter_link, :xpath, "//*[@id='filterToggleLink']/span"
  element :addnewattribute_button, :xpath, ".//a[@title='Add New Attribute']"
  element :saveattributes_button, :xpath, ".//form[@id='evalCommAttrForm']/table/tbody/tr/td/a[@title='Save']"
  element :searchcommunitiesbyattributes_button, :xpath, ".//a[@title='Search']"
  element :searchcommunity_field, :xpath, ".//input[@id='searchname']"
  element :savecommunitysearch_button, :xpath, ".//input[@type='button' and @value='Save Search']"
  element :setdefaultsearchcommunity_checkbox, :xpath, ".//input[@id='asDefault']"
  # endregion

  # region Bulk Actions
  element :bulkactionsideastage_combobox, :xpath, ".//select[@id='idea_stage']"
  element :bulkactionsfilter_button, :xpath, ".//*[@id='ideaBulkFilter']/a[span[text()='Filter']]"
  element :bulkactionsideas_container, :xpath, ".//*[@id='tableBody' or @id='usersBody']"
  element :bulkactionsaction_combobox, :xpath, ".//select[@id='assignIdeaId']"
  element :bulkactionsprocess_button, :xpath, ".//form[@id='bulkActionFormId']/a[span[text()='Process Ideas']]"
  # endregion

  # region Communities search
  element :keywords_field, :xpath, ".//*[@id='keywords']"
  element :savesearch_field, :xpath, ".//*[@id='searchname']"
  element :asdefault_checkbox, :xpath, ".//*[@id='asDefault']"
  element :savesearch_button, :xpath, ".//*[@value='Save Search']"
  element :savedsearchmessage_label, :xpath, ".//span[@id='saved_search_message']"
  element :search_button, :xpath, ".//*[contains(@onclick,'searchcommunityideas')]"
  element :searchcommunity_button, :xpath, ".//*[contains(@class,'button') and contains(@title,'Search')]"
  element :findideas_button, :xpath, ".//*[contains(@title,'Find ideas')]"
  element :deletesavedcommunitysearch_button, :xpath, ".//table[@id='filter_table']/tbody/tr[1]/td/img"
  # endregion

  # region Top Search
  element :topsearch_field, :xpath, ".//*[@id='query']"
  element :loop_button, :xpath, ".//*[@title='Search']"
  element :topsearchresults_container, :xpath, ".//*[@id='contents']"
  @@topsearchresults_container = '#contents'
  # endregion

  # region Administration setting
  element :showideastatstoall_checkbox, :xpath, ".//*[@type='checkbox'][contains(@id,'DisplayConfig.showIdeaStatsToAllUsers')]"
  element :submitidedisplay_button, :xpath, ".//*[@title='Submit']"
  # endregion

  ###Oops#
  element :returnHomePage_link, :xpath, ".//*/a[text()='Return to the home page.']"
  # endregion

  def getCurrentUser
    @@currentUser
  end

  def setCurrentUser(user)
    @@currentUser = user
  end

  def getCurrentIdea
    @@currentIdea
  end

  def setCurrentIdea(idea)
    @@currentIdea = idea
  end

  def getCurrentSite
    @@currentSite
  end

  def setCurrentSite(site)
    @@currentSite = site
  end

  def getIdeaTitle(idea)
    if !$devmod
      @@ideaTitles[idea]
    else
      return idea
    end
  end


  def addIdeaTitle(idea)
    if !$devmod
      suffix = (Time.now.to_f*1000).to_i.to_s
      ideaTitle = idea + ' ' + suffix
      @@ideaTitles[idea] = ideaTitle
    else
      return idea
    end
  end

  def addClosedIdeaTitle(idea_title, idea_id)
    @@closedIdeaTitles[idea_title] = idea_id
  end

  def getClosedIdeaTitle(idea_title)
    @@closedIdeaTitles[idea_title]
  end

  def addFoundIdeaTitle(idea_title)
    @@foundIdeaTitles[idea_title] = idea_title
  end

  def getFoundIdeaTitle(idea_title)
    @@foundIdeaTitles[idea_title]
  end

  def getFoundIdeaTitles
    return @@foundIdeaTitles
  end


  def clearFoundIdeaTitles
    @@closedIdeaTitles.clear
  end

  def getSingleQuotedIdeaTitle(idea)
    if !$devmod
      @@singlequotedIdeaTitles[idea]
    else
      return idea
    end
  end

  def addSingleQuotedIdeaTitle(idea)
    if !$devmod
      @@singlequotedIdeaTitles[idea] = idea
    else
      return idea
    end
  end

  def getSingleQuotedIdeas
    return @@singlequotedIdeaTitles
  end

  def getDoubleQuotedIdeaTitle(idea)
    if !$devmod
      @@doublequotedIdeaTitles[idea]
    else
      return idea
    end
  end

  def addDoubleQuotedIdeaTitle(idea)
    if !$devmod
      @@doublequotedIdeaTitles[idea] = idea
    else
      return idea
    end
  end

  def getDoubleQuotedIdeas
    return @@doublequotedIdeaTitles
  end

  def getCategoryTitle(category)
    if !$devmod
      @@categoryTitles[category]
    else
      return category
    end
  end

  def addCategoryTitle(category)
    if !$devmod
      categoryTitle = Forgery('lorem_ipsum').words(4, :random => true).capitalize
      @@categoryTitles[category] = categoryTitle
      return categoryTitle
    else
      return category
    end
  end

  def cleanPhaseDescriptionsArray
    @@phasedescriptions = Array.new
  end

  def cleanPhaseNamesArray
    @@phasenames = Array.new
  end

  def addPhaseDescription(desc)
    @@phasedescriptions.push(desc)
  end

  def addPhaseName(name)
    @@phasenames.push(name)
  end

  def getPhaseDescriptions
    return @@phasedescriptions
  end

  def getPhaseNames
    return @@phasenames
  end

  def cleanPhaseEndDatesArray
    @@phaseenddates = Array.new
  end

  def addPhaseEndDate(enddate)
    @@phaseenddates.push(enddate)
  end

  def getPhaseEndDate
    return @@phaseenddates
  end

  def cleanPhaseEndTimesArray
    @@phaseendtimes = Array.new
  end

  def addPhaseEndTime(endtime)
    @@phaseendtimes.push(endtime)
  end

  def getPhaseEndTime
    return @@phaseendtimes
  end

  def setPageUrl (url)
    self.class.set_url url
    page.driver.browser.manage.window.maximize
    self.load
  end

  def click_specific_link(link)
    sleep 1
    case link
      when 'Clear Search' then
        clearsearch_link.click
      when 'Return to the home page.' then
        returnHomePage_link.click
      when 'Email Type' then
        emailtype_combobox.click
      when 'Home' then
        home_link.click
      when 'Activity' then
        activity_link.click
      when 'Post Idea' then
        postidea_link.click
      when 'View Ideas' then
        viewideas_link.click
      when 'Pairwise Tab' then
        pairwisetab_link.click
        if has_pairwisestartvoting_link?
          pairwisestartvoting_link.click
        end
      when 'Manage Community' then
        managecommunity_link.click

      when 'Leaderboard' then
        leaderboard_link.click
      when 'Store' then
        store_link.click
      when 'Dashboard' then
        dashboard_link.click
      when 'Administration' then
        hoverMoreMainMenuTab
        administration_link.click
      when 'Challenges' then
        hoverMoreMainMenuTab
        challenges_link.click
      when 'SpigitLogo' then
        logo_link.click
      when 'Communities' then
        hoverMoreMainMenuTab
        communities_link.click
      when 'Communities Attributes'
        hoverMoreMainMenuTab
        communitiesattributes_link.click
      when 'Challenge Templates' then
        challengetemplates_link.click
      when 'Bulk Actions' then
        hoverMoreMainMenuTab
        bulkactions_link.click
      when 'Leaderboard editor' then
        leaderboardeditor_link.click
      when 'Innovation Market' then
        innomarket_link.click

      # region My Inbox
      when 'My Inbox' then
        myinbox_link.click
      when 'My Tasks' then
        inboxtasks_tab.click
      when 'My Notifications' then
        notifications_tab.click
      when 'My Messages' then
        messages_tab.click
      # endregion

      # region Users
      when 'Users' then
        users_link.click
      when 'Users Actions' then
        usersactions_tab.click
      when 'Users Actions Yes' then
        waitUntilElementIsVisible 'Users Actions Yes',4
        usersactionsconfirm_link.click
      when 'User Experience Management' then
        userexperience_link.click
      when 'Idea Management' then
        ideamanagement_link.click
      when 'Users Simple' then
        userssimple_tab.click
      # endregion

      # region Challenges
      when 'New Challenge' then
        new_challenge_link.click
      when 'Edit Challenge' then
        editchallenge_link.click
      when 'Save Template' then
        savetemplate_link.click
      when 'Select winners now' then
        selectwinnersnow_link.click
      when 'Confirm Selected Winners' then
        confirmwinnersyes_link.click
      # endregion

      when 'Forgot your user name?' then
        reset_user_link.click
      when 'Forgot your password?' then
        reset_password_link.click
      when 'Forgot your username?' then
        reset_username_link.click
      when 'Return to sign in' then
        returntosignin_link.click

      when 'Sign-Out' then
        signout_link.click
      when 'Register' then
        register_link.click

      when 'Security' then
        security_link.click
      when 'Legal' then
        legal_link.click

      ###Site Themes and Access Settings links###
      when 'Site Themes and Access Settings' then
        sitethemesandaccesssettings_link.click
      when 'Create Community' then
        create_community_option.click
      when 'My Username' then
        myprofile_link.click

      ###Post Category links###
      when 'Post New Category' then
        postcategory_link.click

      ###Idea Template Editor links###
      when 'Idea Template Editor' then
        ideatemplateeditor_link.click

      # region View Idea
      when 'Idea Edit' then
        editidea_link.click
      when 'Approve Comment' then
        approvependingcomments_link.click
      when 'Post a review' then
        postreviewtab_link.click
      when 'Evaluation'
        evaluation_tab.click
      when 'Move to First Stage' then
        movetofirststage_link.click
      when 'Move to Second Stage' then
        movetosecondstage_link.click
      when 'Move to Third Stage' then
        movetothirdstage_link.click
      when 'Move to Custom Stage' then
        movetocustomstage_link.click
      when 'Move to Stage' then
        movetostage_link.click
      when 'Idea Delete' then
        deleteidea_link.click
      when 'Close Idea' then
        closeidea_link.click
      when 'Post a Review' then
        within(:xpath, '//*[@id="tab3"]') do
          click_link('Post a review')
        end
      when 'Invite member' then
        teammember_link.click
      # endregion

      #region Site Editor links
      when 'Site Editor' then
        site_editor_link.click
        sleep 2
      when 'Site Editor Home' then
        siteeditorhome_link.click
      when 'CustomHome' then
        customHome.click
      when 'PostIdea' then
        postIdea.click
      when 'ViewIdeas' then
        viewIdeas.click
      when 'SiteEditorPairwise' then
        pairwise.click
      when 'Challenge' then
        challenge.click
      when 'Leaderboard Site' then
        leaderboard.click
      when 'StoreSite' then
        sleep 2
        storesite.click
        sleep 3
      when 'Dashboard Site' then
        dashboard.click
      when 'AdministrationPane' then
        administration_link.click
      when 'Invest' then
        invest.click
      when 'Widgets' then
        widgets.click
      when 'AllBlogs' then
        sleep 2
        allBlogs.click
        sleep 3
      when 'PostBlog' then
        postBlog.click
      when 'PostBlogComment' then
        postBlogComment.click
      when 'ViewBlog' then
        viewBlog.click
      when 'ViewBlogDrafts' then
        viewBlogDrafts.click
      when 'BlogSettings' then
        blogSettings.click
      when 'BlogModerate' then
        blogModerate.click
      when 'BlogSpam' then
        blogSpam.click
      when 'Analitycs' then
        analitycs.click
      when 'SiteHealth' then
        siteHealth.click
      when 'Reports' then
        reports.click
      when 'AdHocReports' then
        adHocReports.click
      when 'EditReport' then
        editReport.click
      when 'UserAdmin' then
        userAdmin.click
      when 'AddUser' then
        addUser.click
      when 'EditUser' then
        editUser.click
      when 'ModeratorAdmin' then
        moderatorAdmin.click
      when 'EmailUsers' then
        emailUsers.click
      when 'GraduationThersholds' then
        graduationThersholds.click
      when 'InviteUsers' then
        inviteUsers.click
      when 'EmailTemplates' then
        emailTemplates.click
      when 'ColorsAndLogo' then
        colorsAndLogo.click
      when 'Security Site' then
        security.click
      when 'DisplaySettings' then
        displaySettings.click
      when 'Names' then
        names.click
      when 'LegalPage' then
        legal.click
      when 'TagSearchResults' then
        tagSearchResults.click
      when 'Import' then
        import.click
      when 'UserProfile' then
        userProfile.click
      when 'Reset' then
        reset.click
      when 'MyActivities' then
        myActivities.click
      when 'MyConnections' then
        myConnections.click
      when 'IdeasByUser' then
        ideasByUser.click
      when 'BuddyEdit' then
        buddyEdit.click
      when 'PendingApprovals' then
        pendingApprovals.click
      when 'ManageResources' then
        manageResources.click
      when 'ViewIdeaVersion' then
        viewIdeaVersion.click
      when 'CloseIdea' then
        closeIdea.click
      when 'ReportAbuse' then
        reportAbuse.click
      when 'CommentEdit' then
        commentEdit.click
      when 'MoveIdea' then
        moveIdea.click
      when 'EditHome' then
        editHome.click
      when 'TellAFriend' then
        tellAFriend.click
      when 'PostCategory' then
        postCategory.click
      when 'SearchResults' then
        searchResults.click
      when 'MostActiveMarkets' then
        mostActiveMarkets.click
      when 'Store0' then
        store0.click
      when 'Auction' then
        auction.click
      when 'ViewIdeaLight' then
        viewIdeaLight.click
      when 'InnovationMarket' then
        innovationMarket.click
      when 'ItemNotAccessible' then
        itemNotAccessible.click
      when 'ViewAllTasks' then
        viewAllTasks.click
      when 'AddTask' then
        addTask.click
      when 'ViewEvluationScore' then
        viewEvluationScore.click
      when 'ViewEvaluationScoreDetails' then
        viewEvaluationScoreDetails.click
      when 'ApprovalTask' then
        approvalTask.click
      when 'IdeaList' then
        ideaList.click
      when 'EvaluationFormTemplate' then
        evaluationFormTemplate.click
      when 'TaskTemplateForm' then
        taskTemplateForm.click
      when 'MyTasks' then
        myTasks.click
      when 'EvaluationTask' then
        evaluationTask.click
      when 'TaskTemplates' then
        taskTemplates.click
      when 'EvaluationFileTemplate' then
        evaluationFileTemplate.click
      when 'EvaluationFile' then
        evaluationFile.click
      when 'PostTextTasks' then
        postTextTasks.click
      when 'TaskSummary' then
        taskSummary.click
      when 'ReviewTaskForm' then
        reviewTaskForm.click
      when 'ThemeEditor' then
        themeEditor.click
      when 'ThemeCssEditor' then
        themeCssEditor.click
      when 'ThemeImageEditor' then
        themeImageEditor.click
      when 'TaskScore' then
        taskScore.click
      when 'TaskTemplateScore' then
        taskTemplateScore.click
      when 'CloneIdea' then
        cloneIdea.click
      when 'RestoreConfiguration' then
        restoreConfiguration.click
      when 'MyTasksAll' then
        myTasksAll.click
      when 'IdeasBetting' then
        ideasBetting.click
      when 'PostChallenge' then
        postChallenge.click
      when 'CommunityAttributes' then
        communityAttributes.click
      when 'CreateCommunity' then
        createCommunity.click
      when 'CommunitySearch' then
        communitySearch.click
      when 'NewAuction' then
        newAuction.click
      when 'AuctionDeliveryInstructions' then
        auctionDeliveryInstructions.click
      when 'ManageBids' then
        manageBids.click
      when 'AuctionHistory' then
        auctionHistory.click
      when 'BidHistory' then
        bidHistory.click
      when 'NewJob' then
        newJob.click
      when 'ViewJobOffer' then
        viewJobOffer.click
      when 'ManageJobOffers' then
        manageJobOffers.click
      when 'WordsInTopics' then
        wordsInTopics.click
      when 'Unsubscribe' then
        unsubscribe.click
      when 'PostChallenge' then
        postChallenge.click
      when 'ViewChallenge' then
        viewChallenge.click
      when 'ChooseChallengeWinner' then
        chooseChallengeWinner.click
      when 'Visualization' then
        visualization.click
      when 'VersionInfo' then
        versionInfo.click
      when 'ViewSector' then
        viewSector.click
      when 'LayoutTest' then
        layoutTest.click
      when 'ViewIdeaFresh' then
        viewIdeaFresh.click
      when 'EmailExpertsFresh' then
        emailExpertsFresh.click
      when 'PostReviewFresh' then
        postReviewFresh.click
      when 'ScoresFresh' then
        scoresFresh.click
      when 'Bio' then
        bio.click
      when 'RecentActivity' then
        recentActivity.click
      when 'StockPortfolio' then
        stockPortfolio.click
      when 'My Profile' then
        sleep 7
        myprofile_link.click
      when 'MyProfile' then
        myProfile.click
        sleep 3
      when 'Comments' then
        comments.click
      when 'ViewIdea' then
        viewIdea.click
        sleep 2
      when 'PostReview' then
        postReview.click
      when 'ShareIdeas' then
        shareIdeas.click
      when 'PostSiteChallenge' then
        postSiteChallenge.click
      when 'MyTradeInvestments' then
        myTradeInvestments.click
      when 'LanguageImportExport' then
        languageImportExport.click
      when 'PairwiseAdminSettings' then
        pairwiseAdminSettings.click
      when 'MobilAppAdminSettings' then
        mobilAppAdminSettings.click
      when 'SiteChallengeTemplates' then
        siteChallengeTemplates.click
      when 'Metadata' then
        metadata_link.click
      when 'Content' then
        content_link.click
      when 'Back to Administration' then
        backtoadministration_link.click
      # endregion

      # region Email Templates
      when 'Email Templates Settings' then
        settingsemailtemplates_tab.click
      when 'Email Templates' then
        emailtemplates_link.click
      when 'Email Templates Users' then
        emailtemplatesusers_tab.click
      when 'Email Template Forgot Password Request' then
        forgotpasswordtitle_link.click
      when 'Email Template Forgot Username' then
        forgotusernametitle_link.click
      when 'Email Template Invitation to New Users to Sign Up' then
        invitationtonewusers_link.click
      # endregion

      # region Profile
      when 'Private Preferences' then
        privatepreferences_widget.click
      when 'My Subscriptions' then
        mysubscriptions_link.click
      when 'View Pending Approvals' then
        pendingapprovals_link.click
      when 'Manage Spam' then
        managespam_link.click
      when 'Moderate Posts' then
        moderateposts_link.click
      when 'Profile My Tasks' then
        profiletasks_tab.click
      # endregion

      ###Turn Off links#
      when 'Turn On/Off Features' then
        turnonofffeatures_link.click

      ###Idea Popup links###
      when 'Idea Popup Close' then
        ideapopupclose_link.click

      ###Idea Information Display links###
      when 'Idea Information Display' then
        ideainformation_link.click

      ###Moderators link###
      when 'Moderators' then
        moderators_link.click

      when 'Experts' then
        experts_link.click

      ###Evaluation templates
      when 'Evaluation Templates' then
        evaluationtemplates_link.click

      ### Graduation Thresholds ###
      when 'Graduation Thresholds' then
        waitUntilElementIsVisible('Graduation Thresholds', 5)
        graduation_thresholds_link.click

      when 'Back to' then
        if has_xpath?('//*[@id="headerWrap"]/div[1]')
          find('a', :text => /^Back to/, :match => :first).click
        else
          puts "Link doesn't exist."
        end

      ###Tasks###
      when 'Switch To Role Assignment' then
        switchtoroleassignment_link.click

      ###Roles links###
      when 'Roles' then
        roles_link.click

      ###Permissions links###
      when 'Permissions' then
        permissions_link.click

      ###Pairwise links###
      when 'Pairwise' then
        pairwise_link.click

      ###View Ideas links###
      when 'View Ideas Advanced Search' then
        searchideasadvanced_link.click

      # region Activity Stream
      when 'My Stuff' then
        activitymystuff_link.click
      when 'All' then
        activityall_link.click
      when 'Show Filters' then
        showfeedsfilters_link.click
      when 'Idea Statistics'  then
        ideastatistics_link.click
      when 'Activity Stream Reset' then
        activitystreamreset_link.click
        sleep 2
      # endregion

      ###Idea Popup
      when 'Activity on Idea Popup' then
        ideapopupactivity_tab.click
      when 'Statistics on Idea Popup' then
        ideapopupstatistics_tab.click
      when 'Comments on Idea Popup' then
        ideapopupcomments_tab.click

      ###Display Ideas in Other Communities links###
      when 'Display Ideas in Other Communities' then
        displayideasothercomm_link.click

      # region Task Links
      when 'Subscribe to Task' then
        subscribetotask_link.click
      when 'Unsubscribe to Task' then
        unsubscribetotask_link.click
      when 'Who Has Access?' then
        whohasaccessTask_link.click
      when 'Edit Task' then
        edittaskTask_link.click
      # endregion

      ###Communities tab links###
      when 'Advanced Filter' then
        advancedfilter_link.click
      else
        fail(ArgumentError.new("'#{link}' is not listed!"))
    end
  end

  def fill_value(field, value)
    case field
      #Nina's Search Engine
      when 'search' then
        search_bar.set value

      #AmexTravel Flight
      when 'departure' then
        dest_travel.set value.upcase
      when 'arrival' then
        arriv_travel.set value.upcase

      #Idea template editor
      when 'Text field - Label' then
        textfield_label.set value
      when 'Text field - Help Text' then
        textfield_helptext.set value

      # region Sign In
      when 'Username' then
        username_field_login.set value
      when 'Password' then
        password_field_login.set value
      when 'Forgot Username Email'
        forgotusernamemail_field.set value
      when 'Forgot Password Username' then
        username_reset.set value
      when 'Forgot Username' then
        password_reset.set value
      when 'Current Password*' then #fixIE.fa.20150218
        currentpassword_field.set value
      when 'New Password*' then
        newpassword_field.set value
      when 'Confirm New Password*' then
        confirmnewpassword_field.set value
      # endregion

      ###Legal###
      when 'Additional Terms' then
        fillInTinyMCE 'Additional Terms', value

      # region Activity Stream
      when 'Activity Stream Search' then
        activitystreamsearch_field.set value
      # endregion

      # region Users page
      when 'new Username' then
        username_field.set value
      when 'new Password' then
        password_field.set value
      when 'New Reset Password' then
        resetnewpassword.set value
      when 'Re-type Password' then
        repassword_field.set value
      when 'First Name' then
        firstname_field.set value
      when 'Last Name' then
        lastname_field.set value
      when 'Email' then
        email_field.set value
      when 'Search Users' then
        usersimplesearch_field.set value
      when 'Edit User Username' then
        edituserusername_field.set value
      # endregion

      # region User Experience Management page
      when 'User Registration Questions' then
        registrationquestions.set value
      when 'Number of Users Online' then
        nousersonline.set value
      when 'Uploads Limit (Members)' then
        uploadslimitmember.set value
      when 'Uploads Limit (Administrator)' then
        uploadslimitadmin.set value
      when 'Number of Ideas in Open Challenge' then
        noideasopenchallenge.set value
      # endregion

      # region Idea Management page
      when 'Trade Window' then
        tradewindow.set value
      when 'Truncated Idea Content Length' then
        truncatedidealength.set value
      when 'Idea Expiry Due Period' then
        ideaexpirydueperiod.set value
      when 'Idea Expiry Note' then
        ideaexpirynote.set value
      when 'Idea Submit Confirmation Message' then
        ideasubmitmessage.set value
      when 'Idea Summary Length' then
        ideasummarylength.set value
      when 'Show Idea ID' then
        showideaid_textfield.set value
      # endregion

      # region Challenges
      when 'Challenge Title' then
        challenge_title.set value
      when 'Challenge Description' then
        challenge_description.set value
      when 'Challenge First Phase' then
        waitUntilElementIsVisible('Challenge First Phase', 10)
        firstphasetitle_field.set value
      when 'Template Name' then
        challengetemplatename_field.set value
      when 'Template Description' then
        challengetemplatedescription_textarea.set value
      # endregion

      # region Security Page
      when 'Allow Login Attempts' then
        allowloginattempts_textfield.set value
      when 'Account Locked Duration' then
        accountlockedduration_textfield.set value
      when 'Lock Out Message' then
        lockoutmessage_textfield.set value
      when 'Password Expiration Frequency' then
        passwordexpirationfrequency_textfield.set value
      when 'Enter Password Again' then
        enterpasswordagain_textfield.set value
      # endregion

      # region Post Category page
      when 'Category Title' then
        categorytitle_field.set value
      when 'Category Summary' then
        categorysummary_field.set value
      when 'Category Tags' then
        categorytags_field.set value
      when 'Category Display Order' then
        categorydisplayorder_field.set value
      # endregion

      # region Email Template
      when 'Custom Email Type' then
        newemailtype_textfield.set value
      when 'Forgot Password Email Subject' then
        forgotpasswordsubject_field.set value
      when 'Forgot Username Email Subject' then
        forgotusernamesubject_field.set value
      when 'Invitation to New Users to Sign Up Subject' then
        invitationnewuserssubject_field.set value
      # endregion

      ### Turn On/Off Feature
      when 'Current Password' then
        currentpassword_textfield.set value
      when 'New Password' then
        newpassword_textfield.set value
      when 'Confirm New Password' then
        confirmnewpassword_textfield.set value

      ###Community Fields###
      when 'Preferred Community URL for Your Site' then
        community_URL.set value
      when 'Community Title' then
        community_title.set value

      ###Community Search Fields
      when 'Save Community Search As' then
        searchcommunity_field.set value

      ###DPA fields###
      when 'User Logout Redirect URI' then
        logoutredirecturl_field.set value

      when 'User Login URI' then
        loginurl_field.set value

      # region Post Idea page
      when 'Title' then
        postideatitle_textfield.set value
      when 'Description' then
        fillInTinyMCE 'Description', value
      when 'Tags' then
        fill_in 'autooption', :with => value
      # endregion

      ###Moderators fields###
      when 'New Moderator Username' then
        moderatorsusername_field.set value

      # region Evaluation Templates page
      when 'Evaluation Template Name' then
        templatename_field.set value
      when 'Evaluation Template Description' then
        templatedesc_field.set value
      when 'Evaluation Field Name' then
        evaluationfilename_field.set value
      when 'Evaluation Task Field Name' then
        evaluationTaskFilename_field.set value
      # endregion

      #region Graduation Thresholds page
      when 'Review Count' then
        reviewcount_field.set value
      when 'Default Review Count' then
        defaultreviewcount_field.set value
      when 'Form Count' then
        formcount_field.set value
      when 'File Count' then
        filecount_field.set value

      when 'Minimum Review Rating' then
        minimumreviewrating_field.set value
      when 'Due date period' then
        reviewduedate_field.set value
      when 'Evaluation Form Due date period' then
        evalformduedateperiod_field.set value
      when 'Evaluation File Due date period' then
        evalfileduedateperiod_field.set value
      when 'New Evaluation Form Due date period' then
        newevalformduedateperiod_field.set value
      when 'New Evaluation File Due date period' then
        newevalfileduedateperiod_field.set value
      when 'Approval Due date period' then
        approvalduedateperiod_field.set value
      when 'Evaluation Form Count' then
        evalformcount_field.set value
      when 'Evaluation File Count' then
        evalfilecount_field.set value
      when 'New Evaluation Form Count' then
        newevalformcount_field.set value
      when 'New Evaluation File Count' then
        newevalfilecount_field.set value
      when 'Approval Count' then
        approvalcount_field.set value
      #Community and analytical section
      when 'Age (in days)' then
        agethreshold_field.set value
      when 'Qualified Page Views' then
        qualifiedpageviewsthreshold_field.set value
      when 'Votes Threshold' then
        votesthreshold_field.set value
      when 'Number of Posts' then
        numberofpoststhreshold_field.set value
      when 'Conversation Level' then
        conversationlevelthreshold_field.set value
      when 'Buzz Percentile' then
        buzzpercentilethreshold_field.set value
      when 'Approval Rating' then
        approvalraatingthreshold_field.set value
      when 'Team Size' then
        teamsizethreshold_field.set value
      when 'Pairwise Ranking' then
        pairwiserankingthreshold_field.set value
      when 'Star Rating' then
        starratingthreshold_field.set value
      # endregion

      # region View Ideas
      when 'Custom Text Field' then
        customtextfield_field.set value
      when 'Custom Rich Text Editor' then
        customrichtexteditor_field.set value
      when 'Custom Radio Group' then
        customradiogroup_combobox.set value
      when 'View Ideas Search' then
        viewideassearch_field.set value
      when 'View Ideas Username' then
        viewideasusername_field.set value
      when 'View Ideas Idea ID' then
        viewideasideaid_field.set value
      when 'View Ideas Tags' then
        viewideastags_field.set value

      when 'View Ideas Description' then
        viewideasDescrip_field.set value
      # endregion

      # region Tasks
      when 'Assign To User' then
        assigntasktouser_field.set value
      when 'Task Name' then
        taskname_field.set value
      when 'Task Description' then
        taskdescription_field.set value
      when 'Post Text' then
        approvalposttext_field.set value
      # endregion

      ##Experts Fields##
      when 'New Expert Username' then
        expertsusername_field.set value

      #region Communities Search
      when 'Keywords' then
        keywords_field.set value
      when 'Save search community' then
        savesearch_field.set value

      #region Top Search
      when 'Top Search' then
        topsearch_field.set value
      #endregion

      ###Site Themes and Access Settings
      when 'Edit Community Title' then
        communitytitleeditor_field.set value
      #endregion

      ###Region Edit Profile
      when 'Add Nickname' then
        nickname_field.set value
      when 'User Phone' then
        phone_field.set value
      when 'User Mobile' then
        mobile_field.set value
      when 'User Website' then
        website_field.set value
      when 'Job Title' then
        jobtitle_field.set value
      when 'Company' then
        company_field.set value
      when 'Email' then
        email_field.set value
      when 'Fax' then
        fax_field.set value
      when 'Address1' then
        address1_field.set value
      when 'Address2' then
        address2_field.set value
      when 'City' then
        city_field.set value
      when 'State' then
        state_field.set value
      when 'Zip' then
        zip_field.set value
      when 'Country' then
        country_field.set value
      when 'IM' then
        im_field.set value
      when 'User First Name' then
        userfirstname_field.set value
      when 'User Last Name' then
        userlastname_field.set value
        #end region

      ###region Roles
      when 'Role Name' then
        rolename_textfield.set(value)

      when 'Role Description' then
        roledescription_textfield.set(value)

      ### region MyInbox
      when 'Recipients' then
        recipients_field.set(value)

      ### region Invite Team Members
      when'Invite Member Username' then
        invitememberuser_field.set(value)
      else
        puts "'#{field}' field doesn't exist."
    end
    sleep 1
  end

  def clickButton(button)
    case button
      #Nina Search Engine
      when 'search' then
        nina_search.click

        #AmexTravelFlight
      when 'round trip' then
        round_trip.click
      when 'one way' then
        one_way.click
      when 'multi city' then
        multi_city.click
      when 'departure date' then
        dep_date.click
      when 'departure time' then
        dep_time.click
      when 'return date' then
        ret_date.click
      when 'return time' then
        ret_time.click
      when 'nonstop flight' then
        nonstop.click
      when 'search flights' then
        search_flights.click

      when 'Change Password Submit' then
        submitchangepassword_button.click
      when 'Submit Terms and Conditions' then
        submitterms_button.click
        sleep 1
      # region Activity Stream
      when 'Activity Stream Search' then
        activitystreamsearch_button.click
      # endregion

      # region Users buttons
      when 'Add User' then
        adduser_button.click
      when 'Submit' then
        submit_button.click
      when 'Submit Reset Password' then
        submitresetpassword_button.click
        sleep 2
      when 'Users Simple Search' then
        userssimplesearch_button.click
      when 'Edit User Update' then
        edituserupdate_button.click
      when 'Users Actions Submit' then
        usersactionssubmit_button.click
      #endregion

      # region Create Community
      when 'Next A' then
        nextbutton_a.click
      when 'Next B' then
        nextbutton_b.click
      when 'Next C' then
        nextbutton_c.click
      when 'Continue' then
        continuebutton.click
      # endregion

      # region User Experience Management
      when 'User Experience Management Submit' then
        userexperiencesubmit_button.click
      when 'User Experience Management Restore' then
        userexperiencerestore_button.click
      # endregion

      # region Idea Management
      when 'Idea Management Submit' then
        ideamanagementsubmit_button.click
      when 'Idea Management Restore Defaults' then
        ideamanagementrestore_button.click
      when 'Idea Management Add New' then
        addstage_button.click
      # endregion

      #region Sign In
      when 'Sign In' then
        signin_button.click
        sleep 3
      when 'Edit Profile' then
        editprofile_button.click
      when 'Update Profile' then
        updateprofile_button.click
      #endregion

      # region Challenges
      when 'Close Edit Template popup' then  #fa.CHM063.20150324
        challengeCloseEditTemplatePopup_button.click
      when 'Save Edit Template popup' then
        challengeSaveEditTemplatePopup_button.click
      when 'X button Edit Template' then
        if $version >= 371
          challengeXEditTemplatePopup_button1.click
        else
          challengeXEditTemplatePopup_button.click
        end
      when 'Create Challenge' then
        challengecreate_button.click
        sleep 4
      when 'Edit Challenge Settings' then
        challengeeditsettings_button.click
      when 'New Challenge Settings Close' then
        challengesettingsdialogclose_button.click
      when 'Add Phase' then
        addphase_link.click
      when 'Update Challenge' then
        updatechallenge_button.click
      when 'Save Challenge Template' then
        savechallengetemplate_button.click
      when 'Challenge Previous Month' then
        challengepreviousmonth_button.click
      when 'Challenge Next Month' then
        challengenextmonth_button.click
      when 'Close Challenge Update Error Popup' then
        challengeerrorpopupclose_button.click
        sleep 2
      when 'Save Challenge Winners' then
        savewinners_button.click
      when 'Close Challenge Settings' then
        challengeSettingClose_button.click if has_challengeSettingClose_button?
      # endregion

      # region Security Page
      when 'Submit Security Settings' then
        submitsecuritysettings_button.click
      when 'Restore Default Security Settings' then
        restoredefaultsecuritysettings_button.click
      # endregion

      # region Legal Page
      when 'Submit Legal' then
        submitlegal_button.click
      # endregion

      #region Terms and Conditions
      when 'Submit Terms' then
        submitterms_button.click
      # endregion

      # region Site Themes and Access Settings
      when 'Site Themes and Access Settings Update' then
        communityaccesupdate_button.click
      when 'Update Attributes' then
        updateattributes_button.click
      # endregion

      # region Post Category
      when 'Category Save Draft' then
        categorysavedraft_button.click
      when 'Category Publish' then
        categorypublish_button.click
      # endregion

      ###Idea Template Editor buttons###
      when 'Save Template' then
        saveideatemplate_button.click

      # region Email Templates
      when 'Submit Subscriptions' then
        submitsubscriptions_button.click
      when 'Add New Email Type' then
        newemailtype_button.click
      when 'Submit New Email Type' then
        submitnewemailtype_button.click
      when 'Email Templates Submit' then
        emailtemplatessubmit_button.click
      when 'Email Templates Cancel' then
        emailtemplatescancel_button.click
      # endregion

      # region Email Users
      when 'Email Users Submit' then
        submitemailusers_button.click

      ###Users###
      when 'Update' then
        update_button.click

      ### DPA ###
      when 'DPA Update' then
        dpaupdate_button.click

      ### Turn On/Off Features ###
      when 'Submit Features Settings' then
        submitfeaturessettings_button.native.send_keys :control, :end
        submitfeaturessettings_button.click
        sleep 1
        submitfeaturessettings_button.click

      when 'Update Change Password' then
        updatechangepassword_button.click

      # region Post Idea
      when 'Post Idea Publish' then
        publishpostidea_button.click
      when 'OK' then
        closeAlertWindow(true)
      when 'Save Draft' then
        savedraftidea_button.click
      when 'Cancel' then
        cancelpostidea_button.click
      # endregion

      ###Idea Information Display###
      when 'Idea Information Display Submit' then
        ideainformationsubmit_button.click

      ###Moderators###
      when 'Moderators Submit' then
        moderatorssubmit_button.click

      # region Evaluation Templates
      when 'Review Form Add New' then
        addnewreviewform_button.click
      when 'Evaluation Template Save' then
        evaluationtemplatesave_button.click
      when 'Evaluation File Save' then
        submitevalfile_button.click
      when 'Upload File Task Submit' then
        submitevalfiletask_button.click
      when 'Review Form Edit' then
        reviewformedit_button.click
      when 'Evaluation Form Add New' then
        addnewevalform_button.click
      when 'Evaluation File Add New' then
        addnewevalfile_button.click
      # endregion

      # region Graduation Thresholds
      when 'Graduation Update' then
        graduationupdate_button.click
      when 'Review Add New' then
        reviewaddnew_button.click
      when 'Approval Add New' then
        approvaladdnew_button.click
      when 'Form Add New' then
        evaluationformaddnew_button.click
      when 'File Add New' then
        evaluationfileaddnew_button.click
      when 'Close Access Settings Popup' then
        accesssettingsclose_button.click
      # endregion

      # region View Idea
      when 'Post your Rating' then
        postreviewrating_button.click
      when 'Close Idea' then
        submitcloseidea_button.click
      when 'Add New Task' then
        addtask_button.click
      when 'Move To Stage Confirm' then
        movetostageconfirm_button.click
      when 'Move to Stage Cancel' then
        movetostagecancel_button.click
      when 'Invite member Cancel' then
        invitemembercancel_button.click
      when 'Post comment' then
        postcomment_reply_button.click
      when 'Post reply' then
        postcomment_reply_button.click
      # endregion

      # region View Ideas
      when 'View Ideas Search' then
        viewideassearch_button.click
        sleep 3
      # endregion

      # region Site Editor
      when 'Add Widget 2' then
        addwidget2_button.click
        sleep 3
      when 'Add Widget 1' then
        addwidget1_button.click
        sleep 3
      when 'Update Site Editor' then
        updatesiteeditor_button.click
        sleep 2
      # endregion

      ###Display Ideas in Other Communities###
      when 'Available Communities Submit' then
        availablecommunitiessubmit_button.click

      #region Task buttons
      when 'Update Task' then
        updatetask_button.click
      when 'Delete Task' then
        deletetask_button.click
      when 'Cancel Task' then
        canceltask_button.click
      when 'Add Task' then
        submittask_button.click
      when 'Change Task' then
        taskcompletedchange_button.click #for all task types
      when 'Change Review' then
        taskschangereview_button.click
      when 'Task Update' then #On the task form page
        taskupdate_button.click
      when 'Upload File' then
        uploadfiletask_button.click

      when 'Submit Task' then
        taskSubmit_button.click
      when 'Submit Task Review' then
        taskSubmitReview_button.click
      when 'Submit Approval Task' then
        approvalTaskSubmit_button.click
      when 'Submit Request Feedback Task' then
        reqFeedTaskSubmit_button.click
      #endregion

      #region Community Attributes
      when 'Add New Attribute' then
        addnewattribute_button.click
      when 'Save Attributes' then
        saveattributes_button.click
      when 'Search Communities By Attributes' then
        searchcommunitiesbyattributes_button.click
      when 'Save Community Search' then
        savecommunitysearch_button.click
      when 'Delete Community Search' then
        deletesavedcommunitysearch_button.click
      #endregion

      ###Communities search TC8.fa.20150121
      when 'Save Search' then
        savesearch_button.click
      when 'Search' then
        search_button.click
      when 'Search Community' then
        searchcommunity_button.click
      when 'Find Ideas' then
        findideas_button.click
      ###Experts
      when 'Experts Submit' then
        expertssubmit_button.click

      # region Bulk Actions
      when 'Bulk Actions Filter' then
        bulkactionsfilter_button.click
      when 'Bulk Actions Process' then
        bulkactionsprocess_button.click
      # endregion

      ##Administration settings
      when 'Submit Admin Settings' then
        submitidedisplay_button.click
      #endregion

      when 'loop' then
        loop_button.click

      ###region Roles
      when 'Role Submit' then
        rolesubmit_button.click

      #region MyInbox
      when 'New Message' then
        newmessage_button.click

      when 'New Message Cancel'
        cancelmessage_button.click

      when 'My Inbox Close'
        closepopup_icon.click

      else
        puts "'#{button}' button doesn't exist."
    end
  end

  def setCheckbox(field, value)
    case field
      ###Users fields###
      when 'Send Email' then
        sendemail_checkbox.set value
      when 'Lock User' then
        lockuser_checkbox.set value
        sleep 2

      ###Sign In fields###
      when 'Remember Username' then
        rememberusername_checkbox.set value

      # region Challenges
      when 'Set this challenge as the default template' then
        defaulttemplate_checkbox.set value
      when 'Automatically send email announcements to all challenge members' then
        challengessendemails_checkbox.set value
      # endregion

      ###User Experience Management fields###
      when 'Full Name Required' then
        fullnamerequired.set value
      when 'Can the user register with a different email address than the one the invite was sent to' then
        differentemailinvite.set value
      when 'Show User Profile of Non-Member' then
        shownonmemberprofile.set value
      when 'Show User email address' then
        showuseremail.set value
      when 'Display User Signatures' then
        displayusersignature.set value
      when 'Show User Net Worth' then
        showusernetworth.set value
      when 'Show Full Names of Users Instead of Username' then
        showuserfullname.set value
      when 'Show Privacy Preferences' then
        showprivacypreferences.set value
      when 'Show Upload Avatar' then
        showuploadavatar.set value
      when 'Show Biography' then
        showbiography.set value
      when 'Show User Stats' then
        showuserstats.set value
      when 'Show User Attributes On Profile' then
        showuserattributes.set value
      when 'Show User Nick Name For First Name' then
        showusernickname.set value
      when 'Enable Yammer Login' then
        enableyammerlogin.set value

      # region Idea Management
      when 'Hide Summary Field' then
        hidesummaryfield.set value
      when 'Build Team in Validation Stage Only' then
        buildteamvalstage.set value
      when 'Ideas Can Have Multiple Versions' then
        ideasmultipleversions.set value
      when 'Owner Can Delete Idea' then
        ownercandelete.set value
      when 'Experts Can Delete Ideas' then
        expertcandelete.set value
      when 'Enable Social Media Sharing' then
        enablesocialsharing.set value
      when 'Show Approval Rating' then
        showapprovalrating.set value
      when 'Show Idea Life Cycle Stage' then
        showidealifecycle.set value
      when 'Show Permalink' then
        showpermalink.set value
      when 'Show Similar Content' then
        showsimilarcontent.set value
      when 'Team Members Recruit' then
        teammemberrecruit.set value
      when 'Administrators Recruit' then
        administratorrecruit.set value
      when 'Allow Team Member Delete' then
        teammemberdelete.set value
      when 'Show Empty Idea Template Fields on View Idea Page' then
        showemptyideatemplate.set value
      when 'Keep HTML formatting in the Truncated Idea Content' then
        keephtmlformatting.set value
      when 'Show Similar Ideas From Aggregate Sites' then
        showsimilarideasagg.set value
      when 'Enable Idea Jobs' then
        enableideajobs.set value
      when 'Show Idea Coordinator Widget' then
        showideacoordinator.set value
      # endregion

      # region Security
      when 'Force HTTP Posts' then
        forcehttpposts_checkbox.set value
      when 'Disable External Redirects' then
        disableexternalredirects_checkbox.set value
      when 'Separate Mail for Username and Password on Add User' then
        separatemail_checkbox.set value
      when 'Reset Login Lock with Password' then
        resetloginlock_checkbox.set value
      when 'Password Expired on First Sign-In' then
        waitUntilElementIsVisible 'Password Expired on First Sign-In',4
        passwordexpired_checkbox.set value
      when 'Disable Embedded URL' then
        disableembeddedurl_checkbox.set value
      # endregion

      ### Legal fields
      when 'Show Additional Terms' then
        shoadditionalterms_checkbox.set value
      when 'Show Second Checkbox to Agree to Terms and Conditions' then
        showsecondcheckboxtoagreetotermsandconditions_checkbox.set value

      ##Terms and Conditions
      when 'Accept Terms' then
        acceptterms_checkbox.set value
      when 'Accept Second Terms' then
        acceptsecondterms_checkbox.set value
      when 'Users agree to additional terms only once across communities' then
        showaddtermacrosscomm_checkbox.set value

      ###Post Category fields###
      when 'Category Moderate Idea' then
        categorymoderateidea_checkbox.set value
      when 'Category Moderate Threads' then
        categorymoderatethreads_checkbox.set value
      when 'Category Subscribe' then
        categorysubscribe_checkbox.set value

      ### Site Editor ###
      when 'Top Level Tab' then
        topleveltab_checkbox.set value
      when 'Lock site' then
        locksite_checkbox.set value

      ###Email Template###
      when 'Account Activity' then
        accountactivity_checkbox.set value
      when 'Custom Type' then
        customtype_checkbox.set value
      when 'Unsubscribe All' then
        unsubscribeall_checkbox.set value

      # region DPA
      when 'Enable email login' then
        enableemaillogin_checkbox.set value
      when 'Review Ideas Enabled' then
        reviewideasenabled_checkbox.set value
      when 'List Aggregated Content From All Sites' then
        listaggregatedcontent_checkbox.set value
      when 'Communities Search in Aggregate Site' then
        communitysearchaggregate_checkbox.set value
      when 'Idea Expiry Enabled' then  #tc9.fa.20150127
        ideaExpiry_checkbox.set value
      when 'Idea trading enabled' then
        ideatradingenabled_checkbox.set value
      # endregion

      # region Turn On/Off Features
      when 'Show Change Password Settings' then
        showchangepasswordsettings_checkbox.set value
        showchangepasswordsettings_checkbox.set value
        sleep 1
      when 'Show Save Draft Button on Post Idea Page' then
        showsavedraftbutton_checkbox.set value
      when 'Show Cancel Button on Post Idea Page' then
        if $version <= 360 #fa.fix.20150407
          showcancelbutton_checkbox.set value
        end
      when 'Show Top Categories' then
        showtopcategories_checkbox.set value
        showtopcategories_checkbox.set value
        sleep 1
      # endregion

      # region Idea Information Display
      when 'Show Moderate Threads' then
        showmoderatethreads_checkbox.set value
      when 'Moderate Idea Threads' then
        moderateideathreads_checkbox.set value
      when 'Show Idea Subscription' then
        showideasubscription_checkbox.set value
      when 'Show Idea Stages' then
        showideastages_checkbox.set value
      when 'Idea expiration date' then  #as.tc9.fa.20150127
        ideaexpirationdate_checkbox.set value
      when 'Show Idea Rating' then #as.tc9.fa.20150127
        showidearating_checkbox.set value
      when 'Posted At' then #as.tc9.fa.20150128
        postedat_checkbox.set value
      when 'Discussion Forum Posts' then
        discussionforumposts_checkbox.set value
      when 'Reviews' then
        reviews_checkbox.set value
      when 'Views' then
        views_checkbox.set value
      when 'Approval Rating' then
        approvalrating_checkbox.set value
      when 'Team Members' then
        teammembers_checkbox.set value
      when 'Graduation Tasks' then
        graduationtasks_checkbox.set value
      when 'Idea Expiration Date stats' then
        ideaexpirationdatestats_checkbox.set value
      # endregion

      ### Post Idea ###
      when 'Confirmation Message' then
        confirmationmessage_checkbox.set value
      when 'Default New Idea Subscription' then
        defaultnewideasubscription_checkbox.set value
      when 'By following, you will receive notification email(s) for any modification under this idea.' then
        recievenotification_checkbox.set value
      when 'Required' then
        recievenotification_checkbox.set value

      ###Moderators fields###
      when 'Moderators Select All' then
        moderatorsselectall_checkbox.set value if has_moderatorsselectall_checkbox?
      when 'Evaluation Template General Review' then
        generalreview_checkbox.set value
      when 'Review Form Text' then
        showreviewformtext_checkbox.set value

      ###View Idea Page
      when 'Idea Closed Successful' then
        ideaimplementedyes_checkbox.set value
      when 'Idea Closed Abort' then
        ideaimplementedno_checkbox.set value
      ###View Ideas Page
      when 'Custom Advanced Search' #20150114.TC13.FA
        customcheckbox_field.set value
      ##Task Approval Section
      when 'Task Approved' then
        taskApproveRadio_checkbox.set value
      when 'Task Not Approved' then
        taskNotApproveRadio_checkbox.set value
      ##Task Review Section
      when 'No Selection Review' then
        taskreviewnoselection_checkbox.set value
      when 'Poor Review' then
        taskreviewpoor_checkbox.set value
      when 'Fair Review' then
        taskreviewfair_checkbox.set value
      when 'Good Review' then
        taskreviewgood_checkbox.set value
      when 'Great Review' then
        taskreviewgreat_checkbox.set value
      when 'oof the Charts Review' then
        taskreviewoffthecharts_checkbox.set value

      ###Communities Page
      when 'Default Search Community' then
        setdefaultsearchcommunity_checkbox.set value

      ##Communities search
      when 'Set as default' then #tc8.fa.20150121
        asdefault_checkbox.set value

      ##Admin Settings
      when 'Show Idea Stats to All Users' then #tc11.fa.20150123
        showideastatstoall_checkbox.set value
      ##Legal
      when 'Show Additional Terms' then #tc23.fa.20150129
        showadditionalterms_checkbox.set value
      ###Terms and conditions###
      when 'Agree above terms' then
        agreeterms_checkbox.set value
      else
        fail(ArgumentError.new("'#{field}' is not listed!"))
    end
  end

  def select_an_option(field, value)
    case field
      when 'Reputation Policy'
        select(value, :from => @@reputationoption_combobox)
      when 'Community Access'
        select(value, :from => @@communityaccess_combobox)

      ###Site Editor ###
      when 'Roles Allowed To View This Page (Unselect all roles for open access)' then
        select(value, :from => @@RolesAllowedToViewThisPage)

      ###Email Template###
      when 'Email Type'
        select(value, :from => 'emailType')

      # region Post Idea
      when 'Category'
        postideacategory_combobox.click
        within postideacategory_combobox do
          find(:xpath, ".//ul/li/a[@title='#{value}']").click
        end
      # endregion

      # region General Review
      when 'Select Review Form'
        first("select[name^='form']").find('option', :text => value).select_option
      when 'Roles' then
        first("select[name^='roles']").find('option', :text => value).select_option
      when 'Select Idea Stage' then
        find(:xpath, ".//*[@id='lcStageId']").find(:xpath, 'option[1]').select_option if value == 'First'
        find(:xpath, ".//*[@id='lcStageId']").find(:xpath, 'option[2]').select_option if value == 'Second'
        find(:xpath, ".//*[@id='lcStageId']").find(:xpath, 'option[3]').select_option if value == 'Third'
        find('#lcStageId').find(:xpath, 'option[4]').select_option if value == 'Custom'
        find('#lcStageId').find(:xpath, 'option[5]').select_option if value == 'Custom1'
      # endregion

      ###Tasks###
      when 'Submit Review' then
        select(value, :from => 'subReviewId')
      when 'Role' then
        select(value, :from => 'assignToRole')

      # region Challenges
      when 'Challenge Template' then
        sleep 1
        find(:xpath, @@challengetemplate_combobox).click
        sleep 1
        find(:xpath, @@challengetemplate_combobox + "/ul/li/a[@title='#{value}']").click
        sleep 1
      when 'Challenge Select Filter' then
        challengeselectfilter_combobox.click
        within challengeselectfilter_combobox do
          find(:xpath, ".//ul/li/a[@title='#{value}']").click
        end
        sleep 2
      when 'Challenge Status' then
        challengestatus_combobox.click
        within challengestatus_combobox do
          find(:xpath, ".//ul/li/a[@title='#{value}']").click
        end
      when 'Challenge End Time' then
        if $browser == 'FF'
          find(:xpath, ".//select[@name='enddate_hour']", :visible => false).find('option', :text => value).select_option # Should be removed when FF issue is fixed
        else
          challengeendtime_field.click
          within challengeendtime_field do
            find(:xpath, ".//ul/li/a[@title='#{value}']").click
          end
        end

      when 'Time Zone' then
        challengetimezone_dropdown.click
        within challengetimezone_dropdown do
          if value == 'random'
            no_tz = all(:xpath,".//ul/li/a").count
            find(:xpath,".//ul/li[#{rand(1..no_tz)}]/a").click
          else
            find(:xpath,".//ul/li/a[@title='#{value}']").click
          end
        end
      # endregion

      # region Activity Stream
      when 'Feed Type' then
        feedstype_combobox.click
        within feedstype_combobox do
          find(:xpath, ".//ul/li/a[@title='#{value}']").click
        end
      # endregion

      # region View Ideas
      when 'Drop Down' then
        customdropdown_combobox.click
        within customdropdown_combobox do
          optionXpath = ".//ul/li/a[@title='" + value + "']"
          find(:xpath, optionXpath).click
        end
      when 'Radio Group' then
        customradiogroup_combobox.click
        within customradiogroup_combobox do
          find(:xpath, ".//ul/li/a[@title='#{value}']").click
        end
      when 'Active Stages' then
        activestages_combobox.click
        find(:xpath,".//li[@class='filter-item idea_stage']/a/ul/li[2]/a").click if value == 'first' #incubation
        find(:xpath,".//li[@class='filter-item idea_stage']/a/ul/li[3]/a").click if value == 'second' #validation
        find(:xpath,".//li[@class='filter-item idea_stage']/a/ul/li[4]/a").click if value == 'third' #emergence
        find(:xpath,".//li[@class='filter-item idea_stage']/a/ul/li/a[contains(text(),'All')]").click if value == 'All' #VI012.fa.20150415
      when 'Categories' then
        allcategories_combobox.click
        if value!='All Categories' then
          find(:xpath,".//li[@class='filter-item categoryTree']/a/ul/li/a[contains(@title, '#{ getCategoryTitle(value) }')]").click
        else
          find(:xpath,".//li[@class='filter-item categoryTree']/a/ul/li/a[contains(@title, '#{value}')]").click
        end

      when 'View Ideas Lifecycle Stage' then
        viewideasstage_combobox.find('option', :text => 'Active Stages').unselect_option
        case value
          when 'First' then
            viewideasstage_combobox.find(:xpath, 'option[2]').select_option
          when 'Second' then
            viewideasstage_combobox.find(:xpath, 'option[3]').select_option
          when 'Third' then
            viewideasstage_combobox.find(:xpath, 'option[4]').select_option
          when 'Custom' then
            viewideasstage_combobox.find(:xpath, 'option[5]').select_option
          when 'Custom1' then
            viewideasstage_combobox.find(:xpath, 'option[6]').select_option
          else puts "'#{value}' value doesn't exist!"
        end
      # endregion

      # region View Idea
      when 'Move to Stage' then
        noStage = 0
        case value
          when 'First' then noStage = 1
          when 'Second' then noStage = 2
          when 'Third' then noStage = 3
          when 'Custom' then noStage = 4
          when 'Custom1' then noStage = 5
          else puts "'#{value}' stage doesn't exist!"
        end
        movetostage_combobox.click
        within movetostage_combobox do
          find(:xpath, ".//ul/li[#{noStage}]/a").click
        end

      when 'View Idea Page Stage' then
        noStage = 0
        case value
          when 'First' then noStage = 1
          when 'Second' then noStage = 2
          when 'Third' then noStage = 3
          when 'Custom' then noStage = 4
          when 'Custom1' then noStage = 5
          else puts "'#{value}' stage doesn't exist!"
        end
        stageselector_combobox.click
        within stageselector_combobox do
          find(:xpath, ".//ul/li[#{noStage}]/a").click
        end
      # endregion

      # region Bulk Actions
      when 'Bulk Actions Idea Stages' then
        case value
          when 'First' then
            bulkactionsideastage_combobox.find(:xpath, 'option[2]').select_option
          when 'Second' then
            bulkactionsideastage_combobox.find(:xpath, 'option[3]').select_option
          when 'Third' then
            bulkactionsideastage_combobox.find(:xpath, 'option[4]').select_option
          when 'Custom' then
            bulkactionsideastage_combobox.find(:xpath, 'option[5]').select_option
          when 'Custom1' then
            bulkactionsideastage_combobox.find(:xpath, 'option[6]').select_option
          else puts "'#{value}' value doesn't exist!"
        end
      when 'Select Bulk Process Action' then
        case value
          when 'Move to stage First' then
            bulkactionsaction_combobox.find(:xpath, 'option[2]').select_option
          when 'Move to stage Second' then
            bulkactionsaction_combobox.find(:xpath, 'option[3]').select_option
          when 'Move to stage Third' then
            bulkactionsaction_combobox.find(:xpath, 'option[4]').select_option
          when 'Move to stage Custom' then
            bulkactionsaction_combobox.find(:xpath, 'option[5]').select_option
          when 'Move to stage Custom1' then
            bulkactionsaction_combobox.find(:xpath, 'option[6]').select_option
          else
            bulkactionsaction_combobox.('option', :text => "#{value}").select_option
        end
      # endregion

      else
        puts "'#{value}' option doesn't exist."
    end
    sleep 5
  end

  def verifyElementExists(element)
    case element
      when 'Agree above terms'
        return has_agreeterms_checkbox?
      when 'Submit Terms and Conditions'
        return has_submitterms_button?

      when 'Control Panel' then
        return has_viewideacontrolpanel_header?

      when 'Stage Progress Bar' then
        fail(ArgumentError.new('NO STAGE PROGRESSBAR IS DISPLAYED!')) if has_no_stage_progressbar?

      when 'User has been created' then
        fail(ArgumentError.new('NO USER WAS CREATED!')) if has_no_usercreated_text?

      when 'Reset Password' then
        fail(ArgumentError.new("The '#{element}' title is not displayed!")) unless has_xpath?(@@resetpassword_text, :text => element)
      when 'Please enter your email address to continue.' then
        return has_xpath?(@@pleaseenteryouremailaddresstocontinue, :text => element)
      when 'The username or password you entered is incorrect.'
        within signinerrormessage_container do
          fail(ArgumentError.new("NO '#{element}' MESSAGE WAS DISPLAYED!")) unless has_text?(element)
        end
      when 'Forgot Username' then
        fail(ArgumentError.new('THE FORGOT USERNAME PAGE IS NOT DISPLAYED!')) if has_no_forgotusername_text?
      when 'Sign in with other accounts?' then
        fail(ArgumentError.new('THE SIGN IN WITH 3RD PARTY ACCOUNT IS NOT DISPLAYED!')) if has_no_signinthirdparty_text?
      when 'The username you entered is not valid. Please try again.'
        if has_no_usernamenotvalid_label? and has_no_usernameinvalidcharacter_label?
          fail(ArgumentError.new('NO INVALID USERNAME MESSAGE IS DISPLAYED!'))
        end
      when 'Forgot Password', 'Please enter your username to reset your password.'
        within resetpassword_container do
          fail(ArgumentError.new("NO '#{element}' IS DISPLAYED!")) unless has_text?(element)
        end
      when 'Forgot Password Username' then
        return has_username_reset?
      when 'Request Sent!','Please follow the instructions in your email to continue.' then
        within loginrequest_container do
          fail(ArgumentError.new("NO '#{element}' MESSAGE IS DISPLAYED!")) unless has_text?(element)
        end
      when 'Follow Instructions on Email'
        fail(ArgumentError.new('NO FOLLOW INSTRUCTIONS ON EMAIL SENT MESSAGE IS DISPLAYED!')) if has_no_followinstructionsonemail_label?
      when 'Update Profile Success' then
        fail(ArgumentError.new('NO UPDATE PROFILE SUCCESS MESSAGE WAS DISPLAYED')) if has_no_updateprofilesuccess_label?
      when 'Draft Saved' then
        fail(ArgumentError.new('THE DRAFT SAVED MESSAGE IS NOT DISPLAYED')) if has_no_categorydraftsaved_text?
      when 'Subscription Success Message' then
        fail(ArgumentError.new('THE SUBSCRIPTION SUCCESS MESSAGE WAS NOT DISPLAYED')) if has_no_subscriptionsuccessmessage_label?

      when 'Account Locked' then
        fail(ArgumentError.new('THE ACCOUNT LOCKED MESSAGE IS NOT DISPLAYED!')) if has_no_userlocked_text?
      when 'Incorrect current password' then
        fail(ArgumentError.new('THE ACCOUNT LOCKED MESSAGE IS NOT DISPLAYED!')) if has_no_userlocked_text?
      when 'The draft has been saved. You can access your draft Idea from your profile page.' then
        fail(ArgumentError.new('THE DRAFT HAS BEEN SAVED MESSAGE WAS NOT DISPLAYED!')) if has_no_draftideawassaved_text?
      when 'Inappropriate content has been used and is being reviewed by the Site Administrator' then
        fail(ArgumentError.new('THE INAPPROPRIATE CONTENT HAS BEEN USED MESSAGE WAS NOT DISPLAYED!')) if has_no_inappropriatecontentused_text?
      when 'General Review' then
        fail(ArgumentError.new('THE GENERAL REVIEW IS NOT DISPLAYED!')) if has_no_generalreview_link?
      when 'Idea Stage' then
        fail(ArgumentError.new('THE GENERAL REVIEW IS NOT DISPLAYED!')) if has_no_idea_stage?

      # region Challenges
      when 'Challenge Ready' then
        return has_challengesummarypopup_container?
      when 'Edit Template' then
        return has_challengeEditTitleEditPopup_label?
      when 'Time Zone*' then
        return has_challengetimezone_dropdown?
      when 'Template' then
        has_challengetemplateselector_combobox?
      when 'New Challenge' then
        return has_new_challenge_link?
      when 'Challenge End Date' then
        return has_challengeenddate_field?
      when 'Challenge End Time' then
        return has_challengeendtime_field?
      when 'Start Date' then
        return has_challengestartdate_input?
      when 'Start Time' then
        return has_challengestarttime_field?
      when 'Challenge Closed Message' then
        fail(ArgumentError.new('NO CHALLENGE CLOSED MESSAGES IS DISPLAYED.')) if has_no_challengecloseddate_label?
      when 'Communities' then
        return has_challengefilter_dropdown?
      when 'Challenges' then
        return has_challengeselectfilter_combobox?
      when 'Challenge Status filter' then
        return has_challengeStatusFilter_dropdown?
      when 'Challenges Billboard' then
        fail(ArgumentError.new('CHALLENGES BILLBOARD IS NOT DISPLAYED!')) if has_no_challengesbillboard_container?
      when 'Time line' then
        return has_challenge_timeline?
      when 'Challenge Template Description','Challenge Template Description Label' then
        return has_challengetemplatedescription_label?
      when 'Challenge Status' then
        return has_challengestatus_combobox?
      when 'Add Phase' then
        return has_addphase_link?
      when 'Edit Challenge' then
        return has_challengeeditsettings_button?
      # endregion

      ###Graduation Thresholds
      # Community and analytical section
      when 'Age (in days)' then
        fail(ArgumentError.new('NO AGE FIELD IS DISPLAYED.')) if has_no_agethreshold_field?
      when 'Qualified Page Views' then
        fail(ArgumentError.new('NO QUALIFIED PAGE VIEWS FIELD IS DISPLAYED.')) if has_no_qualifiedpageviewsthreshold_field?
      when 'Votes Threshold' then
        fail(ArgumentError.new('NO VOTES FIELD IS DISPLAYED.')) if has_no_votesthreshold_field?
      when 'Number of Posts' then
        fail(ArgumentError.new('NO NUMBER OF POSTS FIELD IS DISPLAYED.')) if has_no_numberofpoststhreshold_field?
      when 'Conversation Level' then
        fail(ArgumentError.new('NO CONVERSATIONAL LEVEL FIELD IS DISPLAYED.')) if has_no_conversationlevelthreshold_field?
      when 'Buzz Percentile' then
        fail(ArgumentError.new('NO BUZZ PERCENTILE FIELD IS DISPLAYED.')) if has_no_buzzpercentilethreshold_field?
      when 'Approval Rating' then
        fail(ArgumentError.new('NO APPROVAL RATING FIELD IS DISPLAYED.')) if has_no_approvalraatingthreshold_field?
      when 'Team Size' then
        fail(ArgumentError.new('NO TEAM SIZE FIELD IS DISPLAYED.')) if has_no_teamsizethreshold_field?
      when 'Pairwise Ranking' then
        fail(ArgumentError.new('NO PAIRWISE RANKING FIELD IS DISPLAYED.')) if has_no_pairwiserankingthreshold_field?
      when 'Star Rating' then
        fail(ArgumentError.new('NO STAR RATING FIELD IS DISPLAYED.')) if has_no_starratingthreshold_field?
      # Review section
      when 'Delete Review' then
        fail(ArgumentError.new('NO DELETE REVIEW CHECKBOX IS DISPLAYED.')) if has_no_defaultdeletereview_checkbox?
      when 'Review Count' then
        fail(ArgumentError.new('NO REVIEW COUNT FIELD IS DISPLAYED.')) if has_no_defaultreviewcount_field?
      when 'Minimum Review Rating' then
        fail(ArgumentError.new('NO MIN REVIEW RATING FIELD IS DISPLAYED.')) if has_no_defaultminreviewrating_field?
      when 'Due Date Period' then
        fail(ArgumentError.new('NO DUE DATE PERIOD FIELD IS DISPLAYED.')) if has_no_defaultduedateperiod_field?
      when 'Delay Email Notification' then
        fail(ArgumentError.new('NO DELAY EMAIL NOTIFICATION FIELD IS DISPLAYED.')) if has_no_defaultdelayemailnotification_checkbox?
      when 'Select Review Form' then
        fail(ArgumentError.new('NO REVIEW FORM SELECTOR IS DISPLAYED.')) if has_no_defaultselectreviewform_combobox?
      when 'Review Roles' then
        fail(ArgumentError.new('NO REVIEW ROLES SELECTOR IS DISPLAYED.')) if has_no_defaultreviewroles_combobox?
      when 'Access to Reviews' then
        fail(ArgumentError.new('NO ACCESS LINK IS DISPLAYED.')) if has_no_defaultaccess_link?
      when 'Add New Review' then
        fail(ArgumentError.new('NO ADD NEW REVIEW BUTTON IS DISPLAYED.')) if has_no_reviewaddnew_button?
      #Evaluation Form section
      when 'Evaluation Form Section' then
        fail(ArgumentError.new('EVALUATION FORM SECTION IS NOT DISPLAYED.')) if has_no_evaluationform_fieldset?
      when 'Delete Evaluation Form' then
        fail(ArgumentError.new('NO DELETE EVALUATION FORM CHECKBOX IS DISPLAYED.')) if has_no_evalformdelete_checkbox?
      when 'Evaluation Form Count' then
        fail(ArgumentError.new('NO EVALUATION FORM COUNT FIELD IS DISPLAYED.')) if has_no_evalformcount_field?
      when 'Evaluation Form Due Date Period' then
        fail(ArgumentError.new('NO DUE DATE PERIOD FIELD IS DISPLAYED.')) if has_no_evalformduedateperiod_field?
      when 'Evaluation Form Delay Email Notification' then
        fail(ArgumentError.new('NO DELAY EMAIL NOTIFICATION FIELD IS DISPLAYED.')) if has_no_evalformdelayemailnotification_checkbox?
      when 'Select Evaluation Form' then
        fail(ArgumentError.new('NO EVALUATION FORM SELECTOR IS DISPLAYED.')) if has_no_evalformselect_combobox?
      when 'Evaluation Form Roles' then
        fail(ArgumentError.new('NO EVALUATION FORM ROLES SELECTOR IS DISPLAYED.')) if has_no_evalformroles_combobox?
      when 'Access to Evaluation Form' then
        fail(ArgumentError.new('NO ACCESS LINK IS DISPLAYED.')) if has_no_evalformaccess_link?
      when 'Add New Evaluation Form' then
        fail(ArgumentError.new('NO ADD NEW EVALUATION FORM BUTTON IS DISPLAYED.')) if has_no_evalformaddnew_button?
      # Evaluation File section
      when 'Evaluation File Section' then
        fail(ArgumentError.new('EVALUATION FILE SECTION IS NOT DISPLAYED.')) if has_no_evaluationfile_fieldset?
      when 'Delete Evaluation File' then
        fail(ArgumentError.new('NO DELETE EVALUATION FILE CHECKBOX IS DISPLAYED.')) if has_no_evalfiledelete_checkbox?
      when 'Evaluation File Count' then
        fail(ArgumentError.new('NO EVALUATION FILE COUNT FIELD IS DISPLAYED.')) if has_no_evalfilecount_field?
      when 'Evaluation File Due Date Period' then
        fail(ArgumentError.new('NO DUE DATE PERIOD FIELD IS DISPLAYED.')) if has_no_evalfileduedateperiod_field?
      when 'Evaluation File Delay Email Notification' then
        fail(ArgumentError.new('NO DELAY EMAIL NOTIFICATION FIELD IS DISPLAYED.')) if has_no_evalfiledelayemailnotification_checkbox?
      when 'Select Evaluation File' then
        fail(ArgumentError.new('NO EVALUATION FILE SELECTOR IS DISPLAYED.')) if has_no_evalfileselect_combobox?
      when 'Evaluation File Roles' then
        fail(ArgumentError.new('NO EVALUATION FILE ROLES SELECTOR IS DISPLAYED.')) if has_no_evalfileroles_combobox?
      when 'Access to Evaluation File' then
        fail(ArgumentError.new('NO ACCESS LINK IS DISPLAYED.')) if has_no_evalfileaccess_link?
      when 'Add New Evaluation File' then
        fail(ArgumentError.new('NO ADD NEW EVALUATION FILE BUTTON IS DISPLAYED.')) if has_no_evalfileaddnew_button?
      # Approval section
      when 'Approval Section' then
        fail(ArgumentError.new('APPROVAL SECTION IS NOT DISPLAYED.')) if has_no_approval_fieldset?
      when 'Delete Approval' then
        fail(ArgumentError.new('NO DELETE APPROVAL CHECKBOX IS DISPLAYED.')) if has_no_approvaldelete_checkbox?
      when 'Approval Count' then
        fail(ArgumentError.new('NO APPROVAL COUNT FIELD IS DISPLAYED.')) if has_no_approvalcount_field?
      when 'Approval Due Date Period' then
        fail(ArgumentError.new('NO DUE DATE PERIOD FIELD IS DISPLAYED.')) if has_no_approvalduedateperiod_field?
      when 'Approval Delay Email Notification' then
        fail(ArgumentError.new('NO DELAY EMAIL NOTIFICATION FIELD IS DISPLAYED.')) if has_no_approvaldelayemailnotification_checkbox?
      when 'Approval Roles' then
        fail(ArgumentError.new('NO APPROVAL ROLES SELECTOR IS DISPLAYED.')) if has_no_approvalroles_combobox?
      when 'Add New Approval' then
        fail(ArgumentError.new('NO ADD NEW APPROVAL BUTTON IS DISPLAYED.')) if has_no_approvaladdnew_button?
      when 'All settings applied' then
        fail(ArgumentError.new('SETTINGS APPLIED MESSAGE WAS NOT DISPLAYED.')) if has_no_settingsappliedmessage_popup?
      when 'Delete idea' then
        return has_deleteidea_link?

      ###Change Password#
      when 'Change Password title' then
        fail(ArgumentError.new('CHANGE PASSWORD WAS NOT DISPLAYED.')) if has_no_changepassword_label?
      when 'Current Password*' then
        fail(ArgumentError.new('CURRENT PASSWORD FIELD WAS NOT DISPLAYED.')) if has_no_currentpassword_field?
      when 'New Password*' then
        fail(ArgumentError.new('NEW PASSWORD FIELD WAS NOT DISPLAYED.')) if has_no_newpassword_field?
      when 'Confirm New Password*' then
        fail(ArgumentError.new('CONFIRM PASSWORD FIELD WAS NOT DISPLAYED.')) if has_no_confirmnewpassword_field?
      when 'Change Password Submit' then
        fail(ArgumentError.new('SUBMIT CHANGE WAS NOT DISPLAYED.')) if has_no_submitchangepassword_button?

      ###Terms and Conditions ###
      when 'Terms and Conditions text' then
        fail(ArgumentError.new('SUBMIT CHANGE WAS NOT DISPLAYED.')) if has_no_submitchangepassword_button?
      when 'Agree terms checkbox' then
        fail(ArgumentError.new('AGREE TERMS CHECKBOX WAS NOT DISPLAYED.')) if has_no_acceptterms_checkbox?
      when 'Submit Terms' then
        fail(ArgumentError.new('SUBMIT TERMS BUTTON WAS NOT DISPLAYED.')) if has_no_submitterms_button?
      when 'Too many attempts have been made. The account has been locked.'
        fail(ArgumentError.new('TOO MANY ATTEMPTS MESSAGE WAS NOT DISPLAYED.')) if has_no_toomanyattempts_text?

      ###Security
      when 'Separate mail for Username and Password on Add User' then
        return has_separatemail_checkbox?

      ###Site Editor
      when 'Site Editor - Challenge' then
        return has_challenge?
      when 'Site Editor - PostChallenge' then
        return has_postChallenge?
      when 'Site Editor - ViewChallenge' then
        return has_viewChallenge?
      else
        fail(ArgumentError.new("'#{element}' element doesn't exist!"))
    end
  end

  def verifyItemExistInDropdown(dropdown, item)
    case dropdown
      when 'Idea Stage' then
        movetostage_combobox.click
        within movetostage_combobox do
          has_no_xpath?("//select[@class='MoveIdeaStageDropdownMenu']/option[text()='#{item}']")
        end
      when 'Sorting dropdown' then #fa.VI029.20150421
        idea_sort_combobox.click
        within idea_sort_combobox do
          has_xpath? (".//*[@id='ideas-result']//li[@class='filter-item idea_sort']/a/select/option[contains(text(),'#{item}')]")
        end
      else
       fail(ArgumentError.new("'#{dropdown}' is not listed!"))
    end
  end

  def verifyElementExistsWithText(element, text)
    case element
      ### region MyProfile
      when 'My Profile Email' then #fa.AS018
        return has_xpath?(".//*[@id='profile-vcard']//span[text()='#{text}']")
      when 'Post comment user autosuggest'
        return has_xpath?(".//ul[@class='auto-list']/li[contains(text(),'#{text}')]")

      when 'Post reply user autosuggest'
        return has_xpath?(".//ul[@class='auto-list']/li[contains(text(),'#{text}')]")

      ### region Invite Team Members
      when 'Invite username autosuggest' then
        return has_xpath?(".//ul/li[@class='ui-menu-item']/a[contains(text(),'#{text}')]")

      when 'Idea results counter' then
        resultCount = has_xpath?(".//*[@id='saved_message']//span[text()='#{text}']")
        resultMessage = has_labelcounter_text?
        return resultCount || resultMessage

      when 'Idea stage' then
        case text
          when 'First'
            return has_no_xpath?(".//*[@id='view_all_tasks_fresh']//option[@selected][0]")
          when 'Second'
            return has_no_xpath?(".//*[@id='view_all_tasks_fresh']//option[@selected][1]")
          when 'Third'
            return has_no_xpath?(".//*[@id='view_all_tasks_fresh']//option[@selected][2]")
          when 'Custom'
            return has_no_xpath?(".//*[@id='view_all_tasks_fresh']//option[@selected][3]")
        end
      when 'Idea current stage' then
        case text
          when 'First'
            return has_xpath?(".//*[@id='view_all_tasks_fresh']//option[@selected][1]") #incubation is selected in dropdown
          when 'Second'
            return has_xpath?(".//*[@id='view_all_tasks_fresh']//option[@selected][2]")
          when 'Third'
            return has_xpath?(".//*[@id='view_all_tasks_fresh']//option[@selected][3]")
          when 'Custom'
            return has_xpath?(".//*[@id='view_all_tasks_fresh']//option[@selected][4]")
        end
      when 'Template Name' then #fa.CHM063.20150324
        return challengetemplatename_field.value==text

      when 'Template Description' then
        return challengetemplatedescription_textarea.value==text

      when 'Counter Template Name' then
        return has_xpath? (".//span[@class='counter'][text()='#{text}/140']")

      when 'Counter Template Description' then
        return has_xpath? (".//span[@class='counter'][text()='#{text}/1000']")

      when 'Challenge Description' then
        return challenge_description.text.should == text
      when 'Post Idea Confirmation Checkbox' then
        return has_xpath?(".//label[@for='continue'][input[@type='checkbox']][text()[contains(.,'#{text}')]]")

      when 'Idea Template Editor Confirmation Checkbox' then
        return has_xpath?(".//*[@id='continue']/following-sibling::label[contains(text(),'#{text}')]")

      when 'Roles > Role' then
        return has_xpath?(".//form//span[@id='roleName'][contains(text(),'#{text}')]")

      when 'Edit User > Role' then
        return has_xpath?(".//span[@class='roleName'][text()='#{text}:']")

      when 'Pairwise Settings > Role' then
        if $version >= 360
          return has_xpath?(".//div[h3[contains(text(),'Pairwise Access')]]//li[contains(.,'#{text}')]")
        else
          return has_xpath?(".//div[h3[contains(text(),'Pairwise Access')]]//span[text()='#{text}']")
        end

      when 'View Permissions' then
        return has_xpath?(".//div[label[contains(text(),'View Permissions')]]/select/option[contains(text(),'#{text}')]")

      when 'Post Permissions' then
        return has_xpath?(".//div[label[contains(text(),'Post Permissions')]]/select/option[contains(text(),'#{text}')]")

      when 'Roles Allowed To View This Page' then
        return has_xpath?(".//select/option[text()='#{text}']")

      when 'Roles Allowed To View This Content' then
        return has_xpath?(".//select[@id='roles0']/option[text()='#{text}']")

      when 'Advanced Search Role' then
        return has_xpath?(".//*[@id='role']/option[contains(text(),'#{text}')]")

      when 'Template' then
        if all(:xpath, @@challengetemplate_combobox+"/ul/li/a").count == 0
          find(:xpath, @@challengetemplate_combobox).click
        end
        sleep 1
        has_xpath?(@@challengetemplate_combobox + "/ul/li/a[@title='#{text}']")

      when 'Challenge Templates List' then
        has_xpath?(".//ul[li/div[text()='#{text}']]/li/div/span/a[@class='removeChallenge']")

      when 'Winners Banner' then
        return has_xpath?(".//div[@class='winner-info']/a[contains(text(),'#{text}')]")

      when 'Graduation Tasks' then
        return has_xpath?(".//div[@class=\"sub-widgets idea-tasks\"]/ul/li/span[contains(text(),\"#{text}\")and not(contains(text(),\"Minimum\"))]")

      when 'Current Stage' then
        return ideastatsprogress_label.text.include? text

      when 'Community And Analytical Tasks' then
        return (!(has_no_analyticaltasks_fieldset?))

      when 'Access Settings Popup' then
        return has_xpath?(".//*[@id='graduation-settings']/div[contains(@style,'display: block;') and contains(@aria-labelledby,'graduationTaskAccessDialog')]//descendant::h2[contains(text(),'#{text}')]")

      when 'Review Selector' then
        return has_xpath?(".//tr[@class='showRow']/td/select[contains(@name,'form')]")

      when 'Evaluation Form Selector' then
        return has_xpath?(".//fieldset[legend[text()='Evaluation Form']]//descendant::tr/td/select[contains(@name,'form')]")

      when 'Evaluation File Selector' then
        return has_xpath?(".//fieldset[legend[text()='Evaluation File']]//descendant::tr/td/select[contains(@name,'form')]")

      when 'Idea Stage Filter Page' then
        return has_xpath?(".//table[@class='dashtable']/tbody/tr/td/a[text()='#{text}']")

      when 'Selected ideas moved to stage' then
        return has_xpath?(".//div[@id='errMsgId'][contains(text(),'Selected ideas moved to \"#{text}\" stage.')]")

      ###Communities page
      when 'Search Has Been Saved' then
        return savedsearchmessage_label.text == text

      when 'Save search title' then #comm.tc8.fa.20150122
        return has_xpath?(".//*[@id='searchname'][@value='#{text}']")

      ###View Ideas Page
      when 'Stage on Idea Stages widget' then
        return has_xpath?(".//div[@id='idea_stages_display']/div/ul/li/a[text()='#{text}']")

      ###View Idea Page
      when 'Idea comment content' then #fa.AS018
        return has_xpath?(".//div[@id='view_idea_comments_fresh']//li[@class='comment clearfix']//a[@title='#{text}']")
      when 'Idea reply content' then #fa.AS018
        return has_xpath?(".//div[@id='view_idea_comments_fresh']//li[@class='comment clearfix reply-node']//a[@title='#{text}']")

      when 'Stage on View Ideas Stages filter' then
        return has_xpath?(".//div[@id='ideas-result']//ul/li/a[contains(@title,'#{text}')]")
      when 'Stage on View Idea Stages selector' then
        stageselector_combobox.click
        within stageselector_combobox do
          return has_xpath?(".//li[contains(@class,'selected')]/a[contains(@title,'#{text}')]")
        end

      when 'Idea Stats task' then
        return has_xpath?(".//*[@id='idea_stats']//li/span[contains(@class,'task-name')][contains(text(),'#{text}')]")

      when 'View Idea User autosuggest' #fa.AS018
        return has_xpath?(".//ul[contains(@class,'ui-autocomplete')]//a[contains(text(),'#{text}')]")

      when 'My Inbox User autosuggest'
        return has_xpath?(".//ul/li[@class='ui-menu-item']/a[contains(text(),'#{text}')]")

      ###Idea Popup
      when 'Idea Popup Current Stage' then
        return has_xpath?(".//div[@id='ideaStats']/div/div/div/div[contains(text(),'#{text}')]")

      when 'Idea stage statistics popup' then #IG003.fa.20150412
        return has_xpath?(".//div[@id='ideaStats']//span[contains(text(),'#{text}')]")

      ###Terms and conditions# as.tc25.fa.20150130
      when 'Terms and Conditions text'
        return has_xpath?(".//*[@id='AdditionalTermsForm']//*[contains(text(),'#{text}')]")

      ###Post Idea
      when 'Checkbox Group' then
        return has_xpath?(".//div[contains(@class,'checkbox_group')]/input[@value='#{text}']")
      when 'Radio Group' then
        return has_xpath?(".//div[contains(@class,'radio_group')]/input[@value='#{text}']")
      when 'Drop Down' then
        find(:xpath, ".//div[@id='idea-template']/div/div/a[select]").click
        return has_xpath?(".//div[@id='idea-template']/div/div/a/ul/li/a[@title='#{text}']")
      ### Manage Communities
      when 'Site Name' then
        return has_xpath?(".//*[@id='contents']//div[@class='break-word']/a[contains(text(),'#{text}')]")
      else
        fail(ArgumentError.new("'#{element}' is not listed!"))
    end
  end

  ###Method to put content in a TinyMCE without delete the current content used on TC #21
  def fillInTinyMCEWithoutDeleteContent(tinymce, content)
    iframe = case tinymce
               # region User Experience Management
               when 'User Profile Page Template' then
                 'config-single-com.spigit.user.UserConfig.userProfileTemplate_ifr'
               when 'User Idea Home Template' then
                 'config-single-com.spigit.user.UserConfig.userTemplateIdeaHome_ifr'
               when 'Access Denied Message' then
                 'config-single-com.spigit.user.UserConfig.accessDeniedMessage_ifr'
               # endregion

               # region Idea Management
               when 'Shown Idea Template' then
                 'config-single-com.spigit.idea.IdeaConfig.viewIdeaTemplate_ifr'
               when 'Shown Idea Short Description Template' then
                 'config-single-com.spigit.idea.IdeaConfig.viewIdeaShortDescTemplate_ifr'
               when 'Shown Idea Summary Template' then
                 'config-single-com.spigit.idea.IdeaConfig.ideaSummaryTemplate_ifr'
               # endregion

               # region Email Templates
               when 'Forgot Password Email Body' then
                 forgotpassword_iframe
               when 'Forgot Username Email Template' then
                 'sendUserName-ebody_ifr'
               # endregion
               else "'#{tinymce}' text area doesn't exist."
             end
    within_frame(iframe) do
      editor = page.find_by_id('tinymce')
      editor.click #FixIE.fa.20150223
      sleep 1
      editor.native.send_keys :control, :end
      sleep 1
      editor.native.send_keys :enter
      sleep 1
      editor.native.send_keys(content)
    end
    sleep 3
  end



  ###Method to put content in a TinyMCE
  def fillInTinyMCE(tinymce, content)
    iframe = case tinymce
               when 'Signature' then
                  'sig_ifr'
               when 'Bio' then
                 'bio_ifr'
               ###Legal###
               when 'Additional Terms' #as.tc25.fa.20150130
                 'config-single-com.spigit.config.SpigitConfig.additionalTerms_ifr'
               when 'Text shown on Second Checkbox'
                 'config-single-com.spigit.config.DisplayConfig.showSecondAgreementCheckboxText_ifr'
               ###User Experience Management fields###
               when 'User Profile Page Template' then
                 'config-single-com.spigit.user.UserConfig.userProfileTemplate_ifr'
               when 'User Idea Home Template' then
                 'config-single-com.spigit.user.UserConfig.userTemplateIdeaHome_ifr'
               when 'Access Denied Message' then
                 'config-single-com.spigit.user.UserConfig.accessDeniedMessage_ifr'

               ###Idea Management fields###
               when 'Shown Idea Template' then
                 'config-single-com.spigit.idea.IdeaConfig.viewIdeaTemplate_ifr'
               when 'Shown Idea Short Description Template' then
                 'config-single-com.spigit.idea.IdeaConfig.viewIdeaShortDescTemplate_ifr'
               when 'Shown Idea Summary Template' then
                 'config-single-com.spigit.idea.IdeaConfig.ideaSummaryTemplate_ifr'

               ###Post Category fields###
               when 'Category Description' then
                 'content_ifr'

               ###Email Templates fields###
               when 'Forgot Password Email Body' then
                 forgotpassword_iframe
               when 'Forgot Username Email Body' then
                 forgotusername_iframe
               when 'Invitation to New Users to Sign Up Body' then
                 invitationnewusers_iframe

               ###PostIdea###
               when 'Description' then
                 'idea_field_Content_ifr'
               when 'Review text' then
                 'content_review_ifr'

               when 'Close Idea' then
                 'desc_ifr'
               ###Legal Page
               when 'Additional Terms' then
                 'config-single-com.spigit.config.SpigitConfig.additionalTerms_ifr'

               else "'#{tinymce}' text area doesn't exist."
             end
    within_frame(iframe) do
      editor = page.find_by_id('tinymce')
      editor.click
      editor.native.clear
      editor.native.send_keys(content)
    end
    sleep 3
  end

  def clearTinyMCE(tinymce)
    iframe = case tinymce
               ###User Experience Management fields###
               when 'User Profile Page Template' then
                 'config-single-com.spigit.user.UserConfig.userProfileTemplate_ifr'
               when 'User Idea Home Template' then
                 'config-single-com.spigit.user.UserConfig.userTemplateIdeaHome_ifr'
               when 'Access Denied Message' then
                 'config-single-com.spigit.user.UserConfig.accessDeniedMessage_ifr'

               ###Idea Management fields###
               when 'Shown Idea Template' then
                 'config-single-com.spigit.idea.IdeaConfig.viewIdeaTemplate_ifr'
               when 'Shown Idea Short Description Template' then
                 'config-single-com.spigit.idea.IdeaConfig.viewIdeaShortDescTemplate_ifr'
               when 'Shown Idea Summary Template' then
                 'config-single-com.spigit.idea.IdeaConfig.ideaSummaryTemplate_ifr'

               ###Post Category fields###
               when 'Category Description' then
                 'content_ifr'

               ###Email Templates fields###
               when 'Forgot Password Email Body' then
                 forgotpassword_iframe
               when 'Forgot Username Email Body' then
                 forgotusername_iframe
               when 'Invitation to New Users to Sign Up Body' then
                 invitationnewusers_iframe

               else  fail(ArgumentError.new("'#{tinymce}' text area is not listed!"))
             end
    within_frame(iframe) do
      editor = page.find_by_id('tinymce')
      editor.click
      editor.native.clear
    end
    sleep 2
  end

  ###Method to unselect all options
  def unselectOptions(list)
    case list
      when 'Review Roles' then
        if has_reviewroles_combobox?
          @xpathroles = ".//*[@id='reviewTaskAddId']/td/select[contains(@name,'roles')]/option" #New task
        else
          @xpathroles = ".//tr[@class='showRow']/td/select[contains(@id,'roles')]/option" #Existing task
        end
        all(:xpath, @xpathroles).each do |item|
          item.unselect_option
        end

      when 'Evaluation form','Evaluation Form Roles' then
        if has_newevalformroles_combobox?
          @xpathroles = ".//fieldset[legend[text()='Evaluation Form']]//tr[@id]//select[contains(@name,'roles')]/option" #New task
        else
          @xpathroles = ".//fieldset[legend[text()='Evaluation Form']]//tr[not(@id)]//select[contains(@name,'roles')]/option" #Existing task
        end
        all(:xpath, @xpathroles).each do |item|
          item.unselect_option
        end

      when 'Evaluation file','Evaluation File Roles' then
        if has_newevalfileroles_combobox?
          @xpathroles = ".//fieldset[legend[text()='Evaluation File']]//tr[@id]//select[contains(@name,'roles')]/option" #New task
        else
          @xpathroles = ".//fieldset[legend[text()='Evaluation File']]//tr[not(@id)]//select[contains(@name,'roles')]/option" #Existing task
        end
        all(:xpath, @xpathroles).each do |item|
          item.unselect_option
        end

      when 'Approval','Approval Roles' then
        if has_newapprovalroles_combobox?
          @xpathroles = ".//fieldset[legend[text()='Approval']]//tr[@id]//select[contains(@name,'roles')]/option" #New task
        else
          @xpathroles = ".//fieldset[legend[text()='Approval']]//tr[not(@id)]//select[contains(@name,'roles')]/option" #Existing task
        end
        all(:xpath, @xpathroles).each do |item|
          item.unselect_option
        end

      when 'Idea Stats' then
        i=0
        xpathIdeaStats = ".//*/input[contains(@id,'ideaStatsElementsDisplayToggle')][@type='checkbox']"
        all(:xpath, xpathIdeaStats).each do |item|
          if $version<370
            find(:xpath, ".//*[@id='config-array-#{i}-com.spigit.idea.IdeaConfig.ideaStatsElementsDisplayToggle']").set(false)
          end
          if $version==370 and i==14
            find(:xpath, ".//*[@id='config-array-15-com.spigit.idea.IdeaConfig.ideaStatsElementsDisplayToggle']").set(false)
          else
            find(:xpath, ".//*[@id='config-array-#{i}-com.spigit.idea.IdeaConfig.ideaStatsElementsDisplayToggle']").set(false)
          end
        end
        i +=1
    end
  end
  ###Method to select an option by its name
  def selectOptionByName(list, option_name)
    case list
      when 'Roles Allowed to Assign and Remove Idea Coordinator' then
        rolesideacoordinator.find('option', :text => /\A#{option_name}\Z/).select_option

      ###Security Page fields###
      when 'Users Who Can Include Links' then
        rolestoincludelinks_selector.find('option', :text => /\A#{option_name}\Z/).select_option

      ###Post Category fields###
      when 'Parent Category' then
        if $browser=='FF' then
          sleep 2
        end
        parentcategory_combobox.find('option', :text => /\A#{option_name}\Z/).select_option

      ###Email Templates fields###
      when 'Forgot Password Email Type' then
        forgotpasswordemailtype_combobox.find('option', :text => /\A#{option_name}\Z/).select_option
      when 'Forgot Username Email Type' then
        forgotuseremailtype_combobox.find('option', :text => /\A#{option_name}\Z/).select_option

      ###Evaluation Templates fields###
      when 'Review Form' then
        @generalreview = GeneralReview.new
        general_review = @generalreview.getReviewTemplate(option_name)
        reviewform_dropdown.find('option', :text => /\A#{general_review}\Z/).select_option

      # region Graduation Thresholds
      when 'Select Review Form' then
        @generalreview = GeneralReview.new
        general_review = @generalreview.getReviewTemplate(option_name)
        all(:xpath,".//*[@id='subRvId']/option[text()]").each do |reviewTemplate|
            templateName = reviewTemplate.text
            if general_review.index(templateName.gsub(".", ""))!= nil
              selectreviewform_combobox.find('option', :text => /\A#{templateName}\Z/).select_option
            end
          end

      when 'Select Previous Review Form' then
        selectreviewform_combobox.find(:xpath, './/option[2]').select_option

      when 'Review Roles' then
        unselectOptions(list)
        if has_reviewroles_combobox?
          reviewroles_combobox.find('option', :text => /\A#{option_name}\Z/).select_option #New task
        else
          reviewrolesUpdate_combobox.find('option', :text => /\A#{option_name}\Z/).select_option #Existing task
        end

      when 'Select Previous Evaluation Form' then
        newevalformselect_combobox.find(:xpath, './/option[2]').select_option

      when 'Select Previous Evaluation File' then
        newevalfileselect_combobox.find(:xpath, './/option[2]').select_option

      when 'Select New Evaluation Form' then
        evalform = Evaluations.new
        option = evalform.getEvaluation(getCurrentSite, option_name)

        all(:xpath,".//*[@id='evFormAddId']//select[not(@multiple)]/option[text()]").each do |template|
          templateName = template.text
          if option.index(templateName.gsub(".", ""))!= nil
            newevalformselect_combobox.find('option', :text => /\A#{templateName}\Z/).select_option
          end
        end

      when 'Select New Evaluation File' then
        @evalform = Evaluations.new
        option = @evalform.getEvaluation(getCurrentSite, option_name)

        all(:xpath,".//*[@id='evFileAddId']//select[not(@multiple)]/option[text()]").each do |template|
          templateName = template.text
          if option.index(templateName.gsub(".", ""))!= nil
            newevalfileselect_combobox.find('option', :text => /\A#{templateName}\Z/).select_option
          end
        end


      when 'Evaluation Form Roles' then
        unselectOptions(list)
        if has_newevalformroles_combobox?
          newevalformroles_combobox.find('option', :text => /\A#{option_name}\Z/).select_option #New task
        else
          evalformroles_combobox.find('option', :text => /\A#{option_name}\Z/).select_option #Existing task
        end

      when 'Evaluation File Roles' then
        unselectOptions(list)
        if has_newevalfileroles_combobox?
          newevalfileroles_combobox.find('option', :text => /\A#{option_name}\Z/).select_option #New task
        else
          evalfileroles_combobox.find('option', :text => /\A#{option_name}\Z/).select_option #Existing task
        end

      when 'Approval Roles' then
        unselectOptions(list)
        if has_newapprovalroles_combobox?
          newapprovalroles_combobox.find('option', :text => /\A#{option_name}\Z/).select_option #New task
        else
          approvalroles_combobox.find('option', :text => /\A#{option_name}\Z/).select_option #Existing task
        end

      # region View Ideas
      when 'Communities' then
        communities_combobox.find('option', :text => 'All').unselect_option
        communities_combobox.find('option', :text => /\A#{option_name}\Z/).select_option
      when 'Custom CheckboxGroup' then #20150115.TC14.FA
        customcheckboxgroup_combobox.find('option', :text => option_name).select_option
      when 'View Ideas Category' then
        viewideascategory_combobox.find('option', :text => 'All Categories').unselect_option
        viewideascategory_combobox.find('option', :text => /\A#{option_name}\Z/).select_option
      when 'View Ideas Role' then
        viewideasrole_combobox.find('option', :text => 'All').unselect_option
        viewideasrole_combobox.find('option', :text => /\A#{option_name}\Z/).select_option
      # endregion

      # region Site Editor
      when 'Select Widget 2' then
        selectwidget2_dropdown.find('option', :text => /\A#{option_name}\Z/).select_option
      when 'Select Widget 1' then
        selectwidget1_dropdown.find('option', :text => /\A#{option_name}\Z/).select_option
      # endregion

      ###Add New Task###
      when 'Upload File' then
        uploadfiletemplate_combobox.find('option', :text => /\A#{option_name}\Z/).select_option
      when 'Submit Review' then
        submitreviewtemplate_combobox.find('option', :text => /\A#{option_name}\Z/).select_option
      when 'Complete Evaluation Form' then
        completeevalformtemplate_combobox.find('option', :text => /\A#{option_name}\Z/).select_option
      ##Edit user
      when 'Gender' then
        gender_dropdown.find('option', :text => /\A#{option_name}\Z/).select_option

      else
        "'#{list}' list doesn't exist."
    end
    sleep 2
  end

  def expandWidget(widget)
    case widget
      when 'View Ideas Control Panel' then
        controlpanel_header.click
      when 'View Idea Control Panel' then
        # viewideacontrolpanel_header.click
        click_link('Control Panel')
      when 'My Pending Approvals' then
        pendingapprovals_header.click
      when 'Expand Phase Editor' then
        challengeexpandphaseeditor_tab.click
        sleep 4
      when 'Collapse Phase Editor' then
        challengecollapsephaseeditor_tab.click
      when 'Content Select Widget' then
        selectwidget1_dropdown.click
      when 'Privacy Preferences' then
        privacypreference_widget.click
      else "'#{widget}' widget doesn't exist."
    end
  end

  def verifymessage(message)
    case message
      when 'Inappropriate content has been used and is being reviewed by the Site Administrator' then
        return has_inappropriatecontentused_text?

      when 'The email address you entered is not valid. Please try again' then
        return has_xpath?(@@theemailaddressyouenteredisnotvalidpleasetryagain, :text => message)

      when 'Passwords do not match.' then
        return has_xpath?(@@passwordsdonotmatch, :text => message)

      when 'New password entered matches old password.','Your reset password request has been used. Please try again.' then
        sleep 2
        return has_xpath?(@@forgotpswerror_container, :text => message)

      when "Password doesn't meet the requirements. Please try again." then
        return has_xpath?(@@pswnotmeetrequirements, :text => message)

      when 'Error: Username may contain letters a-z, numbers 0-9, underscores and a single dot.' then
        return has_xpath?(@@usernameerror, :text => message)

      when 'The username is missing.' then
        return has_xpath?(@@usernameerror, :text => message)

      when 'User information updated.' then
        sleep 2
        return has_xpath?(@@successmesage, :text => message)

      when 'Your password has been successfully changed.' then
        sleep 3
        return has_xpath?(@@passwordchangedsuccessfullydmessage, :text => message)

      ###Email Users###
      when 'The email message body was blank. Email(s) not sent.' then
        return has_emailbodyblanck_text?

      ###Post Idea###
      when 'Registration and Sign-in required for access.' then
        return has_xpath?(@@registrationmessage, :text => message)

      when 'Some required fields are left empty, please correct all highlighted fields.' then
        if $version>360 #fa.fix.PI-003
          return has_xpath?(".//*[@id='themeContainer']/div[text()='Some required fields are left empty, please correct all highlighted fields.']")
        else
          return has_xpath?(@@postideaerrorsmessage, :text => message)
        end

      when 'Please provide idea title.' then
        if $version>360 #fa.fix.PI-003
          return has_xpath?(".//*[@id='themeContainer']/div[text()='Some required fields are left empty, please correct all highlighted fields.']")
        else
          return has_xpath?(@@postideaerrorsmessage, :text => message)
        end

      when 'Please select a category.' then
        if $version>360 #fa.fix.PI-003
          return has_xpath?(".//*[@id='themeContainer']/div[text()='Some required fields are left empty, please correct all highlighted fields.']")
        else
          return has_xpath?(@@postideaerrorsmessage, :text => message)
        end
      when 'Please provide idea text.' then
        return has_xpath?(@@postideaerrorsmessage, :text => message)

      when 'Please confirm before publishing the idea (ideas).' then
        alert = page.driver.browser.switch_to.alert
        alert.text == message ? (return true) : (return false)

      when "Please complete the section. 'Description'." then
        if $version>360 #fa.fix.PI-003
          return has_xpath?(".//*[@id='themeContainer']/div[text()='Some required fields are left empty, please correct all highlighted fields.']")
        else
          message = message.gsub('\'','"')
          return has_xpath?(@@postideaerrorsmessage, :text => message)
        end
      when 'Information submitted and will be published upon approval' then
        return has_xpath?(@@postideasuccesmessage, :text => message)

      when 'User added to the Moderators panel' then
        return has_xpath?(@@useraddedtomoderators_text)

      when 'User added to the Experts panel' then #tc16.fa.20150121
        return has_xpath?(@@useraddedtoexperts_text)

      when 'Field Label cannot be empty' then
        return has_xpath?("//div[@class='popup-notice fixed corner-all-10 error'][contains(text(),'#{message}')]")

      when 'Option value cannot be empty' then
        return has_xpath?("//div[@class='popup-notice fixed corner-all-10 error'][contains(text(),'#{message}')]")

      when 'Field Label cannot be empty' then
        return has_xpath?("//div[@class='popup-notice fixed corner-all-10 error'][contains(text(),'#{message}')]")

      when 'User now has the assigned role', 'User now has the custom role.' then
        return has_xpath?(@@assignedrolesuccessmessage)

      when 'User is no longer assigned to role' then
        return has_xpath?(".//div[@id='successMessage' and center[(contains(text(),'no longer assigned'))]]")

      when 'All settings applied' then
        sleep 3
        return has_xpath?(@@evaluationsavedsuccessmessage, :text => message)

      when 'Settings updated.' then #fa.as038
        sleep 2
        return has_xpath?(@@evaluationsavedsuccessmessage, :text => message)

      when 'Would you like to move this idea' then
        alert = page.driver.browser.switch_to.alert
        alert.text == 'Please confirm before publishing the idea (ideas).' ? (return true) : (return false)

      when 'The length of the description exceeds 255 characters.' then
        return has_xpath?(".//div[@id='messageId']/p[contains(text(),'#{message}')]")

      ###Region Edit Profile
      when 'Your profile has been saved.' then
        sleep 2
        return has_xpath?(@@successmesage, :text => message)
      #End Region

      when message then
        return has_xpath?(@@ideacreatedmessage, :text => message)

      else
        "The '#{message}'was not found."
    end
  end

  def verifyfieldexists(field, content)
    case field
      when 'Email' then
        has_field?('email', :with => content)
      when 'Edit Community Title' then
        communitytitleeditor_field.value == content
      when 'Age (in days)' then
        agethreshold_field.value == content
      else
        "The '#{field}'was not found."
    end
  end

  def getCountEmailsReceived(useraccount, password, subject)
    emailscounter = 0
    Gmail.new(useraccount, password) do |gmail|
    # @users = Users.new
    # gmail = @users.getSession(useraccount, password)
      puts "Looking for '#{subject}' in gmail account..."
      gmail.inbox.emails(:unread,:subject => subject).each do |email|
        if emailscounter == 0 then
          email.mark(:read)
          emailscounter = emailscounter + 1
          break
        end
      end
    end
    return emailscounter
  end

  def getNumberEmailsByContent(useraccount, password, subject, content)
    emailscounter = 0
    Gmail.connect(useraccount, password) do |gmail|
    # @users = Users.new
    # gmail = @users.getSession(useraccount, password)
      puts "Looking for '#{subject}' in gmail account..."
      gmail.inbox.emails(:unread, :subject => subject).each do |email|
        if email.body.to_s.include?(content)
          email.mark(:read)
          emailscounter = emailscounter + 1
          break
        else
          email.mark(:unread)
        end
      end
    end
    return emailscounter
  end

  def getNumberEmailsByContentAndUser(useraccount, password, subject, content, user_addressed)
    emailscounter = 0
    Gmail.connect(useraccount, password) do |gmail|
    # @users = Users.new
    # gmail = @users.getSession(useraccount, password)
      puts "Looking for '#{subject}' in gmail account..."
      gmail.inbox.emails(:unread, :subject => subject).each do |email|
        if email.body.to_s.include?(content) and email.body.to_s.include?(user_addressed)
          email.mark(:read)
          emailscounter = emailscounter + 1
          break
        else
          email.mark(:unread)
        end
      end
    end
    return emailscounter
  end

  def closeAlertWindow(value)
    sleep 2
    if value
      page.driver.browser.switch_to.alert.accept
    else
      page.driver.browser.switch_to.alert.dismiss
    end
    sleep 2
  end

  def refreshPage
    visit(current_url)
  end

  def selectRadioButton(option)
    case option
      ###Users fields###
      when 'Enable user(s)' then
        usersenableuser_option.click
      when 'Grant Community Access' then
        usersgrantaccess_option.click

      when 'Revoke Community Access' then
        usersrevokeaccess_option.click

      ###Community fields###
      when 'Fancy33 Theme' then
        fancy33theme_option.click
      when 'Child of' then
        childof_radio.click
      ###Tasks###
      when "Submit Review" then
        submitreview_option.click
      else
        puts "'#{option}' option doesn't exist."
    end
  end

  def selectRadioButtonOption(group, option)
    case group
      ###View Idea fields###
      when 'Task Type' then
        within_fieldset(group) do
          choose(option)
        end
      when 'Challenge Templates' then
        find(:xpath,".//ul[li/div[text()='#{option}']]//input[@type='radio']").click

      else
        puts "'#{group}' group doesn't exist."
    end
  end

  def clickRemoveItemDialogButton(button)
    removeButton = find(:xpath, "//button[text()='#{button}']")
    removeButton.click
    sleep 2
  end

  def hoverMoreMainMenuTab
    if has_xpath? ".//ul/li[contains(@class,'moreNavHolder')]"
      #page.execute_script('$(".moreNavHolder>a").trigger("mouseover")')
      find(:xpath, ".//ul/li[contains(@class,'moreNavHolder')]").hover
      # page.driver.browser.action.move_to(page.find(:xpath, ".//ul/li[contains(@class,'moreNavHolder')]").native).perform
    end
  end

  def verifyIdeaListedOnWidget(widget, idea_title, status)
    result = false
    case widget
      when 'Activity - My Ideas' then
        within(@@activitymyideas_widget) do
          classStatus = status == '' ? "title " : "title status"+status
          ideaExists = has_xpath? "//div[@class='#{classStatus}']/a[@class='action_IdeaDetails ideaTitle'][div[text()='#{idea_title}']]"
          statusExists = status == '' ? true : has_xpath?("//div[@class='#{classStatus}']/span[@class='pendingStatus right'][text()='#{status}']")
          result = true if (ideaExists and statusExists)
        end

      when 'My Profile - My Ideas' then
        within(@@profilemyideas_widget) do
          ideaExists = status == '' ? has_xpath?("//td[@class='title']/div/a[@title='#{idea_title}']") : has_xpath?("//td[@class='title']/div[i[text()='(#{status})']]/a[@title='#{idea_title}']")
          statusExists = status == '' ? true : (has_xpath? "//td[@class='title']/div[a[@title='#{idea_title}']]/i[text()='(#{status})']")
          if ideaExists and statusExists
            result = true
          else
            if has_xpath? "//a[@class='moreLinks']"
              find(:xpath, "//a[@class='moreLinks']").click
              ideaExists = status == '' ? has_xpath?("//td[@class='title']/div/a[@title='#{idea_title}']") : has_xpath?("//td[@class='title']/div[i[text()='(#{status})']]/a[@title='#{idea_title}']")
              statusExists = status == '' ? true : has_xpath?("//td[@class='title']/div[a[@title='#{idea_title}']]/i[text()='(#{status})']")
              result = true if (ideaExists and statusExists)
            end
          end
        end

      when 'View Ideas' then
        if has_xpath?('.//*[@id="viewIdeasViewPort"]') then
          within(:xpath, './/*[@id="viewIdeasViewPort"]') do
            result = has_content?(idea_title)
          end
        end

      when 'Activity Stream/My Stuff' then
        if has_xpath?('.//*[@id="activity_stream_home"]') then
          click_link('My Stuff')
          within(:xpath, './/*[@id="activity_stream_home"]') do
            result = has_content?(idea_title)
          end
        end

      when 'Activity Stream/All' then
        if has_xpath?('//*[@id="activity_stream_home"]') then
          click_link('All')
          within(:xpath, '//*[@id="activity_stream_home"]') do
            result = has_content?(idea_title)
          end
        end

      when 'Activity Stream/My Ideas' then
        if has_xpath?('//*[@id="activity_stream_home"]') then
          click_link('Following')
          within(:xpath, '//*[@id="activity_stream_home"]') do
            result = has_content?(idea_title)
          end
        end
    end
    return result
  end

  def openIdeaListedOnWidget(widget, idea_title)
    @util = Util.new
    case widget
      when 'Activity - My Ideas' then
        scrollBottomWidget widget
        within(@@activitymyideas_widget) do
          find(:xpath, ".//a[@class='action_IdeaDetails ideaTitle'][div[text()='#{idea_title}']]").click
        end
        @util.elementExistsOnTime('css', $css_verify_ideapopup, 8)
      when 'My Profile - My Ideas' then
        within(@@profilemyideas_widget) do
          find(:xpath, ".//td[@class='title']/div/a[@title='#{idea_title}']").click
          sleep 2
        end
    end
  end

  def scrollBottomWidget(widget)
    idWidget =  case widget
                  when 'Activity - My Ideas' then
                    @@activitymyideas_widget
                  when 'View Ideas' then
                    @@viewideas_container
                  when 'Activity Stream Widget' then
                    @@activitystream_widget
                  when 'User Activities' then
                    @@useractivities_widget
                end
    outerHeight = page.execute_script("return $('#{idWidget}').outerHeight();")
    scrollHeight = page.execute_script("return $('#{idWidget}').get(0).scrollHeight;")
    scrollTop = page.execute_script("return $('#{idWidget}').scrollTop();")
    while (scrollTop+outerHeight) < scrollHeight do
      page.execute_script("$('#{idWidget}').scrollTop(#{scrollHeight})")
      sleep 3
      scrollHeight = page.execute_script("return $('#{idWidget}').get(0).scrollHeight;")
      scrollTop = page.execute_script("return $('#{idWidget}').scrollTop();")
    end
  end
  #CC
  def scrollDownWidget(widget)
    idWidget =  case widget
                  when 'Activity - My Ideas' then
                    @@activitymyideas_widget
                  when 'View Ideas' then
                    @@viewideas_container
                  when 'Activity Stream Widget' then
                    @@activitystream_widget
                  when 'User Activities' then
                    @@useractivities_widget
                end
    outerHeight = page.execute_script("return $('#{idWidget}').outerHeight();")
    scrollHeight = page.execute_script("return $('#{idWidget}').get(0).scrollHeight;")
    scrollTop = page.execute_script("return $('#{idWidget}').scrollTop();")
    page.execute_script("$('#{idWidget}').scrollTop(#{scrollHeight})")
    sleep 3
  end

  def scrollWidgetUntilElementFound(widget, xpathElement)
    idWidget = case widget
                 when 'Available Communities List' then
                   '.jspContainer'
               end
    outerHeight = page.execute_script("return $('#{idWidget}').outerHeight();")
    scrollHeight = page.execute_script("return $('#{idWidget}').get(0).scrollHeight;")
    scrollTop = page.execute_script("return $('#{idWidget}').scrollTop();")
    y = 400
    contentFound = has_xpath?(xpathElement)
    while ((scrollTop+outerHeight) < scrollHeight) and !contentFound do
      page.execute_script("$('#{idWidget}').scrollTop(#{y})")
      scrollTop = page.execute_script("return $('#{idWidget}').scrollTop();")
      within(idWidget) do
        contentFound = has_xpath?(xpathElement)
      end
      y += 400
    end
  end

  def selectAutosuggestUser(field, username)
    case field
      when 'Moderator Name' then
        if $version >= 360
          usernameXpath = ".//ul[contains(@class,'ui-autocomplete')]//a[contains(text(),'#{username} ')]"
          result = false
          waitTime = Time.now + 10
          while Time.now < waitTime and !result do
            result = has_xpath?(usernameXpath)
          end
          find(:xpath, usernameXpath).click
        else
          if has_xpath?("//*[@id='autocomplete_username_choices']/ul/li[contains(@id,'liun_#{username}|')]")
            find(:xpath, "//*[@id='autocomplete_username_choices']/ul/li[contains(@id,'liun_#{username}|')]").click
          end
        end

      when 'Expert Name' then
        if has_xpath?("//*[@id='autocomplete_username_choices_username']/ul/li[contains(@id,'liun_#{username}|')]")
          find(:xpath, "//*[@id='autocomplete_username_choices_username']/ul/li[contains(@id,'liun_#{username}|')]").click
        end
        #assigntasktouser_field.set @users.getUser(value, "username")
        sleep 3
        assigntasktouser_field.native.send_keys :down
        assigntasktouser_field.native.send_keys :enter

      when 'Assign Task To User', 'View Ideas Username' then
        usernameXpath = ".//ul[contains(@class,'ui-autocomplete')]//a[contains(text(),'#{username} ')]"
        result = false
        waitTime = Time.now + 10
        while Time.now < waitTime and !result do
          result = has_xpath?(usernameXpath)
        end
        first(:xpath, usernameXpath).click
        fail(ArgumentError.new("'#{username}' user was not found!")) unless result

      when 'Assign User in IdeaPopup' then
        usernameXpath = ".//ul[contains(@class,'auto-list')]//li[mark[contains(text(),'#{username}')]]"
        result = false
        waitTime = Time.now + 10
        while Time.now < waitTime and !result do
          result = has_xpath?(usernameXpath)
        end
        find(:xpath, usernameXpath).click
        fail(ArgumentError.new("'#{username}' user was not found!")) unless result
    end
  end

  def verifyPopupMessage(message)
    result = false
    message_xpath = ''
    case message
      when 'Template saved.',
          'Selected winners updated.' then
        message_xpath = ".//div[contains(@class,'popup-notice')][text()='#{message}']"
      when 'Challenge template is deleted.' then
        message_xpath = ".//*[@id='themeContainer']/div[@style='display: block;' and text()='#{message}']"
      when 'All settings applied.',
          'Saved search saved.',
          'Search returned no results.',
          'Saved search removed.',
          'Job started.',
          'Membership Rejected',
          'Update successful.' then
        message_xpath = ".//div[contains(@class,'popup-notice')][contains(text(),'#{message}')]"
      when 'End Date cannot be earlier than today.' then
        message_xpath = ".//div[contains(@class,'popup-notice')][contains(.,'#{message}')]"
      when 'Phase duration must be at least an hour. Please adjust phase end date',
          'Predictions can be enabled in one phase of a challenge.',
          'Pairwise Voting can be enabled in one phase of a challenge.',
          'Phase Name is required.',
          'Please enter Template Name.',
          'Phase duration must be at least an hour. Please adjust phase end date.',
          'Start Date cannot be earlier than today.' then
        message_xpath = ".//div[contains(@class,'popup-notice')][contains(text(),'#{message}')]"
      when 'Congratulations! Your challenge is ready.' then #fa.CHM015.20150319
        message_xpath = ".//*[@id='challengeSettingInfo']/h2[contains(text(),'#{message}')]"
      when 'Challenge template is set as default template.' then #fa.CHM065.20150330
        message_xpath = ".//*[@id='themeContainer']/div[contains(text(),'#{message}')]"
      else
        puts "'#{message}' does not exist!"
    end
    unless message_xpath == ''
      waittime = Time.now + 10
      while Time.now < waittime and !result do
        result = has_xpath?(message_xpath)
      end
      result
    end
  end

  def verifyFieldIsEmpty(field)
    case field
      when 'Username' then
        return username_field_login.value == ''
      when 'Password' then
        return password_field_login.value == ''
      when 'Challenge Template Description' then
        return challengetemplatedescription.text == ''
      when 'Challenge Title' then
        return challenge_title.text == ''
      when 'Challenge Description' then
        return challenge_description.text.should == ''
      when 'Template Name' then
        return challengetemplatename_field.value.should == ''
      when 'Template Description'
        return challengetemplatedescription_textarea.value.should == ''
      else
        fail(ArgumentError.new("'#{field}' does not exist!"))
    end
  end

  def storeFieldListItems(elementLabel)
    xpath_ListItem = "//ul[@id='frmb-0']/li[div[@class='legend']/span[text()='#{elementLabel}']]/div/div[@class='frm-elements']/div/ol/li/input[2]"
    all(:xpath, xpath_ListItem).each do |item|
      @communities = Communities.new
      @communities.addCommunityFieldItem(@@currentSite, elementLabel, item[:value].to_s)
    end
  end

  def verifyComboboxListItems(combobox, items)
    case combobox
      when 'Drop Down' then
        customdropdown_combobox.click
        within customdropdown_combobox do
          items.each do |item|
            fail(ArgumentError.new("'#{item}' option is not displayed in the combobox!")) unless has_xpath?(".//ul/li/a[@title='#{item}']")
          end
        end
        customdropdown_combobox.click
      else
        puts "'#{combobox}' is not listed!"
    end
  end

  def waitAmountMinutes(minutes)
    waitTime = Time.now + (minutes*60)
    while Time.now < waitTime do
    end
  end

  def waitUntilElementIsVisible(element, secondsToWait)
    result = false
    waitTime = Time.now + secondsToWait
    until Time.now > waitTime or result do
      case element
        when 'Phases Container' then
          result = has_challengephases_container?
        when 'Challenge First Phase' then
          result = has_firstphasetitle_field?
        when 'Users Actions Yes' then
          result = has_usersactionsconfirm_link?
        when 'Graduation Thresholds' then
          result = has_graduation_thresholds_link?
        when 'Password Expired on First Sign-In'
          result = has_passwordexpired_checkbox?
      end
    end
    puts "'#{element}' element doesn't exist!" unless result
  end

  def selectDateFromDatePicker(date_to_pick)
    months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
    dateArray = date_to_pick.split('/')
    day = dateArray[1]
    month = dateArray[0]
    year = dateArray[2]

    #Manage the picker to reach specified year
    if year.to_i > datepickercurrentyear_label.text.to_i
      while datepickercurrentyear_label.text.to_i < year.to_i  do
        datepickernext_button.click
      end
    elsif year.to_i < datepickercurrentyear_label.text.to_i
      while datepickercurrentyear_label.text.to_i > year.to_i  do
        datepickerprevious_button.click
      end
    end
    #Manage the picker to reach specified month
    if month.to_i > (months.index(datepickercurrentmonth_label.text)+1)
      while month.to_i > (months.index(datepickercurrentmonth_label.text)+1) do
        datepickernext_button.click
      end
    elsif month.to_i < (months.index(datepickercurrentmonth_label.text)+1)
      while month.to_i < (months.index(datepickercurrentmonth_label.text)+1) do
        datepickerprevious_button.click
      end
    end
    find(:xpath, ".//table[@class='ui-datepicker-calendar']//a[text()='#{day.to_i}']").click
  end

  def setIdeaExpiryDurationValues(duration)
    all(:xpath, "//input[contains(@id,'IdeaConfig.ideaExpirationDuration')]").each do|stageconfiguration|
      stageconfiguration.set duration
      sleep 1
    end
    setIdeaExpiryDurationValue(duration)
  end

  def setIdeaExpiryDurationValue(duration)
    @@ideataskduration = duration
  end

  def getIdeaExpiryDurationValue()
    @@ideataskduration
  end

  def uploadFile(path)
    formattedpath = File.expand_path(path)
    attach_file('fileNameId', formattedpath.gsub('/','\\'))
  end

  def uploadFileId(path, idname)
    formattedpath = File.expand_path(path)
    attach_file(idname, formattedpath.gsub('/','\\'))
  end

  def getItemsList(listname)
    case listname
      when 'Evaluation Form List' then
        within(:xpath, ".//select[@id='templateSelId']") do
          return all(:xpath, ".//option")
        end
      when 'Evaluation File List' then
        within(:xpath, ".//select[@id='evFileSelId']") do
          return all(:xpath, ".//option")
        end
      when 'Review Form List' then
        within(:xpath, ".//*[@id='reviewFormTemplateId']") do
          return all(:xpath, ".//option")
        end

      else
        puts "'#{listname}' is not listed."
    end
  end

  def expandCommunityParents()
    parents = all(:xpath, ".//div[@id='markup']/ul/li[span[2]]")

    if parents.length > 0
      parents.each do|parent|
        parent.find(:xpath, 'span[2]').click
      end
    end
  end

  def verifyIdeaExistsInTopSearchResults(ideaTitle, exists)
    within topsearchresults_container do
      idea = has_xpath?(".//div[@class='grid_24']/td/a[text()='#{ideaTitle}']")
      if exists and !idea
        fail(ArgumentError.new("'#{ideaTitle}' idea is not listed in the results!"))
      elsif !exists and idea
        fail(ArgumentError.new("'#{ideaTitle}' idea is listed in the results!"))
      end
    end
  end

  def selectItemInAutosuggest(autosuggestName, item)
    case autosuggestName
      when 'Post comment user autosuggest' then
        find(:xpath, ".//ul[@class='auto-list']/li[contains(text(),'#{item}')]").click
      when 'Post reply user autosuggest' then
        find(:xpath, ".//ul[@class='auto-list']/li[contains(text(),'#{item}')]").click
      when 'airport1' then
        find(:xpath, "html/body/ul[19]/li[1]/a[contains(text(), '#{item}')]").click
      when 'airport2' then
        find(:xpath, "html/body/ul[20]/li[1]/a[contains(text(), '#{item}')]").click
      when 'dept time' then
        find(:xpath, "html/body/ul/li/a[text()='#{item}']").click
      when 'ret time' then
        find(:xpath, "html/body/ul/li/a[text()='#{item}']").click
      when 'fare class' then
        find(:xpath, "html/body/ul[18]/li/a[text()='#{item}']").click
    end
  end

end
