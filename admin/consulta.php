<!DOCTYPE html>
<html>
<head>
	<title>Cadastrar</title>
	<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
</head>
<body>
<br><br>
<h2 style="margin-left: 50px;">Produtos</h2>

<table style="margin-left: 50px;" class="table table-hover">
	<thead>
		<tr>
			<td>#</td>
			<td>Produto</td>
			<td>Categoria</td>
			<td>preço</td>
			<td>Quantidade</td>
			<td>tamanho</td>
		</tr>
	</thead>

	<tbody>

		<?php
			$sql = "SELECT * FROM p_loja.produtos, p_loja.categoria where produtos.id = '2'";
			$query = mysqli_query($conexao, $sql);

			while ($reg = mysqli_fetch_row($query)) {
				echo "$reg[0]";
			}
			
		?>
	</tbody>

</table>

</body>
</html>