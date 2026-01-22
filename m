Return-Path: <linux-rtc+bounces-5828-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNdlMuJzcWm3HAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5828-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 01:48:34 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 81851600C3
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 01:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 87DBA3879B1
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 00:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322172BDC2A;
	Thu, 22 Jan 2026 00:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qt4l+sov";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="maRV4rBx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5442765DF
	for <linux-rtc@vger.kernel.org>; Thu, 22 Jan 2026 00:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769042908; cv=none; b=nPoEJZCHiybDmBLpONEsAhnvW9KRFOBGSCVo4VAiy+jMIOZ7ln+13DG2TGy5yPWChz2FKuRcPuu2ApWH9wgom/874bk5G/8zgyPBcQxJJ3H/oqZjQKY8/6Sdx6vW81m0TlXP545NNflv5gspKcGUZngcdKN9ML8mLPFPK8yrK2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769042908; c=relaxed/simple;
	bh=YgkbcXlmcga492MlvJ5hBRrRTRjG9AP55dNP5piMLys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WN7dnzeU88RHGq7HozpLqXGTQKCJLITC8pdehe+BFKaGmfTrmLeT1pdVvgeMthgyXljNrmvmPXx92P/fbY7P+oO58Zo9qdSB6TRkzYXyDykphy8A8jNfASYcycZuxAHt1+C1sqn2HSr35LbqEYAH/4MTIDy6a2VhtL26gvII7kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qt4l+sov; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=maRV4rBx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769042903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XSYrCFJLTYE1vUJlazCK1VzEy0tKZI14lHyw9347PV8=;
	b=Qt4l+soveGkmPIJy77qPCBwwdSEcumP1uhLU4uf94M9vomMlyqbA8WFCf0fCUH90P04ARs
	nS111ZSkcr8aBm0S8PP3RaJ+4SCdkTpnLCmDLZ+8GOU9NM+OMq8S2kL4ngLidUgtygdOnw
	iwkecmfrua6M5rtmk7WfjM1WuU+3LCE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-0nvBN2BgMqCtpzkSQLu-KA-1; Wed, 21 Jan 2026 19:48:22 -0500
X-MC-Unique: 0nvBN2BgMqCtpzkSQLu-KA-1
X-Mimecast-MFC-AGG-ID: 0nvBN2BgMqCtpzkSQLu-KA_1769042902
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8946f51b8c8so15176676d6.3
        for <linux-rtc@vger.kernel.org>; Wed, 21 Jan 2026 16:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769042902; x=1769647702; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSYrCFJLTYE1vUJlazCK1VzEy0tKZI14lHyw9347PV8=;
        b=maRV4rBx9RgbqM11Eb2El7HGK6ckBV9Q4NYPtBGGnLw7HDDf2KY6Frqr1aTOqSs5gn
         KT3b1qYkly5iz1F2218UKP522+0PFSPddPwO9JGI1CaMsVxa5XvUCIS6KbuU9OX0w1PY
         1vG22xKJoEeN8Tqr1GCLUWXOxSTE6E+R7gRZFtUPGFkawgRH59xH7wq3HrLLnIk+VBvp
         lrDpsQ9faTzHa7/NIu51KvzBUrShPmuJCJQh/10VYSerKWC6kfjhHTIKpnpzH08jxj3p
         0aDwBk35zM1VQ/fwJM6dwHV5B8dBLddlGcsrLA+oxGybeE2ktkk3gig6xERVvhNbCEOc
         zTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769042902; x=1769647702;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XSYrCFJLTYE1vUJlazCK1VzEy0tKZI14lHyw9347PV8=;
        b=Lsu7+w9T7FKqA08EohzwnIwqsQZVHhBPgjxMSGFNTz+gZPu27K1CLh+kyFZh9InNlc
         M5zXtWh0PV/qDrSqAXTvMj7h+pyr4gFy+P+zQLTQVXr1YLO1gW3TXBQah/CnOrEaLw76
         IzwZQO589t+KTisuBlhI/rUtmz6JVBsj2XZu8z3l+L5+J707DY7GaISdCv/pvsud6Lw0
         SS3gmjt/AF7lHgQhjtx58B91scjxEKgaO0dikzub9UvhDtl1bWF43TTy+ujudvGsVo9K
         jS1kU8l+EQQ4wPniZ2RlwGr3oT1GwJj67zj3LLGb9aJzXKD9CUIhGA/LPdjAJFpc2u5M
         ERvA==
X-Forwarded-Encrypted: i=1; AJvYcCXK+YSV4TuuJm6rROydkLW70OTnX/MiU/VWNHAxepOIdWGMKrZzGoVCwjU/qr/D6BSxM2tmPRpJsFs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ApO63+76dtE+OKSpEFyxTlc6QyrrSCdpH0sKXirPPhrwcNZI
	7h/zj83xo9KLCc/idTPCRASuEaCZUNu2hW8V6LhDTPnF5Vkv82chGNJ3JyISKTH5P6QId5MuyV8
	MUlG4zxn3jIUR/9NS8weISqBWysSScczzUgjEBvXJ2szkpjvzx5gbU7nyFYZmmg==
X-Gm-Gg: AZuq6aKpKxxhmjA0wQMBRTrFIlIURJOXeflhZlbkHeuUaxuUgvraxL8QZALCa7nqYQc
	rE1aWq+YoePDcCKcyyhd7zBdI1TNrc/i5qQZT12iJEOjiuGSRsNABG3wNQkD8U4vrDr2nh2uSaR
	I2CXc/5bsQkf45LK0y75pC+nWT2ZzdIPu/4OQlgSQ/pMmIOO0iV6TkpBWedcB3kT4bUAxiES4vD
	XsLiD+ldlkra4/Avh/h+iTJlSH3kioGoDUB5bFBzz+OJkkF96JTTxfdSLjT3wmd/pkndogOFz28
	OXm/V+ngG00i8yu8EhcTWxi0X/lA9RGU3wiqqHPS6nfImvDM1CLKleBSin63K2HVqVYHbC87Jqw
	e08SYIfIq1ZWNP1eOb+X/nwcbLKpvfWY4/9MMJa/cStTL
