--[[
-- added by wsh @ 2017-12-18
-- 定时器管理：负责定时器获取、回收、缓存、调度等管理
-- 注意：
-- 1、任何需要定时更新的函数从这里注册，游戏逻辑层最好使用不带"Co"的接口
-- 2、带有"Co"的接口都是用于协程，它的调度会比普通更新后一步---次序依从Unity函数调用次序：https://docs.unity3d.com/Manual/ExecutionOrder.html
-- 3、UI界面倒计时刷新等不需要每帧去更新的逻辑最好用定时器，少用Updatable，定时器能很好避免频繁的无用调用
-- 4、定时器并非精确定时，误差范围和帧率相关
-- 5、循环定时器不会累积误差，这点和Updater的Update函数自己去控制时间刷新是一致的，很好用
-- 6、定时器是weak表，使用临时对象时不会持有引用
-- 7、慎用临时函数、临时闭包，所有临时对象要外部自行维护引用以保障生命周期，否则会被GC掉===>很重要***
-- 8、考虑到定时器可能会被频繁构造、回收，这里已经做了缓存池优化
--]]

local Messenger = require "Framework.Common.Messenger"
local TimerManager = BaseClass("TimerManager", Singleton)
local UpdateMsgName = "Update"

-- 构造函数
local function __init(self)
	-- 成员变量
	-- handle
	self.__update_handle = nil
	self.__lateupdate_handle = nil
	self.__fixedupdate_handle = nil
	self.__coupdate_handle = nil
	self.__colateupdate_handle = nil
	self.__cofixedupdate_handle = nil
	-- 定时器列表
	self.__update_timer = {}
	self.__lateupdate_timer = {}
	self.__fixedupdate_timer = {}
	self.__coupdate_timer = {}
	self.__colateupdate_timer = {}
	self.__cofixedupdate_timer = {}
	-- 定时器缓存
	self.__pool = {}
	-- 要停止的定时器
	self.__to_stop = {}
end

-- 获取delta
local function GetDelta(timer, is_fixed)
	local delta = nil
	if timer.use_frame then
		delta = 1
	elseif is_fixed then
		delta = Time.fixedDeltaTime
	else
		delta = not timer.unscaled and Time.deltaTime or Time.unscaledDeltaTime
	end
	return delta
end

-- 延后回收定时器
-- 这里有个很坑的问题，一帧内定时器被回收然后马上又被复用，会导致更新函数出错，所以需要延后回收
local function DoDelayRecycle(self)
	for i,v in pairs(self.__to_stop) do 
		table.insert(self.__pool, v)
		self.__to_stop[i] = nil
	end
end

-- Update回调
local function UpdateHandle(self)
	-- 更新定时器
	for timer,_ in pairs(self.__update_timer) do
		timer:Update(GetDelta(timer, false))
		if timer:IsOver() then
			self:RemoveTimer(timer)
		end
	end
	DoDelayRecycle(self)
end

-- LateUpdate回调
local function LateUpdateHandle(self)
	-- 更新定时器
	for timer,_ in pairs(self.__lateupdate_timer) do
		timer:Update(GetDelta(timer, false))
		if timer:IsOver() then
			self:RemoveLateTimer(timer)
		end
	end
	DoDelayRecycle(self)
end

-- FixedUpdate回调
local function FixedUpdateHandle(self)
	-- 更新定时器
	for timer,_ in pairs(self.__fixedupdate_timer) do
		timer:Update(GetDelta(timer, true))
		if timer:IsOver() then
			self:RemoveFixedTimer(timer)
		end
	end
	DoDelayRecycle(self)
end

-- CoUpdate回调
local function CoUpdateHandle(self)
	-- 更新定时器
	for timer,_ in pairs(self.__coupdate_timer) do
		timer:Update(GetDelta(timer, false))
		if timer:IsOver() then
			self:RemoveCoTimer(timer)
		end
	end
	DoDelayRecycle(self)
end

-- CoLateUpdate回调
local function CoLateUpdateHandle(self)
	-- 更新定时器
	for timer,_ in pairs(self.__colateupdate_timer) do
		timer:Update(GetDelta(timer, false))
		if timer:IsOver() then
			self:RemoveCoLateTimer(timer)
		end
	end
	DoDelayRecycle(self)
end

