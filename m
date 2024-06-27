Return-Path: <linux-rtc+bounces-1416-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B763191B24F
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 00:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E71521C22436
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Jun 2024 22:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2321A2563;
	Thu, 27 Jun 2024 22:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e0hTsFcL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C8D13B780;
	Thu, 27 Jun 2024 22:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719527827; cv=none; b=hLHhliPC/Hcyoduo7srdsuXLKHI2l18dtgdrc1x1uWWFFODlVRPRd8s6vNDslvbv35a7Nzh+q0iWMlkV0J0Ut2O/jC+7IWw6C5WwQKhp05bLMEM2JTW0asjtGdgFg0ycAN8lvwbOCU4syk18bmxQ40GqSNHW0NKC4w4Ur4E1kaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719527827; c=relaxed/simple;
	bh=Cdi+EEllHeyNyedSY82aIZSvPEIACrCGSg5DA2acbq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tylNxfYZQwoWhAE9If+5DiZmZPSqmVd2m9Gt2d+n4Qkzewt+/mrQbRYchUGhCAcJKwfSSRMgsnGrAgUz0lyXItpZoI+l6XHB84Z3MmyoZoHFbj88M28wXJVZqZ4pWhhYEMfUFbdw8cnM6SM8SoIpFwxIkgg9MYgnCS21HR0NN0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e0hTsFcL; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C037FF804;
	Thu, 27 Jun 2024 22:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719527823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zfP2hKhvXiExN0t9i/91sAyGkmacqicPLe0gSPZt9jY=;
	b=e0hTsFcLzzx9cmXTCwBIWx8+KYKK4B+mQocX/MryhvOkIcn8YlWbSlJrdX1IYujFr5TWPK
	Sk2Qe77k1JyGRm9Z2otTHAOywtlx9BSamuon48s8b2xIpFGyvMaFeYk6KqcJ5Nd4MfQBtY
	tbN/7TlrU+vJkhbzBM68OwZH0VUtWNvP1d0H7tRkYmErCbi0gkcAhrwCsPEXI5Vp6vlc7x
	rQSe6aKb+xeOqxbqRFqjteKElO+N/0psle+VP3qM3g7irhiTzKY06LaBBXxlL8LDr5jJeS
	8jUHOzo5nOEKJ/gyO8QzAWDkVYpPZ4tajd7lz8AnFxsBe7jjR1imaWNFD8WHgQ==
Date: Fri, 28 Jun 2024 00:37:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Szentendrei=2C_Tam=E1s?= <szentendrei.tamas@prolan.hu>
Subject: Re: [PATCH resubmit] rtc: ds1307: Detect oscillator fail on mcp794xx
Message-ID: <202406272237033260538e@mail.local>
References: <20240621080512.2916664-1-csokas.bence@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240621080512.2916664-1-csokas.bence@prolan.hu>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

It is not clear to me why your resent this one but not the other one,
can you elaborate?

On 21/06/2024 10:05:13+0200, Csókás, Bence wrote:
> This patch enables the detection of the oscillator failure
> on mcp794xx chips.
> 
> Co-developed-by: Szentendrei, Tamás <szentendrei.tamas@prolan.hu>
> Signed-off-by: Szentendrei, Tamás <szentendrei.tamas@prolan.hu>
> Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
> ---
>  drivers/rtc/rtc-ds1307.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index 506b7d1c2397..bdb7b201a160 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -65,6 +65,7 @@ enum ds_type {
>  #	define DS1340_BIT_CENTURY_EN	0x80	/* in REG_HOUR */
>  #	define DS1340_BIT_CENTURY	0x40	/* in REG_HOUR */
>  #define DS1307_REG_WDAY		0x03	/* 01-07 */
> +#	define MCP794XX_BIT_OSCRUN	BIT(5)
>  #	define MCP794XX_BIT_VBATEN	0x08
>  #define DS1307_REG_MDAY		0x04	/* 01-31 */
>  #define DS1307_REG_MONTH	0x05	/* 01-12 */
> @@ -242,6 +243,10 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
>  	    regs[DS1307_REG_MIN] & M41T0_BIT_OF) {
>  		dev_warn_once(dev, "oscillator failed, set time!\n");
>  		return -EINVAL;
> +	} else if (ds1307->type == mcp794xx &&
> +	    !(regs[DS1307_REG_WDAY] & MCP794XX_BIT_OSCRUN)) {
> +		dev_warn_once(dev, "oscillator failed, set time!\n");
> +		return -EINVAL;
>  	}
>  
>  	tmp = regs[DS1307_REG_SECS];
> -- 
> 2.34.1
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

