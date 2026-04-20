Return-Path: <linux-rtc+bounces-6388-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEqzHEqi5mkrzAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6388-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Apr 2026 00:01:46 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D67E04346D6
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Apr 2026 00:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 938EC301C10F
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Apr 2026 22:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB503876C1;
	Mon, 20 Apr 2026 22:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAReCENy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1253859FD
	for <linux-rtc@vger.kernel.org>; Mon, 20 Apr 2026 22:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776722443; cv=none; b=ql8+Rm2e47v3a2wvp1H4oFHYPxAZa3oZcvCzn9V4mhRLklm0LaHqe1DRK8B4ANgTNJG3WNzFKwlj3w7x5nOwhgP7nvz2FhTOnAht78AQT/pnWbwT1nkhdquFEmSmSp/M6DWz+ttLc8IGx4n0JqeY2ayvxzMG4OySl5bawzqeuxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776722443; c=relaxed/simple;
	bh=zcIuX44FQ4JZplZlzPi2l4ZSnMwkpRIbGnceAVAp6cg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kPS9QDzMiwoUoZlg3gd71hkKHiHpdF3a+o6VBikqtyFfVDA0kj6A1CjnEcIvkMOB5FRjDV3W7Q5WbrqLf7Jf/keFQK0bis9pTA/xxxiV7otpkCUSU4Ao7IU9ufzAKYtYwbCm5PmCo2eYQLHrslRzs6OSH6KzjK+BSyxSeqfhReI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAReCENy; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d77f60944so2883290f8f.3
        for <linux-rtc@vger.kernel.org>; Mon, 20 Apr 2026 15:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776722440; x=1777327240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7JO2f/xlDpOxtBT93GnNbMq3RmdZ9DsCL97xFYueTk=;
        b=kAReCENyQnUWaL/fzwM1HV0Iz4JNWHfQYDT+hEHCcnneS2miPKABJqXU6DBOguxZKS
         T+owt/hFSTq799Zq6ejr8MfRapAGqczgxrn/8/FSKbE4KmN2ecbAPCxl0IncFGwJTXxJ
         nLKB7sB3vG6SkQH2/xRRbRyCNxGQLGcXSEM/lZ3EydQTt+k/28Voi4lzCueMszLE9MQU
         MNmU/BmLUUxnUGI5vDtsusUgwIOBaCNde5y2QQ8c3lQ0RVjTWmuoH5l+htPqfA6o0t9v
         VEcoOG5uXV5v1ERu+jg2x5BELqnbOExZVcrhsQF9tEDo8NaLFrZbDn2mXtDgg+BpshvP
         X1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776722440; x=1777327240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+7JO2f/xlDpOxtBT93GnNbMq3RmdZ9DsCL97xFYueTk=;
        b=SCDoATXfHAs5tje9Oyq3MEzNKfEk6lDiNvRlqjZnCS8G44w1b7aRCRmU2uS390cIV9
         Arkiv8BERLMtyx0OUGQSKtOin1ZI9hIohDoYKqcnxa1LwQeyQYJO57wOHhtFE+bhc8Bt
         4Je4unvnq7411U5KrVYDaf6vXDVKt4aIePIQiPgzGDdFzeOZ10ITXQXJs1IDCIkRE0KR
         Z4aJ8GPEWl5bHl/tw7dl843DDRGDZDpx6fSSPXF7xjJxi/Ku/8gjKfgY71sjTQKMAFA4
         xc7lcqHns8SOpx0zDSeP3hUhg/pEnXdJ2W100Jgim8/HHoMbxkiRSysfbgQhLFJ+od6t
         j/NA==
X-Forwarded-Encrypted: i=1; AFNElJ8p/91rB6XxJHMT0uAyfL+CHlxqS6TizUnnCtfo8fgWZYXA+luMIP7G48BN4h1euRDoWTqXwbEmy7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTtkEP+Msjrv6/CsBWhyKPCyeh7gQNmApTJIf+k/ZY7Q0YT4Z1
	N+xbL9+UwLEixHw4gEG5kNaUWBSjbAXxJ37DhYFo+UbtWCCrSDFibTHA
