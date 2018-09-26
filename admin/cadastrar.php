<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
</head>

<?php
error_reporting(0);


$nomep = $_POST['nomep'];
$quant = $_POST['quant'];
$valoru = $_POST['valoru'];
$descri = $_POST['descri'];


$sql = "INSERT INTO produtos (produto , quantidade, preco , descricao) VALUES ('$nomep' , '$quant' , '$valoru' , '$descri')";

$res = mysqli_query($conexao, $sql);
	if ($res) {

		$imagem = $_POST['img'];
		$id_p = mysqli_fetch_row("SELECT LAST_INSERT_ID()");

		echo "<script> alert('".$id_p."') </script>";

		$msg = false;

		if (isset($_FILES['img'])) {
			$extensao = strtolower(substr($_FILES['img']['name'] , -4));
			$novo_nome = md5(microtime()).$extensao;
			$diretorio = "upload/";

			move_uploaded_file($_FILES, ['arquivo']['tpm_name'] .$diretorio . $novo_nome);

			$sql_img = "INSERT INTO imagem (id_produto , imagem) VALUES ('$id_p', '$novo_nome')";
			$queryImg = mysqli_query($conexao, $sql_img);

			$cat = $_POST['cate'];
			$sql_cat =  "INSERT INTO categoria (categoria , id_produto) VALUES ('$cat' , $id_p);";
			$queryCat = mysqli_query($conexao, $sql_cat);
$cores = $_POST['cor'];

$sql_cor =  "INSERT INTO cor (cor , id_produto) VALUES ('$cores' , $id_p);";
			$querycor = mysqli_query($conexao, $sql_cor);

	if($queryImg){
			echo "Foi"; 
		}

		echo "<script>alert('Cadastrado!!')</script>";
	} else {
		echo "<script>alert('Erro!!')</script>";		
	}

}

 ?>


<body>

<br><br>
	<div class="container" style="margin-left: 50px;">
		<div class="row">
			<div class="col-md-6">
				<legend>Cadastrar produto</legend>
				<form method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label>Nome do produto</label>
						<input placeholder="Nome do produto" class="form-control" type="text" name="nomep">
					</div>
					<div class="form-group">
						<label>Valor por unidade</label>
						<div class="input-group col-md-4">
					<input placeholder="Valor unitário" class="form-control" type="number" name="valoru">
						</div>
					</div>
					<div class="form-group">
						<label>Quantidade</label>
						<div class="input-group col-md-4">
							<input placeholder="Quantidade" class="form-control" type="text" name="quant">
						</div>
					</div>
						<div class="form-group">
						<label>Descrição</label>
						<textarea class="form-control" placeholder="Descrição" style="max-width: 560px; min-width: 560px; max-height: 150px; min-height: 100px;" name="descri"></textarea>
						</div>
					 <div class="form-group">
						<label>Foto</label>
						<input type="file" name="img">
						</div>
					<div class="form-group">
						<label>Categoria: </label>
						<select name="cate">
							<option>infantil</option>
							<option>PP</option>
							<option>P</option>
							<option>M</option>
							<option>G</option>
							<option>GG</option> 
						    </select></div> </br>
						    <div class="form-group">
							<label>Cor: </label>
							<select name="cor">
							<option>Branco</option>
							<option>Preto</option>
							<option>Azul</option>
							<option>Cinza</option>
							<option>Laranja</option>
							<option>Vermelho</option> 
						    </select></div> </br>		
					<input class="btn btn-success" value="Cadastrar" type="submit" name="submit">
					<br><br>
				</form>
			</div>
		</div>	
	</div>


</body>
</html>