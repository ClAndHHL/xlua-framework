--[[
-- added by wsh @ 2017-12-18
-- 定时器
-- 注意：
-- 1、定时器需要暂停使用pause、恢复使用resume
-- 2、定时器一定使用stop停止，逻辑层脚本就应该释放掉引用，因为它随后会被管理类回收
--]]

local Timer = BaseClass("Timer")

-- 构造函数
local function __init(self, delay, func, obj, one_shot, use_frame, unscaled)
	-- 成员变量
	-- weak表，保证定时器不影响目标对象的回收
	self.target = setmetatable({}, {__mode = "v"})
	if delay and func then
		self:Init(delay, func, obj, one_shot, use_frame, unscaled)
	end
end

-- Init
local function Init(self, delay, func, obj, one_shot, use_frame, unscaled)
	assert(type(delay) == "number" and delay >= 0)
	assert(func ~= nil)
	-- 时长，秒或者帧
	self.delay = delay
	-- 回调函数
	self.target.func = func
	-- 回传对象，一般作为回调函数第一个self参数
	self.target.obj = obj
	-- 是否是一次性计时
	self.one_shot = one_shot
	-- 是否是帧定时器，否则为秒定时器
	self.use_frame = use_frame
	-- 使用deltaTime计时，还是采用unscaledDeltaTime计时
	self.unscaled = unscaled
	-- 是否已经启用
	self.started = false
	-- 倒计时
	self.left = delay
	-- 是否已经结束
	self.over = false
	-- 传入对象是否为空
	self.obj_not_nil = obj and true or false
	-- 启动定时器时的帧数
	self.startFrameCount = Time.frameCount
end

-- Update
local function Update(self, delta)
	if not self.started then
		return
	end
	
	-- 说明：所有定时器从下一帧才开始跑
	if self.startFrameCount == Time.frameCount then
		return
	end
	
	self.left = self.left - delta
	if self.left <= 0 then
		if self.target.func ~= nil then
			-- 说明：这里一定要先改状态，后回调
			-- 如果回调手动删除定时器又马上再次获取，则可能得到的是同一个定时器，再修改状态就不对了
			if not self.one_shot then
				-- 说明：必须把上次计时“欠下”的时间考虑进来，否则会有误差
				self.left = self.delay + self.left
			else
				self.over = true
			end
			-- 说明：运行在保护模式，有错误也只是停掉定时器，不要让客户端挂掉
			local status, err
			if self.obj_not_nil then
				status, err = pcall(self.target.func, self.target.obj)
			else
				status, err = pcall(self.target.func)
			end
			if not status then
				self.over = true
				Logger.LogError(err)
			end
		else
			self.over = true
		end
	end
end

-- 启动计时
local function Start(self)
	if not self.started then
		self.left = self.delay
		self.started = true
	end
end

-- 暂停计时
local function Pause(self)
	self.started = false
end

-- 恢复计时
local function Resume(self)
	self.started = true
end

-- 停止计时
local function Stop(self)
	self.left = 0
	self.one_shot = false
	self.target.func = nil
	self.target.obj = nil
	self.use_frame = false
	self.unscaled = false
	self.started = false
	self.over = true
end

-- 复位：如果计时器是启动的，并不会停止，只是刷新倒计时
local function Reset(self)
	self.left = self.delay
end

-- 是否已经完成计时
local function IsOver(self)
	if self.target.func == nil then
		return true
	end
	if self.obj_not_nil and self.target.func == nil then
		return true
	end
	return self.over
end

Timer.__init = __init
Timer.Init = Init
Timer.Update = Update
Timer.Start = Start
Timer.Pause = Pause
Timer.Resume = Resume
Timer.Stop = Stop
Timer.Reset = Reset
Timer.IsOver = IsOver
return Timer;