-- CoFixedUpdate回调
local function CoFixedUpdateHandle(self)
	-- 更新定时器
	for timer,_ in pairs(self.__cofixedupdate_timer) do
		timer:Update(GetDelta(timer, true))
		if timer:IsOver() then
			self:RemoveCoFixedTimer(timer)
		end
	end
	DoDelayRecycle(self)
end

-- 启动
local function Startup(self)
	self:Dispose()
	self.__update_handle = UpdateBeat:CreateListener(UpdateHandle, TimerManager:GetInstance())
	self.__lateupdate_handle = LateUpdateBeat:CreateListener(LateUpdateHandle, TimerManager:GetInstance())
	self.__fixedupdate_handle = FixedUpdateBeat:CreateListener(FixedUpdateHandle, TimerManager:GetInstance())
	self.__coupdate_handle = CoUpdateBeat:CreateListener(CoUpdateHandle, TimerManager:GetInstance())
	self.__colateupdate_handle = CoLateUpdateBeat:CreateListener(CoLateUpdateHandle, TimerManager:GetInstance())
	self.__cofixedupdate_handle = CoFixedUpdateBeat:CreateListener(CoFixedUpdateHandle, TimerManager:GetInstance())
	UpdateBeat:AddListener(self.__update_handle)
	LateUpdateBeat:AddListener(self.__lateupdate_handle)
	FixedUpdateBeat:AddListener(self.__fixedupdate_handle)
	CoUpdateBeat:AddListener(self.__coupdate_handle)
	CoLateUpdateBeat:AddListener(self.__colateupdate_handle)
	CoFixedUpdateBeat:AddListener(self.__cofixedupdate_handle)
end

-- 释放
local function Dispose(self)
	if self.__update_handle ~= nil then
		UpdateBeat:RemoveListener(self.__update_handle)
		self.__update_handle = nil
	end
	if self.__lateupdate_handle ~= nil then
		LateUpdateBeat:RemoveListener(self.__lateupdate_handle)
		self.__lateupdate_handle = nil
	end
	if self.__fixedupdate_handle ~= nil then
		FixedUpdateBeat:RemoveListener(self.__fixedupdate_handle)
		self.__fixedupdate_handle = nil
	end
	if self.__coupdate_handle ~= nil then
		CoUpdateBeat:RemoveListener(self.__coupdate_handle)
		self.__coupdate_handle = nil
	end
	if self.__colateupdate_handle ~= nil then
		CoLateUpdateBeat:RemoveListener(self.__colateupdate_handle)
		self.__colateupdate_handle = nil
	end
	if self.__cofixedupdate_handle ~= nil then
		CoFixedUpdateBeat:RemoveListener(self.__cofixedupdate_handle)
		self.__cofixedupdate_handle = nil
	end
end

-- 清理：可用在场景切换前，不清理关系也不大，只是缓存池不会下降
local function Cleanup(self)
	self.__update_timer = {}
	self.__lateupdate_timer = {}
	self.__fixedupdate_timer = {}
	self.__coupdate_timer = {}
	self.__colateupdate_timer = {}
	self.__cofixedupdate_timer = {}
	self.__pool = {}
	self.__to_stop = {}
end

-- 获取定时器
local function GetTimer(self, delay, func, obj, one_shot, use_frame, unscaled)
	local timer = nil
	if table.length(self.__pool) > 0 then
		timer = table.remove(self.__pool)
		if delay and func then
			timer:Init(delay, func, obj, one_shot, use_frame, unscaled)
		end
	else
		timer = Timer.New(delay, func, obj, one_shot, use_frame, unscaled)
	end
	return timer
end

-- 回收定时器
local function RecycleTimer(self, timer)
	timer:Stop()
	table.insert(self.__to_stop, timer)
end

-- 添加Update定时器
local function AddTimer(self, delay, func, obj, one_shot, use_frame, unscaled)
	assert(not self.__update_timer[timer])
	local timer = GetTimer(self, delay, func, obj, one_shot, use_frame, unscaled)
	self.__update_timer[timer] = true
	return timer
end

-- 添加LateUpdate定时器
local function AddLateTimer(self, delay, func, obj, one_shot, use_frame, unscaled)
	assert(not self.__lateupdate_timer[timer])
	local timer = GetTimer(self, delay, func, obj, one_shot, use_frame, unscaled)
	self.__lateupdate_timer[timer] = true
	return timer
end

