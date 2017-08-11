return setmetatable({
		lockbox = nil
	}, {
	__call = function(this)
		assert(this.lockbox and this.lockbox.ALLOW_INSECURE or false,"This module is insecure!  It should not be used in production.  If you really want to use it, set Lockbox.ALLOW_INSECURE to true before importing it");
	end
})