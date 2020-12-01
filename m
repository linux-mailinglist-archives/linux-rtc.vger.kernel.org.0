Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B954E2C9F10
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Dec 2020 11:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbgLAKWR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 1 Dec 2020 05:22:17 -0500
Received: from mga12.intel.com ([192.55.52.136]:30701 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726046AbgLAKWQ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 1 Dec 2020 05:22:16 -0500
IronPort-SDR: 5nuBiWFnYcFleauDlVnibGMqitGhxkVDoXj79t3iJhqrECtj50UqRuIWzfL+1iYyVpgHeK6SLt
 1edI5h8Ree6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="152056597"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="gz'50?scan'50,208,50";a="152056597"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 02:21:31 -0800
IronPort-SDR: +FiQaeIaHlQZ1NXSUjULnmU/w6wa9ej0KBBWAvKnhIZV5PdosgJaaiALbTPMVO0M4tFPFAVyFn
 Chvr6elVa0Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="gz'50?scan'50,208,50";a="434615220"
Received: from lkp-server01.sh.intel.com (HELO 70b44b587200) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Dec 2020 02:21:28 -0800
Received: from kbuild by 70b44b587200 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kk2ml-0000Dc-DO; Tue, 01 Dec 2020 10:21:27 +0000
Date:   Tue, 1 Dec 2020 18:20:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Biwen Li <biwen.li@oss.nxp.com>, leoyang.li@nxp.com,
        alexandre.belloni@bootlin.com, anson.huang@nxp.com,
        aisheng.dong@nxp.com
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org, jiafei.pan@nxp.com,
        linux-rtc@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: Re: [PATCH] rtc: pcf2127: clear the flag TSF1 before enabling
 interrupt generation
Message-ID: <202012011857.keglNpcP-lkp@intel.com>
References: <20201201084746.20135-1-biwen.li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <20201201084746.20135-1-biwen.li@oss.nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Biwen,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on v5.10-rc6 next-20201130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Biwen-Li/rtc-pcf2127-clear-the-flag-TSF1-before-enabling-interrupt-generation/20201201-165409
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
config: mips-randconfig-r023-20201201 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project ac40a2d8f16b8a8c68fc811d67f647740e965cb8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/54db60db88e4fd3ab6ac26f9a5b4768316347f95
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Biwen-Li/rtc-pcf2127-clear-the-flag-TSF1-before-enabling-interrupt-generation/20201201-165409
        git checkout 54db60db88e4fd3ab6ac26f9a5b4768316347f95
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-pcf2127.c:629:16: warning: operator has lower precedence than '|'; '|' will be evaluated first
   has_nvmem (PCF2127_BIT_WD_CTL_CD0) : (0) |
   ~~~~~~~~~ ^
   drivers/rtc/rtc-pcf2127.c:629:16: note: place parentheses around the '|' expression to silence this warning
   has_nvmem (PCF2127_BIT_WD_CTL_CD0) : (0) |
   ~~~~~~~~~ ^
   drivers/rtc/rtc-pcf2127.c:629:16: note: place parentheses around the expression to evaluate it first
   has_nvmem (PCF2127_BIT_WD_CTL_CD0) : (0) |
   ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fatal error: error in backend: Nested variants found in inline asm string: ' .set push
   .set mips64r2
   .if ( 0x00 ) != -1)) 0x00 ) != -1)) : ($( static struct ftrace_branch_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace_branch"))) __if_trace = $( .func = __func__, .file = "arch/mips/include/asm/bitops.h", .line = 105, $); 0x00 ) != -1)) : $))) ) && ( 0 ); .set push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ; .endif
   1: ll $0, $1
   or $0, $2
   sc $0, $1
   beqz $0, 1b
   .set pop
   '
   clang-12: error: clang frontend command failed with exit code 70 (use -v to see invocation)
   clang version 12.0.0 (git://gitmirror/llvm_project ac40a2d8f16b8a8c68fc811d67f647740e965cb8)
   Target: mips-unknown-linux-gnu
   Thread model: posix
   InstalledDir: /opt/cross/clang-ac40a2d8f1/bin
   clang-12: note: diagnostic msg:
   Makefile arch drivers include kernel scripts source usr

vim +629 drivers/rtc/rtc-pcf2127.c

   560	
   561	static int pcf2127_probe(struct device *dev, struct regmap *regmap,
   562				 int alarm_irq, const char *name, bool has_nvmem)
   563	{
   564		struct pcf2127 *pcf2127;
   565		int ret = 0;
   566	
   567		dev_dbg(dev, "%s\n", __func__);
   568	
   569		pcf2127 = devm_kzalloc(dev, sizeof(*pcf2127), GFP_KERNEL);
   570		if (!pcf2127)
   571			return -ENOMEM;
   572	
   573		pcf2127->regmap = regmap;
   574	
   575		dev_set_drvdata(dev, pcf2127);
   576	
   577		pcf2127->rtc = devm_rtc_allocate_device(dev);
   578		if (IS_ERR(pcf2127->rtc))
   579			return PTR_ERR(pcf2127->rtc);
   580	
   581		pcf2127->rtc->ops = &pcf2127_rtc_ops;
   582		pcf2127->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
   583		pcf2127->rtc->range_max = RTC_TIMESTAMP_END_2099;
   584		pcf2127->rtc->set_start_time = true; /* Sets actual start to 1970 */
   585		pcf2127->rtc->uie_unsupported = 1;
   586	
   587		if (alarm_irq > 0) {
   588			ret = devm_request_threaded_irq(dev, alarm_irq, NULL,
   589							pcf2127_rtc_irq,
   590							IRQF_TRIGGER_LOW | IRQF_ONESHOT,
   591							dev_name(dev), dev);
   592			if (ret) {
   593				dev_err(dev, "failed to request alarm irq\n");
   594				return ret;
   595			}
   596		}
   597	
   598		if (alarm_irq > 0 || device_property_read_bool(dev, "wakeup-source")) {
   599			device_init_wakeup(dev, true);
   600			pcf2127->rtc->ops = &pcf2127_rtc_alrm_ops;
   601		}
   602	
   603		if (has_nvmem) {
   604			struct nvmem_config nvmem_cfg = {
   605				.priv = pcf2127,
   606				.reg_read = pcf2127_nvmem_read,
   607				.reg_write = pcf2127_nvmem_write,
   608				.size = 512,
   609			};
   610	
   611			ret = devm_rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
   612		}
   613	
   614		/*
   615		 * Watchdog timer enabled and reset pin /RST activated when timed out.
   616		 * Select 1Hz clock source for watchdog timer.
   617		 * Note: Countdown timer disabled and not available.
   618		 * For pca2129, pcf2129, only bit[7] is for Symbol WD_CD
   619		 * of register watchdg_tim_ctl. The bit[6] is labeled
   620		 * as T. Bits labeled as T must always be written with
   621		 * logic 0.
   622		 */
   623		ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_WD_CTL,
   624					 PCF2127_BIT_WD_CTL_CD1 |
   625					 PCF2127_BIT_WD_CTL_CD0 |
   626					 PCF2127_BIT_WD_CTL_TF1 |
   627					 PCF2127_BIT_WD_CTL_TF0,
   628					 PCF2127_BIT_WD_CTL_CD1 |
 > 629					 has_nvmem ? (PCF2127_BIT_WD_CTL_CD0) : (0) |
   630					 PCF2127_BIT_WD_CTL_TF1);
   631		if (ret) {
   632			dev_err(dev, "%s: watchdog config (wd_ctl) failed\n", __func__);
   633			return ret;
   634		}
   635	
   636		pcf2127_watchdog_init(dev, pcf2127);
   637	
   638		/*
   639		 * Disable battery low/switch-over timestamp and interrupts.
   640		 * Clear battery interrupt flags which can block new trigger events.
   641		 * Note: This is the default chip behaviour but added to ensure
   642		 * correct tamper timestamp and interrupt function.
   643		 */
   644		ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
   645					 PCF2127_BIT_CTRL3_BTSE |
   646					 PCF2127_BIT_CTRL3_BIE |
   647					 PCF2127_BIT_CTRL3_BLIE, 0);
   648		if (ret) {
   649			dev_err(dev, "%s: interrupt config (ctrl3) failed\n",
   650				__func__);
   651			return ret;
   652		}
   653	
   654		/*
   655		 * Enable timestamp function and store timestamp of first trigger
   656		 * event until TSF1 and TFS2 interrupt flags are cleared.
   657		 */
   658		ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_TS_CTRL,
   659					 PCF2127_BIT_TS_CTRL_TSOFF |
   660					 PCF2127_BIT_TS_CTRL_TSM,
   661					 PCF2127_BIT_TS_CTRL_TSM);
   662		if (ret) {
   663			dev_err(dev, "%s: tamper detection config (ts_ctrl) failed\n",
   664				__func__);
   665			return ret;
   666		}
   667	
   668		/*
   669		 * Clear TSF1 field of ctrl1 register to clear interrupt
   670		 * before enabling interrupt generation when
   671		 * timestamp flag set. Unless the flag TSF1 won't
   672		 * be cleared and the interrupt(INT pin) is
   673		 * triggered continueously.
   674		 */
   675		ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
   676					 PCF2127_BIT_CTRL1_TSF1,
   677					 0);
   678		if (ret) {
   679			dev_err(dev, "%s:  control and status register 1 (ctrl1) failed, ret = 0x%x\n",
   680				__func__, ret);
   681			return ret;
   682		}
   683		/*
   684		 * Enable interrupt generation when TSF1 or TSF2 timestamp flags
   685		 * are set. Interrupt signal is an open-drain output and can be
   686		 * left floating if unused.
   687		 */
   688		ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
   689					 PCF2127_BIT_CTRL2_TSIE,
   690					 PCF2127_BIT_CTRL2_TSIE);
   691		if (ret) {
   692			dev_err(dev, "%s: tamper detection config (ctrl2) failed\n",
   693				__func__);
   694			return ret;
   695		}
   696	
   697		ret = rtc_add_group(pcf2127->rtc, &pcf2127_attr_group);
   698		if (ret) {
   699			dev_err(dev, "%s: tamper sysfs registering failed\n",
   700				__func__);
   701			return ret;
   702		}
   703	
   704		return devm_rtc_register_device(pcf2127->rtc);
   705	}
   706	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--nFreZHaLTZJo0R7j
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--nFreZHaLTZJo0R7j--
