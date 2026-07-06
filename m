Return-Path: <linux-rtc+bounces-6920-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kHVlCJS3S2p/ZAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6920-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 16:11:32 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B621F711C5C
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 16:11:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=l0lhylyf;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6920-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6920-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EACE31A0067
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 12:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BBC3FE35F;
	Mon,  6 Jul 2026 12:36:53 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CC5380FD8
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 12:36:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341412; cv=none; b=m4UpI1o4O4ePd7gg0vySNuD7dWKfA+n3dLvETjcbg3VY4mCFwyVSVwEpwprIjwTF2+Kph5BjL+ttIrX6kmMzS/+WX9UsIfQC06vDEFwHLA4qq74Hfn9f8EM4YGDplN79KKfvSQX2GwBpCyw2Y6MpqoUys7CVnLxZJew/CGMZIzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341412; c=relaxed/simple;
	bh=rra+HC6UW8ngg1M+w7ntsNH71CV+8l9s2Aq1rHgxNRs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pUx6s3ym2yIeAKPe/lF7p2EST7WprYLRum+UMk3NZaZwRqRXTjD9cF4WqwB51p1DPI8mFmW5gE/AUwk5VieDUIChAqS9R5BnoZVt6LtTlLQin4dbmwDyAEkV48qey6EJHFSND7+gJUXt+jmUqc0jR4OxJ4f8DcsjqEH+KEOz4Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=l0lhylyf; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493d28b1930so22457195e9.0
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 05:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783341404; x=1783946204; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3nillUBzOVKmupjRSjEGs6YGga/o/TlBfybdbWa9Q6w=;
        b=l0lhylyfDBK0V3kS1BnCsG69PemtJ6uJDAgeDa17Cm/CwDBYWAL1ZJtDRCvbtU2elP
         4fI8s9kurynv7u7DCxEAjPtNZHwWrx/hVY29opwOjAdgte400NSDnNEVa10TBPdapLah
         DYyBerPVmyU17mHMvnv1MOQmcXYJc/cPjhBpA3Px5ufTo9EjLLn75cwmv1VHrt4QiRdp
         vWdGevZd4EIW2DATDwJf4hYqpEclC1abd0U6YzBXN5g8inSJAQ5hJgeZewOg5ziRuqcj
         Z+0+ea/t7z78ezFU07GflcgOVmOvfAAGtecRA8i1SV7ye03W5aUPNuZdPWof7/kt3IEQ
         Mtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341404; x=1783946204;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3nillUBzOVKmupjRSjEGs6YGga/o/TlBfybdbWa9Q6w=;
        b=bTFxOeSiBDqhMLtOSTx6+Q4Jgi5O1006jU+wm5fcEwn6L++b7CdKcLEyXDWZaDmdhV
         pwn5AzZy4z/S3ZqZyoCcMcvRLELq9qk5ycPJJGruYhUGQ1dGkGXlVdiemzLwcjNa2wJz
         TxV/6O91iC5GC+NIYB6g1FTDzRl5P48NQVtGX/szXXtzwHt6A3DRSaDySAOg/Tc0LOrM
         y7bLGlVOLo3WqGwmXH886O4XEFC/Sw9UZcduRZA4ezG5zY6q5b3nwDqMwwjJhp9Jq6+q
         j1U4W4akhHwdZ52Rh9RIvS7IUkPZ4pdn2m94g1TY/XSYn1pzB64+81aVcUXQJll49W90
         sGQw==
X-Forwarded-Encrypted: i=1; AHgh+Rptzp2Xx+ijoM2Fs5s5JfdBQzKUxOlHdoR86y0iQCiqfGMx/N+CYU66QxMsOurIxW0BI+FzWXStr5w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp8wzCCdlIMg+pzMSFc5/7vmCG+HEP2cfumGqfHUPcJ4RWx4nS
	1dpOBecnfja9UEMVlZ8MY7a770t/NQ+FP4yW8y5DSsvXcISvP7ldE/agj5Uap0L0p+0=
X-Gm-Gg: AfdE7cm6EhTRH2w0Vn7TikuYz+NLr0tM9TsFoIuuo0N6y59iondMgcvH6NT0rspxLS3
	A5CLGIuXGrOLgtkVrikSCKZaiHxGGKUbnYuuvnvUiCdP1HmRF40uSqYh07PiPc2KAWOhYjtrxN1
	huOmBJ7NP85PBblW1dSnCxy0hp5EjhYaFE4TtlDzFNiYB30N2xyUESOekJwV0/C3e4Yc63ucAZa
	fGpSVm3U0UdIWz35b/BXOaiS9n4L15tgI1XWgEg7It1qkX4AeuVi7EynYP+DaJGpk4U0pZP0BFc
	IsaXaZ1lSjbvRmxVGQYxHtlCTscZF9OX4RDRIehldYTA0RsFnRSJ6qZlbTKd8c1vzkKiZ9MONlj
	djNH6QiNFTlsLSBi/ZS9fhLE+ILttEsRgWBFoxTPcJTNI5Jjn5thrJ5zQmZ6fYy1/Z8n8bpEPHr
	qbuYjy3yQgegY=
