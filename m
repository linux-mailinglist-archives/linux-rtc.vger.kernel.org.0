Return-Path: <linux-rtc+bounces-5830-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBboAHmFcWk1IAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5830-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 03:03:37 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D2360AC1
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 03:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C6724FCCFD
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 02:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82D336C0BD;
	Thu, 22 Jan 2026 02:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oZrd87Qd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5608C36C0A2
	for <linux-rtc@vger.kernel.org>; Thu, 22 Jan 2026 02:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769047336; cv=none; b=PTCak1WVp4fHXyA9n+Zh67tENnb6kUf/35uKbNJ5e97U36dr+0q0ffTMalTZoz7Hw/OIfYP3FaeCdBTef/NMGvfij95L+mWl/OT3Qt+nwThfhGWEYTs7gCU+QVtxJEvC0FQjQuglV/7quH5WAcJl95bG9OfZfX/aKsUHnzMU9qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769047336; c=relaxed/simple;
	bh=gqdjoSavvFU/Ljz9ZUNg7oKrF6AIY4V3UlVMG7lNwG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0CyaHwm3oZCIfsJqJAazOyOY01PV6i++T/T+FTvNXzZ2RoYWSx9QoWYObpO7ZRU+hGWs6Z9YZa3XajkRezveKJ/mXAJFZAjkUtA0DfJyysEL44T+wu+fmG2bvWiYuCB07G6d1VQgM1qIebFfsBGWaf+GbtnyazHRdSeucSXcu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oZrd87Qd; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2CB721A29EB;
	Thu, 22 Jan 2026 02:02:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E621F60711;
	Thu, 22 Jan 2026 02:02:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1779D102F0B74;
	Thu, 22 Jan 2026 03:02:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769047329; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=U4VoT2uHHZbDUnK+cLuny/IQf7bwRywulijFTXxIp60=;
	b=oZrd87Qd43UalBkqoLJu0f8VoxvrC3lpujWJtOKE9uL0HUlC5cZKp0g6uH1UAyyIdAIiL7
	dJQK6lUGIL1I4wHWkzH3VAmqZT0ucFgwrBMmiwAxBtj9iff3Z0f0p18OaOhf/VzuB/N0ri
	mU76fqjUY15op56HkmBFS1qfVQKNJpbb2ttXip9FxZCijHv2IXA21Jd/yoA7kNSdF9kfDH
	v0eplMU8MOwl+4MoLlWpjNU1WLpRfbD10nD5uJlPO24S24Uf4OP8VwXKnpvUzuLAQfaWyY
	sbstLHHSAlvAOl7H6h3zJ98yk+bP6g0oMI6bD+yQxzMZUyb6fuKYZKucP1zrsA==
Date: Thu, 22 Jan 2026 03:02:07 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 03/27] rtc: ac100: convert from divider_round_rate() to
 divider_determine_rate()
Message-ID: <20260122020207de2216d9@mail.local>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-3-535a3ed73bf3@redhat.com>
 <202601220026092a75a45e@mail.local>
 <aXFz05Tnm8MmQbBD@redhat.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXFz05Tnm8MmQbBD@redhat.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5830-lists,linux-rtc=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[bootlin.com,reject];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,bootlin.com:email,bootlin.com:url,bootlin.com:dkim]
X-Rspamd-Queue-Id: 69D2360AC1
X-Rspamd-Action: no action

