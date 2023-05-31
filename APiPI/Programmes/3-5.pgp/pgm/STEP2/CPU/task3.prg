PROGRAM task3 5 (* Ladder Diagram *)
	CODE_INIT
		<?xml version="1.0"?>
		<?ladder Version = 1.0?>
		<!-- Automation Studio Generated XML Section -->
		<networks xmlns:dt="urn:schemas-microsoft-com:datatypes" maxcolumn="0">
		</networks>
	END_CODE_INIT
	CODE_CYCLIC
		<?xml version="1.0"?>
		<?ladder Version = 1.0?>
		<!-- Automation Studio Generated XML Section -->
		<networks xmlns:dt="urn:schemas-microsoft-com:datatypes" maxcolumn="8">
			<network label="" comment="" row="3" column="5">
				<row><contact type="open" name="d"/><contact type="open" name="t"/><line/><line/><line/><line/><line/><coil type="open" name="Y2"/></row>
				<row><empty or="true"/><contact type="negative transition" name="S2"/><contact type="open" name="Y2"/><contact type="negative transition" name="S3"/><line/><line/><line or="true"/><empty/></row>
				<row><empty or="true"/><contact type="open" name="P4"/><contact type="negative transition" name="P3"/><contact type="open" name="S2"/><line/><line/><line or="true"/><empty/></row>
			</network>
			<network label="" comment="" row="2" column="5">
				<row><contact type="negative transition" name="P3"/><contact type="negative transition" name="Y2"/><contact type="open" name="S2"/><contact type="open" name="d"/><line/><line/><line/><coil type="open" name="Y1"/></row>
				<row><contact type="open" name="S1"/><contact type="open" name="Y1"/><contact type="open" name="P3"/><line/><line/><line/><line or="true"/><empty/></row>
			</network>
			<network label="" comment="" row="3" column="4">
				<row><contact type="open" name="d"/><contact type="open" name="Y1"/><contact type="open" name="P4"/><line/><line/><line/><line/><coil type="open" name="P3"/></row>
				<row><empty or="true"/><contact type="open" name="P3"/><line/><line/><line/><line/><line or="true"/><empty/></row>
				<row><contact type="open" name="P3"/><contact type="open" name="Y2"/><line/><line/><line/><line/><line or="true"/><empty/></row>
			</network>
			<network label="" comment="" row="4" column="3">
				<row><contact type="open" name="S2"/><contact type="negative transition" name="Y1"/><line/><line/><line/><line/><line/><coil type="open" name="P4"/></row>
				<row><contact type="open" name="d"/><contact type="open" name="P4"/><line/><line/><line/><line/><line or="true"/><empty/></row>
				<row><contact type="open" name="P4"/><contact type="open" name="Y1"/><line/><line/><line/><line/><line or="true"/><empty/></row>
				<row><contact type="open" name="P3"/><line/><line/><line/><line/><line/><line or="true"/><empty/></row>
			</network>
			<network label="" comment="" row="3" column="8">
				<row><empty/><empty/><empty/><empty/><empty/><functionblock position="header" name="latency"/><empty/></row>
				<row><contact type="open" name="d"/><contact type="open" name="S1"/><line/><line/><line/><functionblock position="top" type="TON_10ms"><input name="IN"/><output name="Q"/></functionblock><coil type="open" name="T"/></row>
				<row><empty or="true"/><contact type="open" name="S2"/><contact type="open" name="P3"/><contact type="negative transition" name="Yn" or="true"/><empty/><functionblock position="bottom"><input name="PT"/><output name="ET"/></functionblock><empty/></row>
			</network>
		</networks>
	END_CODE_CYCLIC
END_PROGRAM
