#     PREREQ_PM => { CPAN::Meta=>q[2.142060], CPAN::Meta::YAML=>q[0.003], Cwd=>q[0], Data::Dumper=>q[0], ExtUtils::CBuilder=>q[0.27], ExtUtils::Install=>q[0], ExtUtils::Manifest=>q[0], ExtUtils::Mkbootstrap=>q[0], ExtUtils::ParseXS=>q[2.21], File::Basename=>q[0], File::Compare=>q[0], File::Copy=>q[0], File::Find=>q[0], File::Path=>q[0], File::Spec=>q[0.82], File::Temp=>q[0.15], Getopt::Long=>q[0], Module::Metadata=>q[1.000002], Parse::CPAN::Meta=>q[1.4401], Perl::OSType=>q[1], Pod::Man=>q[2.17], TAP::Harness=>q[3.29], Test::More=>q[0.49], Text::Abbrev=>q[0], Text::ParseWords=>q[0], version=>q[0.87] }

all : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1
realclean : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 realclean
	/usr/bin/perl -e '1 while unlink $$ARGV[0]' Makefile
distclean : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 distclean
	/usr/bin/perl -e '1 while unlink $$ARGV[0]' Makefile


force_do_it :
	@ true
build : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 build
clean : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 clean
code : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 code
config_data : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 config_data
diff : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 diff
dist : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 dist
distcheck : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 distcheck
distdir : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 distdir
distinstall : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 distinstall
distmeta : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 distmeta
distsign : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 distsign
disttest : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 disttest
docs : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 docs
fakeinstall : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 fakeinstall
help : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 help
html : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 html
install : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 install
installdeps : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 installdeps
manifest : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 manifest
manifest_skip : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 manifest_skip
manpages : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 manpages
pardist : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 pardist
ppd : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 ppd
ppmdist : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 ppmdist
prereq_data : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 prereq_data
prereq_report : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 prereq_report
pure_install : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 pure_install
retest : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 retest
skipcheck : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 skipcheck
test : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 test
testall : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 testall
testcover : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 testcover
testdb : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 testdb
testpod : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 testpod
testpodcoverage : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 testpodcoverage
versioninstall : force_do_it
	/usr/bin/perl Build --makefile_env_macros 1 versioninstall

.EXPORT : UNINST INSTALLSCRIPT INSTALLVENDORMAN1DIR INSTALLBIN INSTALLPRIVLIB INSTALLVENDORBIN INSTALLSITEMAN1DIR INSTALLSITEBIN INSTALL_BASE POLLUTE INSTALLARCHLIB INSTALLSITESCRIPT INSTALLVENDORARCH INSTALLMAN1DIR INSTALLDIRS INC INSTALLVENDORSCRIPT PREFIX TEST_VERBOSE INSTALLSITEARCH INSTALLVENDORLIB DESTDIR INSTALLSITELIB INSTALLVENDORMAN3DIR INSTALLMAN3DIR INSTALLSITEMAN3DIR VERBINST

