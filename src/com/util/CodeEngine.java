package com.util;

import jdk.nashorn.api.scripting.NashornScriptEngineFactory;

import javax.script.Bindings;
import javax.script.ScriptContext;
import javax.script.ScriptEngine;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;

public class CodeEngine {
	private ScriptEngine Engine;
	private StringWriter sw;
	
	public CodeEngine()
	{
		//ScriptEngineManager factory = new ScriptEngineManager();
		// create a JavaScript engine
		Engine = new NashornScriptEngineFactory().getScriptEngine(new String[]{"--no-java", "-strict", "--no-syntax-extensions", "--language=es6"}, null, s -> false);
		Bindings bindings = Engine.getBindings(ScriptContext.ENGINE_SCOPE);
		bindings.remove("exit");
		bindings.remove("quit");
		bindings.remove("load");
		bindings.remove("loadWithNewGlobal");
		//ScriptEngine engine = factory.getEngineByName("JavaScript");
		// evaluate JavaScript code from String
		sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		Engine.getContext().setWriter(pw);
	}
	public void SetBindings(HashMap<String,Object> inputBindings)
	{
		// Get bindings & keys
		Bindings bindings = Engine.getBindings(ScriptContext.ENGINE_SCOPE);
		String[] inputKeys = inputBindings.keySet().toArray(new String[]{});
		// Add the to the engine's bindings
		for (String inputKey : inputKeys)
		{
			bindings.put(inputKey,inputBindings.get(inputKey));
		}
	}
	public void SetBinding(String key,Object binding)
	{
		Bindings bindings = Engine.getBindings(ScriptContext.ENGINE_SCOPE);
		bindings.put(key,binding);
	}
	public String[] GetBindingKeys()
	{
		return Engine.getBindings(ScriptContext.ENGINE_SCOPE).keySet().toArray(new String[]{});
	}
	public HashMap<String,Object> GetBindings()
	{
		String[] keys = GetBindingKeys();
		Bindings raw_bindings = Engine.getBindings(ScriptContext.ENGINE_SCOPE);
		HashMap<String,Object> bindings = new HashMap<>();
		for (String key : keys)
		{
			bindings.put(key,raw_bindings.get(key));
		}
		return bindings;
	}
	public HashMap Exec(String code) {
		HashMap<String, Object> output = new HashMap<>();
		try{
			Engine.eval(code);
			output.put("output", sw.getBuffer().toString());
			output.put("error", false);
		} catch (javax.script.ScriptException ex) {
			output.put("error", true);
			output.put("line", ex.getLineNumber());
			output.put("message", ex.getMessage());
		}
		catch(Exception e){
			e.printStackTrace();
			output.put("error", true);
			output.put("line", "unknown");
			output.put("message", "unknown error");
		}
		return output;
	}
}
