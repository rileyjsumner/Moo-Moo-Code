<%@ page import="com.data.Map.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />

<title>Moo Moo Code - Level Editor</title>
<link rel="stylesheet" href="<c:url value="/css/map.css"/>">
<link rel="stylesheet" href="<c:url value="/css/levels.css"/>">

<c:import url="/WEB-INF/page_defaults/menu.jsp" />

<%MapData mapData = (MapData) request.getAttribute("map_data");boolean entityMode = request.getParameterMap().containsKey("mode");%>
<div style="display:inline-block;width:95px;height:100%;float:left;border-right:5px solid #49483E;z-index:3;position:relative;background-color: #272822;">
	<div class = "action" id="action-settings" <%if(!entityMode){out.print("style='background-color:#49483E'");}%>><i class = "fa fa-gear action-icon" <%if(!entityMode){out.print("style=\"color:#F8F8F2\"");}%>></i><p class = "action-text">Level Settings</p></div>
	<div class = "action" id="action-tiles"><i class = "fa fa-th action-icon"></i><p class = "action-text">Tile Editor</p></div>
	<div class = "action" id="action-entities" <%if(entityMode){out.print("style='background-color:#49483E'");}%>><i class = "fa fa-street-view action-icon" <%if(entityMode){out.print("style=\"color:#F8F8F2\"");}%>></i><p class = "action-text">Entity Editor</p></div>
	<div class = "action" id="action-decorations"><i class = "fa fa-tree action-icon"></i><p class = "action-text">Deco Editor</p></div>
</div>
<div id = "menu-settings" class = "action-menu" <%if(entityMode){out.print("style=\"left:-400px\"");}else{out.print("style=\"left:100px\"");}%>>
	<p style="font-size:18px;padding:20px;">Level Settings:</p>
	<form action = "<c:url value="/Admin/LevelEditor"/>?action=settings" method = "post">
		<table style="width: 100%;overflow: hidden; white-space: nowrap;">
			<tr><td><label class = "admin-levels-label" for="settings-x">Width:</label></td><td><input id = 'settings-x' name = "x" class = "admin-levels-input" type = "number" value="<%=mapData.Map.DimX%>"/></td></tr>
			<tr><td><label class = "admin-levels-label" for="settings-y">Height:</label></td><td><input id = 'settings-y'  name = "y" class = "admin-levels-input" type = "number" value="<%=mapData.Map.DimY%>"/></td></tr>
			<tr><td><label class = "admin-levels-label" for="settings-time">Max Time (s):</label></td><td><input id = 'settings-time'  name = "time" class = "admin-levels-input" step=".1" type = "number" value="<%=mapData.Map.Time*.1%>"/></td></tr>
		</table>
		<label for = 'level-code' class = 'admin-levels-label'>Level Code:</label>
		<div style = 'text-align:left'>
		<textarea name = 'code' id = 'level-code' style = 'text-align: left;display: none' class="admin-levels-input"><%=mapData.Map.Code%></textarea>
		</div>
		<label for = 'level-desc' class = 'admin-levels-label'>Level Description:</label>
		<textarea name = 'desc' id = 'level-desc' style = 'resize:vertical;' class="admin-levels-input"><%=mapData.Map.Desc%></textarea>
		<label for = 'level-help' class = 'admin-levels-label'>Level Help:</label>
		<textarea name = 'help' id = 'level-help' style = 'resize:vertical;' class="admin-levels-input"><%=mapData.Map.Help%></textarea>
		<input name = "map" type = "hidden" value="<%=mapData.Map.Id%>"/>
		<button class = "edit-btn">Save</button>
	</form>
</div>
<div id = "menu-tiles" class = "action-menu" style="left:-400px;">
	<p style="font-size:18px;padding:20px;">Select a tile to apply:</p>
	<table style = "border-collapse: collapse;width:100%;text-align:center;">
		<%
			ArrayList<Tile> tiles = mapData.Tiles.getAllTiles();
			
			for(Tile tile : tiles)
			{
				out.print("<tr class = 'level-tile-select' data-tile-icon='"+tile.Icon+"' data-tile-type = '"+tile.Type+"' data-tile-id = '"+tile.Id+"'><td><div class = 'tile-icon pixel' style = 'background-image: url(/icons/map_tiles/"+tile.Icon+".png)'></div></td><td><div class = 'tile-name'>"+tile.Name+"</div></td></tr>");
			}
		%>
	</table>