On 21/01/2026 19:48:19-0500, Brian Masney wrote:
> Hi Alexandre,
> 
> On Thu, Jan 22, 2026 at 01:26:09AM +0100, Alexandre Belloni wrote:
> > On 08/01/2026 16:16:21-0500, Brian Masney wrote:
> > > The divider_round_rate() function is now deprecated, so let's migrate
> > > to divider_determine_rate() instead so that this deprecated API can be
> > > removed.
> > > 
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > 
> > > ---
> > > To: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > Cc: linux-rtc@vger.kernel.org
> > > ---
> > >  drivers/rtc/rtc-ac100.c | 75 +++++++++++++++++++++++++------------------------
> > >  1 file changed, 38 insertions(+), 37 deletions(-)
> > > 
> > > diff --git a/drivers/rtc/rtc-ac100.c b/drivers/rtc/rtc-ac100.c
> > > index 33626311fa781b5ce90dcc472f948dc933bbc897..16aca4431da8c029e6195d8a3c9fe75fa95d0bc0 100644
> > > --- a/drivers/rtc/rtc-ac100.c
> > > +++ b/drivers/rtc/rtc-ac100.c
> > > @@ -140,42 +140,16 @@ static unsigned long ac100_clkout_recalc_rate(struct clk_hw *hw,
> > >  				   AC100_CLKOUT_DIV_WIDTH);
> > >  }
> > >  
> > > -static long ac100_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
> > > -				    unsigned long prate)
> > > -{
> > > -	unsigned long best_rate = 0, tmp_rate, tmp_prate;
> > > -	int i;
> > > -
> > > -	if (prate == AC100_RTC_32K_RATE)
> > > -		return divider_round_rate(hw, rate, &prate, NULL,
> > > -					  AC100_CLKOUT_DIV_WIDTH,
> > > -					  CLK_DIVIDER_POWER_OF_TWO);
> > > -
> > > -	for (i = 0; ac100_clkout_prediv[i].div; i++) {
> > > -		tmp_prate = DIV_ROUND_UP(prate, ac100_clkout_prediv[i].val);
> > > -		tmp_rate = divider_round_rate(hw, rate, &tmp_prate, NULL,
> > > -					      AC100_CLKOUT_DIV_WIDTH,
> > > -					      CLK_DIVIDER_POWER_OF_TWO);
> > > -
> > > -		if (tmp_rate > rate)
> > > -			continue;
> > > -		if (rate - tmp_rate < best_rate - tmp_rate)
> > > -			best_rate = tmp_rate;
> > > -	}
> > > -
> > > -	return best_rate;
> > > -}
> > > -
> > >  static int ac100_clkout_determine_rate(struct clk_hw *hw,
> > >  				       struct clk_rate_request *req)
> > >  {
> > > -	struct clk_hw *best_parent;
> > > +	int i, ret, num_parents = clk_hw_get_num_parents(hw);
> > > +	struct clk_hw *best_parent = NULL;
> > >  	unsigned long best = 0;
> > > -	int i, num_parents = clk_hw_get_num_parents(hw);
> > >  
> > >  	for (i = 0; i < num_parents; i++) {
> > >  		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
> > > -		unsigned long tmp, prate;
> > > +		unsigned long prate;
> > >  
> > >  		/*
> > >  		 * The clock has two parents, one is a fixed clock which is
> > > @@ -199,13 +173,40 @@ static int ac100_clkout_determine_rate(struct clk_hw *hw,
> > >  
> > >  		prate = clk_hw_get_rate(parent);
> > >  
> > > -		tmp = ac100_clkout_round_rate(hw, req->rate, prate);
> > > -
> > > -		if (tmp > req->rate)
> > > -			continue;
> > > -		if (req->rate - tmp < req->rate - best) {
> > > -			best = tmp;
> > > -			best_parent = parent;
> > > +		if (prate == AC100_RTC_32K_RATE) {
> > > +			struct clk_rate_request div_req = *req;
> > > +
> > > +			div_req.best_parent_rate = prate;
> > > +
> > > +			ret = divider_determine_rate(hw, &div_req, NULL,
> > > +						     AC100_CLKOUT_DIV_WIDTH,
> > > +						     CLK_DIVIDER_POWER_OF_TWO);
> > > +			if (ret != 0 || div_req.rate > req->rate)
> > > +				continue;
> > 
> > This leaves a braces inbalance
> 
> To be clear, you also want the braces around the if like this:
> 
> if (ret != 0 || div_req.rate > req->rate) {
> 	continue;
> } else if (req->rate - div_req.rate < req->rate - best) {
> 	best = div_req.rate;
> 	best_parent = parent;
> }
> 

Yes, you can change that and add my ack on v2, I'm fine with this going
through clk.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

