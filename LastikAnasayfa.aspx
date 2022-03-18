<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="LastikAnasayfa.aspx.cs" Inherits="lastik.LastikAnasayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="//cdn.datatables.net/plug-ins/1.10.25/i18n/Turkish.json"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">
    <link rel="stylesheet" href="./styles/style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.21/js/jquery.dataTables.min.js" integrity="sha512-BkpSL20WETFylMrcirBahHfSnY++H2O1W+UnEEO4yNIl+jI2+zowyoGJpbtk6bx97fBXf++WJHSSK2MV4ghPcg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.0/pdfmake.min.js" integrity="sha512-3KEActb4EdIUU0uR38GT+fwQoGE6NgQtklBmK5FR0hg/KsrpnD27V5o8I6/E5lpcdO0BCulWuQuhyuhR4IlD3w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.datatables.net/autofill/2.3.7/css/autoFill.dataTables.min.css"></script>
    <script src="https://cdn.datatables.net/autofill/2.3.7/js/dataTables.autoFill.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript">




        $(document).ready(function () {


            $.ajax({


                url: "LastikAnasayfa.aspx",
                dataType: 'json',
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var temp = JSON.parse(data.d)
                    for (var i = 0; i < temp.length + 1; i++) {
                        var incele = $("a[id=incele]")
                        incele.click(function () {

                            $('#modalaç').modal('show')
                            $('#cinsro').append(temp[i].Lastik_Cinsi)
                            $('#markaro').append(temp[i].Lastik_Markası)
                            $('#boyutro').append(temp[i].Lastik_Boyutu)
                            $('#calendarro').append(temp[i].Alındığı_Tarih)
                            $('#tablo').append('<tr>' + + '</tr>')
                        })

                        $('#tablo').append('<td>' + temp[i].Lastik_Cinsi + '</td>')
                        $('#tablo').append('<td>' + temp[i].Lastik_Markası + '</td>')
                        $('#tablo').append('<td>' + temp[i].Lastik_Boyutu + '</td>')
                        $('#tablo').append('<td>' + temp[i].Alındığı_Tarih + '</td>')
                        $('#tablo').append('<td>' + '<a style="font-size: 20px;" id="incele"><i class="fa fa-info"></i></a>' + '</td>')
                        $('#tablo').append('<tr>' + + '</tr>')

                    }

                },
                error: function () {
                    
                    alert('Talep esnasında sorun oluştu.Yeniden deneyin');

                }
            });






            var markası = document.getElementById("marka")


            var cinsi = document.getElementById("cins")


            var boyutu = document.getElementById("boyut")


            var tarih = document.getElementById("calendar")


            var modalekle = $("a[id=modalekle]")
            modalekle.click(function () {

                $('#modalaç').modal('show')

            })


            var boşbuton = $("button[id=boşbuton]")
            boşbuton.click(function () {

                $('#tablo').append('<td>' + cinsi.value + '</td>')
                $('#tablo').append('<td>' + markası.value + '</td>')
                $('#tablo').append('<td>' + boyutu.value + '</td>')
                $('#tablo').append('<td>' + tarih.value + '</td>')
                $('#tablo').append('<td>' + '<a style="font-size: 20px;" id="modalekle"><i class="fa fa-info"></i></a>' + '</td>')
                $('#tablo').append('<tr>' + + '</tr>')



                var userDetails = {};

                userDetails.cins = $("#cins").val();
                userDetails.marka = $("#marka").val();
                userDetails.boyut = $("#boyut").val();
                userDetails.calendar = $("#calendar").val();

                var jsonData = JSON.stringify({
                    userDetails: userDetails
                });
                $.ajax({


                    url: "LastikAnasayfa.aspx/addLastik",
                    dataType: 'json',
                    type: 'POST',
                    data: '{"cins":"' + $("#cins").val() + '","marka":"' + $("#marka").val() + '","boyut":"' + $("#boyut").val() + '","calendar":"' + $("#calendar").val() + '"}',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                       

                    },
                    error: function () {
                       
                        alert('Talep esnasında sorun oluştu.Yeniden deneyin');

                    }
                    
                });
              <%--  $.ajax({
                    type: "POST",
                    url: '<%= ResolveUrl("LastikAnasayfa.aspx/addLastik") %>',
                    data: '{"cins":"' + $("#cins").val() + '","marka":"' + $("#marka").val() + '","boyut":"' + $("#boyut").val() + '","calendar":"' + $("#calendar").val()+'"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccess,
                    error: OnErrorCall
                });--%>

                function OnSuccess(response) {
                    var result = response.d;
                    if (result == "success") {
                        $("#msg").html("New record addded successfully  :)").css("color", "green");
                    }
                    $("#cins").val("");
                    $("#marka").val("");
                    $("#boyut").val("");
                    $("#calendar").val("");
                }

                function OnErrorCall(response) {
                    $("#msg").html("Error occurs  :(").css("color", "red");
                }

            })

            $('#myTable').DataTable({
                "language": {
                    "url": "https://cdn.datatables.net/plug-ins/1.10.25/i18n/Turkish.json"
                }
            });



        });




        function generateQRCode() {

            var markası = document.getElementById("marka")


            var cinsi = document.getElementById("cins")


            var boyutu = document.getElementById("boyut")


            var tarih = document.getElementById("calendar")

            var qrtext = 'Lastik Markası : ' + markası.value + '\nLastik Cinsi : ' + cinsi.value + '\nLastik Boyutu : ' + boyutu.value + '\nAlindigi Tarih : ' + tarih.value


            new QRious({
                element: document.getElementById('qr-code'),
                size: 200,
                value: qrtext
            });



            var canvas = document.getElementById('qr-code');
            var dataURL = canvas.toDataURL();



            let docDefinition = {

                pageSize: 'A5',
                pageOrientation: 'landscape',
                content: [
                    {
                        image: dataURL,
                        fit: [150, 150],
                        absolutePosition: { x: 20, y: 20 }
                    },
                    {
                        image: dataURL,
                        fit: [130, 130],
                        absolutePosition: { x: 25, y: 200 }
                    },
                    {
                        image: dataURL,
                        fit: [130, 130],
                        absolutePosition: { x: 210, y: 200 }
                    },
                    {
                        image: dataURL,
                        fit: [130, 130],
                        absolutePosition: { x: 400, y: 200 }
                    },

                    {
                        text: 'Lastik Markası : ' + markası.value + '\nLastik Cinsi : ' + cinsi.value + '\nLastik Boyutu : ' + boyutu.value + '\nAlındığı Tarih : ' + tarih.value,
                        fontSize: 20,
                        absolutePosition: { x: 300, y: 20 }
                    }
                ]
            };
            pdfMake.createPdf(docDefinition).open();
        }
    </script>



    <style>
        body {
            font: 90%/1.45em "Helvetica Neue", HelveticaNeue, Verdana, Arial, Helvetica, sans-serif;
            margin: 0;
            padding: 0;
            color: #000;
            background-color: #fff;
        }

        th {
            border-top: 3px solid #dddddd;
            border-bottom: 3px solid #dddddd;
            border-right: 3px solid #dddddd;
        }

            th:first-child {
                border-left: 3px solid #dddddd;
            }
    </style>


