package com.code;

import jdk.nashorn.api.scripting.NashornScriptEngineFactory;

import javax.script.Bindings;
import javax.script.ScriptContext;
import javax.script.ScriptEngine;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.concurrent.*;
// Object to run javascript on the server
public class CodeEngine {
	private ScriptEngine Engine;
	private StringWriter sw;
	// Sets up javascript environment
	public CodeEngine()
	{
		Engine = new NashornScriptEngineFactory().getScriptEngine(new String[]{"--no-java", "-strict", "--no-syntax-extensions"}, null, s -> false);
		Bindings bindings = Engine.getBindings(ScriptContext.ENGINE_SCOPE);
		bindings.remove("exit");
		bindings.remove("quit");
		bindings.remove("load");
		bindings.remove("loadWithNewGlobal");
		sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		Engine.getContext().setWriter(pw);
	}
	// Set variables and functions in the javascript context
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
	// Set variables and functions in the javascript context
	public void SetBinding(String key,Object binding)
	{ // Set binding
		Bindings bindings = Engine.getBindings(ScriptContext.ENGINE_SCOPE);
		bindings.put(key,binding);
	}
	// Get variables and functions from the javascript context
	public String[] GetBindingKeys()
	{ // Get binding Keys
		return Engine.getBindings(ScriptContext.ENGINE_SCOPE).keySet().toArray(new String[]{});
	}
	// Set variables and functions from the javascript context
	public HashMap<String,Object> GetBindings()
	{ // returns a HashMap of code bindings
		String[] keys = GetBindingKeys();
		Bindings raw_bindings = Engine.getBindings(ScriptContext.ENGINE_SCOPE);
		HashMap<String,Object> bindings = new HashMap<>();
		for (String key : keys)
		{
			bindings.put(key,raw_bindings.get(key));
		}
		return bindings;
	}
	// execute code in the javascript context
	public CodeOutput Exec(String code) {
		// execute script
		CodeOutput output= new CodeOutput();
		ExecutorService executor = Executors.newFixedThreadPool(4);
		
		Future<?> future = executor.submit(() -> {
			try
			{
				Engine.eval(code);
				output.Text = sw.getBuffer().toString();
				output.Error = false;
			}
			catch (javax.script.ScriptException ex)
			{
				output.Error = true;
				output.Text =  ex.getMessage().replaceFirst(" in <eval>","");
			}
			catch (Exception e)
			{
				e.printStackTrace();
				output.Error = true;
				output.Text =  "Unknown error";
			}
		});
		
		executor.shutdown();                          // reject all further submissions
		
		try {
			future.get(2, TimeUnit.SECONDS);  // wait 1 second to finish
		} catch (InterruptedException e) {            // possible error cases
			System.out.println("job was interrupted");
			output.Error = true;
			output.Text =  "Script was interrupted";
		} catch (ExecutionException e) {
			output.Error = true;
			output.Text =  "Unknown error";
			System.out.println("caught exception: " + e.getCause());
		} catch (TimeoutException e) {
			output.Error = true;
			output.Text =  "Script took too long; Check your code for infinite loops";
			future.cancel(true);   // interrupt the job
		}
		try
		{
			if(!executor.awaitTermination(2, TimeUnit.SECONDS)){
				// force it to quit
				executor.shutdownNow();
				
				output.Error = true;
				output.Text =  "Script took too long; Check your code for infinite loops";
			}
		}
		catch (InterruptedException e)
		{
			e.printStackTrace();
			output.Error = true;
			output.Text =  "unknown error";
		}
		return output;
	}
}
