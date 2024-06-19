Return-Path: <linux-rtc+bounces-1360-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCA090EE33
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Jun 2024 15:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 357B11F20944
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Jun 2024 13:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889141494A6;
	Wed, 19 Jun 2024 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="anLEQSsl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6571474C8;
	Wed, 19 Jun 2024 13:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718803603; cv=none; b=L+rUGuuqXYqrbDdYcJXoysqV9YUs+v7jekt1/Au2j187m2mgTOgEjMsQH6EBn0NFeZNE6VRq0m9xLiafK+ihF0jTzplYUVSiccMbJieHj6x0WmcurxkJlR9Ay0WHYodNuIncmJu1pgHR33UDSkO4B5OUYUD3X9xDNllbPGF6gas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718803603; c=relaxed/simple;
	bh=C6PXGPLhQ6WXKs28ePUEu19IYSvXFGFlJkjHxpNDXQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZCv81KD41FxdxIJvXLlgQm5+VQllUvpHbzCSDUhTQ/mm0oXghc/p0uLyiBbrLeJUxGCQL03hzpnfdjXU8eWNGtanfuoHIr31mo3eHSYA5JvazpxdTNa/bUUNivEzrlA7F99QMJTlR8HocS1y1Bfd/J36JuwpsaO/UP2dBKy6H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=anLEQSsl; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADA212000F;
	Wed, 19 Jun 2024 13:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718803598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUv6jir4zxSpq9FsjWcgIlTaRYhkbm23dEzaKXrswo4=;
	b=anLEQSsl9n3YR6eCFoQhaaww7I/37SqXyXL9rqbWpgrbPbZMicZA0bBwa/J5hvf/sC/gsk
	QiBUJBuWLfdDYYH76dBBylJfr26oAfJagYrGFtmA9ZymCdpJ28YSbPfbp91TMYLRNXBCVB
	Qa8mysxVnHc2eSEfSf7D0yGdIaoGp1SEaREPiYxS/23LStAqGvZEi3FX2fjpKEP0a/87+e
	YdryoAKD40+Ny9C/2YLtF9+8Aw+E4bklS5g6157MB7HKBX+sO7BajQphEYSLtaXOjPAYdx
	EJszuNopmt+pbMMBYZTzN9GVlVKikjg5/qswCQvN7dHJvNu6WfELEwP2qfDWxw==
Date: Wed, 19 Jun 2024 15:26:38 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resubmit] rtc: interface: Add RTC offset to alarm after
 fix-up
Message-ID: <20240619132638b08dcc9d@mail.local>
References: <20240619130115.2799118-1-csokas.bence@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240619130115.2799118-1-csokas.bence@prolan.hu>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 19/06/2024 15:01:16+0200, Csókás, Bence wrote:
> `rtc_add_offset()` is called by `__rtc_read_time()`
> and `__rtc_read_alarm()` to add the RTC's offset to
> the raw read-outs from the device drivers. However,
> in the latter case, a fix-up algorithm is run if
> the RTC device does not report a full `struct rtc_time`
> alarm value. In that case, the offset was forgot to be
> added.
> 
> Fixes: fd6792bb022e ("rtc: fix alarm read and set offset")
> 
> Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
> ---
>  drivers/rtc/interface.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index 1b63111cdda2..db8dffffed91 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -273,12 +273,11 @@ int __rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
>  		if (err)
>  			return err;
>  
>  		/* full-function RTCs won't have such missing fields */
>  		if (rtc_valid_tm(&alarm->time) == 0) {
> -			rtc_add_offset(rtc, &alarm->time);
> -			return 0;
> +			goto done;
>  		}
>  
>  		/* get the "after" timestamp, to detect wrapped fields */
>  		err = rtc_read_time(rtc, &now);
>  		if (err < 0)
> @@ -378,10 +377,12 @@ int __rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
>  done:
>  	if (err && alarm->enabled)
>  		dev_warn(&rtc->dev, "invalid alarm value: %ptR\n",
>  			 &alarm->time);
>  
> +	rtc_add_offset(rtc, &alarm->time);
> +

This must not be done when the tm is invalid.

>  	return err;
>  }
>  
>  int rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
>  {
> -- 
> 2.34.1
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

