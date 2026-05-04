Return-Path: <linux-rtc+bounces-6462-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMfkMmgZ+Wlc5gIAu9opvQ
	(envelope-from <linux-rtc+bounces-6462-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 05 May 2026 00:10:48 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5D04C44FE
	for <lists+linux-rtc@lfdr.de>; Tue, 05 May 2026 00:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 320243004628
	for <lists+linux-rtc@lfdr.de>; Mon,  4 May 2026 22:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA6F37B03F;
	Mon,  4 May 2026 22:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="E8cPukgj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B3532F757;
	Mon,  4 May 2026 22:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777932519; cv=none; b=LLVgCTduoAM2AssGPF+mrNypt/WvcCPEXqpky/TLADuHsW+POfTHWVda4WQY9SPpl7Hqms0Z7RKeFMNjZ1wejGwAVreVXhUTP3mT12/Z4TSUp+C8e3j21QQpAgavueSCQUHvMAeYPVjkSI38VCpUSYPfwupc7ARoY1nLFmYE8y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777932519; c=relaxed/simple;
	bh=uKO3OThduz3uDpEXSTrFD7dD0sh5vZbTHBn9d6ET+pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/jccFlDfMJ/xxutzUebOoHbiQBrlKDFw+6FVIyruHzzvMA/ulItFDz+G16CCsgxFfgVYG4/vEcabeb5GBTgQvkrIv6pqhtLATGnX39IRI/Um1yHHbYD5tqu3EmzOEVSY0fpxYIKgtiplcHgLdzLTWVQ9o+/ZFwhMAYycuc0EBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=E8cPukgj; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id D1BDC20B7168; Mon,  4 May 2026 15:08:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D1BDC20B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1777932515;
	bh=x+vUf0ep58fim8tkG16fveukvAlzam8fSbH347xB6S4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E8cPukgj9FMiXcNmlQy29pN2CJ19RexDp1IywNQqDIyrtDnlw+r1kofREWD0VGDhk
	 gC6lsOU1DHL6A1ZkQJU0uGFXbFwauRMEnu8dUL2r4MRTgfGxKnHNgDBz56e1acMv52
	 90htlsPBALqILSpRLG+UOJwe+jRJz+uH5XvdkEoo=
Date: Mon, 4 May 2026 15:08:35 -0700
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
Cc: alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tyler Hicks <code@tyhicks.com>,
	Sasha Levin <sashal@kernel.org>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Thara Gopinath <tgopinath@linux.microsoft.com>
Subject: Re: [PATCH] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Message-ID: <20260504-fd90667b1274c4e3a38a0604@linux.microsoft.com>
References: <20260501044657.1003980-2-ronan.dalton@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501044657.1003980-2-ronan.dalton@alliedtelesis.co.nz>
X-Rspamd-Queue-Id: 2E5D04C44FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.microsoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.microsoft.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6462-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux.microsoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[meaganlloyd@linux.microsoft.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,enneenne.com:email,bootlin.com:email,alliedtelesis.co.nz:email,tyhicks.com:email,linux.microsoft.com:dkim,linux.microsoft.com:mid]

Hi Ronan -

On Fri, May 01, 2026 at 04:46:10PM +1200, Ronan Dalton wrote:
> Prior to commit 6cb0d8587b96 ("rtc: ds1307: remove clear of oscillator
> stop flag (OSF) in probe"), the oscillator stop flag (OSF) bit was
> checked during device probe for the ds1337, ds1339, ds1341, and ds3231
> chips; if it was set, it would be cleared and a warning would be logged
> saying "SET TIME!". Since that commit, the OSF bit is no longer cleared,
> but the warning is still printed.
> 
> Directly following that commit, there was no way to get rid of this
> warning because nothing cleared the OSF bit on these chips.
> 
> The commit associated with the previous commit, ae03a28e12a7 ("rtc:
> ds1307: handle oscillator stop flag (OSF) for ds1341"), made proper use
> of the OSF when getting and setting the time in the RTC. However, the
> other RTC variants ds1337, ds1339 and ds3231 didn't have a corresponding
> change made.
> 
> Given that the OSF bit is no longer cleared at probe time when it is
> set, the remaining three chips should have the same handling as the
> ds1341 chip has for the OSF bit.
> 
> Fix the issue on the ds1337, ds1339 and ds3231 chips by applying the
> same logic as the ds1341 has to these chips.
> 
> Note that any devices brought up between the first referenced commit and
> this one may begin mistrusting the time reported by the RTC until it is
> set again, if the bit was never explicitly cleared.
> 
> Note that only the ds1339 was tested with this change, but the
> datasheets for the other chips contain essentially identical
> descriptions of the OSF bit so the same change should work.
> 

Thanks for finding and fixing this issue. I agree that the kernel logging
"SET TIME!" on every boot after the OSF gets set is unwanted behavior.

The original series was backported, so we will probably want this fix
backported too.

> An alternative to this change could be just to revert the referenced two
> commits and not use the OSF bit at all, apart from logging a warning and
> clearing it on probe.

The OSF handling fixed a real problem and is in use by a number of other
chip types in the driver, so I think we should keep the commits.

> 
> Signed-off-by: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Tyler Hicks <code@tyhicks.com>
> Cc: Sasha Levin <sashal@kernel.org>
> Cc: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
> Cc: Rodolfo Giometti <giometti@enneenne.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Fixes: 6cb0d8587b96 ("rtc: ds1307: remove clear of oscillator stop flag (OSF) in probe")
> ---
>  drivers/rtc/rtc-ds1307.c | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index 7205c59ff729..edf81b975dec 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -269,6 +269,16 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
>  		if (tmp & DS1338_BIT_OSF)
>  			return -EINVAL;
>  		break;
> +	case ds_1337:
> +	case ds_1339:
> +	case ds_1341:
> +	case ds_3231:
> +		ret = regmap_read(ds1307->regmap, DS1337_REG_STATUS, &tmp);
> +		if (ret)
> +			return ret;
> +		if (tmp & DS1337_BIT_OSF)
> +			return -EINVAL;
> +		break;

If you're going to re-arrange the block to be in somewhat of an order,
perhaps put it above 1338 since 1337 < 1338.

>  	case ds_1340:
>  		if (tmp & DS1340_BIT_nEOSC)
>  			return -EINVAL;
> @@ -279,13 +289,6 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
>  		if (tmp & DS1340_BIT_OSF)
>  			return -EINVAL;
>  		break;
> -	case ds_1341:
> -		ret = regmap_read(ds1307->regmap, DS1337_REG_STATUS, &tmp);
> -		if (ret)
> -			return ret;
> -		if (tmp & DS1337_BIT_OSF)
> -			return -EINVAL;
> -		break;
>  	case ds_1388:
>  		ret = regmap_read(ds1307->regmap, DS1388_REG_FLAG, &tmp);
>  		if (ret)
> @@ -380,14 +383,17 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
>  		regmap_update_bits(ds1307->regmap, DS1307_REG_CONTROL,
>  				   DS1338_BIT_OSF, 0);
>  		break;
> +	case ds_1337:
> +	case ds_1339:
> +	case ds_1341:
> +	case ds_3231:
> +		regmap_update_bits(ds1307->regmap, DS1337_REG_STATUS,
> +				   DS1337_BIT_OSF, 0);
> +		break;

Same here

>  	case ds_1340:
>  		regmap_update_bits(ds1307->regmap, DS1340_REG_FLAG,
>  				   DS1340_BIT_OSF, 0);
>  		break;
> -	case ds_1341:
> -		regmap_update_bits(ds1307->regmap, DS1337_REG_STATUS,
> -				   DS1337_BIT_OSF, 0);
> -		break;
>  	case ds_1388:
>  		regmap_update_bits(ds1307->regmap, DS1388_REG_FLAG,
>  				   DS1388_BIT_OSF, 0);
> -- 
> 2.53.0

