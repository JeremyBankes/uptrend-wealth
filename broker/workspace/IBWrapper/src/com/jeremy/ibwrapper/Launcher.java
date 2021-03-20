package com.jeremy.ibwrapper;

import java.io.IOException;

public class Launcher {

	public static void main(String[] args) {
		try {
			IBWrapperApplication application = new IBWrapperApplication("localhost", 4002, 8080);
			application.start();
		} catch (IOException exception) {
			exception.printStackTrace();
		}
	}

}
