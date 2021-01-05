Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7E42EA529
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Jan 2021 07:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbhAEGFV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 Jan 2021 01:05:21 -0500
Received: from mga01.intel.com ([192.55.52.88]:60473 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725298AbhAEGFV (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 5 Jan 2021 01:05:21 -0500
IronPort-SDR: 4ZDcKI55Ff6QY9Uyo9fFW2ev6f6qlns+RpWB4ektlt4zUeKemVoa0Yd+MTUfxr3R+r3bw7nqkS
 dJHyfKOUF4KQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="195585959"
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
   d="gz'50?scan'50,208,50";a="195585959"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 22:04:39 -0800
IronPort-SDR: t1UhBJ4uqWRyv1PvK9j8907s1H3wVgJKpas1LZdW2D9WgVN4EJMRYMdjHyNaecUs3y85TmkJUN
 0Qka77/YgVIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
   d="gz'50?scan'50,208,50";a="566986456"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jan 2021 22:04:35 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kwfSN-0007zP-4m; Tue, 05 Jan 2021 06:04:35 +0000
Date:   Tue, 5 Jan 2021 14:03:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Philipp Rosenberger <p.rosenberger@kunbus.com>,
        linux-rtc@vger.kernel.org
Cc:     kbuild-all@lists.01.org, p.rosenberger@kunbus.com,
        dan.carpenter@oracle.com, u.kleine-koenig@pengutronix.de,
        biwen.li@nxp.com, lvb@xiphos.com, bruno.thomsen@gmail.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: pcf2127: Disable Power-On Reset Override
Message-ID: <202101051332.G87dSM0T-lkp@intel.com>
References: <20210104161910.9144-2-p.rosenberger@kunbus.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline
In-Reply-To: <20210104161910.9144-2-p.rosenberger@kunbus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Philipp,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on v5.11-rc2 next-20210104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Philipp-Rosenberger/rtc-pcf2127-proper-initilize-rtc-after-power-loss/20210105-002256
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
config: parisc-randconfig-r006-20210105 (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ac3cb31420b7b402d9deda24768725e3b956ccf5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Philipp-Rosenberger/rtc-pcf2127-proper-initilize-rtc-after-power-loss/20210105-002256
        git checkout ac3cb31420b7b402d9deda24768725e3b956ccf5
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=parisc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/rtc/rtc-pcf2127.c: In function 'pcf2127_probe':
>> drivers/rtc/rtc-pcf2127.c:622:5: error: 'PCF2127_BIT_CTRL1_POR_OVRD' undeclared (first use in this function); did you mean 'PCF2127_BIT_CTRL1_TSF1'?
     622 |     PCF2127_BIT_CTRL1_POR_OVRD);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |     PCF2127_BIT_CTRL1_TSF1
   drivers/rtc/rtc-pcf2127.c:622:5: note: each undeclared identifier is reported only once for each function it appears in


vim +622 drivers/rtc/rtc-pcf2127.c

   561	
   562	static int pcf2127_probe(struct device *dev, struct regmap *regmap,
   563				 int alarm_irq, const char *name, bool has_nvmem)
   564	{
   565		struct pcf2127 *pcf2127;
   566		int ret = 0;
   567	
   568		dev_dbg(dev, "%s\n", __func__);
   569	
   570		pcf2127 = devm_kzalloc(dev, sizeof(*pcf2127), GFP_KERNEL);
   571		if (!pcf2127)
   572			return -ENOMEM;
   573	
   574		pcf2127->regmap = regmap;
   575	
   576		dev_set_drvdata(dev, pcf2127);
   577	
   578		pcf2127->rtc = devm_rtc_allocate_device(dev);
   579		if (IS_ERR(pcf2127->rtc))
   580			return PTR_ERR(pcf2127->rtc);
   581	
   582		pcf2127->rtc->ops = &pcf2127_rtc_ops;
   583		pcf2127->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
   584		pcf2127->rtc->range_max = RTC_TIMESTAMP_END_2099;
   585		pcf2127->rtc->set_start_time = true; /* Sets actual start to 1970 */
   586		pcf2127->rtc->uie_unsupported = 1;
   587	
   588		if (alarm_irq > 0) {
   589			ret = devm_request_threaded_irq(dev, alarm_irq, NULL,
   590							pcf2127_rtc_irq,
   591							IRQF_TRIGGER_LOW | IRQF_ONESHOT,
   592							dev_name(dev), dev);
   593			if (ret) {
   594				dev_err(dev, "failed to request alarm irq\n");
   595				return ret;
   596			}
   597		}
   598	
   599		if (alarm_irq > 0 || device_property_read_bool(dev, "wakeup-source")) {
   600			device_init_wakeup(dev, true);
   601			pcf2127->rtc->ops = &pcf2127_rtc_alrm_ops;
   602		}
   603	
   604		if (has_nvmem) {
   605			struct nvmem_config nvmem_cfg = {
   606				.priv = pcf2127,
   607				.reg_read = pcf2127_nvmem_read,
   608				.reg_write = pcf2127_nvmem_write,
   609				.size = 512,
   610			};
   611	
   612			ret = devm_rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
   613		}
   614	
   615		/*
   616		 * Disable the Power-On Reset Override facility to start normal
   617		 * operation. If the operation should fail, just move on. The RTC should
   618		 * work fine, but functions like watchdog and alarm interrupts might
   619		 * not work.
   620		 */
   621		ret = regmap_clear_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
 > 622					PCF2127_BIT_CTRL1_POR_OVRD);
   623		if (ret) {
   624			dev_err(dev, "%s: can't disable PORO (ctrl1).\n", __func__);
   625			dev_warn(dev, "Watchdog and alarm functions might not work properly\n");
   626		}
   627	
   628		/*
   629		 * Watchdog timer enabled and reset pin /RST activated when timed out.
   630		 * Select 1Hz clock source for watchdog timer.
   631		 * Note: Countdown timer disabled and not available.
   632		 */
   633		ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_WD_CTL,
   634					 PCF2127_BIT_WD_CTL_CD1 |
   635					 PCF2127_BIT_WD_CTL_CD0 |
   636					 PCF2127_BIT_WD_CTL_TF1 |
   637					 PCF2127_BIT_WD_CTL_TF0,
   638					 PCF2127_BIT_WD_CTL_CD1 |
   639					 PCF2127_BIT_WD_CTL_CD0 |
   640					 PCF2127_BIT_WD_CTL_TF1);
   641		if (ret) {
   642			dev_err(dev, "%s: watchdog config (wd_ctl) failed\n", __func__);
   643			return ret;
   644		}
   645	
   646		pcf2127_watchdog_init(dev, pcf2127);
   647	
   648		/*
   649		 * Disable battery low/switch-over timestamp and interrupts.
   650		 * Clear battery interrupt flags which can block new trigger events.
   651		 * Note: This is the default chip behaviour but added to ensure
   652		 * correct tamper timestamp and interrupt function.
   653		 */
   654		ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
   655					 PCF2127_BIT_CTRL3_BTSE |
   656					 PCF2127_BIT_CTRL3_BIE |
   657					 PCF2127_BIT_CTRL3_BLIE, 0);
   658		if (ret) {
   659			dev_err(dev, "%s: interrupt config (ctrl3) failed\n",
   660				__func__);
   661			return ret;
   662		}
   663	
   664		/*
   665		 * Enable timestamp function and store timestamp of first trigger
   666		 * event until TSF1 and TFS2 interrupt flags are cleared.
   667		 */
   668		ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_TS_CTRL,
   669					 PCF2127_BIT_TS_CTRL_TSOFF |
   670					 PCF2127_BIT_TS_CTRL_TSM,
   671					 PCF2127_BIT_TS_CTRL_TSM);
   672		if (ret) {
   673			dev_err(dev, "%s: tamper detection config (ts_ctrl) failed\n",
   674				__func__);
   675			return ret;
   676		}
   677	
   678		/*
   679		 * Enable interrupt generation when TSF1 or TSF2 timestamp flags
   680		 * are set. Interrupt signal is an open-drain output and can be
   681		 * left floating if unused.
   682		 */
   683		ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
   684					 PCF2127_BIT_CTRL2_TSIE,
   685					 PCF2127_BIT_CTRL2_TSIE);
   686		if (ret) {
   687			dev_err(dev, "%s: tamper detection config (ctrl2) failed\n",
   688				__func__);
   689			return ret;
   690		}
   691	
   692		ret = rtc_add_group(pcf2127->rtc, &pcf2127_attr_group);
   693		if (ret) {
   694			dev_err(dev, "%s: tamper sysfs registering failed\n",
   695				__func__);
   696			return ret;
   697		}
   698	
   699		return devm_rtc_register_device(pcf2127->rtc);
   700	}
   701	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--oyUTqETQ0mS9luUI
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
wFidCxktAQDO6lRWtjkCAA==

--oyUTqETQ0mS9luUI--
