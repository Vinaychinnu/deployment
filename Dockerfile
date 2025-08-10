<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sliding Puzzle Game</title>
<style>
    body {
        font-family: Arial, sans-serif;
        display: flex;
        flex-direction: column;
        align-items: center;
        background: #f4f4f4;
        margin: 0;
        padding: 20px;
    }
    h1 {
        margin-bottom: 10px;
    }
    #puzzle {
        display: grid;
        grid-template-columns: repeat(3, 100px);
        grid-template-rows: repeat(3, 100px);
        gap: 5px;
    }
    .tile {
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 24px;
        font-weight: bold;
        background: #3498db;
        color: white;
        cursor: pointer;
        border-radius: 8px;
        transition: 0.2s;
    }
    .tile:active {
        transform: scale(0.95);
    }
    .empty {
        background: #ccc;
        cursor: default;
    }
    #message {
        margin-top: 20px;
        font-size: 18px;
        font-weight: bold;
        color: green;
    }
</style>
</head>
<body>

<h1>Sliding Puzzle</h1>
<div id="puzzle"></div>
<div id="message"></div>

<script>
    const puzzleContainer = document.getElementById("puzzle");
    const message = document.getElementById("message");
    let tiles = [...Array(8).keys()].map(n => n + 1); // [1,2,3,...,8]
    tiles.push(""); // empty space

    // Shuffle tiles
    function shuffle(array) {
        for (let i = array.length - 1; i > 0; i--) {
            let j = Math.floor(Math.random() * (i + 1));
            [array[i], array[j]] = [array[j], array[i]];
        }
        return array;
    }

    function drawPuzzle() {
        puzzleContainer.innerHTML = "";
        tiles.forEach((value, index) => {
            const tile = document.createElement("div");
            tile.classList.add("tile");
            if (value === "") {
                tile.classList.add("empty");
            } else {
                tile.textContent = value;
                tile.addEventListener("click", () => moveTile(index));
            }
            puzzleContainer.appendChild(tile);
        });
    }

    function moveTile(index) {
        const emptyIndex = tiles.indexOf("");
        const validMoves = [emptyIndex - 1, emptyIndex + 1, emptyIndex - 3, emptyIndex + 3];
        if (validMoves.includes(index) && isAdjacent(index, emptyIndex)) {
            [tiles[index], tiles[emptyIndex]] = [tiles[emptyIndex], tiles[index]];
            drawPuzzle();
            checkWin();
        }
    }

    function isAdjacent(index1, index2) {
        if (index1 === index2 - 1 && index2 % 3 !== 0) return true;
        if (index1 === index2 + 1 && index1 % 3 !== 0) return true;
        if (index1 === index2 - 3 || index1 === index2 + 3) return true;
        return false;
    }

    function checkWin() {
        if (tiles.slice(0, 8).every((val, i) => val === i + 1) && tiles[8] === "") {
            message.textContent = "🎉 You Win!";
        } else {
            message.textContent = "";
        }
    }

    tiles = shuffle(tiles);
    drawPuzzle();
</script>

</body>
</html>