</div>
<div id = "menu-entities" class = "action-menu" <%if(entityMode){out.print("style=\"left:100px\"");}else{out.print("style=\"left:-400px\"");}%>>
	<div class = 'vertical-fill-container'>
		<div class = 'vertical-compact'>
			<p style="font-size:18px;padding:20px;">Add a new entity:</p>
			<form method = 'post' action = '<c:url value="/Admin/LevelEditor?action=entity_new"/>'>
				<div class = 'entity-container-new'>
					<div class='entity-header-new'>
						<input name = "map" type = "hidden" value="<%=mapData.Map.Id%>"/>
						<%=mapData.GetTypeDD(-1,true,true)%>
					</div>
				</div>
			</form>
			<%
				if(mapData.MapEntities.size()>0)
				{
					out.print("<p style=\"font-size:18px;padding:20px;\">Edit an existing entity:</p>");
				}
			%>
		</div>
		<div class = 'vertical-fill'>
			<div style = 'overflow-y:scroll;width:100%;height:100%;'>
				<%
					int selected = -1;
					if(request.getParameterMap().containsKey("selected_ent")){try {selected = Integer.parseInt(request.getParameter("selected_ent"));}catch(NumberFormatException ex){/**/}}
					
					for(Entity entity : mapData.MapEntities)
					{
						out.print("<div class='entity-container' data-id='"+entity.Id+"'><div class='entity-header' data-id='"+entity.Id+"'>"+entity.Name+"</div>" +
								"<form method = 'post' action = '/Admin/LevelEditor' class = 'entity-content' "+((selected == entity.Id) ? "style='display:block;'" : "")+"><table style=\"width: 100%;overflow: hidden; white-space: nowrap;\">" +
								"<tr><td><label class = \"admin-levels-label\" for='entity-type-"+entity.Id+"'>Entity Type:</label></td><td>"+mapData.GetTypeDD(entity.Type,false,false)+"</td></tr>" +
								"<tr><td><label class = \"admin-levels-label\" for='entity-name-"+entity.Id+"'>Custom Name:</label></td><td><input name = 'name' class = 'admin-levels-input' type='text' id = 'entity-name-"+entity.Id+"' value='"+entity.Name+"' /></td></tr>" +
								"<tr><td><label class = \"admin-levels-label\" for='entity-x-"+entity.Id+"'>Spawn X:</label></td><td><input name = 'spawn_x' step = '.1' class = 'admin-levels-input' type='number' id = 'entity-x-"+entity.Id+"' value='"+entity.X+"' /></td></tr>" +
								"<tr><td><label class = \"admin-levels-label\" for='entity-y-"+entity.Id+"'>Spawn Y:</label></td><td><input name = 'spawn_y' step = '.1' class = 'admin-levels-input' type='number' id = 'entity-y-"+entity.Id+"' value='"+entity.Y+"' /></td></tr>" +
								"</table><input type='hidden' value='"+entity.Id+"' name = 'id' /><input type='hidden' value='"+mapData.Map.Id+"' name = 'map' /><button name = 'action' value='entity' class = \"edit-btn\">Save</button><button name = 'action' value='entity_delete' class = \"edit-btn edit-btn-red\">Delete</button></form></div>");
					}
				%>
			</div>
		</div>
	</div>
