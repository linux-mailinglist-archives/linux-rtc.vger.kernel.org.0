Return-Path: <linux-rtc+bounces-210-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F2C7E165E
	for <lists+linux-rtc@lfdr.de>; Sun,  5 Nov 2023 21:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEAD2B20D4E
	for <lists+linux-rtc@lfdr.de>; Sun,  5 Nov 2023 20:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB17918644;
	Sun,  5 Nov 2023 20:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=carlosaurelio.net header.i=@carlosaurelio.net header.b="m3SVEuje"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF643BE6D;
	Sun,  5 Nov 2023 20:18:18 +0000 (UTC)
Received: from h7.fbrelay.privateemail.com (h7.fbrelay.privateemail.com [162.0.218.230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF2790;
	Sun,  5 Nov 2023 12:18:17 -0800 (PST)
Received: from MTA-10-4.privateemail.com (mta-10.privateemail.com [198.54.118.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id E0B9B60562;
	Sun,  5 Nov 2023 15:18:14 -0500 (EST)
Received: from mta-10.privateemail.com (localhost [127.0.0.1])
	by mta-10.privateemail.com (Postfix) with ESMTP id A621C1800043;
	Sun,  5 Nov 2023 15:18:12 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=carlosaurelio.net;
	s=default; t=1699215492;
	bh=nDKjE4aaqyE3xa9fbGG91EUJMOtqQ87wXRuhYIwaqPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m3SVEuje25C99xcE6LwEpwJUmcjT5JckDxNCzwm74K+F7t7jKSrZZU76pOXNE98MG
	 WMDowxHEefrhpfic+tEAwCmhMORQAqUYWtKeh9BNgvmuexKFIpcjjKutFatw0tUC3X
	 yTMCHQPKwujH7rjrD937q1kuhznqZcE9xXISXT4ZBt0pGn70SAkvUnRCxD/1DDXvDi
	 /COVldnIHAajR9H7YEagTbPdAGPiFQHKKu6QJaNUg58htBTzIYhu8O8cwwXDyZWMjd
	 NHDwgPadMhwHNyE29ApEfzA7vLg9Lo+pX3jbKHXmr4ZC5y1tV0f6gyeLLph7Zkn+28
	 TVKWCh+p347CQ==
Received: from arch-bow (unknown [187.11.35.108])
	by mta-10.privateemail.com (Postfix) with ESMTPA;
	Sun,  5 Nov 2023 15:17:57 -0500 (EST)
Date: Sun, 5 Nov 2023 17:17:55 -0300
From: Carlos Menin <menin@carlosaurelio.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Sergio Prado <sergio.prado@e-labworks.com>, menin@carlosaurelio.net
Subject: Re: [PATCH v2 1/2] rtc: add pcf85053a
Message-ID: <ZUf4czmwLEqKpM28@arch-bow>
References: <20231103125106.78220-1-menin@carlosaurelio.net>
 <5451ac26-c498-4af5-b3fa-fe2265433ccc@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5451ac26-c498-4af5-b3fa-fe2265433ccc@roeck-us.net>
X-Virus-Scanned: ClamAV using ClamSMTP

On Fri, Nov 03, 2023 at 07:09:27AM -0700, Guenter Roeck wrote:
> On 11/3/23 05:51, Carlos Menin wrote:
> > Add support for NXP's PCF85053A RTC chip.
> > 
> > Signed-off-by: Carlos Menin <menin@carlosaurelio.net>
> > Reviewed-by: Sergio Prado <sergio.prado@e-labworks.com>
> > ---
> 
> [ ... ]
> 
> > +static int pcf85053a_bvl_to_mv(unsigned int bvl)
> > +{
> > +	long mv_table[] = {
> > +		1700,
> > +		1900,
> > +		2100,
> > +		2300,
> > +		2500,
> > +		2700,
> > +		2900,
> > +		3100,
> 
> How are those numbers determined ? The datasheet gives voltage ranges.
> I'd have assumed that the center of those ranges is chosen, but for the
> most part it is the maximum, except for 2900 which is a bit above center
> and 3100 for "> 3.0V". Not that I care too much, but it seems to me that
> using the center voltage for each range would be more consistent.
> 

I just used numbers that would result in the same step between levels
(200 mV) at the same time they would fit in the ranges, but I agree
that using the center of the ranges makes sense. In this case which
values would you suggest for <= 1.7 and > 3.0 ?

> > +static int pcf85053a_hwmon_register(struct device *dev, const char *name)
> > +{
> > +	struct pcf85053a *pcf85053a = dev_get_drvdata(dev);
> > +	struct device *hwmon_dev;
> > +
> > +	hwmon_dev = devm_hwmon_device_register_with_info(dev, name, pcf85053a,
> > +							 &pcf85053a_hwmon_chip_info,
> > +							 0);
> 
> This won't compile if CONFIG_HWMON=n or if CONFIG_RTC_DRV_PCF85053A=y and
> CONFIG_HWMON=m.
> 
> Guenter
> 

I will add dependencies in the Kconfig file.

Thanks for reviewing,
Carlos

