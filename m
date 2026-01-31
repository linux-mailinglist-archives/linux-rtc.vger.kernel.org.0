Return-Path: <linux-rtc+bounces-5920-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YK88CfdGfWlBRQIAu9opvQ
	(envelope-from <linux-rtc+bounces-5920-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 01:04:07 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C18A5BF7BA
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 01:04:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69B903022603
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 00:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1DD13D539;
	Sat, 31 Jan 2026 00:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zHX/HuAf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A7A4A02;
	Sat, 31 Jan 2026 00:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769817838; cv=none; b=Z5GXMQenkUw0PLoF+TlTASoFv7GuCTivkfpbwt7a+8k95XS6+HLJone6XBPs1asOx+7HlwfSPn7xNjJp2WiwVxeNamNLKGhOzdm8s2aUfsJyoxpZHoGOkCv39RuGCn0OSgIDYAi2OBomgexQwubk5OjXIY/2DzH2GFRifbQnBWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769817838; c=relaxed/simple;
	bh=vrxUlymp6NgNp4kWQYzAuPX+sPxhEdV0IM0mCC2NhTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CzpAhfopgGqki/yZ/rhNpu7wIbp/XSpLA13VqGD1GvUOMU3Id6aK0bACprSY39vH7w2lzqeF6YGtUNlOCD9G0wNOsq8Bom8cA3kNZG37JfuQVjhKA0lHv0heBqvDC46uc/tuOxtwOlkChu2cqzXFfbeXpz++35+KVLeMxtgus1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zHX/HuAf; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 799634E42328;
	Sat, 31 Jan 2026 00:03:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D0476075A;
	Sat, 31 Jan 2026 00:03:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E2C4119A88ED;
	Sat, 31 Jan 2026 01:03:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769817833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=7QSOAV9KvjyEiqG32/NinqncE4qzzkjLeQ4fOHtY5SY=;
	b=zHX/HuAfg4HkvK14/3MUf1sAYttURBVlbbInNlN6chjMZjSMLOTu7etGT5jrxXo89uen6g
	8e0K3GAdcILRIeCOrh3i/1pPiQ6GclmcxkilAxiP/E0rpXMSpSvWafD1sS2NiZh2bbIu7k
	D6fMrs1+1oPRVxn3xXlOeuFdWC8LeJBxvUFunW7qkxKKrjjhlWWMDjQqln2lrxQdzwKMVI
	TzJTDUEZQUKDwbjWH1Ed09ArtmPys0Zi8tUGmACLdo3CFmzfKl2uKUZWqLgvisoBJpMEgy
	3LhTRnvIUvonWx5s++JA1E2Z/C9ZRsbh6JrZzKl1W0Xbg/exF9VZFiVZkqF24Q==
Date: Sat, 31 Jan 2026 01:03:50 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Fredrik M Olsson <fredrik.m.olsson@axis.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH 3/4] rtc: ds1307: Add Driver for Epson RX8901CE
Message-ID: <20260131000350d1fac76c@mail.local>
References: <20251219-ds1307-rx8901-add-v1-0-b13f346ebe93@axis.com>
 <20251219-ds1307-rx8901-add-v1-3-b13f346ebe93@axis.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-ds1307-rx8901-add-v1-3-b13f346ebe93@axis.com>
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
	TAGGED_FROM(0.00)[bounces-5920-lists,linux-rtc=lfdr.de];
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
X-Rspamd-Queue-Id: C18A5BF7BA
X-Rspamd-Action: no action

Hello,

On 19/12/2025 13:10:37+0100, Fredrik M Olsson wrote:
>  #define MCP794XX_REG_CONTROL		0x07
>  #	define MCP794XX_BIT_ALM0_EN	0x10
>  #	define MCP794XX_BIT_ALM1_EN	0x20
> @@ -226,6 +233,19 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
>  			dev_warn_once(dev, "oscillator failed, set time!\n");
>  			return -EINVAL;
>  		}
> +	} else if (ds1307->type == rx_8901) {
> +		unsigned int regflag;
> +
> +		ret = regmap_read(ds1307->regmap, RX8901_REG_INTF, &regflag);
> +		if (ret) {
> +			dev_err(dev, "%s error %d\n", "read", ret);

The multiple dev_err you are adding should be dev_dbg as there is no
other actions for the user than to restart the operation when it fails
so there is not actual value apart when debugging.

> +			return ret;
> +		}
> +
> +		if (regflag & RX8901_REG_INTF_VLF) {
> +			dev_warn_once(dev, "oscillator failed, set time!\n");
> +			return -EINVAL;
> +		}
>  	}
>  
>  	/* read the RTC date and time registers all at once */
> @@ -307,7 +327,7 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
>  	tmp = regs[DS1307_REG_HOUR] & 0x3f;
>  	t->tm_hour = bcd2bin(tmp);
>  	/* rx8130 is bit position, not BCD */
> -	if (ds1307->type == rx_8130)
> +	if (ds1307->type == rx_8130 || ds1307->type == rx_8901)
>  		t->tm_wday = fls(regs[DS1307_REG_WDAY] & 0x7f) - 1;
>  	else
>  		t->tm_wday = bcd2bin(regs[DS1307_REG_WDAY] & 0x07) - 1;
> @@ -358,7 +378,7 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
>  	regs[DS1307_REG_MIN] = bin2bcd(t->tm_min);
>  	regs[DS1307_REG_HOUR] = bin2bcd(t->tm_hour);
>  	/* rx8130 is bit position, not BCD */
> -	if (ds1307->type == rx_8130)
> +	if (ds1307->type == rx_8130 || ds1307->type == rx_8901)
>  		regs[DS1307_REG_WDAY] = 1 << t->tm_wday;
>  	else
>  		regs[DS1307_REG_WDAY] = bin2bcd(t->tm_wday + 1);
> @@ -422,6 +442,17 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
>  			dev_err(dev, "%s error %d\n", "write", result);
>  			return result;
>  		}
> +	} else if (ds1307->type == rx_8901) {
> +		/*
> +		 * clear Voltage Loss Flag as data is available now (writing 1
> +		 * to the other bits in the INTF register has no effect)
> +		 */
> +		result = regmap_write(ds1307->regmap, RX8901_REG_INTF,
> +				      0xff ^ RX8901_REG_INTF_VLF);
> +		if (result) {
> +			dev_err(dev, "%s error %d\n", "write", result);
> +			return result;
> +		}
>  	}
>  
>  	return 0;
> @@ -568,6 +599,17 @@ static u8 do_trickle_setup_rx8130(struct ds1307 *ds1307, u32 ohms, bool diode)
>  	return setup;
>  }
>  
> +static u8 do_trickle_setup_rx8901(struct ds1307 *ds1307, u32 ohms, bool diode)
> +{
> +	/* make sure that the backup battery is enabled */
> +	u8 setup = RX8901_REG_PWSW_CFG_INIEN;

You can't do this as this will cause issues in the future for people
wanting to keep this bit disabled (the main reason being that you don't
want to draw power from the battery while your device sits on a shelf).
You have to handle the RTC_PARAM_BACKUP_SWITCH_MODE parameter and then
switch it from userspace.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

