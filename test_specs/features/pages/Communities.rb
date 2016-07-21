class Communities

  @@communities = Hash.new { |h,k| h[k] = {} }
  @@challengeTemplates = Hash.new { |h,k| h[k] = {} }
  @@challengeWinnerIdea
  @@tasksPerStage = Hash.new { |l,m| l[m] = {} }
  @@ideasCommunity = Hash.new
  @@communityFieldItems = Hash.new { |h,k| h[k] = {} }
  @@ideaTasks = Hash.new { |h,k| h[k] = Hash.new { |hh, kk| hh[kk] = {} } }
  @@stagenames = Hash.new { |o,p| o[p] = {} }
  @@challengestartdatetime = Hash.new { |s,t| s[t] = {} }
  @@challengePhases = Hash.new

  @@communities['Main Site']['url'] = "https://www.#{$versionUrl}.spigit.com/User/Login"
  @@communities['Wrong Site']['url'] = "https://nosite.#{$versionUrl}.spigit.com/User/Login"

  def getCommunityUrl(community)
      @@communities[community]['url']
  end

  def getCommunityTitle(community)
    @@communities[community]['title']
  end

  def setCommunity(community, title, url)
    if url.to_s.index('.com') != nil then
      pos = url.to_s.index('.com') + 4
      @@communities[community]['url'] = url.to_s.slice(0, pos) + '/User/Login'
    else
      @@communities[community]['url'] = url
    end
    @@communities[community]['title'] = title
  end

  def setCommunityUrl(community, url)
    if url.to_s.index('.com') != nil then
      pos = url.to_s.index('.com') + 4
      @@communities[community]['url'] = url.to_s.slice(0, pos) + '/User/Login'
    else
      @@communities[community]['url'] = url
    end
  end

  def getCommunityInfo(community,info)
    @@communities[community][info]
  end

  def addCommunityInfo(community,info, data)
    @@communities[community][info] = data
  end

  def getChallengeTemplate(community, template)
    if !$devmod then
      @@challengeTemplates[community][template]
    else
      return ChallengeTemplate.new(:name => template,
                                   :description => '',
                                   :timezone => '',
                                   :phasesDuration => '')
    end
  end

  def addChallengeTemplate(community, templateName, template)
    @@challengeTemplates[community][templateName] = template
  end

  def getWinnerIdea
    @@challengeWinnerIdea
  end

  def setWinnerIdea(idea)
    @@challengeWinnerIdea = idea
  end

  def getTaskPerStage(community, stage)
    @@tasksPerStage[community][stage]
  end

  def addTaskPerStage(community, stage, task)
    @@tasksPerStage[community][stage] = task
  end

  def getIdeasCommunity(community)
    @@ideasCommunity[community]
  end

  def addIdeaCommunity(community, idea)
    if @@ideasCommunity[community] == nil
      ideas = Array.new
      @@ideasCommunity[community] = ideas
    end
    @@ideasCommunity[community].push(idea)
  end

  def getIdeaTask(idea, user, taskType)
    if !$devmod
      return @@ideaTasks[idea][user][taskType]
    else
      return taskType
    end
  end

  def addIdeaTask(idea, user, taskType)
    taskName = 'Task' + Forgery('lorem_ipsum').words(4, :random => true)
    @@ideaTasks[idea][user][taskType] = taskName
    return taskName
  end

  def setIdeaTask(idea, user, taskType, taskName)
    @@ideaTasks[idea][user][taskType] = taskName
  end

  def getCommunityFieldItems(community, field)
    @@communityFieldItems[community][field]
  end

  def addCommunityFieldItem(community, field, item)
    if @@communityFieldItems[community][field] == nil
      items = Array.new
      @@communityFieldItems[community][field] = items
    end
    @@communityFieldItems[community][field].push(item)
  end

  def getStageNames(community, stage)
    return @@stagenames[community][stage]
  end

  def addStageNames(community, stage)
    stageName = 'Auto Stage ' + Forgery('lorem_ipsum').words(7, :random => true)
    @@stagenames[community][stage] = stageName
  end

  def setStageNames(community, stage, stageName)
    @@stagenames[community][stage] = stageName
  end

  def getChallengeStartDateTime(challenge, type)
      return @@challengestartdatetime[challenge][type]
  end

  def setChallengeStartDateTime(challenge, type, datetime)
    @@challengestartdatetime[challenge][type] = datetime
  end

  def getChallengePhases(challenge)
    @@challengePhases[challenge]
  end

  def setChallengePhases(challenge, phases)
    @@challengePhases[challenge] = phases
  end

end

class ChallengeTemplate
  attr_accessor :name, :description, :timezone, :phasesDuration, :phases
  def initialize(args)
    @name = args.fetch(:name)
    @description = args.fetch(:description)
    @timezone = args.fetch(:timezone)
    @phasesDuration = args.fetch(:phasesDuration)
    @phases = args.fetch(:phases)
  end
end

class ChallengePhase
  attr_accessor :name, :description, :endDate, :endTime, :activities
  def initialize(args)
    @name = args.fetch(:name)
    @description = args.fetch(:description)
    @endDate = args.fetch(:endDate)
    @endTime = args.fetch(:endTime)
    @activities = args.fetch(:activities)
  end
end

class CommunityTasks
  attr_accessor :stageName,
                :age, :pageViews, :votes, :posts, :conversationLevel, :buzz, :approvalRating, :teamSize, :pairwise, :starRating,
                :reviews,
                :evalForms,
                :evalFiles,
                :approvals

  def initialize
    @stageName = ''
    @age = ''
    @pageViews = ''
    @votes = ''
    @posts = ''
    @conversationLevel = ''
    @buzz = ''
    @approvalRating = ''
    @teamSize = ''
    @pairwise = ''
    @starRating = ''
    @reviews = nil
    @evalForms = nil
    @evalFiles = nil
    @approvals = nil
  end

  def setStageName(stagename)
    @stageName = stagename
  end

  def getStageName()
    return @stageName
  end

  def setAge(age)
    @age = age
  end

  def getAge()
    return @age
  end

  def setPageViews(pageviews)
    @pageViews = pageviews
  end

  def getPageViews()
    return @pageViews
  end

  def setVotes(votes)
    @votes = votes
  end

  def getVotes()
    return @votes
  end

  def setPosts(posts)
    @posts = posts
  end

  def getPosts()
    return @posts
  end

  def setConversationLevel(convlevel)
    @conversationLevel = convlevel
  end

  def getConversationLevel()
    return @conversationLevel
  end

  def setBuzz(buzz)
    @buzz = buzz
  end

  def getBuzz()
    return @buzz
  end

  def setApprovalRating(apprat)
    @approvalRating = apprat
  end

  def getApprovalRating()
    return @approvalRating
  end

  def setTeamSize(teamsize)
    @teamSize = teamsize
  end

  def getTeamSize()
    return @teamSize
  end

  def setPairwise(pairwise)
    @pairwise = pairwise
  end

  def getPairwise()
    return @pairwise
  end

  def setStarRating(starrat)
    @starRating = starrat
  end

  def getStarRating()
    return @starRating
  end

  def setReviews(reviews)
    @reviews = reviews
  end

  def getReviews()
    return @reviews
  end

  def setEvalForms(evforms)
    @evalForms = evforms
  end

  def getEvalForms()
    return @evalForms
  end

  def setEvalFiles(evfiles)
    @evalFiles = evfiles
  end

  def getEvalFiles()
    return @evalFiles
  end

  def setApprovals(apps)
    @approvals = apps
  end

  def getApprovals()
    return @approvals
  end
end
