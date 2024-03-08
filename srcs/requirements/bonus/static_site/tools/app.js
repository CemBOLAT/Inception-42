const express = require('express');
const app = express();

// index.html dosyasını yayınla
app.use(express.static('public'));

app.listen(3030, () => {
    console.log("Sunucu 3030 portunda çalışıyor");
});