X-Received: by 2002:a05:6214:4001:b0:894:68f7:40f2 with SMTP id 6a1803df08f44-89468f7424cmr104557946d6.2.1769042901997;
        Wed, 21 Jan 2026 16:48:21 -0800 (PST)
X-Received: by 2002:a05:6214:4001:b0:894:68f7:40f2 with SMTP id 6a1803df08f44-89468f7424cmr104557706d6.2.1769042901567;
        Wed, 21 Jan 2026 16:48:21 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89468d65eebsm40483976d6.30.2026.01.21.16.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 16:48:21 -0800 (PST)
Date: Wed, 21 Jan 2026 19:48:19 -0500
From: Brian Masney <bmasney@redhat.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 03/27] rtc: ac100: convert from divider_round_rate() to
 divider_determine_rate()
Message-ID: <aXFz05Tnm8MmQbBD@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-3-535a3ed73bf3@redhat.com>
 <202601220026092a75a45e@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601220026092a75a45e@mail.local>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[redhat.com,quarantine];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-5828-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 81851600C3
X-Rspamd-Action: no action

Hi Alexandre,

On Thu, Jan 22, 2026 at 01:26:09AM +0100, Alexandre Belloni wrote:
> On 08/01/2026 16:16:21-0500, Brian Masney wrote:
> > The divider_round_rate() function is now deprecated, so let's migrate
> > to divider_determine_rate() instead so that this deprecated API can be
> > removed.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
> > ---
> > To: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: linux-rtc@vger.kernel.org
> > ---
> >  drivers/rtc/rtc-ac100.c | 75 +++++++++++++++++++++++++------------------------
> >  1 file changed, 38 insertions(+), 37 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-ac100.c b/drivers/rtc/rtc-ac100.c
> > index 33626311fa781b5ce90dcc472f948dc933bbc897..16aca4431da8c029e6195d8a3c9fe75fa95d0bc0 100644
> > --- a/drivers/rtc/rtc-ac100.c
> > +++ b/drivers/rtc/rtc-ac100.c
> > @@ -140,42 +140,16 @@ static unsigned long ac100_clkout_recalc_rate(struct clk_hw *hw,
> >  				   AC100_CLKOUT_DIV_WIDTH);
> >  }
> >  
> > -static long ac100_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
> > -				    unsigned long prate)
> > -{
> > -	unsigned long best_rate = 0, tmp_rate, tmp_prate;
> > -	int i;
> > -
> > -	if (prate == AC100_RTC_32K_RATE)
> > -		return divider_round_rate(hw, rate, &prate, NULL,
> > -					  AC100_CLKOUT_DIV_WIDTH,
> > -					  CLK_DIVIDER_POWER_OF_TWO);
> > -
> > -	for (i = 0; ac100_clkout_prediv[i].div; i++) {
> > -		tmp_prate = DIV_ROUND_UP(prate, ac100_clkout_prediv[i].val);
> > -		tmp_rate = divider_round_rate(hw, rate, &tmp_prate, NULL,
> > -					      AC100_CLKOUT_DIV_WIDTH,
> > -					      CLK_DIVIDER_POWER_OF_TWO);
> > -
> > -		if (tmp_rate > rate)
> > -			continue;
> > -		if (rate - tmp_rate < best_rate - tmp_rate)
> > -			best_rate = tmp_rate;
> > -	}
> > -
> > -	return best_rate;
> > -}
> > -
> >  static int ac100_clkout_determine_rate(struct clk_hw *hw,
> >  				       struct clk_rate_request *req)
> >  {
> > -	struct clk_hw *best_parent;
> > +	int i, ret, num_parents = clk_hw_get_num_parents(hw);
> > +	struct clk_hw *best_parent = NULL;
> >  	unsigned long best = 0;
> > -	int i, num_parents = clk_hw_get_num_parents(hw);
> >  
> >  	for (i = 0; i < num_parents; i++) {
> >  		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
> > -		unsigned long tmp, prate;
> > +		unsigned long prate;
> >  
> >  		/*
> >  		 * The clock has two parents, one is a fixed clock which is
> > @@ -199,13 +173,40 @@ static int ac100_clkout_determine_rate(struct clk_hw *hw,
> >  
> >  		prate = clk_hw_get_rate(parent);
> >  
> > -		tmp = ac100_clkout_round_rate(hw, req->rate, prate);
> > -
> > -		if (tmp > req->rate)
> > -			continue;
> > -		if (req->rate - tmp < req->rate - best) {
> > -			best = tmp;
> > -			best_parent = parent;
> > +		if (prate == AC100_RTC_32K_RATE) {
> > +			struct clk_rate_request div_req = *req;
> > +
> > +			div_req.best_parent_rate = prate;
> > +
> > +			ret = divider_determine_rate(hw, &div_req, NULL,
> > +						     AC100_CLKOUT_DIV_WIDTH,
> > +						     CLK_DIVIDER_POWER_OF_TWO);
> > +			if (ret != 0 || div_req.rate > req->rate)
> > +				continue;
> 
> This leaves a braces inbalance

To be clear, you also want the braces around the if like this:

if (ret != 0 || div_req.rate > req->rate) {
	continue;
} else if (req->rate - div_req.rate < req->rate - best) {
	best = div_req.rate;
	best_parent = parent;
}

Brian


