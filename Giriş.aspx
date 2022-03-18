<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Giriş.aspx.cs" Inherits="lastik.Giriş" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> </script>
    <script src="	https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Tahoma, Verdana, Segoe, sans-serif;
            font-size: 14px;
            background: #f6fffd;
            padding: 20px;
            text-align: center;
        }

        .wrapper {
            width: 250px;
            height: 350px;
            margin: 60px auto;
            perspective: 600px;
            text-align: left;
        }

        .rec-prism {
            width: 100%;
            height: 100%;
            position: relative;
            transform-style: preserve-3d;
            transform: translateZ(-100px);
            transition: transform 0.5s ease-in;
        }

        .face {
            position: absolute;
            width: 250px;
            height: 500px;
            padding: 20px;
            background: rgba(250, 250, 250, 0.96);
            border: 3px solid #07ad90;
            border-radius: 3px;
        }

            .face .content {
                color: #666;
            }

                .face .content h2 {
                    font-size: 1.2em;
                    color: #07ad90;
                }

                .face .content .field-wrapper {
                    margin-top: 30px;
                    position: relative;
                }

                    .face .content .field-wrapper label {
                        position: absolute;
                        pointer-events: none;
                        font-size: 0.85em;
                        top: 40%;
                        left: 0;
                        transform: translateY(-50%);
                        transition: all ease-in 0.25s;
                        color: #999999;
                    }

                    .face .content .field-wrapper input[type=text], .face .content .field-wrapper input[type=password], .face .content .field-wrapper input[type=submit], .face .content .field-wrapper textarea {
                        -webkit-appearance: none;
                    }

                        .face .content .field-wrapper input[type=text]:focus, .face .content .field-wrapper input[type=password]:focus, .face .content .field-wrapper input[type=submit]:focus, .face .content .field-wrapper textarea:focus {
                            outline: none;
                        }

                    .face .content .field-wrapper input[type=text], .face .content .field-wrapper input[type=password], .face .content .field-wrapper textarea {
                        width: 100%;
                        border: none;
                        background: transparent;
                        line-height: 2em;
                        border-bottom: 1px solid #07ad90;
                        color: #666;
                    }

                        .face .content .field-wrapper input[type=text]::-webkit-input-placeholder, .face .content .field-wrapper input[type=password]::-webkit-input-placeholder, .face .content .field-wrapper textarea::-webkit-input-placeholder {
                            opacity: 0;
                        }

                        .face .content .field-wrapper input[type=text]::-moz-placeholder, .face .content .field-wrapper input[type=password]::-moz-placeholder, .face .content .field-wrapper textarea::-moz-placeholder {
                            opacity: 0;
                        }

                        .face .content .field-wrapper input[type=text]:-ms-input-placeholder, .face .content .field-wrapper input[type=password]:-ms-input-placeholder, .face .content .field-wrapper textarea:-ms-input-placeholder {
                            opacity: 0;
                        }

                        .face .content .field-wrapper input[type=text]:-moz-placeholder, .face .content .field-wrapper input[type=password]:-moz-placeholder, .face .content .field-wrapper textarea:-moz-placeholder {
                            opacity: 0;
                        }

                        .face .content .field-wrapper input[type=text]:focus + label, .face .content .field-wrapper input[type=text]:not(placeholder-shown) + label, .face .content .field-wrapper input[type=password]:focus + label, .face .content .field-wrapper input[type=password]:not(placeholder-shown) + label, .face .content .field-wrapper textarea:focus + label, .face .content .field-wrapper textarea:not(placeholder-shown) + label {
                            top: -35%;
                            color: #42509e;
                        }

                    .face .content .field-wrapper input[type=submit] {
                        -webkit-appearance: none;
                        cursor: pointer;
                        width: 100%;
                        background: #07ad90;
                        line-height: 2em;
                        color: #fff;
                        border: 1px solid #07ad90;
                        border-radius: 3px;
                        padding: 5px;
                    }

                        .face .content .field-wrapper input[type=submit]:hover {
                            opacity: 0.9;
                        }

                        .face .content .field-wrapper input[type=submit]:active {
                            transform: scale(0.96);
                        }

                    .face .content .field-wrapper textarea {
                        resize: none;
                        line-height: 1em;
                    }

                        .face .content .field-wrapper textarea:focus + label, .face .content .field-wrapper textarea:not(placeholder-shown) + label {
                            top: -25%;
                        }

            .face .thank-you-msg {
                position: absolute;
                width: 200px;
                height: 130px;
                text-align: center;
                font-size: 2em;
                color: #07ad90;
                left: 50%;
                top: 50%;
                -webkit-transform: translate(-50%, -50%);
            }

                .face .thank-you-msg:after {
                    position: absolute;
                    content: "";
                    width: 50px;
                    height: 25px;
                    border: 10px solid #07ad90;
                    border-right: 0;
                    border-top: 0;
                    left: 50%;
                    top: 50%;
                    -webkit-transform: translate(-50%, -50%) rotate(0deg) scale(0);
                    transform: translate(-50%, -50%) rotate(0deg) scale(0);
                    -webkit-animation: success ease-in 0.15s forwards;
                    animation: success ease-in 0.15s forwards;
                    animation-delay: 2.5s;
                }

        .face-front {
            transform: rotateY(0deg) translateZ(125px);
        }

        .face-top {
            height: 250px;
            transform: rotateX(90deg) translateZ(125px);
        }

        .face-back {
            transform: rotateY(180deg) translateZ(125px);
        }

        .face-right {
            transform: rotateY(90deg) translateZ(125px);
        }

        .face-left {
            transform: rotateY(-90deg) translateZ(125px);
        }

        .face-bottom {
            height: 250px;
            transform: rotateX(-90deg) translateZ(225px);
        }

        .nav {
            margin: 20px 0;
            padding: 0;
        }

            .nav li {
                display: inline-block;
                list-style-type: none;
                font-size: 1em;
                margin: 0 10px;
                color: #42509e;
                position: relative;
                cursor: pointer;
            }

                .nav li:after {
                    content: "";
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    width: 20px;
                    border-bottom: 1px solid #42509e;
                    transition: all ease-in 0.25s;
                }

                .nav li:hover:after {
                    width: 100%;
                }

        .psw, .signup, .singin {
            display: block;
            margin: 20px 0;
            font-size: 0.75em;
            text-align: center;
            color: #42509e;
            cursor: pointer;
        }

        small {
            font-size: 0.7em;
        }

        @-webkit-keyframes success {
            from {
                -webkit-transform: translate(-50%, -50%) rotate(0) scale(0);
            }

            to {
                -webkit-transform: translate(-50%, -50%) rotate(-45deg) scale(1);
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <ul class="nav">
        <li onclick="showLogin()">Giriş Yap</li>
        <li onclick="showSignup()">Kayıt Ol</li>
        <li onclick="showForgotPassword()">Şifremi Unuttum</li>
    </ul>
    <div class="wrapper">
        <div class="rec-prism">
            <div class="face face-top">
                <div class="content">
                    <form onsubmit="event.preventDefault()">
                        <div class="field-wrapper">
                        </div>
                        <div class="field-wrapper">
                            <input type="submit">
                        </div>
                    </form>
                </div>
            </div>
            <div class="face face-front">
                <div class="content">
                    <h2 style="margin-left: 55px">Oturum Aç</h2>
                    <form onsubmit="event.preventDefault()">
                        <div class="field-wrapper">
                              <input type="text" id="kAdi" />
                            <label>
                                Kullanıcı Adı
                            </label>
                        </div>
                        <div class="field-wrapper">
                            <input type="password" id="ksifre" />
                            <label>Şifre</label>
                        </div>
                        <div class="field-wrapper">
                            <input type="submit" value="Giriş Yap" id="Giriş_Buttonu" onclick="">
                        </div>
                        <span class="psw" onclick="showForgotPassword()">Şifrenizi Mi Unuttunuz?   </span>
                        <span class="signup" onclick="showSignup()">Hesabınız Yok Mu? Hesap Oluştur</span>
                    </form>
                </div>
            </div>
            <div class="face face-back">
                <div class="content">
                    <h2>Şifrenizi Mi Unuttunuz?</h2>
                    <small>Enter your email so we can send you a reset link for your password</small>
                    <form onsubmit="event.preventDefault()">
                        <div class="field-wrapper">
                            <input type="text" name="email" placeholder="email">
                            <label>Kullanıcı Adınıızı Giriniz</label>
                        </div>
                        <div class="field-wrapper">
                            <input type="submit" value="Oluştur">
                        </div>
                    </form>
                </div>
            </div>
            <div class="face face-right ">
                <div class="content">
                    <h2 style="margin-left: 20px">Hesabınızı Oluşturun</h2>
                    <form onsubmit="event.preventDefault()">
                        <div class="field-wrapper">
                            <input id="nkadi" required="required" type="text" placeholder="Ad">
                            <label>Ad:</label>
                        </div>
                        <div class="field-wrapper">
                            <input id="nksoyadi" required="required" type="text" placeholder="Soyad">
                            <label>Soyad:</label>
                        </div>
                        <div class="field-wrapper">
                            <input id="nkkadi" required="required" type="text" placeholder="Şifre">
                            <label>Kullanıcı Adı:</label>
                        </div>
                        <div class="field-wrapper">
                            <input id="nksfire" required="required" type="password" name="password1" placeholder="Şifre">
                            <label>Şifre:</label>
                        </div>
                        <div class="field-wrapper">
                            <input id="nksifretekrar" required="required" type="password" name="passwordw" placeholder="Şifre Tekrar">
                            <label>Şifre Tekrar:</label>
                        </div>
                        <div class="field-wrapper">
                            <input type="submit" onclick="Kontrol" value="Oluştur">
                        </div>
                        <span style="margin-bottom: auto" class="singin" onclick="showLogin()">Bir Hesabınız Var mı?  Giriş Yap</span>
                    </form>
                </div>
            </div>




        </div>
    </div>

    <script type="text/javascript">
        var yeniKullanıcıAdı = document.getElementById('nkadi')
        var yeniKullanıcıSoyadı = document.getElementById('nksoyadi')
        var yeniKullanıcıID = document.getElementById('nkkadi')
        var yenikullanıcısifre = document.getElementById('nksifre')
        var yenikullanıcısifretekrar = document.getElementById('nksifretekrar')
        var kullanıcıGirisadi = document.getElementById('kAdi')
        var kullanıcıGirissifresi = document.getElementById('ksifre')

        $(document).ready(function () {
            console.log("asd")
            $('input[id=Giriş_Buttonu]').click(function () {
                $.ajax({
                    url: 'Giriş.aspx/Eczane_Getir',
                    dataType: 'json',
                    type: 'POST',
                    data: "{'Kullanıcı_Adı':'" + $('input[id=kAdi]').val() + "','Şifre':'" + $('input[id=ksifre]').val()+"'}",
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {

                        var temp = JSON.parse(data.d)
                        console.log(data.d)
                        if (temp.length > 0) {
                            
                            window.close("Giriş.aspx");
                            window.open("LastikAnasayfa.aspx");

                        }
                        else {
                            alert("Kullanıcı adı veya Şifre yanlış");
                        }
                    },
                    error: function () {

                        alert('Talep esnasında sorun oluştu.Yeniden deneyin');

                    }
                });
            })

        })
      
        function den() {
         
            if (kullanıcıGirisadi.length == 0) {
                alert('Bu alan boş bırakılamaz');
            }else if (kullanıcıGirissifresi.length == 0) {
                alert('Bu alan boş bırakılamaz');
            }
            

        }




        let prism = document.querySelector(".rec-prism");

        function showSignup() {
            prism.style.transform = "translateZ(-100px) rotateY( -90deg)";

        }
        function showLogin() {
            prism.style.transform = "translateZ(-100px)";


        }
        function showForgotPassword() {
            prism.style.transform = "translateZ(-100px) rotateY( -180deg)";
        }





        function showThankYou() {
            prism.style.transform = "translateZ(-100px) rotateX( 90deg)";

        }


        function KullanıcıGirisDenetleme() {


        }
    </script>

</asp:Content>
