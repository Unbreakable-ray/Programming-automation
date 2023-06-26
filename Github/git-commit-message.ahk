#Requires AutoHotkey v2.0
#SingleInstance Force
#HotIf WinActive("ahk_exe GitHubDesktop.exe") 

F1::
{
MsgBox ("(aa)Add: Create a capability e.g. feature, test, dependency.`n`n(dr)Drop: Delete a capability e.g. feature, test, dependency.`n`n(f)Fix: Fix an issue e.g. bug, typo, accident, misstatement.`n`n(b)Bump: Increase the version of something e.g. a dependency.`n`n(m)Make: Change the build process, or tools, or infrastructure.`n`n(s)Start: Begin doing something; e.g. enable a toggle, feature flag, etc.`n`n(st)Stop: End doing something; e.g. disable a toggle, feature flag, etc.`n`n(o)Optimize: A change that MUST be just about performance, e.g. speed up code.`n`n(d)Document: A change that MUST be only in the documentation, e.g. help files.`n`n(re)Refactor: A change that MUST be just a refactoring patch`n`n(r)Reformat: A change that MUST be just a formatting path, e.g. change spaces.`n`n(ar)Rearrange: A change that MUST be just an arranging patch, e.g. change layout.`n`n(dr)Redraw: A change that MUST be just a drawing patch, e.g. change a graphic, image, icon, etc.`n`n(wo)Reword: A change that MUST be just a wording patch, e.g. change a comment, label, doc, etc.`n`n(vi)Revise: A change that MUST be just a revising patch e.g. a change, an alteration, a correction, etc.`n`nRefit/Refresh/Renew/Reload: A change that MUST be just a patch e.g. update test data, API keys, etc.`n`n(l)Add or change/Fix Link.`n`n(art)Adding Art/logo/.`n`n(u)Update`n`n(t)Test.`n`n(de)Delete")

}

+1::
{
    
}

::aa::Add,
::dr::Drop,
::f::Fix,
::b::Bumb,
::m::Make,
::s::Start,
::st::Stop,
::o::Optimize,
::d::Document,
::re::Refactor,
::r::Reformat,
::ar::Rearrange,
::dra::Redraw,
::wo::Reword,
::vi::Revise,
::l::Link,
::art::Adding Art/logo/Image
::u::Update,
::t::Test,
::de::Delete,