Return-Path: <linux-rtc+bounces-2119-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C10C9944D8
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 11:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE1D11C20895
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 09:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035F718BB99;
	Tue,  8 Oct 2024 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WCeyXLl4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723B115B12F;
	Tue,  8 Oct 2024 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728381293; cv=none; b=dCp8AnViha5WondvZZkj2hUQlkN1ejC1DYHLrHsZyTIAi1lqK/aynax3Y1oQYeREZ45ducZ3PkpziX9sY2g2I0hqY/I7fMBzgIxYxD43E8s0ph/yKEFPiGAfBqfHX+z1Af3YklvCN5nOBy0TwdjSBWVkr8/xZZLnvF7DjcOJYR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728381293; c=relaxed/simple;
	bh=oQwq4WEpW8fwze9Nx8EH52TwswH18lQNtHBEg/MjyAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=by4Vj54wMHbnIoBeHmbbjF6wvMxol140po0FwexdLywcH3sRgI/nqoWLrd9eejZqbvrpj6YhtVAPWYU8KFmbHyc+rpJzwTYfmSScS5FqM07mDQkA6KF/b8RXsdAK12mTr/GVn9C07JQlIe8QaLq6L7PyHZ9PPHb8fY061uMA0KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WCeyXLl4; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F31C024000A;
	Tue,  8 Oct 2024 09:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728381284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0ZF/hejp+N/CpFRUcMlAuvC99pZmHza0rLu0g6OgSUc=;
	b=WCeyXLl4Q/CuCSAv4qpDoOkErO7sPPC1PfUeIebGnkwbHqN4JJo1lti1wnhsAMw+6g01L0
	8NmGERZHb24HIO+3XTamQjxSesZzv36fSFi+eIfw/oxXgxGloZq8bT5GtWrVbBL7evat3+
	EN7In187iRltvCImfLW4VNisigyvKh8pEkWZttDCUXBt+sqQcg22yR4ARypemidKXTcEVR
	+CtvaX8YJB2Gcz9+3lTktA4u5OSkqcTTuO73/gK2LtxhesAs3rTz3hpOG+/BFtjQcgeKs4
	MmUgrGd4OzvZIM2qvz4yCMWzuv9LkcHe9zBPvP1N9BHXlImjqhxxxUvU5C4zjQ==
Date: Tue, 8 Oct 2024 11:54:43 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/rtc:Fix the wrong format specifier
Message-ID: <20241008095443c9f8f39e@mail.local>
References: <20241008092517.14123-1-zhujun2@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008092517.14123-1-zhujun2@cmss.chinamobile.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

Please fix the subject line, it has to be in the subsystem style.

On 08/10/2024 02:25:17-0700, Zhu Jun wrote:
> The format specifier of "int" in sprintf() should be "%d", not
> "%u".
> 
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>  drivers/rtc/rtc-rv3028.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
> index 2f001c59c61d..c79fad316119 100644
> --- a/drivers/rtc/rtc-rv3028.c
> +++ b/drivers/rtc/rtc-rv3028.c
> @@ -162,7 +162,7 @@ static ssize_t timestamp0_count_show(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	return sprintf(buf, "%u\n", count);
> +	return sprintf(buf, "%d\n", count);
>  };
>  
>  static DEVICE_ATTR_RO(timestamp0_count);
> -- 
> 2.17.1
> 
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

