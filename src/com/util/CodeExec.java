package com.util;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;

public class CodeExec {
	public static HashMap Exec(String code) {
		HashMap<String, Object> output = new HashMap<>();
		// create a script engine manager
		ScriptEngineManager factory = new ScriptEngineManager();
		// create a JavaScript engine
		ScriptEngine engine = factory.getEngineByName("JavaScript");
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