</div>
<div id = "menu-decorations" class = "action-menu" <%if(entityMode){out.print("style=\"left:100px\"");}else{out.print("style=\"left:-400px\"");}%>>
	<div class = 'vertical-fill-container'>
		<div class = 'vertical-compact'>
			<p style="font-size:18px;padding:20px;">Edit Decorations:</p>
			<form method = "post" action = "<c:url value="/Admin/LevelEditor?action=deco_repopulate"/>">
				<input name = "map" type = "hidden" value="<%=mapData.Map.Id%>"/>
				<button class = "edit-btn">Re-Populate All Decorations</button>
			</form>
			<p style="font-size:18px;padding:20px;">Add a new entity:</p>
			<form method = 'post' action = '<c:url value="/Admin/LevelEditor?action=deco_new"/>'>
				<div class = 'entity-container-new'>
					<div class='entity-header-new'>
						<input name = "map" type = "hidden" value="<%=mapData.Map.Id%>"/>
						<%=mapData.GetDecoTypeDD(-1,true,true)%>
					</div>
				</div>
			</form>
			<%
				if(mapData.MapDecorations.size()>0)
				{
					out.print("<p style=\"font-size:18px;padding:20px;\">Edit an existing decoration:</p>");
				}
			%>
		</div>
		<div class = 'vertical-fill'>
			<div style = 'overflow-y:scroll;width:100%;height:100%;'>
				<%
					selected = -1;
					
					for(MapDeco deco : mapData.MapDecorations)
					{
						out.print("<div class='entity-container' data-id='"+deco.Id+"'><div class='entity-header' data-id='"+deco.Id+"'>"+mapData.GetDecoName(deco.Type)+"</div>" +
								"<form method = 'post' action = '/Admin/LevelEditor' class = 'entity-content' "+((selected == deco.Id) ? "style='display:block;'" : "")+"><table style=\"width: 100%;overflow: hidden; white-space: nowrap;\">" +
								"<tr><td><label class = \"admin-levels-label\" for='deco-type-"+deco.Id+"'>Entity Type:</label></td><td>"+mapData.GetDecoTypeDD(deco.Type,false,false)+"</td></tr>" +
								"<tr><td><label class = \"admin-levels-label\" for='deco-x-"+deco.Id+"'>Spawn X:</label></td><td><input name = 'spawn_x' step = '.1' class = 'admin-levels-input' type='number' id = 'deco-x-"+deco.Id+"' value='"+deco.X+"' /></td></tr>" +
								"<tr><td><label class = \"admin-levels-label\" for='deco-y-"+deco.Id+"'>Spawn Y:</label></td><td><input name = 'spawn_y' step = '.1' class = 'admin-levels-input' type='number' id = 'deco-y-"+deco.Id+"' value='"+deco.Y+"' /></td></tr>" +
								"</table><input type='hidden' value='"+deco.Id+"' name = 'id' /><input type='hidden' value='"+mapData.Map.Id+"' name = 'map' /><button name = 'action' value='deco' class = \"edit-btn\">Save</button><button name = 'action' value='deco_delete' class = \"edit-btn edit-btn-red\">Delete</button></form></div>");
					}
				%>
			</div>
		</div>
	</div>
</div>
<div style="display:inline-block;width:calc(100% - 500px);height:100%;text-align:center;float:right">
	<table class = 'map-table'>
	<%
		for(int y =mapData.Map.DimY-1;y>=0;y--)
		{
			out.print("<tr><td class = 'map-label-cell'><div class = 'map_label_y'>"+(y+1)+"</div></td>");
			for(int x = 0 ;x<mapData.Map.DimX;x++)
			{
				if(x == mapData.Map.DimX-1 && y ==mapData.Map.DimY-1){out.print("<td id = 'entity-reference' class = 'map-tile-cell'>");}
				else{out.print("<td class = 'map-tile-cell'>");}
				final Tile tile = mapData.GetTile(x, y);
				if(tile != null)
				{
					out.print("<div class = \"map-tile pixel\" data-x = '"+x+"' data-y='"+y+"' data-type=\""+tile.Type+"\" data-id=\""+tile.Id+"\" style = \"cursor:pointer;background-image: url(/icons/map_tiles/");
					out.print(tile.Icon);
				}
				else
				{
					out.print("<div class = \"map-tile pixel\" data-x = '"+x+"' data-y='"+y+"' data-type=\"0\" style = \"cursor:pointer;background-image: url(/icons/map_tiles/");
					out.print("null");
				}
				if(y == 0)
				{
					out.print(".png);\"></div><div class = 'map_label_x'>"+(x+1)+"</div></td>");
				}
				else{
					out.print(".png);\"></div></td>");
				}
			}
			out.print("</tr>");
		}
	%>
	</table>
