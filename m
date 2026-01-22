Return-Path: <linux-rtc+bounces-5836-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGWUMqMvcmmadwAAu9opvQ
	(envelope-from <linux-rtc+bounces-5836-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 15:09:39 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B17767B4F
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 15:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D2A907492EC
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 12:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D733AA1A9;
	Thu, 22 Jan 2026 12:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="P6sJSXBt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E439346E7B
	for <linux-rtc@vger.kernel.org>; Thu, 22 Jan 2026 12:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769086602; cv=none; b=dndN6xleIAbtNlCSRHOgvxhCFfTlvdhUA3vVbftBv3RLRhAkf9K72m8xFk54Ru2rGs7ItVwDjsZXPjGhCaf+CqfOF98C9H8qWmwg+N7rkRq7K6gevxUEhcvI3GUGmEItcTH5JRQYONrMELyvEPFi1OPF+BwkzHLEjQbkj5tsyMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769086602; c=relaxed/simple;
	bh=95Vb6bXYV6P6exbgY+x4IWfEduAVIIhcfQCUSjL/WHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+8cFm48FSYMDo3l8x+YcWRFnIM39NZ5V0u4/C1dBieQdaQe3qHtoI3HO7vM8lP7S3ZoFmVp0aiEukXkF8iFXIyCMu/1Ayzd2fxhrQYYCnIrgZafK22Up16Php3i5XZ2tyWYlAQRcMA/r8nVT6QsRwkjV8UkrNsMT1z8hKga3R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=P6sJSXBt; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 807634E421BC;
	Thu, 22 Jan 2026 12:56:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FA4F606B6;
	Thu, 22 Jan 2026 12:56:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E63B119B8081;
	Thu, 22 Jan 2026 13:56:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769086596; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=KLRZ1UZ71QZfMGd+E2qFHECed0RpdQ9EnSYXNGqErjc=;
	b=P6sJSXBt9+4g4ONzpdqi3CrdYgZRuuGxC0vd0w+LtqNDEI7uGlC8UsCr3fBiLTMGT9zXf1
	7LmdsMCnTHMTQNA0MsbVZ9qOBL+vDpdBx7VE8p8VAop4rOQuqVZtRBVt1PfxAiNN+J8gnJ
	U/GgWpbul1NFJqg6VUFYZZZvQbaJ8UxD0i2+5N1IUxE5zS7wss1QIZ/noNmZWJBssmbdkR
	xCBqHqIvcHUzYE9AI46iJmtZ6c66qBxc7//2DvEHnRD7M0MvC5hgYoJA116419H+0n1UHY
	DPRvcPZJ9yVRTJr6jS4qfyo9vMDAykk5lj0QrQO9vv1976pdXx/hHGVEHT8E/w==
Date: Thu, 22 Jan 2026 13:56:35 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtc: ac100: convert from divider_round_rate() to
 divider_determine_rate()
Message-ID: <202601221256350b0ba153@mail.local>
References: <20260122-rtc-ac100-divider-round-rate-v2-1-044f8b493c35@redhat.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-rtc-ac100-divider-round-rate-v2-1-044f8b493c35@redhat.com>
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
	TAGGED_FROM(0.00)[bounces-5836-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 7B17767B4F
X-Rspamd-Action: no action

On 22/01/2026 07:47:16-0500, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> Changes since v1:
> - Fix two cases of brace inbalances around if/else
> 
> Alexandre: Per v1 comments, I'll include this with my GIT PULL to Stephen.

Sure, thanks!

> ---
>  drivers/rtc/rtc-ac100.c | 75 +++++++++++++++++++++++++------------------------
>  1 file changed, 38 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ac100.c b/drivers/rtc/rtc-ac100.c
> index 33626311fa781b5ce90dcc472f948dc933bbc897..bba7115ff3ad0f9a9b428784b49ba3fde0d18484 100644
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
> +			if (ret != 0 || div_req.rate > req->rate) {
> +				continue;
> +			} else if (req->rate - div_req.rate < req->rate - best) {
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
> +				if (ret != 0 || div_req.rate > req->rate) {
> +					continue;
> +				} else if (req->rate - div_req.rate < req->rate - best) {
> +					best = div_req.rate;
> +					best_parent = parent;
> +				}
> +			}
>  		}
>  	}
>  
> @@ -213,7 +214,7 @@ static int ac100_clkout_determine_rate(struct clk_hw *hw,
>  		return -EINVAL;
>  
>  	req->best_parent_hw = best_parent;
> -	req->best_parent_rate = best;
> +	req->best_parent_rate = clk_hw_get_rate(best_parent);
>  	req->rate = best;
>  
>  	return 0;
> 
> ---
> base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> change-id: 20260122-rtc-ac100-divider-round-rate-bc2b8bf98338
> 
> Best regards,
> -- 
> Brian Masney <bmasney@redhat.com>
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

