<!DOCTYPE html>
<html lang="en">

<head>
    <title>Halaman Login</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="container">
        <div class="formGambar">
            <img src="gambar/gambarBackgroundProfile.jpg">
            <div class="formJudul">
                <img src="gambar/gambarLogo.jpg">
                <label><b> Universitas XYZ </b></label>
            </div>
        </div>
        <div class="formLogin">
            <h5><b>LOGIN SISTEM AKADEMIK</b></h5>
            <form action="halamanDashboard.php">
                <div class="gambar1">
                    <img src="gambar/gambarUsername.png">
                    <label><b> Username </b></label><br>
                    <input type="text" name="username" placeholder="Masukkan NIM atau NID" required="required"><br><br>
                </div>
                <div class="gambar2">
                    <img src="gambar/gambarPassword.png">
                    <label><b> Password </b></label><br>
                    <input type="password" name="password" placeholder="Masukkan Password" required="required">
                </div>
                <button type="submit" class="btn btn-success">Login</button>
            </form>
        </div>
    </div>
</body>

</html>