Return-Path: <linux-rtc+bounces-6786-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LdsdA4bfQmqFGAoAu9opvQ
	(envelope-from <linux-rtc+bounces-6786-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 23:11:34 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC516DECDA
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 23:11:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=NJmPRkeL;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6786-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6786-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 732803038D3B
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 21:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B97D389101;
	Mon, 29 Jun 2026 21:11:23 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C853C7E1D;
	Mon, 29 Jun 2026 21:11:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782767482; cv=none; b=i32G93zRTq5SIxplZg5eT6JNNMycQnhCUxU+UQH/wMJJbZYGta1zF1mW+nzG4+p5rwnMkqnpRv2aU109eSjqEuKqq40B0eaMUYHHvl+hggqCedMeXfbSk2FkQpw97VreCz1cE1I2kpSxHkRguvM4tUlU+6kpbItmOev0ySnfNYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782767482; c=relaxed/simple;
	bh=MjMuyiEiT7hz3Zll61O2Dlr8UrFTewEY5kUnhavfLC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3xGw8+pK0qRQYsXxXlOOr3hSN5V9Bqt2xEKh+45Wv9eX5ZdByZ/JZfCRbc8AjHRKTEP3O2h/bwMHloTUqjxdjOFI+WlVF+8siYrTGoAqL6BjWN2/Pftn4DoApLou+0WOFlV9KRqNbMyWzpNAnWlataq7tsRbowphOdEIksOKqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJmPRkeL; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782767470; x=1814303470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MjMuyiEiT7hz3Zll61O2Dlr8UrFTewEY5kUnhavfLC0=;
  b=NJmPRkeLEJCqDXUfXsqZfE2+OOObpgegoUuh4iJzUnEYDsN16j/pDDxr
   Rt9cXE8YDf8hbAIAcri1Ge0afbRefYBvzrR9Nemz8nVsucAw0Lvt5zsxc
   /hctJCFET8IcIuqJiSVQGwCDGWiXz/2vvsve49OTQnsBpEcVu+ichVXha
   +ZMbZFARJS/s4qDqVutY357sJzyse14wQBf+0BYg41pWy3R2SSeaURFvj
   xehquJk66sYXBE8Zgjq2AItMBWErDHTPPRQS8HaR3m3pjJD07p11SRHcm
   nLcKtktMfaBEL82QEO0AqVRGbCedWWWq0gS86QYuyv6Z0s6JNQhjbmd+P
   g==;
X-CSE-ConnectionGUID: UPXr0D8mQ+eP/en9XKEi1Q==
X-CSE-MsgGUID: lzkkAuUNQdKnwd7gpzw3Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83502820"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83502820"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 14:10:56 -0700
X-CSE-ConnectionGUID: /Xic7++iRh2P5K14e+woKg==
X-CSE-MsgGUID: inGOC2mNSVu5491mi9hXYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="250375617"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Jun 2026 14:10:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weJFi-000000007lX-13zX;
	Mon, 29 Jun 2026 21:10:50 +0000
Date: Tue, 30 Jun 2026 05:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: Fredrik M Olsson <fredrik.m.olsson@axis.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@axis.com,
	Fredrik M Olsson <fredrik.m.olsson@axis.com>
Subject: Re: [PATCH v3] rtc: ds1307: Add driver for Epson RX8901CE
Message-ID: <202606300521.DkMaPRKi-lkp@intel.com>
References: <20260629-ds1307-rx8901-add-v3-1-302dc3cbb71e@axis.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-ds1307-rx8901-add-v3-1-302dc3cbb71e@axis.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6786-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:fredrik.m.olsson@axis.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk@kernel.org,m:conor+dt@kernel.org,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@axis.com,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FC516DECDA

Hi Fredrik,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dc59e4fea9d83f03bad6bddf3fa2e52491777482]

url:    https://github.com/intel-lab-lkp/linux/commits/Fredrik-M-Olsson/rtc-ds1307-Add-driver-for-Epson-RX8901CE/20260629-232253
base:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
patch link:    https://lore.kernel.org/r/20260629-ds1307-rx8901-add-v3-1-302dc3cbb71e%40axis.com
patch subject: [PATCH v3] rtc: ds1307: Add driver for Epson RX8901CE
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260630/202606300521.DkMaPRKi-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606300521.DkMaPRKi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300521.DkMaPRKi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-ds1307.c:2332:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
    2332 |         }
         |         ^
   1 warning generated.


