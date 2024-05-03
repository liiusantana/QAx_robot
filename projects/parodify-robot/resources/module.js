async function MockMySong(page) {
    const testData = {
        "id": 1,
        "title": "Smells Like Test Script",
        "artist": "Nullvana",
        "description": "Nullvana",
        "image": "https://raw.githubusercontent.com/qaxperience/mock/main/covers/nevertesting.jpg",
        "type": "album",
        "src": "https://raw.githubusercontent.com/qaxperience/mock/main/songs/nirvana.mp3"
      }
   await page.route('**/songs', route =>route.fulfill({
    status: 200,
    body: JSON.stringify([testData])
   }))
  }

  exports.__esModule = true;
  exports.MockMySong = MockMySong;