X-Received: by 2002:a05:600c:828e:b0:493:b6d5:72df with SMTP id 5b1f17b1804b1-493df090d47mr3392275e9.35.1783341404120;
        Mon, 06 Jul 2026 05:36:44 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c637bc21sm660820945e9.7.2026.07.06.05.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:36:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  conor+dt@kernel.org,  robh@kernel.org,
  linux-rtc@vger.kernel.org,  "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,  devicetree@vger.kernel.org,
  linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 6/9] clk: sunxi-ng: div: add read-only operation support
In-Reply-To: <20260706100635.E5DC61F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Mon, 06 Jul 2026 10:06:35
	+0000")
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
	<20260706-a733-rtc-v4-6-f330728db3d3@baylibre.com>
	<20260706100635.E5DC61F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 06 Jul 2026 14:36:41 +0200
Message-ID: <1jv7asguqu.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6920-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashiko-bot@kernel.org,m:sashiko-reviews@lists.linux.dev,m:conor+dt@kernel.org,m:robh@kernel.org,m:linux-rtc@vger.kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:from_mime,baylibre.com:email,baylibre.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B621F711C5C

On lun. 06 juil. 2026 at 10:06, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Inconsistent rate calculation between `determine_rate` and `recalc_rate` due to division order.
> --
>
> commit 39f872462c04ad724c3624b152234160de56a47e
> Author: Jerome Brunet <jbrunet@baylibre.com>
>
> clk: sunxi-ng: div: add read-only operation support
>
> Add support for sunxi-ng read-only dividers. This will be
> useful to the a733 oscillator detection logic.
>
>> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
>> index 62d680ccb524b..d1c8c7baa12dc 100644
>> --- a/drivers/clk/sunxi-ng/ccu_div.c
>> +++ b/drivers/clk/sunxi-ng/ccu_div.c
> [ ... ]
>> @@ -84,6 +84,36 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
>>  					     req, ccu_div_determine_rate_helper, cd);
>>  }
>>  
>> +static int ccu_rodiv_determine_rate(struct clk_hw *hw,
>> +				    struct clk_rate_request *req)
>> +{
>> +	struct ccu_div *cd = hw_to_ccu_div(hw);
>> +	unsigned long val;
>> +	u32 reg;
>> +	int ret;
>> +
>> +	reg = readl(cd->common.base + cd->common.reg);
>> +	val = reg >> cd->div.shift;
>> +	val &= (1 << cd->div.width) - 1;
>> +
>> +	req->rate = ccu_mux_helper_unapply_prediv(&cd->common, &cd->mux, -1,
>> +						  req->rate);
>> +
>> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
>> +		req->rate *= cd->fixed_post_div;
>> +
>> +	ret = divider_ro_determine_rate(hw, req, cd->div.table,
>> +					cd->div.width, cd->div.flags, val);
>> +
>> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
>> +		req->rate /= cd->fixed_post_div;
>> +
>> +	req->rate = ccu_mux_helper_apply_prediv(&cd->common, &cd->mux, -1,
>> +						req->rate);
>
> [Severity: Medium]
> Will this division order cause inconsistent rate calculations compared to
> ccu_div_recalc_rate()?
>
> The divider_ro_determine_rate() helper applies DIV_ROUND_UP() to the unadjusted
> parent rate, and then this function divides that result by fixed_post_div and
> prediv.
>
> However, ccu_div_recalc_rate() applies prediv to the parent rate first, then
> calculates the divider rate, and finally divides by fixed_post_div.
>
> Since the Common Clock Framework requires determine_rate and recalc_rate to be
> mathematically consistent, could this discrepancy cause rate mismatches or
> warnings for clocks using a pre-divider or fixed post-divider?

I think the RO side is correct and RW one is not.

The RO part correctly walk back the tree by un-applying the predivider
so, whatever CCF does with the parent rate value will be correct.

The RW part query the parent rate then applies the prediv. This
will be thrown away when/if clk_divider_bestdiv() calls
clk_hw_round_rate() on the parent. If that happens, the subsequent
un-apply of the prediv would make the matter even worse. So (if I
understand all this correctly) this case does not happen yet, otherwise
we would have noticed, and it can be fixed separately.

Side Note: I've not followed the sunxi history behind all those
prediv/postdiv but I find them a bit confusing. It seems like inserting
some fixed factor clocks in the clock trees would accomplish the same
thing while simplifying mux/divider quite a lot by droping these quirks ?

Side Note #2: I feel that while sashiko is pointing out valid things but we
are slowly getting off topic and down the rabbit hole with it ...

>
>> +
>> +	return ret;
>> +}
>> +

-- 
Jerome