X-Gm-Gg: AeBDiesMOzAOsfGKAZQRJ3e49mf7KO5bVmmKLIzxKBMhjQ4p3iXO2QYln0oKh8mtZ2z
	bMlL6oJ1zDmHkBlt6x9jzhaprYPzkBBjJgxcp4nFgPC/5eafPJGsLby00rGh5BmbMrdFdat/QmA
	E8kgHcW/uGu8M+2GMjNCn1bZyTjX+e3gLY4c3Z7iFYKIJCOZwGroxPPWXodTRi6SspAVE+pJn5M
	XjdceFcxyPUMEp6Yhvo5NRTFWG11UKww9BoWa5rnrX30vxYYcD5YiD48XAHsIoFyZ9JFt0i8aJu
	sfM1oKV1+GOpF084BFoAryA8Iqu/9ngq63G3o5m+xDdyO0ZRHHplZkSXzR1vrcL6IR9GfneJrgq
	KdQ1S4vfxskD376NbH3BeZnryPkVNsIo2OoB7fL97ByAOp4S3gt6IMXHRefI002ihZ6ZT1sDqS0
	8cDPOZyB8nIPNaYz9uZNIBuD9ekVQFuTTiAtTM0gZXSOHJUojIFjTYe9Y6SF4aBdKVWByfodVvv
	S8=
X-Received: by 2002:a05:6000:2303:b0:43e:b020:f8a2 with SMTP id ffacd0b85a97d-43fe3dd5208mr22198611f8f.19.1776722440147;
        Mon, 20 Apr 2026 15:00:40 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4dc26a3sm36471952f8f.15.2026.04.20.15.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:00:39 -0700 (PDT)
Date: Mon, 20 Apr 2026 23:00:37 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Ping-Ke Shih <pkshih@realtek.com>, Richard Cochran
 <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Hans de Goede
 <hansg@kernel.org>, Linus Walleij <linusw@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Salah Triki <salah.triki@gmail.com>, Achim
 Gratz <Achim.Gratz@stromeko.de>, Ben Collins <bcollins@watter.com>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/9] x86/extable: switch to using FIELD_GET_SIGNED()
Message-ID: <20260420230037.21fb4758@pumpkin>
In-Reply-To: <aeZf98xjbxdHvZOS@yury>
References: <20260417173621.368914-1-ynorov@nvidia.com>
	<20260417173621.368914-3-ynorov@nvidia.com>
	<20260420112428.GF3102624@noisy.programming.kicks-ass.net>
	<aeZf98xjbxdHvZOS@yury>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6388-lists,linux-rtc=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[34];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,baylibre.com,analog.com,realtek.com,gmail.com,lunn.ch,davemloft.net,google.com,bootlin.com,rasmusvillemoes.dk,stromeko.de,watter.com,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: D67E04346D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 20 Apr 2026 13:18:47 -0400
Yury Norov <ynorov@nvidia.com> wrote:

> On Mon, Apr 20, 2026 at 01:24:28PM +0200, Peter Zijlstra wrote:
> > On Fri, Apr 17, 2026 at 01:36:13PM -0400, Yury Norov wrote:  
> > > The EX_DATA register is laid out such that EX_DATA_IMM occupied MSB.
> > > It's done to make sure that FIELD_GET() will sign-extend the IMM
> > > field during extraction.
> > > 
> > > To enforce that, all EX_DATA masks are made signed integers. This
> > > works, but relies on the particular implementation of FIELD_GET(),
> > > i.e. masking then shifting, not vice versa; and the particular
> > > placement of the fields in the register.  
> > 
> > I don't think the order of the mask and shift matters in this case. If
> > we were to first shift down and then mask, it would still work (after
> > all, the mask would also need to be shifted and would also get sign
> > extended, effectively ending up as -1).  
>  
> FIELD_GET() doesn't require mask to be signed when a reg is signed, so
> shifting mask may become zero-extended in an alternative implementation:
> 
>         (reg >> __bf_shf(mask)) & (mask >> __bf_shf(mask)
> 
> This all is hypothetical, anyways.
> 
> > But yes, this very much depends on the signed field being the topmost
> > field and including the MSB.  
> 
> This is the part I dislike mostly. This would look just like undefined
> behavior for the API user: depending on fields placement or type of the
> inputs, sometimes FIELD_GET() sign-extendeds the field, and sometimes
> not. 
> 
> We could likely force FIELD_GET() to treat both reg and mask as unsigned
> types, and state that explicitly in the documentation.
> 

There is already a BUILD_BUG_ON((_mask) == 0), changing it to >= 0
will detect negative masks.
I think the only one is the x86 exception table.
FIELD_GET() casts the result to typeof(_mask) so the sign of 'reg'
shouldn't matter.
I just tried building with a compile-time check for reg being negative.
But there are too many false positives from FIELD_GET(mask, readl(addr))
and FIELD_GET(mask, READ_ONCE(var)).
The pre-processor expansions of those don't bear thinking about.

It's late now, but I will check how __unsigned_scalar_typeof() handles
variables with const or volatile qualifiers.
I think they do though the 'default' the same at bitfields.

	David

