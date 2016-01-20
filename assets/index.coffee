$ = require('jquery');
_ = require('lodash');
require('./tweenmax');
class Shower
	constructor: (options) ->
		opt = {
			'speed': 10,
			'items': []
		}
		@opt = _.extend({}, opt, options)
		@initialState()
		@start()

	random: (min, max) ->
	  Math.floor Math.random() * (1 + max - min) + min

	move: ->
		random = @random
		speed = @opt.speed
		@tl = tl = new TimelineMax(repeat: -1)
		@dots.each ->
		  tl.add TweenMax.fromTo(@, speed,
			left: random(0, 100) + "%"
			top: random(0, 100) + "%"
			z: random(-725, 600)
			opacity: Math.random()
		  ,
			left: "+=" + random(10, 3) + "%"
			top: "+=" + random(10, 100) + "%"
			z: "+=" + random(725, 600)
			opacity: Math.random() + 0.1
			repeat: 1
			yoyo: false
			ease: Sine.easeInOut
	  ), 0

	initialState: ->
		@state = {'pause': false}

	regiterEvent: ->
		@state
		$(".container").on 'click', =>
			if @state.pause 
				@tl.play()
			else
				@tl.pause()
			@state.pause = !@state.pause

	render: ->
		@container = $(".container")
		items = @opt.items
		i = 0
		html = ''
		_.forEach items, (item) ->
			html += "<div class='bubble'><img src=#{item} width=50 height=50></img></div>"
			i++
		@dots = $(html).appendTo(@container)

	start: ->
		@render()
		@regiterEvent()
		@move()
		
window.Shower = Shower