</div>
<script>
	var DanWalks=true;
	var max_x = <%= mapData.Map.DimX %>;
	var max_y = <%= mapData.Map.DimY %>;
	var ent_reposition = false;
	var ent_id = -1;
	$(document).ready(function()
	{
		$(".entity-header").click(function()
		{
			ent_reposition = true;
			var clicked = $(this).data("id");
			ent_id = clicked;
			$(".entity-header").each(function(){
				if($(this).data("id") !== clicked)
				{
					$(this).next().slideUp(0);
				}
				else{$(this).next().slideDown(100);}
			});
		});
		
		var codeMirror = CodeMirror.fromTextArea(document.getElementById("level-code"), {
			theme: "monokai",
			lineNumbers: true,
			mode: "javascript",
			autoCloseBrackets: true,
			matchBrackets: true,
			showCursorWhenSelecting: true
		});
		codeMirror.setSize("90%","180px");
		
		// The click on the the table for adding entities
		
		$(".map-table").click(function(evt){
			if(ent_reposition)
			{
				var r = $("#entity-reference");
				var posX = (max_x + ((evt.pageX - r.offset().left - r.width()) * .02)).toFixed(1);
				var posY = (max_y - ((evt.pageY - r.offset().top) * .02)).toFixed(1);
				$.post("/Admin/LevelEditor",{
					action:"entity_move",
					id: ent_id,
					x: posX,
					y: posY});
				$("#entity-x-"+ent_id).val(posX);
				$("#entity-y-"+ent_id).val(posY);
				moveEntity(ent_id,posX,posY);
			}
		});
		
		var selected_tile_type=null;
		var selected_tile_icon=null;
		$(".level-tile-select").click(function(){
			
			var selected = $(this).data("tile-id");
			selected_tile_type = $(this).data("tile-type");
			selected_tile_icon = $(this).data("tile-icon");
			
			$(".level-tile-select").each(function(){
				if($(this).data("tile-id") === selected)
				{
					$(this).css("background-color","#75715E");
				}
				else
				{
					$(this).css("background-color","");
				}
			});
		});
		function deselectType()
		{
			
			selected_tile_type=null;
			selected_tile_icon=null;
			$(".level-tile-select").each(function(){
				$(this).css("background-color","");
			});
		}
		// make the stuff draggable
		var isMouseDown = false;
		$('body').mousedown(function() {isMouseDown = true;}).mouseup(function() {isMouseDown = false;});
		$(".map-tile").mouseenter(function()
		{
			if(isMouseDown)
			{
				changeTile($(this));
			}
		});
		$(".map-tile").mousedown(function(){
			changeTile($(this));
		});
		function changeTile(selected_el)
		{
			if(selected_tile_type !== null)
			{
				selected_el.css("background-image","url(/icons/map_tiles/"+selected_tile_icon+".png)");
				$.post("/Admin/LevelEditor",{
						action:"tile",
						x:selected_el.data("x"),
						y:selected_el.data("y"),
						type:selected_tile_type,
						map: "<%= mapData.Map.Id%>"});
			}
		}
		$("#action-settings").click(function() // open the level settings
		{
			ent_reposition = false;
			deselectType();
			
			$("#menu-settings").animate({"left":"100px","opacity":"1"},400);
			$("#action-settings>.action-icon").css("color","#F8F8F2");
			$("#action-settings").css("background-color","#49483E");
			
			$("#menu-entities").animate({"left":"-400px","opacity":"0"},400);
			$("#menu-tiles").animate({"left":"-400px","opacity":"0"},400);
			$("#menu-decorations").animate({"left":"-400px","opacity":"0"},400);
			
			$("#action-entities>.action-icon").css("color","");
			$("#action-tiles>.action-icon").css("color","");
			$("#menu-decorations").animate({"left":"-400px","opacity":"0"},400);
			
			$("#action-entities").css("background-color","");
			$("#action-tiles").css("background-color","");
			$("#action-decorations").css("background-color","");
		});
		$("#action-entities").click(function()  // open the level entities
		{
			deselectType();
			ent_reposition = false;
			$("#menu-entities").animate({"left":"100px","opacity":"1"},400);
			$("#action-entities>.action-icon").css("color","#F8F8F2");
			$("#action-entities").css("background-color","#49483E");
			
			$("#action-settings>.action-icon").css("color","");
			$("#action-tiles>.action-icon").css("color","");
			$("#action-decorations>.action-icon").css("color","");
			
			$("#menu-settings").animate({"left":"-400px","opacity":"0"},400);
			$("#menu-tiles").animate({"left":"-400px","opacity":"0"},400);
			$("#menu-decorations").animate({"left":"-400px","opacity":"0"},400);
			
			$("#action-settings").css("background-color","");
			$("#action-tiles").css("background-color","");
			$("#action-decorations").css("background-color","");
		});
		$("#action-tiles").click(function()
		{
			ent_reposition = false;
			$("#menu-tiles").animate({"left":"100px","opacity":"1"},400);
			$("#action-tiles>.action-icon").css("color","#F8F8F2");
			$("#action-tiles").css("background-color","#49483E");
			
			$("#action-settings>.action-icon").css("color","");
			$("#action-entities>.action-icon").css("color","");
			$("#action-decorations>.action-icon").css("color","");
			
			$("#menu-settings").animate({"left":"-400px","opacity":"0"},400);
			$("#menu-entities").animate({"left":"-400px","opacity":"0"},400);
			$("#menu-decorations").animate({"left":"-400px","opacity":"0"},400);
			
			$("#action-entities").css("background-color","");
			$("#action-settings").css("background-color","");
			$("#action-decorations").css("background-color","");
		});
		$("#action-decorations").click(function()
		{
			ent_reposition = false;
			deselectType();
			$("#menu-decorations").animate({"left":"100px","opacity":"1"},400);
			$("#action-decorations>.action-icon").css("color","#F8F8F2");
			$("#action-decorations").css("background-color","#49483E");
			
			$("#action-settings>.action-icon").css("color","");
			$("#action-entities>.action-icon").css("color","");
			$("#action-tiles>.action-icon").css("color","");
			
			$("#menu-settings").animate({"left":"-400px","opacity":"0"},400);
			$("#menu-entities").animate({"left":"-400px","opacity":"0"},400);
			$("#menu-tiles").animate({"left":"-400px","opacity":"0"},400);
			
			$("#action-entities").css("background-color","");
			$("#action-settings").css("background-color","");
			$("#action-tiles").css("background-color","");
		});
		// Farmer animation
		function StartDanWalk()
		{
			DanWalks=true;DanWalk();
		}
		function DanWalk()
		{
			if(!DanWalks){return;}
			$(".entity-player").css("background-image","url(/icons/characters/farmer_dan_walk.png)");
			setTimeout(DanWalk2,300);
		}
		function DanWalk2()
		{
			if(!DanWalks){return;}
			$(".entity-player").css("background-image","url(/icons/characters/farmer_dan_walk_mid.png)");
			setTimeout(DanWalk3,300);
		}
		function DanWalk3()
		{
			if(!DanWalks){return;}
			$(".entity-player").css("background-image","url(/icons/characters/farmer_dan_walk_2.png)");
			setTimeout(DanWalk4,300);
		}
		function DanWalk4()
		{
			if(!DanWalks){return;}
			$(".entity-player").css("background-image","url(/icons/characters/farmer_dan_walk_mid_2.png)");
			setTimeout(DanWalk,300);
		}
		DanWalk();
	});
	function addEntity(entity_class,x,y,id)
	{
		$("#entity-reference").append("<div id = 'entity-ref-"+id+"' class = 'map-entity pixel "+entity_class+"' style=\"" +
			"right:" + (( max_x - x - .5) * 50) + "px;" +
			"top:" + (( max_y - y - .5) * 50) + "px\">");
	}
	function moveEntity(id,x,y)
	{
		var ent = $("#entity-ref-"+id);
		ent.css("right",(( max_x - x - .5) * 50) + "px");
		ent.css("top",(( max_y - y - .5) * 50) + "px");
	}
	function addDeco(icon,x,y,id)
	{
		$("#entity-reference").append("<div id = 'deco-ref-"+id+"' class = 'map-entity pixel' style=\"background-image: url(/icons/deco/"+icon+".png);" +
			"right:" + (( max_x - x - .5) * 50) + "px;" +
			"top:" + (( max_y - y - .5) * 50) + "px\">");
	}
	function moveDeco(id,x,y)
	{
		var ent = $("#deco-ref-"+id);
		ent.css("right",(( max_x - x - .5) * 50) + "px");
		ent.css("top",(( max_y - y - .5) * 50) + "px");
	}
	<%
		for(Entity entity : mapData.MapEntities)
		{
			out.print("addEntity('");
			if(entity.Type==0)
			{
				out.print("entity-player-spawn");
			}
			else if(entity.Type==1)
			{
				out.print("entity-cow");
			}
			out.print("',"+entity.X+","+entity.Y+","+entity.Id+");");
		}
		for(MapDeco deco : mapData.MapDecorations)
		{
			out.print("addDeco('"+mapData.GetDecoIcon(deco.Type)+"',"+deco.X+","+deco.Y+","+deco.Id+");");
		}
	%>
</script>
<c:import url="/WEB-INF/page_defaults/footer.jsp" />