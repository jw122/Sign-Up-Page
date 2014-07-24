package com.vaannila.dao;

import java.sql.Types;

import org.hibernate.cfg.Environment;
import org.hibernate.dialect.Dialect;

public class MSAccessDialect extends Dialect {
	
	public MSAccessDialect() {
		
		super();
		registerColumnType( Types.BIT, "BIT" );
		registerColumnType( Types.BIGINT, "INTEGER" );
		registerColumnType( Types.SMALLINT, "SMALLINT" );
		registerColumnType( Types.TINYINT, "BYTE" );
		registerColumnType( Types.INTEGER, "INTEGER" );
		registerColumnType( Types.CHAR, "VARCHAR(1)" );
		registerColumnType( Types.VARCHAR, "VARCHAR($l)" );
		registerColumnType( Types.FLOAT, "DOUBLE" );
		registerColumnType( Types.DOUBLE, "DOUBLE" );
		registerColumnType( Types.DATE, "DATETIME" );
		registerColumnType( Types.TIME, "DATETIME" );
		registerColumnType( Types.TIMESTAMP, "DATETIME" );
		registerColumnType( Types.VARBINARY, "VARBINARY($l)" );
		registerColumnType( Types.NUMERIC, "NUMERIC" );

		getDefaultProperties().setProperty(Environment.STATEMENT_BATCH_SIZE,NO_BATCH);
		}

		public String getIdentityColumnString() {
			//return " counter ";
			return "not null auto_number";
		}

		public String getIdentitySelectString() {
			return "select @@IDENTITY";
		}
}
