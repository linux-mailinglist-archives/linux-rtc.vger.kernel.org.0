Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2207E38D69C
	for <lists+linux-rtc@lfdr.de>; Sat, 22 May 2021 19:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhEVRYn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 22 May 2021 13:24:43 -0400
Received: from mga06.intel.com ([134.134.136.31]:45617 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231324AbhEVRYm (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 22 May 2021 13:24:42 -0400
IronPort-SDR: TpJOzlfbwQQnGXAYBiEovSn5d2yUZ9J0tjRQrquR+IHitq5M0gphvRENh6pZ7jc+zF20R9Itec
 6jt1Ot/80EqQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9992"; a="262901671"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="gz'50?scan'50,208,50";a="262901671"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2021 10:23:16 -0700
IronPort-SDR: ylOlxVSJcJvH8RNM4kwHSp66VHwxq5ubhtzU3OzklTsmJFpbMa1MG0cMYk9sCFIIhkkB0IzRca
 WdLYAq6ee10g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="gz'50?scan'50,208,50";a="468913739"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 22 May 2021 10:23:13 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lkVLE-0000Kw-Cx; Sat, 22 May 2021 17:23:12 +0000
Date:   Sun, 23 May 2021 01:22:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     qxj511mail@gmail.com, alexandre.belloni@bootlin.com,
        a.zummo@towertech.it
Cc:     kbuild-all@lists.01.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qiuxiaojin@cvte.com
Subject: Re: [PATCH] rtc: rs5c372:  Fix read the time from RTC is illegal
 When reading time from an uninitialized RTC chip, The value may be illegal
Message-ID: <202105230100.uUeOryMF-lkp@intel.com>
References: <20210521024026.28472-1-qxj511mail@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <20210521024026.28472-1-qxj511mail@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on v5.13-rc2 next-20210521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/qxj511mail-gmail-com/rtc-rs5c372-Fix-read-the-time-from-RTC-is-illegal-When-reading-time-from-an-uninitialized-RTC-chip-The-value-may-be-ille/20210522-202320
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
config: x86_64-randconfig-s031-20210522 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/0day-ci/linux/commit/62c495535e38dc184558713e6c007071f50f516c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review qxj511mail-gmail-com/rtc-rs5c372-Fix-read-the-time-from-RTC-is-illegal-When-reading-time-from-an-uninitialized-RTC-chip-The-value-may-be-ille/20210522-202320
        git checkout 62c495535e38dc184558713e6c007071f50f516c
        # save the attached .config to linux build tree
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/rtc/rtc-rs5c372.c: In function 'rs5c372_rtc_read_time':
>> drivers/rtc/rtc-rs5c372.c:261:3: error: implicit declaration of function 'rs5c372_rtc_set_time'; did you mean 'rs5c372_rtc_read_time'? [-Werror=implicit-function-declaration]
     261 |   rs5c372_rtc_set_time(dev, tm);
         |   ^~~~~~~~~~~~~~~~~~~~
         |   rs5c372_rtc_read_time
   drivers/rtc/rtc-rs5c372.c: At top level:
>> drivers/rtc/rtc-rs5c372.c:273:12: error: static declaration of 'rs5c372_rtc_set_time' follows non-static declaration
     273 | static int rs5c372_rtc_set_time(struct device *dev, struct rtc_time *tm)
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-rs5c372.c:261:3: note: previous implicit declaration of 'rs5c372_rtc_set_time' was here
     261 |   rs5c372_rtc_set_time(dev, tm);
         |   ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +261 drivers/rtc/rtc-rs5c372.c

   208	
   209	static int rs5c372_rtc_read_time(struct device *dev, struct rtc_time *tm)
   210	{
   211		struct i2c_client *client = to_i2c_client(dev);
   212		struct rs5c372	*rs5c = i2c_get_clientdata(client);
   213		int		status = rs5c_get_regs(rs5c);
   214		unsigned char ctrl2 = rs5c->regs[RS5C_REG_CTRL2];
   215		int flags_utime = 0;
   216	
   217		if (status < 0)
   218			return status;
   219	
   220		switch (rs5c->type) {
   221		case rtc_r2025sd:
   222		case rtc_r2221tl:
   223			if ((rs5c->type == rtc_r2025sd && !(ctrl2 & R2x2x_CTRL2_XSTP)) ||
   224			    (rs5c->type == rtc_r2221tl &&  (ctrl2 & R2x2x_CTRL2_XSTP))) {
   225				dev_warn(&client->dev, "rtc oscillator interruption detected. Please reset the rtc clock.\n");
   226				return -EINVAL;
   227			}
   228			break;
   229		default:
   230			if (ctrl2 & RS5C_CTRL2_XSTP) {
   231				dev_warn(&client->dev, "rtc oscillator interruption detected. Please reset the rtc clock.\n");
   232				return -EINVAL;
   233			}
   234		}
   235	
   236		tm->tm_sec = bcd2bin(rs5c->regs[RS5C372_REG_SECS] & 0x7f);
   237		tm->tm_min = bcd2bin(rs5c->regs[RS5C372_REG_MINS] & 0x7f);
   238		tm->tm_hour = rs5c_reg2hr(rs5c, rs5c->regs[RS5C372_REG_HOURS]);
   239	
   240		tm->tm_wday = bcd2bin(rs5c->regs[RS5C372_REG_WDAY] & 0x07);
   241		tm->tm_mday = bcd2bin(rs5c->regs[RS5C372_REG_DAY] & 0x3f);
   242	
   243		if (tm->tm_mday < 1) {
   244			// The value read from the register may be zero, which is an illegal value
   245			flags_utime = flags_utime + 1;
   246			tm->tm_mday = 1;
   247		}
   248	
   249		/* tm->tm_mon is zero-based */
   250		tm->tm_mon = bcd2bin(rs5c->regs[RS5C372_REG_MONTH] & 0x1f) - 1;
   251	
   252		if (tm->tm_mon < 0) {
   253			flags_utime = flags_utime + 1;
   254			tm->tm_mon = 0;
   255		}
   256	
   257		/* year is 1900 + tm->tm_year */
   258		tm->tm_year = bcd2bin(rs5c->regs[RS5C372_REG_YEAR]) + 100;
   259	
   260		if (flags_utime > 0) {
 > 261			rs5c372_rtc_set_time(dev, tm);
   262		}
   263	
   264		dev_dbg(&client->dev, "%s: tm is secs=%d, mins=%d, hours=%d, "
   265			"mday=%d, mon=%d, year=%d, wday=%d\n",
   266			__func__,
   267			tm->tm_sec, tm->tm_min, tm->tm_hour,
   268			tm->tm_mday, tm->tm_mon, tm->tm_year, tm->tm_wday);
   269	
   270		return 0;
   271	}
   272	
 > 273	static int rs5c372_rtc_set_time(struct device *dev, struct rtc_time *tm)
   274	{
   275		struct i2c_client *client = to_i2c_client(dev);
   276		struct rs5c372	*rs5c = i2c_get_clientdata(client);
   277		unsigned char	buf[7];
   278		unsigned char	ctrl2;
   279		int		addr;
   280	
   281		dev_dbg(&client->dev, "%s: tm is secs=%d, mins=%d, hours=%d "
   282			"mday=%d, mon=%d, year=%d, wday=%d\n",
   283			__func__,
   284			tm->tm_sec, tm->tm_min, tm->tm_hour,
   285			tm->tm_mday, tm->tm_mon, tm->tm_year, tm->tm_wday);
   286	
   287		addr   = RS5C_ADDR(RS5C372_REG_SECS);
   288		buf[0] = bin2bcd(tm->tm_sec);
   289		buf[1] = bin2bcd(tm->tm_min);
   290		buf[2] = rs5c_hr2reg(rs5c, tm->tm_hour);
   291		buf[3] = bin2bcd(tm->tm_wday);
   292		buf[4] = bin2bcd(tm->tm_mday);
   293		buf[5] = bin2bcd(tm->tm_mon + 1);
   294		buf[6] = bin2bcd(tm->tm_year - 100);
   295	
   296		if (i2c_smbus_write_i2c_block_data(client, addr, sizeof(buf), buf) < 0) {
   297			dev_dbg(&client->dev, "%s: write error in line %i\n",
   298				__func__, __LINE__);
   299			return -EIO;
   300		}
   301	
   302		addr = RS5C_ADDR(RS5C_REG_CTRL2);
   303		ctrl2 = i2c_smbus_read_byte_data(client, addr);
   304	
   305		/* clear rtc warning bits */
   306		switch (rs5c->type) {
   307		case rtc_r2025sd:
   308		case rtc_r2221tl:
   309			ctrl2 &= ~(R2x2x_CTRL2_VDET | R2x2x_CTRL2_PON);
   310			if (rs5c->type == rtc_r2025sd)
   311				ctrl2 |= R2x2x_CTRL2_XSTP;
   312			else
   313				ctrl2 &= ~R2x2x_CTRL2_XSTP;
   314			break;
   315		default:
   316			ctrl2 &= ~RS5C_CTRL2_XSTP;
   317			break;
   318		}
   319	
   320		if (i2c_smbus_write_byte_data(client, addr, ctrl2) < 0) {
   321			dev_dbg(&client->dev, "%s: write error in line %i\n",
   322				__func__, __LINE__);
   323			return -EIO;
   324		}
   325	
   326		return 0;
   327	}
   328	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--VbJkn9YxBvnuCH5J
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--VbJkn9YxBvnuCH5J--
