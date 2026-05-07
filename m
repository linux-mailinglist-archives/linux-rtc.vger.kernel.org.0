Return-Path: <linux-rtc+bounces-6475-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFPjF9St/GkNSgAAu9opvQ
	(envelope-from <linux-rtc+bounces-6475-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 07 May 2026 17:20:52 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9924EAE9B
	for <lists+linux-rtc@lfdr.de>; Thu, 07 May 2026 17:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 393C33010399
	for <lists+linux-rtc@lfdr.de>; Thu,  7 May 2026 15:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD861441032;
	Thu,  7 May 2026 15:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="aFCOO/nW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bzg5BsZb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971BD43E9FF;
	Thu,  7 May 2026 15:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167167; cv=none; b=POj8bKIYyAild0pl+kxu5I4Ck+pgY6oFH145xohB8AycP5xinWNsvmmno0jLUmfVjMmEuTpnpoMo0Y5o3K+0PpdUFKuJwTnVDbcc6v6EMiw0QlmCDFmqiMjAhjlGo2GSzJqlPW0bNYNTd/uYcyceSTGUwtPVJIptJB/BI9p2ASg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167167; c=relaxed/simple;
	bh=lf+sZJ4rE5b/24w7+yfWuko/2+F9/GbvSSUjz/pQdEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMxFIjmcY4MfQD0K95A17bX3kHlFGMJd5xYhjhxiv9wC9tJa+tfRyRU8fT+Hsg+InoqmkpoOoly4x26099sSM4bxW8bmqb24856zh5C0Z2j/ETRK3wUuOgClj7310/WpmgeWjsvFBKZNVCQOJLAPP0BkcVv3La/bikhcWVpyopo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=aFCOO/nW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Bzg5BsZb; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2811A7A0084;
	Thu,  7 May 2026 11:19:22 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 07 May 2026 11:19:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1778167161; x=1778253561; bh=hVqV1Ts51c
	DJBkNZ9a1xW6T5PtwH6Vxq8AydYKDJXLQ=; b=aFCOO/nWk+7Q1e7ALs3Xfmt7e9
	FJo9T5qBlgPBFqoVdyRXh9pQiA8b+KRY4e/TcB4sVROz11cZMLq288xZZyOlnxRp
	Fn4fAlRZ0ks9chKC2h38lIqkvQpF43TlfcQrTa38G36r6VO6EUsySnyhwlTBBeOx
	RA/Gg8a2ARx6wIDUdp6ruH7qO//SrYks26UU6q9WRrijlaxMsPzmveY/guMn8qHD
	6SZxlyXBLBAjMjh6OrYyHYXivSgqffsf6hFRCI7MmDSSRHTW/SZnvsrWLNrMSJjj
	feGjm2mAkIhc/L4PMxISvALwPlvOzq0e5Pddxnk2GNueyUwhPrStAi1lzNJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778167161; x=1778253561; bh=hVqV1Ts51cDJBkNZ9a1xW6T5PtwH6Vxq8Ay
	dYKDJXLQ=; b=Bzg5BsZb5mulLjvaF6uJ4Qmu7VOp4WQV7NXCQC+EF0XHfnzWX6w
	uZ6ru44jpZ/UCjWGHCURlHeSfXFxUVKqAXBrqm/7EudDbYHxXZNxIM2Nt1kB1h0z
	TjhVNcn7+iOSLF0NxxG+9IHtKHzjrBWyGvF95zx/4l4NCXqycW2Pw2QyYNy7lj71
	qixrHPz4fMhyYl6szHS1fMqMoDdCNQ7NyFk42noAcZ1tXJIkvdPrldfgylpHqdEe
	qn9lIyd4vQAfeI2Oh9KIcA2Q3CuGpifOnUCSN27t6Q1ZYQ4ivqz1vfCyfxL44xn2
	XwX6e65uTyBuj2mFBaQbkrI37BDQxNlnTDA==
X-ME-Sender: <xms:eK38aawv_VKochBhy2N2OJjCVo20yohJC0LOsVCp_QwiCE5nsz41Pw>
    <xme:eK38abOJvva_BcRjDC434OPYbGtyG6zKnM0tNaOclsYrPLQPxDPX1Ii6pJ4NHQ8eg
    addwPhFVdSKc-yNIyhlrMUcAVMulXaBkCqxaplRWQK7L3gAZyQVNZIh>
X-ME-Received: <xmr:eK38aQmjW-ttzxWYRcCoKw1jcfSSKdTMmh7n4zk2bXEU-DIxzdilNnk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdejkeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfihlhgvrhcu
    jfhitghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnh
    epvdehvddttdfhfefhtdfgleehfeeggfdujeeuveekudevkedvgeejtddtfefgleeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghouggvse
    hthihhihgtkhhsrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehrohhnrghnrdgurghlthhonhesrghllhhivgguthgvlhgvshhish
    drtghordhniidprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohho
    thhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehsrghshhgrlheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepmhgvrghgrghnlhhlohihugeslhhinhhugidrmhhitghrohhsohhfthdrtgho
    mhdprhgtphhtthhopehgihhomhgvthhtihesvghnnhgvvghnnhgvrdgtohhmpdhrtghpth
    htoheptghhrhhishdrphgrtghkhhgrmhesrghllhhivgguthgvlhgvshhishdrtghordhn
    ii
X-ME-Proxy: <xmx:eK38aQQ3bLacuHhSRw03GKylSITUitPVygD-eYg0bykYE4mVdrt-Sw>
    <xmx:eK38afUAON6ICjEFAedp0odRUzusrtjo2oROjLI39Gn8Kz1trUrE1A>
    <xmx:eK38aUJtXL5H3gT775cBb_mQwmnBT0PTS7YxRQqvr9u6VAXcpbNZBw>
    <xmx:eK38af0JAoDqQwCyDD45m5qsHd7aIZsQEuqVhBT7wiab0poQtSYLQw>
    <xmx:ea38aSmEmMzyJoUfe8EmdqYZ2XQ2TqXUBvRylLbnSgMwk68fA2u8jT64>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 May 2026 11:19:19 -0400 (EDT)
Date: Thu, 7 May 2026 10:19:03 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
Cc: alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Message-ID: <afytZzYGaSG-6V6y@yaupon>
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
X-Rspamd-Queue-Id: AC9924EAE9B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-6475-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,bootlin.com:email,thicks.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 2026-05-01 16:46:10, Ronan Dalton wrote:
> Prior to commit 6cb0d8587b96 ("rtc: ds1307: remove clear of oscillator

This commit hash is from the linux-6.12.y stable branch but we should
use hashes from Linus' tree in this commit message:

 48458654659c ("rtc: ds1307: remove clear of oscillator stop flag (OSF) in probe")

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

The commit hash referenced here should be 523923cfd5d6.

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
> An alternative to this change could be just to revert the referenced two
> commits and not use the OSF bit at all, apart from logging a warning and
> clearing it on probe.
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

Please adjust the commit hash here, as well. Everything else looks good.
Thanks!

Reviewed-by: Tyler Hicks <code@thicks.com>

Tyler

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
> 

