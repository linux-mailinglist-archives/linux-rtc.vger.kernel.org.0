Return-Path: <linux-rtc+bounces-5921-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AZUNGZHfWlRRQIAu9opvQ
	(envelope-from <linux-rtc+bounces-5921-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 01:05:58 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FEBBF7CD
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 01:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95400301B925
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 00:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E19433A0;
	Sat, 31 Jan 2026 00:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V3MdabnD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C763A2556E;
	Sat, 31 Jan 2026 00:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769817955; cv=none; b=eJBpnX6Ye0S6L3B4XmM3VjPz1SLOXioQg7oUe6kTFZcqF7cgGJ13z4pMzuB0560rJI0KWg+wgXAlJDOCs9+7hisb2/cHvrRQQ1mI4GkAnSYp0PAvhgR+Nr6ec/iNSZs0vufD/iSiTV/nPOB3lFHSBkcHuLA3M3mMCsewstcqskE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769817955; c=relaxed/simple;
	bh=nnF37jpn1ccH1eSP5LAYMpOQwE/0kLNPS98l5gNdcC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVZcZFyTPWHxHFB42WnMC5kI9KHYSFNU9o+8A9dnvMfmYfEFAdSqvQ78g0UCDo5ISdKYv7KZZuYt50jh8E8EajHmY5Ai420MUHiunFT1AfD8WcItTnFBM/vC3/DSAG7V4gBYxU2WldViJwz6SOisTo3AfSZ3NiRpUTEBjTKXv+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V3MdabnD; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 626AF1A2B3D;
	Sat, 31 Jan 2026 00:05:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 290D56075A;
	Sat, 31 Jan 2026 00:05:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AAAA2119A88BC;
	Sat, 31 Jan 2026 01:05:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769817951; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=E0wRSbu057Z1EpllgPAdIzsCUMQY+IxBbvgHtbwZcQo=;
	b=V3MdabnDxciSkydKyaZBgduAYS647H7TcWaQwVtyXG1EmUqhvVMiDflBkRNkrQo6IlWxTO
	eiXXzYX41t8NMKFG5oxLzsbCdOOtZKI254pphvKDF/6I0AcHA0qlQ2aq0HK2ZL6SG1M0kr
	Nnh4PW/j9yRMAZjrve7VwLao0I1RCKZu9SfdBWWgebMrlCOAz6t+m2js/2TPEGUKXTVuAX
	jM7bC563perU2q6Lr/zcaF3x64CYMhq7Ci4ori+300CEw8DV9a9qb0GFCICI9m0ZwyIB+H
	+Sy30Y4W5fC/cvJ98gTZdxukXxqTzaWyQQl9qsE+aBXcY5+DRYBQKnBh3uAbag==
Date: Sat, 31 Jan 2026 01:05:49 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Fredrik M Olsson <fredrik.m.olsson@axis.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH 4/4] rtc: ds1307: Add support for reading RX8901CE
 battery VL status
Message-ID: <20260131000549071abafa@mail.local>
References: <20251219-ds1307-rx8901-add-v1-0-b13f346ebe93@axis.com>
 <20251219-ds1307-rx8901-add-v1-4-b13f346ebe93@axis.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-ds1307-rx8901-add-v1-4-b13f346ebe93@axis.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5921-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:url,bootlin.com:dkim]
X-Rspamd-Queue-Id: 28FEBBF7CD
X-Rspamd-Action: no action

On 19/12/2025 13:10:38+0100, Fredrik M Olsson wrote:
> Adds support for:
> - Reading the battery voltage low status using the RTC_VL_READ ioctl,
>   which also reports invalid time information if the VLF flag is set.
> 
> Signed-off-by: Fredrik M Olsson <fredrik.m.olsson@axis.com>
> ---
>  drivers/rtc/rtc-ds1307.c | 46 +++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index 99d95e520108..ca062ed0c867 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -133,8 +133,11 @@ enum ds_type {
>  #define RX8901_REG_INTF			0x0e
>  #define RX8901_REG_INTF_VLF		BIT(1)
>  #define RX8901_REG_PWSW_CFG		0x37
> +#define RX8901_REG_PWSW_CFG_VBATLDETEN	BIT(4)
>  #define RX8901_REG_PWSW_CFG_INIEN	BIT(6)
>  #define RX8901_REG_PWSW_CFG_CHGEN	BIT(7)
> +#define RX8901_REG_BUF_INTF		0x46
> +#define RX8901_REG_BUF_INTF_VBATLF	BIT(3)
>  
>  #define MCP794XX_REG_CONTROL		0x07
>  #	define MCP794XX_BIT_ALM0_EN	0x10
> @@ -458,6 +461,39 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_RTC_INTF_DEV
> +static int rx8901_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
> +{
> +	struct ds1307 *ds1307 = dev_get_drvdata(dev);
> +	unsigned int regflag, tmp = 0;
> +	int ret = 0;
> +
> +	switch (cmd) {
> +	case RTC_VL_READ:
> +		ret = regmap_read(ds1307->regmap, RX8901_REG_INTF, &regflag);
> +		if (ret)
> +			return ret;
> +
> +		if (regflag & RX8901_REG_INTF_VLF)
> +			tmp |= RTC_VL_DATA_INVALID;
> +
> +		ret = regmap_read(ds1307->regmap, RX8901_REG_BUF_INTF, &regflag);
> +		if (ret)
> +			return ret;
> +
> +		if (regflag & RX8901_REG_BUF_INTF_VBATLF)
> +			tmp |= RTC_VL_BACKUP_LOW;
> +
> +		return put_user(tmp, (unsigned int __user *)arg);
> +	default:
> +		return -ENOIOCTLCMD;
> +	}
> +	return ret;
> +}
> +#else
> +#define rx8901_ioctl NULL
> +#endif
> +
>  static int ds1337_read_alarm(struct device *dev, struct rtc_wkalrm *t)
>  {
>  	struct ds1307		*ds1307 = dev_get_drvdata(dev);
> @@ -599,10 +635,13 @@ static u8 do_trickle_setup_rx8130(struct ds1307 *ds1307, u32 ohms, bool diode)
>  	return setup;
>  }
>  
> -static u8 do_trickle_setup_rx8901(struct ds1307 *ds1307, u32 ohms, bool diode)
> +static u8 do_trickle_setup_rx8901(struct ds1307 *ds1307, u32 ohms __always_unused, bool diode)
>  {
> -	/* make sure that the backup battery is enabled */
> -	u8 setup = RX8901_REG_PWSW_CFG_INIEN;
> +	/*
> +	 * make sure that the backup battery is enabled and that battery
> +	 * voltage detection is performed
> +	 */
> +	u8 setup = RX8901_REG_PWSW_CFG_INIEN | RX8901_REG_PWSW_CFG_VBATLDETEN;
>  
>  	if (diode)
>  		setup |= RX8901_REG_PWSW_CFG_CHGEN;
> @@ -1005,6 +1044,7 @@ static const struct rtc_class_ops rx8130_rtc_ops = {
>  static const struct rtc_class_ops rx8901_rtc_ops = {
>  	.read_time      = ds1307_get_time,
>  	.set_time       = ds1307_set_time,
> +	.ioctl          = rx8901_ioctl,
>  };
>  

This seems to be an unrelated changed that hasn't been squashed in the
proper patch.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

