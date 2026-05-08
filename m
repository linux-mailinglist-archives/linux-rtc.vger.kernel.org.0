Return-Path: <linux-rtc+bounces-6485-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN+QA4H6/WnYlQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6485-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 08 May 2026 17:00:17 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D824F8390
	for <lists+linux-rtc@lfdr.de>; Fri, 08 May 2026 17:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF8B9301DE7A
	for <lists+linux-rtc@lfdr.de>; Fri,  8 May 2026 15:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FAE3F7AA5;
	Fri,  8 May 2026 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="pypyrCBR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rG9yQs1c"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC422352C34;
	Fri,  8 May 2026 15:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252414; cv=none; b=d5Du4e4Nipm9qXCgll0ETyEH7TDjvQURwlxnyDSDFrsC5u3NqCX0TvBqirbm+zgYP/d6N00n1xnZCiQi2enNWGCzII9ty65+OGhQjIaI8ineQIJufj8YRXX1TsMrN2Al2QMxaF5H/HeI3i1GQUK8y5PONRln8BLeoZGND0aUZl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252414; c=relaxed/simple;
	bh=PWhTOA+mQ1vsLLDlxHMCTc7ukEw+frxMMoOHDB+7MZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVF2oAeBXtG0QaPI9STFbeQuHG82d9rrlZh/G7l/UC2W8YAkiku5XiuINQfTXAFGO3UOD2xhdD4lrCQYLrn9UD//gNW7BI18u3viCUzUV13L5dPYD1voiOuj+cW5L2lDJBrLKP+k6KTxy3v/PzEEjjaWaXiU/u0qdDe0UOd+Ue8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=pypyrCBR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rG9yQs1c; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DBB837A0166;
	Fri,  8 May 2026 11:00:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 08 May 2026 11:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1778252411; x=1778338811; bh=73wc6Bv58p
	adeGP8ml1W4jXtGr0WBA9uIhE0H2uoKiE=; b=pypyrCBRH68IkvrLNtSiGMMxVV
	4JTPpXnhwD5BIA+Gz8O5Im4htkF6iphlPqSaFiyCuOOWSLyU0jQq+Q7hRguU9ID8
	Kpdsa6MAduTAWAP0Ja1RzPowapAEB3LT+sjWNTTvl//Tgmi/q7wkULnNN91qMc+K
	bqzY6ClLsTtcJfaAWgBjtujbPZ6JfZHlipawDbHnk48O6owtPxWY+ESGyPns970+
	3MWyiw/AG+845ZGd5U5whvBEO/Gn88xl+SfZkPdMtLJVvhIC2cPN5RjqoPwwBkyS
	XAbR0Oy/0VcH3kqzq2omItwReqJJp3tlzbzdOG7FzpR4dp8SzOSHnAvitXHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778252411; x=1778338811; bh=73wc6Bv58padeGP8ml1W4jXtGr0WBA9uIhE
	0H2uoKiE=; b=rG9yQs1ctAYMLmlYr/oS4FMh0Oe+0jwRbsg5qnI55tb1bsOICL6
	xrH5RTGjJmgWTOahE6WgeTjLih34akPQw0fgyo53i+qWeH0n5KULdHzurc7ifxr7
	YNCH8nIgy+Inub6hKm6333Oe8r/IXgyHjeLKlFtRnX+EE14+SYvQq96mnOdlq45a
	odw1h9/WDU/xttMgdPoCi/E6xi1IzXVUtP7OUhnLxsl9yT20A5N1Pwsd+/KNBOOy
	RT+Cy+DU0HnSS+LsPI/oyISL827EqwB+1tYdWeI6pydMD0MRYmmMzaFIkGrBeamy
	gzExS61k7g8jpPEwqGbzDmxAv/duKDGxzfg==
X-ME-Sender: <xms:evr9aeDv3PEkLX1Exc5i1cxcCX4-VYHswGk0DLqJaF2h3Q6jaxZWrg>
    <xme:evr9adcXoupcAlo01eBQMyZxmeAKPndMYaRtMmKFpRfk_HQQSJdVgC1RZ80dm7xhR
    nGwggiuaoId33Bt6xdpeWjvxte_0Dz-Bo_Jpmxze0IziSHN-OZxbHw>
X-ME-Received: <xmr:evr9aV2AI3Z66Kn081DG4o3Q8nS-qDmIqd3stXKAbmztjdqhOMEqQDk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduuddtieehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:evr9acjrzj8WdjU_elN8W38tKDuVLn4IWz59dWSVWXEjaFWVfbdlNA>
    <xmx:evr9aWkQV6izQGb4_iWct7jEMjwUbZZyZaPNlED9UPJvbYPg79LmnA>
    <xmx:evr9aaY5aIwMR1AO5H1LkBJKxEy0Ya1wadigd_2mL96_HAgau7pZfQ>
    <xmx:evr9aZHo2fgL_bDajtzFMD1ClT0dXsrpovkjbtMVTIOmqRxNt3mpsg>
    <xmx:e_r9aZ3sZa7Qhiyc62cZKRW1-41hcLj9Jy-z46nb2VlgKnk72I02wyl8>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 May 2026 11:00:07 -0400 (EDT)
Date: Fri, 8 May 2026 10:00:03 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
Cc: alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v3] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Message-ID: <af36cwOofjtS2mNP@yaupon>
References: <20260508032518.3696705-2-ronan.dalton@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508032518.3696705-2-ronan.dalton@alliedtelesis.co.nz>
X-Rspamd-Queue-Id: 71D824F8390
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-6485-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,enneenne.com:email,alliedtelesis.co.nz:email]
X-Rspamd-Action: no action

On 2026-05-08 15:24:49, Ronan Dalton wrote:
> Prior to commit 48458654659c ("rtc: ds1307: remove clear of oscillator
> stop flag (OSF) in probe"), the oscillator stop flag (OSF) bit was
> checked during device probe for the ds1337, ds1339, ds1341, and ds3231
> chips; if it was set, it would be cleared and a warning would be logged
> saying "SET TIME!". Since that commit, the OSF bit is no longer cleared,
> but the warning is still printed.
> 
> Directly following that commit, there was no way to get rid of this
> warning because nothing cleared the OSF bit on these chips.
> 
> The commit associated with the previous commit, 523923cfd5d6 ("rtc:
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
> Signed-off-by: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Tyler Hicks <code@tyhicks.com>
> Cc: Sasha Levin <sashal@kernel.org>
> Cc: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
> Cc: Rodolfo Giometti <giometti@enneenne.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Fixes: 48458654659c ("rtc: ds1307: remove clear of oscillator stop flag (OSF) in probe")
> ---
> Changes in v3:
> - Remove paragraph mentioning alternative fix from commit message
> 
> Changes in v2:
> - Fix hashes of referenced commits

Reviewed-by: Tyler Hicks <code@tyhicks.com>

Thanks again!

Tyler

> 
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

