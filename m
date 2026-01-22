Return-Path: <linux-rtc+bounces-5827-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBv/D7BucWkPHAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5827-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 01:26:24 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EBF5FEDD
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 01:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4EBA54E4385
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 00:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A862C0274;
	Thu, 22 Jan 2026 00:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2eXjaZn+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAAA2BEC4E
	for <linux-rtc@vger.kernel.org>; Thu, 22 Jan 2026 00:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769041578; cv=none; b=iF8R/3X3Ww10v1llMu5ZQQQ44kGRzQ2xOVAzuF+JTTjEIa24vRHYVFXNdLlz5cAL8RoLJ6C0hAIVzR6SmFtrVH484HPv889mnY1+nFQJfv/2emTY1Re1AOsdJk6Y7NFK/ZzpWxRXjCx962XDnWIhoZNto4h+ej+SL/zA5xjxuX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769041578; c=relaxed/simple;
	bh=hP+9fk7VaCo2SPT/AetIm7YfIJIqEA8BJRaRGX3vSrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=beA7KNagwU/4j4sQliXdaQuL7IWXYFruvtk1L2Te/JQDskTONcR893IobqlGf70t948lOFYq4egSybwFnSlwDdh7rrrtnhFurQMeN2rTgwiP4czi++Zi/TmiVl0HRW2vxfEsLXL+rIem2xBb6dsgfojwGsaBszYjcAGIQjb7oMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2eXjaZn+; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BEB2EC21A95;
	Thu, 22 Jan 2026 00:26:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 010EC60711;
	Thu, 22 Jan 2026 00:26:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D39D102F0B74;
	Thu, 22 Jan 2026 01:26:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769041572; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=x4jg29QU41LLNzuVU5AM3L7b1Wlo+jm9c6ZZ5u4Zv4A=;
	b=2eXjaZn+jaZCAHoQX8mXzr+COm0SdUn4VylHsLTEi0nPXCh+HiD9OdSCL17urswEnm1bPv
	YICTmjXUKNQB6boklJvHme4rm+WRCTKf3v7PgoIVEr/7W3umx3E0sKLEmcf04TFCdokodY
	PGmznMvhodZsSnsBu2x1dk2FpiAF4T62Hr4ZXR3q75VaAafPbgAfOVhmOA0Tx1tChHLHi2
	KA7rD8wPRquZt4IuGB1Wa8owWlvKUaqyD3qTpa7/iqjnAUxY25kSHYJif+G/LAyM8bPwTG
	sHICX4Igpx2fDePAbJLfnk8PrTM1QO20F7dZsnsI143NZi4Uf0KJT7gZWgxNIg==
Date: Thu, 22 Jan 2026 01:26:09 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 03/27] rtc: ac100: convert from divider_round_rate() to
 divider_determine_rate()
Message-ID: <202601220026092a75a45e@mail.local>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-3-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-clk-divider-round-rate-v1-3-535a3ed73bf3@redhat.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[bootlin.com,reject];
	DKIM_TRACE(0.00)[bootlin.com:+];
	TAGGED_FROM(0.00)[bounces-5827-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: A5EBF5FEDD
X-Rspamd-Action: no action

Hello,

On 08/01/2026 16:16:21-0500, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---
> To: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-rtc@vger.kernel.org
> ---
>  drivers/rtc/rtc-ac100.c | 75 +++++++++++++++++++++++++------------------------
>  1 file changed, 38 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ac100.c b/drivers/rtc/rtc-ac100.c
> index 33626311fa781b5ce90dcc472f948dc933bbc897..16aca4431da8c029e6195d8a3c9fe75fa95d0bc0 100644
> --- a/drivers/rtc/rtc-ac100.c
> +++ b/drivers/rtc/rtc-ac100.c
> @@ -140,42 +140,16 @@ static unsigned long ac100_clkout_recalc_rate(struct clk_hw *hw,
>  				   AC100_CLKOUT_DIV_WIDTH);
>  }
>  
> -static long ac100_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
> -				    unsigned long prate)
> -{
> -	unsigned long best_rate = 0, tmp_rate, tmp_prate;
> -	int i;
> -
> -	if (prate == AC100_RTC_32K_RATE)
> -		return divider_round_rate(hw, rate, &prate, NULL,
> -					  AC100_CLKOUT_DIV_WIDTH,
> -					  CLK_DIVIDER_POWER_OF_TWO);
> -
> -	for (i = 0; ac100_clkout_prediv[i].div; i++) {
> -		tmp_prate = DIV_ROUND_UP(prate, ac100_clkout_prediv[i].val);
> -		tmp_rate = divider_round_rate(hw, rate, &tmp_prate, NULL,
> -					      AC100_CLKOUT_DIV_WIDTH,
> -					      CLK_DIVIDER_POWER_OF_TWO);
> -
> -		if (tmp_rate > rate)
> -			continue;
> -		if (rate - tmp_rate < best_rate - tmp_rate)
> -			best_rate = tmp_rate;
> -	}
> -
> -	return best_rate;
> -}
> -
>  static int ac100_clkout_determine_rate(struct clk_hw *hw,
>  				       struct clk_rate_request *req)
>  {
> -	struct clk_hw *best_parent;
> +	int i, ret, num_parents = clk_hw_get_num_parents(hw);
> +	struct clk_hw *best_parent = NULL;
>  	unsigned long best = 0;
> -	int i, num_parents = clk_hw_get_num_parents(hw);
>  
>  	for (i = 0; i < num_parents; i++) {
>  		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
> -		unsigned long tmp, prate;
> +		unsigned long prate;
>  
>  		/*
>  		 * The clock has two parents, one is a fixed clock which is
> @@ -199,13 +173,40 @@ static int ac100_clkout_determine_rate(struct clk_hw *hw,
>  
>  		prate = clk_hw_get_rate(parent);
>  
> -		tmp = ac100_clkout_round_rate(hw, req->rate, prate);
> -
> -		if (tmp > req->rate)
> -			continue;
> -		if (req->rate - tmp < req->rate - best) {
> -			best = tmp;
> -			best_parent = parent;
> +		if (prate == AC100_RTC_32K_RATE) {
> +			struct clk_rate_request div_req = *req;
> +
> +			div_req.best_parent_rate = prate;
> +
> +			ret = divider_determine_rate(hw, &div_req, NULL,
> +						     AC100_CLKOUT_DIV_WIDTH,
> +						     CLK_DIVIDER_POWER_OF_TWO);
> +			if (ret != 0 || div_req.rate > req->rate)
> +				continue;

This leaves a braces inbalance

> +			else if (req->rate - div_req.rate < req->rate - best) {
> +				best = div_req.rate;
> +				best_parent = parent;
> +			}
> +		} else {
> +			int j;
> +
> +			for (j = 0; ac100_clkout_prediv[j].div; j++) {
> +				struct clk_rate_request div_req = *req;
> +				unsigned long tmp_prate;
> +
> +				tmp_prate = DIV_ROUND_UP(prate, ac100_clkout_prediv[j].div);
> +				div_req.best_parent_rate = tmp_prate;
> +
> +				ret = divider_determine_rate(hw, &div_req, NULL,
> +							     AC100_CLKOUT_DIV_WIDTH,
> +							     CLK_DIVIDER_POWER_OF_TWO);
> +				if (ret != 0 || div_req.rate > req->rate)
> +					continue;

Ditto.

> +				else if (req->rate - div_req.rate < req->rate - best) {
> +					best = div_req.rate;
> +					best_parent = parent;
> +				}
> +			}
>  		}
>  	}


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

