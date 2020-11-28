<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../global-style.css">
    <link rel="stylesheet" href="../css/exercicios.css">
    <!--Link do Bootstrap--->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <!--Link do Bootstrap--->
    
    <!---FONT AWESON--->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.1/css/all.css" integrity="sha384-xxzQGERXS00kBmZW/6qxqJPyxW3UR0BPsL4c8ILaIWXva5kFi7TxkIIaMiKtqV1Q" crossorigin="anonymous">
    <title>Mr. Helth</title>
</head>
<body>
    <div class="conteiner">
        <!----Menu superior css no inicio do global style----->
        <header>
            <nav>
                <ul>
                    <li><a href="pages/usuario.html"><i class="fas fa-user"></i></a></li>
                    <li><img src="../img/logo.png" width="50px" alt=""></li>
                    <li><a href="pages/configuracoes.html"><i class="fas fa-cog"></i></a></li>
                </ul>
            </nav>
        </header>
        
        <!----pagina----->
        <section class="pg-exercicio">
<div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
</div>
            <div class="itens-exercicio">
                <img src="../img/logo.png" alt="imagem do exercercio tal...."/>
                <div class="bloco-text">
                    <div>
                        <h2>Titulo a ser puxado do banco de dados</h2>
                        <p>
                            Lorem ipsum Lorem ipsumLorem ipsumvLorem ipsumLorem ipsumvLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum
                        </p>
                    </div>
                    <ul class="status">
                        <li> <input type="button" onclick="" value="Feito"></li>
                        <li> <input type="button" onclick="" value="Não"></li>
                    </ul>
                </div>

            </div>
        </section>
        <!----pagina----->
        <!----Menu inferiror css no inicio do global style----->
        <div class="menu">
            <nav>
                <ul>
                    <li><a href="pages/exercicios.html"><i class="fas fa-running"></i></a></li>
                    <li><a href="pages/beber-agua.html"><i class="fas fa-faucet"></i></a></li>
                    <li><a href="pages/alimentacao.html"><i class="fas fa-utensils"></i></a></li>
                    <li><a href="pages/agenda.html"><i class="fas fa-calendar-alt"></i></a></li>
                </ul>
            </nav>
        </div>
        
        
        <?php
            /****PUXANDO CONECXAO AO BANCO DE DADOS***/
            include('conexao.php');


            $pegandoPostAlimentacao="SELECT * FROM 'tbl_exercicio'";

        ?>
    
    
    </div>  
    <!--Link do Bootstrap--->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <!--Link do Bootstrap--->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
</html>