</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h3>Bilgilerinizi Girin ve QR Kodunuzu Oluşturun</h3>

    <div class="row">
        <div class="col-lg-2">
            <button type="button" class="btn btn-block btn-outline-danger" style="margin-left: 1500px;" onclick="window.close('LastikAnasayfa.aspx'); window.open('Giriş.aspx')"><i style='font-size: 20px' class='fas'>&#xf2f5;</i> Oturumu Kapat</button>
        </div>
    </div>
    <br></br>
    <div class="row">
        <div class="col-lg-12">
            <div class="card card-warning">
                <div class="card-header">
                    <h3 class="card-title">Lastik Bilgilerini Girin</h3>

                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <input type="text" class="form-control" id="marka" placeholder="Lastik Markası">
                        </div>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" id="cins" placeholder="Lastik Cinsi">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6" style="margin-top: 20px;">
                            <input type="text" class="form-control" id="boyut" placeholder="Lastik Boyutu">
                        </div>
                        <div class="col-lg-6" style="margin-top: 20px;">
                            <input type="date" class="form-control" id="calendar">
                        </div>
                    </div>
                </div>

            </div>


        </div>
    </div>

    <div class="modal" tabindex="-1" role="dialog" id="modalaç">
        <div class="row">
            <div class="col-lg-12">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Önizleme</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" id="mbody">
                            <div class="row">
                                <div class="col-lg-6">
                                    <input type="text" class="form-control" id="markaro" placeholder="Lastik Markası" readonly>
                                </div>
                                <div class="col-lg-6">
                                    <input type="text" class="form-control" id="cinsro" placeholder="Lastik Cinsi" readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6" style="margin-top: 20px;">
                                    <input type="text" class="form-control" id="boyutro" placeholder="Lastik Boyutu" readonly>
                                </div>
                                <div class="col-lg-6" style="margin-top: 20px;">
                                    <input type="date" class="form-control" id="calendar" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" onclick="generateQRCode()">Oluştur ve Yazdır</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>







    <div class="row">
        <div class="col-lg-6" style="margin-top: 20px;">
            <button type="button" id="boşbuton" class="btn btn-block btn-outline-primary">Tabloya Ekle</button>
        </div>
        <div class="col-lg-6" style="margin-top: 20px;">
            <button type="button" class="btn btn-block btn-outline-primary" onclick="generateQRCode()">Oluştur ve Yazdır</button>
        </div>
    </div>







    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrious/4.0.2/qrious.min.js"></script>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.qrcode/1.0/jquery.qrcode.min.js" integrity="sha512-NFUcDlm4V+a2sjPX7gREIXgCSFja9cHtKPOL1zj6QhnE0vcY695MODehqkaGYTLyL2wxe/wtr4Z49SvqXq12UQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>





    <div class="row" style="margin-top: 70px;">
        <div class="col-lg-12">
            <table id="myTable" style="width: 100%;">


                <thead>
                    <tr>
                        <th>Lastik Cinsi</th>
                        <th>Lastik Markası</th>
                        <th>Lastik Boyutu</th>
                        <th>Lastiğin Alındığı Tarih</th>
                        <th>İncele</th>

                    </tr>

                </thead>
                <tbody id="tablo">
                </tbody>
                <tfoot>


                    <tr>
                        <th>Lastik Cinsi</th>
                        <th>Lastik Markası</th>
                        <th>Lastik Boyutu</th>
                        <th>Lastiğin Alındığı Tarih</th>
                        <th>İncele</th>

                    </tr>
                </tfoot>
            </table>

        </div>

    </div>



    <canvas id="qr-code" style="visibility: hidden"></canvas>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrious/4.0.2/qrious.min.js"></script>
</asp:Content>
