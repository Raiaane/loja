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
$categ = $_POST['cate'];

$dir = "img/";

$sql = "INSERT INTO produtos VALUES (default,'$nomep' , '$quant' , '$valoru' , '$descri' , '$categ', '0')";
$res = mysqli_query($conexao, $sql);

$sqlPg = "SELECT LAST_INSERT_ID()";
$queryPg = mysqli_query($conexao, $sqlPg);

	if ($queryPg) {
	$codPgIndice = mysqli_fetch_row($queryPg);
	$salva = $codPgIndice[0];	

	if ($res) {

		$imagem = $_POST['img'];
	
		if (isset($_FILES['img']) && isset($_FILES['img2']) && isset($_FILES['img3'])) {

			$nome1 = microtime();
			$nome2 = md5(microtime());
			$nome3 = base64_encode(microtime());

			$ext = strtolower(substr($_FILES['img']['name'],-4));
			$novo_nome = $nome1.$ext;

			$ext2 = strtolower(substr($_FILES['img2']['name'],-4));
			$novo_nome2 = $nome2.$ext2;

			$ext3 = strtolower(substr($_FILES['img3']['name'],-4));
			$novo_nome3 = $nome3.$ext3;
 
			$sal = move_uploaded_file($_FILES['img']['tmp_name'], $dir.$novo_nome);
			$sal2 = move_uploaded_file($_FILES['img2']['tmp_name'], $dir.$novo_nome2);
			$sal3 = move_uploaded_file($_FILES['img3']['tmp_name'], $dir.$novo_nome3);
			
			if ($sal & $sal2 & $sal3) {
				echo "<script type='text/javascript'> alert('imagem') </script>";
			}

			$sql_img = "INSERT INTO imagem (id, id_produto, imagem) VALUES (default, '".
              $salva."', '$novo_nome')";
			$queryImg = mysqli_query($conexao, $sql_img);

			$sql_img2 = "INSERT INTO imagem (id, id_produto, imagem) VALUES (default, '".
              $salva."', '$novo_nome2')";
			$queryImg2 = mysqli_query($conexao, $sql_img2);

			$sql_img3 = "INSERT INTO imagem (id, id_produto, imagem) VALUES (default, '".
              $salva."', '$novo_nome3')";
			$queryImg3 = mysqli_query($conexao, $sql_img3);

			if($queryImg){
				echo "Foi"; 
			}

				echo "<script>alert('Cadastrado!!')</script>";
			} else {
				echo "<script>alert('Erro!')</script>";		
			}

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
						<input placeholder="Nome do produto" class="form-control" type="text" name="nomep" style="width: 2000px;">
					</div>
					<div class="form-group">
						<label>Valor por unidade</label>
						<div class="input-group col-md-4">
					<input placeholder="Valor unitário" class="form-control" type="number" name="valoru" style="width: 2000px;">
						</div>
					</div>
					<div class="form-group">
						<label>Quantidade</label>
						<div class="input-group col-md-4">
							<input placeholder="Quantidade" class="form-control" type="text" name="quant" style="width: 2000px;">
						</div>
					</div>
						<div class="form-group">
						<label>Descrição</label>
						<textarea class="form-control" placeholder="Descrição" style="max-width: 2000px; min-width: 560px; max-height: 150px; min-height: 100px; width: 2000px;" name="descri" ></textarea>
						</div>
					 <div class="form-group">
						<label>Foto</label>
						<input type="file" name="img">
						<label>Foto - 2</label>
						<input type="file" name="img2">
						<label>Foto - 3</label>
						<input type="file" name="img3">
						</div>
					<div class="form-group">
						<label>Categoria: </label></br>
						<select name="cate" style="width: 2000px; height: 30px;">
							<?php

								$sqlCatMostra = "SELECT * FROM categoria;";
								$queryCatMostra = mysqli_query($conexao, $sqlCatMostra);

								while ($cat = mysqli_fetch_assoc($queryCatMostra)) {
									
									echo "<option value='".$cat['categoria']."'>".$cat['categoria']."</option>";

								}

							?> 
						</select><br>

					<input class="btn btn-success" value="Cadastrar" type="submit" name="submit" style="width: 500px; margin-left: 150px;">
					<br><br>
				</form>
			</div>
		</div>	
	</div>


</body>
</html>