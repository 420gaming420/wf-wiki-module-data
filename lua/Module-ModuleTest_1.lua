---	'''ModuleTest''' hosts the entry point to the unit test runner [[Module:TestHarness]].<br />
--	
--	On this Wiki, ModuleTest is used in:
--	* All module's <code>/testcases/doc</code> subpages
--	
--  Fork of https://dev.fandom.com/wiki/Module:Testunit
--  
--	@module		moduletest
--	@alias		p
--	@author		[[User:FINNER|FINNER]]
--	@author		[[User:KockaAdmiralac|KockaAdmiralac]]
--	@require	[[Module:Arguments]]
--	@release	stable

local p = {};

local getArgs = require('Module:Arguments').getArgs;

function p.main(frame)
    local args = getArgs(frame); --frame:getParent().args;
    local title = mw.title.getCurrentTitle();
    local typ = string.lower(args[1] or '');
    local moduleName, functionName;

    if typ == 'scrib' then
        moduleName = 'Module:'..(args.modulename or title.rootText)..'/testcases';
        functionName = 'run';
        frame.args = {};
    elseif typ == 'unittest' then
        moduleName = 'Module:'..(args.modulename or title.rootText)..'/testcases';
        functionName = 'run_tests';
        frame.args = {
            differs_at = args.differs_at or '1',
        };
    elseif typ == 'sandbox' then
        moduleName = 'Module:TestHarness';
        functionName = 'run_tests';
        frame.args = {
            modulename = args.modulename or (title.rootText..'/sandbox'),
            testdata = args.testdata or (title.rootText..'/sandbox/testcases'),
            differs_at = args.differs_at or '1',
            display_mode = args.display_mode or '0'
        };
    else
        moduleName = 'Module:TestHarness';
        functionName = 'run_tests';
        frame.args = {
            modulename = args.modulename or title.rootText or '',
            testdata = args.testdata or '',
            differs_at = args.differs_at or '1',
            display_mode = args.display_mode or '0',
            pass_only = args.pass_only or '0'
        };
    end

    return require(moduleName)[functionName](frame);
end

return p;
