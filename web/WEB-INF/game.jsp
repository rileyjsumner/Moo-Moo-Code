<%@ page import="com.data.Game.GameFrame" %>
<%@ page import="com.data.Game.GameOutput" %>
<%@ page import="com.data.Map.Entity" %>
<%@ page import="com.data.Map.MapData" %>
<%@ page import="com.data.Map.MapDeco" %>
<%@ page import="com.data.Map.Tile" %>
<%@ page import="com.util.Html" %>
<%@ page import="java.util.Objects" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />

<title>Moo Moo Code - Game</title>
<link rel="stylesheet" href="<c:url value="/css/map.css"/>">
<link rel="stylesheet" href="<c:url value="/css/levels.css"/>">

<c:import url="/WEB-INF/page_defaults/menu.jsp" />
<% MapData mapData = (MapData) request.getAttribute("level_data");
boolean exec = (boolean) request.getAttribute("exec");GameOutput output = new GameOutput();
if(exec){output = (GameOutput) request.getAttribute("game_data");}
%>
<%if(exec){%>
<div id="game-end-modal" class="modal-invis">
	<!-- Modal content -->
	<div class="modal-content-invis" style = 'margin:25% auto;'>
		<%if(!output.Success){%><p style = 'font-size:60px;font-weight:bolder'>You Lose!</p>
		<%}else{%><p style = 'font-size:60px;font-weight:bolder'>You win!</p><%}%>
		<p style = 'font-size:30px;font-weight:bolder;margin-top:10px;margin-bottom:20px'><%=output.EndText%></p>
		<div class = 'game-end-btn' onclick="location.href='/Game?retry=true&level=<%=mapData.Map.Id%>'"><i class = 'fa fa-undo'></i><div class = 'game-end-btn-text'>Retry Level</div></div>
		<div class = 'game-end-btn' onclick="location.href='/LevelSelect'"><i class = 'fa fa-home'></i><div class = 'game-end-btn-text'>Level Selection</div></div>
		<pre class = 'map-desc'></pre>
	</div>
</div>
<%}%>
<div id="desc-modal" class="modal" <%if(!exec && (boolean)request.getAttribute("desc")){%>style = 'display:block'<%}%>>
	<!-- Modal content -->
	<div class="modal-content">
		<span class="close">&times;</span>
		<pre class = 'map-desc'><%=mapData.Map.Desc%></pre>
	</div>
</div>

<div id="help-modal" class="modal">
	<!-- Modal content -->
	<div class="modal-content">
		<span class="close">&times;</span>
		<pre class = 'map-desc'><%=mapData.Map.Help%></pre>
	</div>
</div>


<div class = 'play-code-panel'>
	<form id = 'code-input-form' style="height:calc(100% - 400px);margin: 0px;" action = '<c:url value="/Game?level="/><%=mapData.Map.Id%>'  method = 'post'>
		<div style = 'width:100%;height:100%;position: relative;overflow: hidden'>
			<textarea name = 'player-code' style = "text-align:left;display: none;" id = 'code'><%=(String)request.getAttribute("code")%></textarea>
		</div>
	</form>
	<div style = 'width:100%;height:50px;' class = 'bracket-hover'>
		<p style = 'font-size: 22px;text-align: center;color: greenyellow;cursor: pointer;padding: 10px;background-color: #181916;' onclick="$('#code-input-form').submit();">Run</p>
	</div>
	<div style="height: 350px;background-color:inherit;position: relative">
		<p style="height:30px;display: block;text-align: center;font-size: 18px;font-weight: bold;">Output:</p>
		<pre id = 'code-output' style="height: 320px;max-height: 330px; overflow-y: scroll; display: block;text-align: left;margin: 0px 0px 0px 5px;"></pre>
	</div>
