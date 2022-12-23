<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel= "stylesheet" href="css/fontawesome/css/all.css">
    <link rel= "stylesheet" href="css/default.css">
    <style>
        *{
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }
        body{
            height: 100vh;
            background-image: url("./images/bg_image.JPG");
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
        }

        .card{
            box-shadow: 0px 3px 6px rgb(100, 153, 184);
        }
        .card .card-text{
            font-size: 16px;
        }


    </style>
    <title>Error</title>
</head>
<body class="d-flex align-items-center justify-content-center">

    <div class="card col-4 alert alert-danger border border-danger shadow">
        <h3 class="card-title">
            <i class="fa fa-window-close me-2"></i>Errors:
        </h3>

        <hr>
            <div class="card-body">
                <p class="card-text">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint harum repudiandae hic quis facilis, dolores sunt velit libero, aut animi earum quae asperiores, esse expedita perspiciatis molestias praesentium nulla. Deleniti!
                </p>

                <hr>
                <a href="/login" class="btn btn-sm btn-danger">
                    <i class="fa fa-arrow-alt-circle-left me-1"></i>Back
                </a>
            </div>

    </div>
</body>
</html>