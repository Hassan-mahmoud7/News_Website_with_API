<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    rel="stylesheet"
  />
    <title>429</title>
</head>

<body>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100vw;
            height: 100vh;
            padding: 0;
            margin: 0;
            background: #959595;
            flex-direction: column;
        }
        .container {
            width: 300px;
            height: 300px;
            border-radius: 10px;
            background: #111;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
        }
        .circle {
            position: relative;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: #333;
            box-shadow: 0 0 10px 5px rgba(255, 225, 0, 0.3), 0 0 100px 55px rgba(115, 227, 255, 0.3);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .circle span {
            font-size: 8px;
            font-weight: bold;
            color: #fff;
            z-index: 1;
        }
        .rounded {
            position: absolute;
            width: 150px;
            height: 30px;
            border-radius: 90px;
            background: #444;
            box-shadow: 0 0 0 5px #333;
            animation: rot 3s linear infinite;
        }
        @keyframes rot {
            100% {
                transform: rotate(360deg);
            }
        }
        .round-left {
            position: absolute;
            top: 0;
            left: 0;
            width: 75px;
            height: 30px;
            background: #ddd;
            border-radius: 30px 0 0 30px;
            animation: slid 1.5s linear infinite;
        }
        @keyframes slid {
            15% {
                border-radius: 0 30px 30px 0;
            }

            50% {
                transform: translateX(100%);
            }
        }
        .circle-t {
            position: absolute;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: #444;
            box-shadow: inset 0 0 10px rgba(255, 255, 255, 0.3);
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .page {
            font-weight: 600;
            color: #fdfdfd;
            text-align: center;
            margin-top: 1rem;
        }
        .back-home {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: 2px solid #222;
            color: #fff;
            text-transform: uppercase;
            font-weight: 600;
            padding: 0.75rem 1rem;
            transition: all 0.2s linear;
            box-shadow: 0 15px 15px -11px rgba(0, 0, 0, 0.4);
            background: #222;
            border-radius: 6px;
            width: auto;
            margin-top: 1rem;
        }
        .back-home:hover {
            background: #222;
            color: #ddd;
        }
        @media (max-width: 600px) {
            .container {
                width: 90%;
                height: 250px;
            }
            .circle {
                width: 50px;
                height: 50px;
            }
            .rounded {
                width: 120px;
                height: 25px;
            }
            .page {
                font-size: 1rem;
            }
            .back-home {
                padding: 0.5rem 0.75rem;
                font-size: 0.85rem;
            }
        }
    </style>

    <div class="container">
        <div class="circle">
            <span>Too many </span>
            <div class="rounded">
                <div class="round-left"></div>
                <div class="circle-t"></div>
            </div>
        </div>
    </div>
    <h2 class="page">Too many attempts. Please try again after <span id="countdown">{{ $time }}</span> seconds.</h2>
    <a href="{{ route('frontend') }}" class="back-home">Refresh</a>
    <script>
        let timeRemaining = parseInt(document.getElementById('countdown').innerText);
        const countdownInterval = setInterval(() => {
            if (timeRemaining > 0) {
                timeRemaining--;
                document.getElementById('countdown').innerText = timeRemaining;
            } else {
                clearInterval(countdownInterval);
                document.getElementById('countdown').innerText = "0";
            }
        }, 1000);
    </script>
</body>
