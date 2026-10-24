-- GEO location module

local geolocationkModule = {} -- Here we store all the functions

local geolocationList = {} -- Here we store all the new geolocations


function geolocationkModule:new(x, y, fontFamily, fontSize, fontColor, scale)
	newGeolocation = {}
	newGeolocation.x = x
	newGeolocation.y = y
	newGeolocation.fontFamily = fontFamily
	newGeolocation.fontSize = fontSize
	newGeolocation.fontColor = fontColor
	newGeolocation.scale = scale
	
	
	function newGeolocation:setFont()
		self.font = love.graphics.newFont(
			self.fontFamily,
			self.fontSize * self.scale
		)
	end
	
	function newGeolocation:setFontColor(fontColor)
		self.fontColor = fontColor
	end
	
	function newGeolocation:setScale(scale)
		self.scale = scale
		self:setFont() -- Reinit font for font size
	end
	
	
	newGeolocation:setFont()
	
	table.insert(geolocationList, newGeolocation)
	
	
	return newGeolocation
end


function geolocationkModule:update(dt) -- Put this in love.update()
	for i, geolocationkElement in ipairs(geolocationList) do
	
	end
end

function geolocationkModule:draw() -- Put this in love.draw()
	local r, g, b, a = love.graphics.getColor()

	for i, geolocationkElement in ipairs(geolocationList) do
		love.graphics.setColor(1, 1, 1)
		
		
		geoText = "49,52° N\n11,2° O"
		
		
		love.graphics.setFont(geolocationkElement.font)
		
		fontHeight = love.graphics:getFont():getHeight()
		fontWidth = love.graphics:getFont():getWidth(geoText)
		
		love.graphics.setColor(geolocationkElement.fontColor)
		love.graphics.print(
			geoText,
			geolocationkElement.x * geolocationkElement.scale,
			geolocationkElement.y * geolocationkElement.scale
		)
	end
	
	love.graphics.setColor(r, g, b, a)
end


return geolocationkModule
