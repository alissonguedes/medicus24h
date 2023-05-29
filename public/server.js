const express = require('express')
const app = express()

const fs = require('fs');
// const https_options = {
// key: fs.readFileSync('/etc/letsencrypt/live/cliniccloud.com.br/privkey.pem'),
// cert: fs.readFileSync('/etc/letsencrypt/live/cliniccloud.com.br/fullchain.pem'),
// }

// const server = require('https').Server(https_options, app)
const server = require('http').Server(app)
const io = require('socket.io')(server)
const {
	v4: uuidV4
} = require('uuid')

app.set('view engine', 'ejs')
app.use(express.static('public'))

app.get('/', (req, res) => {
	res.redirect(`/${uuidV4()}`)
})

app.get('/:room', (req, res) => {
	res.render('room', {
		roomId: req.params.room
	})
})

io.on('connection', socket => {
	socket.on('join-room', (roomId, userId) => {

		console.log(userId);
		socket.join(roomId)
		socket.to(roomId).broadcast.emit('user-connected', userId)

		socket.on('disconnect', () => {
			socket.to(roomId).broadcast.emit('user-disconnected', userId)
		})
	})
})

server.listen(3000);