</div>
<div style="display:inline-block;width:calc(100% - 552px);height:100%;text-align:center;float:right;position: relative">
	<div style = 'position:absolute;display: inline-block;right:0;top:0;z-index: 1;'>
		<div class = 'map-tooltip'><i id = 'desc-open' class = 'modal-open-btn fa fa-sliders'></i><div class = 'map-tooltip-text'></div></div>
		<div class = 'map-tooltip'><i id = 'help-open' class = 'modal-open-btn fa fa-question'></i><div class = 'map-tooltip-text'></div></div>
		<div class = 'map-tooltip'><i onclick="location.href='/LevelSelect'" class = 'modal-open-btn fa fa-home'></i><div class = 'map-tooltip-text'></div></div>
	</div>
	<div style = 'position: absolute;top: 0;width: 100%;font-weight: bold;'>
		<div style = 'display: inline-block;width: 100px;height: 50px;background-color: #75715E; border-bottom-right-radius: 5px;border-bottom-left-radius: 5px;'>
			<p id = 'clock-s' style = 'display: inline-block;font-size: 40px;'></p><p id = 'clock-ms' style = 'display: inline-block;margin-left: 10px;'></p>
		</div>
	</div>
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
	// Get the modal
	var desc_modal = document.getElementById('desc-modal');
	var help_modal = document.getElementById('help-modal');
	var game_end_modal = $("#game-end-modal");
	
	// When the user clicks on the button, open the modal
	$("#desc-open").click(function() {
		desc_modal.style.display = "block";
	});
	$("#help-open").click(function() {
		help_modal.style.display = "block";
	});
	
	// When the user clicks on <span> (x), close the modal
	$(".close").click(function() {
		help_modal.style.display = "none";
		desc_modal.style.display = "none";
	});
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target === help_modal) {
			help_modal.style.display = "none";
		}
		else if (event.target === desc_modal) {
			desc_modal.style.display = "none";
		}
	};
	var codeMirror = CodeMirror.fromTextArea(document.getElementById("code"), {
		theme: "monokai",
		lineNumbers: true,
		mode: "javascript",
		autoCloseBrackets: true,
		matchBrackets: true,
		showCursorWhenSelecting: true
	});
	codeMirror.setSize("100%","100%");
	var max_x = <%= mapData.Map.DimX %>;
	var max_y = <%= mapData.Map.DimY %>;
	function moveEntity(id,x,y)
	{
		var ent = $("#entity-ref-"+id);
		ent.css("right",(( max_x - x - .5) * 50) + "px");
		ent.css("top",(( max_y - y - .5) * 50) + "px");
	}
	function addEntity(entity_class,x,y,id)
	{
		$("#entity-reference").append("<div id = 'entity-ref-"+id+"' class = 'map-entity pixel "+entity_class+"' style=\"" +
			"right:" + (( max_x - x - .5) * 50) + "px;" +
			"top:" + (( max_y - y - .5) * 50) + "px\">");
	}
	function removeEntity(id)
	{
		$("#entity-reference").remove("#entity-ref-"+id);
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
	function removePlayerSpawns()
	{
		$("#entity-reference").remove(".entity-player-spawn");
	}
	function setTime(time)
	{
		$("#clock-s").html(Math.floor(time*.1));
		$("#clock-ms").html(time % 10);
	}
	setTime(<%=mapData.Map.Time%>);
	function addConsole(text,error)
	{
		var code_out = $("#code-output");
		if(error){code_out.append("<pre class = 'error'>"+text+"</pre>");}
		else{code_out.append(text);}
		code_out.scrollTop(code_out[0].scrollHeight);
	}
	function win()
	{
		game_end_modal.addClass("modal-invis-shown");
		game_end_modal.animate({"opacity":1},100);
		// Make the clock Green
		$("#clock-s").css("color","#A6E22E");
		$("#clock-ms").css("color","#A6E22E");
		
		// Add COMPLETE to console
		var code_out = $("#code-output");
		code_out.append("<pre class = 'win'>LEVEL COMPLETE!</pre>");
		code_out.scrollTop(code_out[0].scrollHeight);
	}
	function lose()
	{
		game_end_modal.addClass("modal-invis-shown");
		game_end_modal.animate({"opacity":1},100);
		// Make the clock Green
		$("#clock-s").css("color","#ff4841");
		$("#clock-ms").css("color","#ff4841");
		
		// Add COMPLETE to console
		var code_out = $("#code-output");
		code_out.append("<pre class = 'error'>LEVEL FAILED</pre>");
		code_out.scrollTop(code_out[0].scrollHeight);
	}
	$( window ).on( "load" ,function() {
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
		loadContent();
	});
	function loadContent()
	{
		removePlayerSpawns();
		<%
			if(exec)
			{
				// add the player
				out.print("addEntity('entity-player',"+output.spawnX+","+output.spawnY+",0);");
				// Add the animations
				for(GameFrame frame: output.GameChanges)
				{
					int time =((100*frame.Data.Map.Time) - (frame.TimeLeft*100));
					out.print("\nsetTimeout(function(){setTime("+frame.TimeLeft+");moveEntity(0,"+frame.Data.PlayerX+","+frame.Data.PlayerY+");");
					if(!Objects.equals(frame.ConsoleOut, "")){out.print("addConsole(\""+ Html.encode(frame.ConsoleOut)+"\","+frame.ConsoleError+")");}
					for(Entity entity : frame.Data.Entities)
					{
						out.print("\nmoveEntity("+entity.Id+","+entity.X+","+entity.Y+");");
					}
					if(frame.GameState==1){out.print("win();");}
					else if(frame.GameState == -1){out.print("lose();");}
					out.print("},"+time+");");
				}
			}
		%>
	}
</script>
<c:import url="/WEB-INF/page_defaults/footer.jsp" />