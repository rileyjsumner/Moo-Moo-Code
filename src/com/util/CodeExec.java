package com.util;


import jdk.nashorn.api.scripting.ClassFilter;
import jdk.nashorn.api.scripting.NashornScriptEngineFactory;

import javax.script.Bindings;
import javax.script.ScriptContext;
import javax.script.ScriptEngine;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;

public class CodeExec {
	public static HashMap Exec(String code) {
		
		HashMap<String, Object> output = new HashMap<>();
		// create a script engine manager
		
		//ScriptEngineManager factory = new ScriptEngineManager();
		// create a JavaScript engine
		ScriptEngine engine = new NashornScriptEngineFactory().getScriptEngine(new String[]{"--no-java", "-strict", "--no-syntax-extensions"}, null, new ClassFilter() {
			@Override
			public boolean exposeToScripts(String s) {
				return false;
			}
		});
		Bindings bindings = engine.getBindings(ScriptContext.ENGINE_SCOPE);
		bindings.remove("exit");
		bindings.remove("quit");
		bindings.remove("load");
		bindings.remove("loadWithNewGlobal");
		//ScriptEngine engine = factory.getEngineByName("JavaScript");
		// evaluate JavaScript code from String
		try {
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			engine.getContext().setWriter(pw);
			engine.eval(code);
			output.put("output", sw.getBuffer().toString());
			output.put("error", false);
		} catch (javax.script.ScriptException ex) {
			output.put("error", true);
			output.put("line", ex.getLineNumber());
			output.put("message", ex.getMessage());
		}
		catch(Exception e){
			output.put("error", true);
			output.put("line", "unknown");
			output.put("message", "unknown error");
		}
		return output;
	}
}
