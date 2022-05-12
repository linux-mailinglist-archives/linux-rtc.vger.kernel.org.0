Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD2EE52568D
	for <lists+linux-rtc@lfdr.de>; Thu, 12 May 2022 22:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358471AbiELUvR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 May 2022 16:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358473AbiELUvQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 May 2022 16:51:16 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B13D05537A;
        Thu, 12 May 2022 13:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652388675; x=1683924675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CpTDljh9Jok9rnbBL80mkvsp+ypOGYJtLjkURZghnsM=;
  b=eEHCuLdOUUCUV5CPfVypE7yninX7+NkaXzzw3nRpWJ1uknx0fp0Gyk49
   hKH47S/Ep28ghFFA7uJ+AsMXL9RE9TsoMEyuEJztZzKWyI9GewHHf0Os4
   yB5x9ojklyRfskAVvMjWkZn230Llo0micqYNNpF+J3QEVNvNcYgaUaR3w
   jlJvdaeRioh2NeSbIzLHorAO0JG3ybC7MMq37dFKiwdVWzjrXlNPHW/iO
   wwh5U2kZ964G0t0AuZ2T8uA/B6gv65XJ4BEicK7Ern2N6f8xh7GajpTxj
   noyvskf7zWfSdaRQzGYiUlDHloeF8KWGBKDrrXPcVdZeM09p8wAlXbvEJ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="252180976"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="252180976"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 13:50:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="671020142"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 May 2022 13:50:50 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1npFlp-000Kuh-ND;
        Thu, 12 May 2022 20:50:49 +0000
Date:   Fri, 13 May 2022 04:50:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     kbuild-all@lists.01.org, Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH v5 4/5] rtc: rzn1: Add oscillator offset support
Message-ID: <202205130445.mjHjgcBv-lkp@intel.com>
References: <20220512143920.238987-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512143920.238987-5-miquel.raynal@bootlin.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Miquel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on robh/for-next linus/master v5.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Miquel-Raynal/RZ-N1-RTC-support/20220512-224022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20220513/202205130445.mjHjgcBv-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1b2c010278819d2c7aab406d9718a659ead047cf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Miquel-Raynal/RZ-N1-RTC-support/20220512-224022
        git checkout 1b2c010278819d2c7aab406d9718a659ead047cf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/rtc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/rtc/rtc-rzn1.c: In function 'rzn1_rtc_set_offset':
>> drivers/rtc/rtc-rzn1.c:275:29: warning: variable 'ppb_per_step' set but not used [-Wunused-but-set-variable]
     275 |         unsigned int steps, ppb_per_step;
         |                             ^~~~~~~~~~~~


vim +/ppb_per_step +275 drivers/rtc/rtc-rzn1.c

   271	
   272	static int rzn1_rtc_set_offset(struct device *dev, long offset)
   273	{
   274		struct rzn1_rtc *rtc = dev_get_drvdata(dev);
 > 275		unsigned int steps, ppb_per_step;
   276		int stepsh, stepsl;
   277		u32 val;
   278		int ret;
   279	
   280		/*
   281		 * Check which resolution mode (every 20 or 60s) can be used.
   282		 * Between 2 and 124 clock pulses can be added or substracted.
   283		 *
   284		 * In 20s mode, the minimum resolution is 2 / (32768 * 20) which is
   285		 * close to 3051 ppb. In 60s mode, the resolution is closer to 1017.
   286		 */
   287		stepsh = DIV_ROUND_CLOSEST(offset, 1017);
   288		stepsl = DIV_ROUND_CLOSEST(offset, 3051);
   289	
   290		if (stepsh >= -0x3E && stepsh <= 0x3E) {
   291			ppb_per_step = 1017;
   292			steps = stepsh;
   293			val |= RZN1_RTC_SUBU_DEV;
   294		} else if (stepsl >= -0x3E && stepsl <= 0x3E) {
   295			ppb_per_step = 3051;
   296			steps = stepsl;
   297		} else {
   298			return -ERANGE;
   299		}
   300	
   301		if (!steps)
   302			return 0;
   303	
   304		if (steps > 0) {
   305			val |= steps + 1;
   306		} else {
   307			val |= RZN1_RTC_SUBU_DECR;
   308			val |= (~(-steps - 1)) & 0x3F;
   309		}
   310	
   311		ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, val,
   312					 !(val & RZN1_RTC_CTL2_WUST), 100, 2000000);
   313		if (ret)
   314			return ret;
   315	
   316		writel(val, rtc->base + RZN1_RTC_SUBU);
   317	
   318		return 0;
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
