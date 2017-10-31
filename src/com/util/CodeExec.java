package com.util;
import java.util.HashMap;

public class CodeExec {
	public static HashMap Exec(String code) {
		CodeEngine engine = new CodeEngine();
		return engine.Exec(code);
	}
}
