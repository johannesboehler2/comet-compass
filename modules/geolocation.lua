-- Copyright 2026 Johannes Böhler
 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.


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