vim +2332 drivers/rtc/rtc-ds1307.c

  2066	
  2067	static int ds1307_probe(struct i2c_client *client)
  2068	{
  2069		const struct i2c_device_id *id = i2c_client_get_device_id(client);
  2070		struct ds1307		*ds1307;
  2071		const void		*match;
  2072		int			err = -ENODEV;
  2073		int			tmp;
  2074		const struct chip_desc	*chip;
  2075		bool			want_irq;
  2076		bool			ds1307_can_wakeup_device = false;
  2077		unsigned char		regs[8];
  2078		struct ds1307_platform_data *pdata = dev_get_platdata(&client->dev);
  2079		int			trickle_charger_setup = 0;
  2080	
  2081		ds1307 = devm_kzalloc(&client->dev, sizeof(struct ds1307), GFP_KERNEL);
  2082		if (!ds1307)
  2083			return -ENOMEM;
  2084	
  2085		dev_set_drvdata(&client->dev, ds1307);
  2086		ds1307->dev = &client->dev;
  2087		ds1307->name = client->name;
  2088	
  2089		ds1307->regmap = devm_regmap_init_i2c(client, &regmap_config);
  2090		if (IS_ERR(ds1307->regmap)) {
  2091			dev_err(ds1307->dev, "regmap allocation failed\n");
  2092			return PTR_ERR(ds1307->regmap);
  2093		}
  2094	
  2095		i2c_set_clientdata(client, ds1307);
  2096	
  2097		match = device_get_match_data(&client->dev);
  2098		if (match) {
  2099			ds1307->type = (uintptr_t)match;
  2100			chip = &chips[ds1307->type];
  2101		} else if (id) {
  2102			chip = &chips[id->driver_data];
  2103			ds1307->type = id->driver_data;
  2104		} else {
  2105			return -ENODEV;
  2106		}
  2107	
  2108		want_irq = client->irq > 0 && chip->alarm;
  2109	
  2110		if (!pdata)
  2111			trickle_charger_setup = ds1307_trickle_init(ds1307, chip);
  2112		else if (pdata->trickle_charger_setup)
  2113			trickle_charger_setup = pdata->trickle_charger_setup;
  2114	
  2115		if (trickle_charger_setup < 0)
  2116			return trickle_charger_setup;
  2117	
  2118		if (trickle_charger_setup && chip->trickle_charger_reg) {
  2119			dev_dbg(ds1307->dev,
  2120				"writing trickle charger info 0x%x to 0x%x\n",
  2121				trickle_charger_setup, chip->trickle_charger_reg);
  2122			regmap_write(ds1307->regmap, chip->trickle_charger_reg,
  2123				     (u8)trickle_charger_setup);
  2124		}
  2125	
  2126	/*
  2127	 * For devices with no IRQ directly connected to the SoC, the RTC chip
  2128	 * can be forced as a wakeup source by stating that explicitly in
  2129	 * the device's .dts file using the "wakeup-source" boolean property.
  2130	 * If the "wakeup-source" property is set, don't request an IRQ.
  2131	 * This will guarantee the 'wakealarm' sysfs entry is available on the device,
  2132	 * if supported by the RTC.
  2133	 */
  2134		if (chip->alarm && device_property_read_bool(&client->dev, "wakeup-source"))
  2135			ds1307_can_wakeup_device = true;
  2136	
  2137		switch (ds1307->type) {
  2138		case ds_1337:
  2139		case ds_1339:
  2140		case ds_1341:
  2141		case ds_3231:
  2142			/* get registers that the "rtc" read below won't read... */
  2143			err = regmap_bulk_read(ds1307->regmap, DS1337_REG_CONTROL,
  2144					       regs, 2);
  2145			if (err) {
  2146				dev_dbg(ds1307->dev, "read error %d\n", err);
  2147				goto exit;
  2148			}
  2149	
  2150			/* oscillator off?  turn it on, so clock can tick. */
  2151			if (regs[0] & DS1337_BIT_nEOSC)
  2152				regs[0] &= ~DS1337_BIT_nEOSC;
  2153	
  2154			/*
  2155			 * Using IRQ or defined as wakeup-source?
  2156			 * Disable the square wave and both alarms.
  2157			 * For some variants, be sure alarms can trigger when we're
  2158			 * running on Vbackup (BBSQI/BBSQW)
  2159			 */
  2160			if (want_irq || ds1307_can_wakeup_device)
  2161				regs[0] |= DS1337_BIT_INTCN | chip->bbsqi_bit;
  2162	
  2163			regmap_write(ds1307->regmap, DS1337_REG_CONTROL,
  2164				     regs[0]);
  2165	
  2166			/* oscillator fault? warn */
  2167			if (regs[1] & DS1337_BIT_OSF) {
  2168				dev_warn(ds1307->dev, "SET TIME!\n");
  2169			}
  2170			break;
  2171	
  2172		case rx_8025:
  2173			err = regmap_bulk_read(ds1307->regmap,
  2174					       RX8025_REG_CTRL1 << 4 | 0x08, regs, 2);
  2175			if (err) {
  2176				dev_dbg(ds1307->dev, "read error %d\n", err);
  2177				goto exit;
  2178			}
  2179	
  2180			/* oscillator off?  turn it on, so clock can tick. */
  2181			if (!(regs[1] & RX8025_BIT_XST)) {
  2182				regs[1] |= RX8025_BIT_XST;
  2183				regmap_write(ds1307->regmap,
  2184					     RX8025_REG_CTRL2 << 4 | 0x08,
  2185					     regs[1]);
  2186				dev_warn(ds1307->dev,
  2187					 "oscillator stop detected - SET TIME!\n");
  2188			}
  2189	
  2190			if (regs[1] & RX8025_BIT_PON) {
  2191				regs[1] &= ~RX8025_BIT_PON;
  2192				regmap_write(ds1307->regmap,
  2193					     RX8025_REG_CTRL2 << 4 | 0x08,
  2194					     regs[1]);
  2195				dev_warn(ds1307->dev, "power-on detected\n");
  2196			}
  2197	
  2198			if (regs[1] & RX8025_BIT_VDET) {
  2199				regs[1] &= ~RX8025_BIT_VDET;
  2200				regmap_write(ds1307->regmap,
  2201					     RX8025_REG_CTRL2 << 4 | 0x08,
  2202					     regs[1]);
  2203				dev_warn(ds1307->dev, "voltage drop detected\n");
  2204			}
  2205	
  2206			/* make sure we are running in 24hour mode */
  2207			if (!(regs[0] & RX8025_BIT_2412)) {
  2208				u8 hour;
  2209	
  2210				/* switch to 24 hour mode */
  2211				regmap_write(ds1307->regmap,
  2212					     RX8025_REG_CTRL1 << 4 | 0x08,
  2213					     regs[0] | RX8025_BIT_2412);
  2214	
  2215				err = regmap_bulk_read(ds1307->regmap,
  2216						       RX8025_REG_CTRL1 << 4 | 0x08,
  2217						       regs, 2);
  2218				if (err) {
  2219					dev_dbg(ds1307->dev, "read error %d\n", err);
  2220					goto exit;
  2221				}
  2222	
  2223				/* correct hour */
  2224				hour = bcd2bin(regs[DS1307_REG_HOUR]);
  2225				if (hour == 12)
  2226					hour = 0;
  2227				if (regs[DS1307_REG_HOUR] & DS1307_BIT_PM)
  2228					hour += 12;
  2229	
  2230				regmap_write(ds1307->regmap,
  2231					     DS1307_REG_HOUR << 4 | 0x08, hour);
  2232			}
  2233			break;
  2234		case ds_1388:
  2235			err = regmap_read(ds1307->regmap, DS1388_REG_CONTROL, &tmp);
  2236			if (err) {
  2237				dev_dbg(ds1307->dev, "read error %d\n", err);
  2238				goto exit;
  2239			}
  2240	
  2241			/* oscillator off?  turn it on, so clock can tick. */
  2242			if (tmp & DS1388_BIT_nEOSC) {
  2243				tmp &= ~DS1388_BIT_nEOSC;
  2244				regmap_write(ds1307->regmap, DS1388_REG_CONTROL, tmp);
  2245			}
  2246			break;
  2247		default:
  2248			break;
  2249		}
  2250	
  2251		/* read RTC registers */
  2252		err = regmap_bulk_read(ds1307->regmap, chip->offset, regs,
  2253				       sizeof(regs));
  2254		if (err) {
  2255			dev_dbg(ds1307->dev, "read error %d\n", err);
  2256			goto exit;
  2257		}
  2258	
  2259		if (ds1307->type == mcp794xx &&
  2260		    !(regs[DS1307_REG_WDAY] & MCP794XX_BIT_VBATEN)) {
  2261			regmap_write(ds1307->regmap, DS1307_REG_WDAY,
  2262				     regs[DS1307_REG_WDAY] |
  2263				     MCP794XX_BIT_VBATEN);
  2264		}
  2265	
  2266		tmp = regs[DS1307_REG_HOUR];
  2267		switch (ds1307->type) {
  2268		case ds_1340:
  2269		case m41t0:
  2270		case m41t00:
  2271		case m41t11:
  2272			/*
  2273			 * NOTE: ignores century bits; fix before deploying
  2274			 * systems that will run through year 2100.
  2275			 */
  2276			break;
  2277		case rx_8025:
  2278			break;
  2279		default:
  2280			if (!(tmp & DS1307_BIT_12HR))
  2281				break;
  2282	
  2283			/*
  2284			 * Be sure we're in 24 hour mode.  Multi-master systems
  2285			 * take note...
  2286			 */
  2287			tmp = bcd2bin(tmp & 0x1f);
  2288			if (tmp == 12)
  2289				tmp = 0;
  2290			if (regs[DS1307_REG_HOUR] & DS1307_BIT_PM)
  2291				tmp += 12;
  2292			regmap_write(ds1307->regmap, chip->offset + DS1307_REG_HOUR,
  2293				     bin2bcd(tmp));
  2294		}
  2295	
  2296		ds1307->rtc = devm_rtc_allocate_device(ds1307->dev);
  2297		if (IS_ERR(ds1307->rtc))
  2298			return PTR_ERR(ds1307->rtc);
  2299	
  2300		if (want_irq || ds1307_can_wakeup_device)
  2301			device_set_wakeup_capable(ds1307->dev, true);
  2302		else
  2303			clear_bit(RTC_FEATURE_ALARM, ds1307->rtc->features);
  2304	
  2305		if (ds1307_can_wakeup_device && !want_irq) {
  2306			dev_info(ds1307->dev,
  2307				 "'wakeup-source' is set, request for an IRQ is disabled!\n");
  2308			/* We cannot support UIE mode if we do not have an IRQ line */
  2309			clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, ds1307->rtc->features);
  2310		}
  2311	
  2312		if (want_irq) {
  2313			err = devm_request_threaded_irq(ds1307->dev, client->irq, NULL,
  2314							chip->irq_handler ?: ds1307_irq,
  2315							IRQF_SHARED | IRQF_ONESHOT,
  2316							ds1307->name, ds1307);
  2317			if (err) {
  2318				client->irq = 0;
  2319				device_set_wakeup_capable(ds1307->dev, false);
  2320				clear_bit(RTC_FEATURE_ALARM, ds1307->rtc->features);
  2321				dev_err(ds1307->dev, "unable to request IRQ!\n");
  2322			} else {
  2323				dev_dbg(ds1307->dev, "got IRQ %d\n", client->irq);
  2324			}
  2325		}
  2326	
  2327		switch (ds1307->type) {
  2328		case rx_8901:
  2329			set_bit(RTC_FEATURE_BACKUP_SWITCH_MODE, ds1307->rtc->features);
  2330			break;
  2331		default:
> 2332		}
  2333	
  2334		ds1307->rtc->ops = chip->rtc_ops ?: &ds13xx_rtc_ops;
  2335		err = ds1307_add_frequency_test(ds1307);
  2336		if (err)
  2337			return err;
  2338	
  2339		err = devm_rtc_register_device(ds1307->rtc);
  2340		if (err)
  2341			return err;
  2342	
  2343		if (chip->nvram_size) {
  2344			struct nvmem_config nvmem_cfg = {
  2345				.name = "ds1307_nvram",
  2346				.word_size = 1,
  2347				.stride = 1,
  2348				.size = chip->nvram_size,
  2349				.reg_read = ds1307_nvram_read,
  2350				.reg_write = ds1307_nvram_write,
  2351				.priv = ds1307,
  2352			};
  2353	
  2354			devm_rtc_nvmem_register(ds1307->rtc, &nvmem_cfg);
  2355		}
  2356	
  2357		ds1307_hwmon_register(ds1307);
  2358		ds1307_clks_register(ds1307);
  2359		ds1307_wdt_register(ds1307);
  2360	
  2361		return 0;
  2362	
  2363	exit:
  2364		return err;
  2365	}
  2366	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