-- 添加FixedUpdate定时器
local function AddFixedTimer(self, delay, func, obj, one_shot, use_frame)
	assert(not self.__fixedupdate_timer[timer])
	local timer = GetTimer(self, delay, func, obj, one_shot, use_frame, false)
	self.__fixedupdate_timer[timer] = true
	return timer
end

-- 添加CoUpdate定时器
local function AddCoTimer(self, delay, func, obj, one_shot, use_frame, unscaled)
	assert(not self.__coupdate_timer[timer])
	local timer = GetTimer(self, delay, func, obj, one_shot, use_frame, unscaled)
	self.__coupdate_timer[timer] = true
	return timer
end

-- 添加CoLateUpdate定时器
local function AddCoLateTimer(self, delay, func, obj, one_shot, use_frame, unscaled)
	assert(not self.__colateupdate_timer[timer])
	local timer = GetTimer(self, delay, func, obj, one_shot, use_frame, unscaled)
	self.__colateupdate_timer[timer] = true
	return timer
end

-- 添加CoFixedUpdate定时器
local function AddCoFixedTimer(self, delay, func, obj, one_shot, use_frame)
	assert(not self.__cofixedupdate_timer[timer])
	local timer = GetTimer(self, delay, func, obj, one_shot, use_frame, unscaled)
	self.__cofixedupdate_timer[timer] = true
	return timer
end

-- 移除Update定时器
local function RemoveTimer(self, timer)
	if timer and self.__update_timer[timer] then
		RecycleTimer(self, timer)
		self.__update_timer[timer] = nil
	end
end

-- 移除LateUpdate定时器
local function RemoveLateTimer(self, timer)
	if timer and self.__lateupdate_timer[timer] then
		RecycleTimer(self, timer)
		self.__lateupdate_timer[timer] = nil
	end
end
	
-- 移除FixedUpdate定时器
local function RemoveFixedTimer(self, timer)
	if timer and self.__fixedupdate_timer[timer] then
		RecycleTimer(self, timer)
		self.__fixedupdate_timer[timer] = nil
	end
end

-- 移除CoUpdate定时器
local function RemoveCoTimer(self, timer)
	if timer and self.__coupdate_timer[timer] then
		RecycleTimer(self, timer)
		self.__coupdate_timer[timer] = nil
	end
end

-- 移除CoLateUpdate定时器
local function RemoveCoLateTimer(self, timer)
	if timer and self.__colateupdate_timer[timer] then
		RecycleTimer(self, timer)
		self.__colateupdate_timer[timer] = nil
	end
end

-- 移除CoFixedUpdate定时器
local function RemoveCoFixedTimer(self, timer)
	if timer and self.__cofixedupdate_timer[timer] then
		RecycleTimer(self, timer)
		self.__cofixedupdate_timer[timer] = nil
	end
end

-- 析构函数
local function __delete(self)
	self:Cleanup()
	self.__update_handle = nil
	self.__lateupdate_handle = nil
	self.__fixedupdate_handle = nil
	self.__coupdate_handle = nil
	self.__colateupdate_handle = nil
	self.__cofixedupdate_handle = nil
	self.__update_timer = nil
	self.__lateupdate_timer = nil
	self.__fixedupdate_timer = nil
	self.__coupdate_timer = nil
	self.__colateupdate_timer = nil
	self.__cofixedupdate_timer = nil
	self.__pool = nil
end

TimerManager.__init = __init
TimerManager.Startup = Startup
TimerManager.Cleanup = Cleanup
TimerManager.Dispose = Dispose
TimerManager.AddTimer = AddTimer
TimerManager.AddLateTimer = AddLateTimer
TimerManager.AddFixedTimer = AddFixedTimer
TimerManager.AddCoTimer = AddCoTimer
TimerManager.AddCoLateTimer = AddCoLateTimer
TimerManager.AddCoFixedTimer = AddCoFixedTimer
TimerManager.RemoveTimer = RemoveTimer
TimerManager.RemoveLateTimer = RemoveLateTimer
TimerManager.RemoveFixedTimer = RemoveFixedTimer
TimerManager.RemoveCoTimer = RemoveCoTimer
TimerManager.RemoveCoLateTimer = RemoveCoLateTimer
TimerManager.RemoveCoFixedTimer = RemoveCoFixedTimer
TimerManager.__delete = __delete
return TimerManager;