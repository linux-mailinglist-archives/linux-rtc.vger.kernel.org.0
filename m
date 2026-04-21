Return-Path: <linux-rtc+bounces-6389-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMutNIVD52n55wEAu9opvQ
	(envelope-from <linux-rtc+bounces-6389-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Apr 2026 11:29:41 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBFA438E27
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Apr 2026 11:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56FB43009CCB
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Apr 2026 09:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5FBB3A5E70;
	Tue, 21 Apr 2026 09:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KP0YHrJK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFCB3A5E60
	for <linux-rtc@vger.kernel.org>; Tue, 21 Apr 2026 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776763670; cv=none; b=RsuvdNxQkZqINxIPFTb1R5Psj0cqnxkQTHWj3Jl/Y7YIMEP5OSywqggRsC0/P2yLO7/lRS5Z5yFej5iPy6Sygky7+7li0hH3VvESGS0yhBGDY/+x2Mf4au8EHbv7kYMApmxanZKUgPVMXb4XCJ/T3i2GPI/v/AkkjRd3EwlbtF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776763670; c=relaxed/simple;
	bh=NWVPQ/ix6la1A9YnRnDlxRH64UYZgVvj6dWNHNlWfm0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zb7y+hc/bLlY20nEKSjxX9k6xxYnjkVVNyA4muVdwL6qjUazJ/Uf8mAi9R4RtBa8hdNffwPr2GkeDX/2ITbzVI8zuiyA4exz+8t/tBRDwFiKYl9sOT4cEU6Iq7+fQc5y9JFnlIZjmaOyBoo3tvfG8dn2+YWnwFtw6QFbNs+VghQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KP0YHrJK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d74086e5bso3961237f8f.0
        for <linux-rtc@vger.kernel.org>; Tue, 21 Apr 2026 02:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776763667; x=1777368467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SK+aw4ngOkm9hF+ynW9KrB9F3h620ajY5HNLbxZ/XI=;
        b=KP0YHrJKrICGVmlUQNpi+20Q7UPpVxplJOquT+Zqh5wyKP1DFRAT7kdVdPEmcAtOJU
         brV2ROn1BQQz1KG0Et0nKatui0DkB9eOcKqCe0j55c/oDql4jqlcVe2INgsEj0oYNzsv
         v4I5gJbI1rbqnzhgEyyCzaFL957VWDYW4GuiX9CSdJK+KYx8hbbz5XGalDkv4CZ0svzP
         Us87q4HoGBFt6XaW9f+srHB+DxtWbVlIqdrWBMgH57xVDqxUZVkdyFAxN8W0e9FeM1pw
         oUlSAwAmh3T6pilJgybq1eLs9wpLgcIqAn6PInRw+GpDo3f1p+g9kBingnGSBOlIcuB3
         OEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776763667; x=1777368467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2SK+aw4ngOkm9hF+ynW9KrB9F3h620ajY5HNLbxZ/XI=;
        b=KFBZbP3di3b9Xk4Ze0ErR2s4E0T2k9aJYGzim8UDFq31ej59E1xax238tI/cxDaSjS
         LfGqLRfjJXwrTzDkpUTaTburzItWVLGkO5jKFPZ9uFcru8sj+aR2a4MYEPy9zjnH0EK1
         dHp+Sh+cr1IWzutzGtxeMvG+45f0JjbmQtV0knY7P87XOzHPhpk407h8bknPM3orr+ed
         XFtrE3rc1CTY5MNVitUZ1VsjdPrdzgjirM1QYgW/KtuLkUprg8Plj/icTj0SYQtOJ6Tl
         qU1Dx/ojByeaXeFcuRQGdF2dDWYihFQeQmjzWfBteLTKYcb/h0YztETEQvy+oItHJbCo
         lkBg==
X-Forwarded-Encrypted: i=1; AFNElJ8VRrCXNQ1uK5Eguf3TyINZyhtVlWj43VsObVEQ6fWEXbb8nDqQcq9NJsXvK6+IqvVhaGwVu/4Fw8U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqj9xPbmoayjvktF2FOHUqt5DDSdh5WNgUesXlvgR+K5voUkBl
	PBzsT9n0w/tFKp6V49DbpJmtA38+jagMHvN6edYENRg3MTmHXW+Cpcjk
X-Gm-Gg: AeBDietdoTK8ksGnOaQqExTiSwquCPOI7lkfVDkurbg7TM0EWoWYY2F9csHK9EyIcKP
	QXgbZ2SljfGsohoznRGtaC2mUjogvbd5IKrJ5zON3oKe+z7+iuV45jHdxa97Ba/p9aBwl2Gbr6z
	jY2MAA2u7437yLWtL8ZTFYwbQ/tGD1kBNf5mr7onkoxHXa1pJL98NOe2xqcu7uwZ4wRDSrpVsyi
	vtpbVHREQ11uratVukZYGLTjKIXXNfiWFTnnGwFQGHxS4lt1bO3n0Nv+COheIf93VWzO8kdHeA6
	YL/G2dmXpMO+Za4n4/65jDNpxL+kPKzWE4ccNw7ZSCoAG8lEa7gsTrWmZ2FmpYxGabpWmdKT9Yf
	sepZeERQJepxvGN/TlkALXvEVMRE12YKPPwXJQQVYDD3uAO1ZJHyGUcXWDMUFWVuhC2k4pFiusB
	WF4Qyaky1kldtTW0aNUycOW1lX8n3FuBsHtcVcqK4ouyThsyzAl5YaUazJN3JtWREF839yz7ia8
	xbipuylf8bEtw==
X-Received: by 2002:a05:6000:1a89:b0:43d:7125:e79f with SMTP id ffacd0b85a97d-43fe3e25c89mr27107393f8f.47.1776763666796;
        Tue, 21 Apr 2026 02:27:46 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1405sm35116597f8f.4.2026.04.21.02.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 02:27:46 -0700 (PDT)
Date: Tue, 21 Apr 2026 10:27:44 +0100
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
Subject: Re: [PATCH 1/9] bitfield: add FIELD_GET_SIGNED()
Message-ID: <20260421102744.6bd30e50@pumpkin>
In-Reply-To: <aeZocbNjbvzMZO8b@yury>
References: <20260417173621.368914-1-ynorov@nvidia.com>
	<20260417173621.368914-2-ynorov@nvidia.com>
	<20260420111940.GE3102624@noisy.programming.kicks-ass.net>
	<aeZocbNjbvzMZO8b@yury>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6389-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,baylibre.com,analog.com,realtek.com,gmail.com,lunn.ch,davemloft.net,google.com,bootlin.com,rasmusvillemoes.dk,stromeko.de,watter.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3BBFA438E27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 20 Apr 2026 13:54:57 -0400
Yury Norov <ynorov@nvidia.com> wrote:

> On Mon, Apr 20, 2026 at 01:19:40PM +0200, Peter Zijlstra wrote:
> > On Fri, Apr 17, 2026 at 01:36:12PM -0400, Yury Norov wrote:  
> > > The bitfields are designed in assumption that fields contain unsigned
> > > integer values, thus extracting the values from the field implies
> > > zero-extending.
> > > 
> > > Some drivers need to sign-extend their fields, and currently do it like:
> > > 
> > > 	dc_re += sign_extend32(FIELD_GET(0xfff000, tmp), 11);
> > > 	dc_im += sign_extend32(FIELD_GET(0xfff, tmp), 11);
> > > 
> > > It's error-prone because it relies on user to provide the correct
> > > index of the most significant bit and proper 32 vs 64 function flavor.
> > > 
> > > Thus, introduce a FIELD_GET_SIGNED() macro, which is the more
> > > convenient and compiles (on x86_64) to just a couple instructions:
> > > shl and sar.
> > > 
> > > Signed-off-by: Yury Norov <ynorov@nvidia.com>
> > > ---
> > >  include/linux/bitfield.h | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> > > index 54aeeef1f0ec..35ef63972810 100644
> > > --- a/include/linux/bitfield.h
> > > +++ b/include/linux/bitfield.h
> > > @@ -178,6 +178,22 @@
> > >  		__FIELD_GET(_mask, _reg, "FIELD_GET: ");		\
> > >  	})
> > >  
> > > +/**
> > > + * FIELD_GET_SIGNED() - extract a signed bitfield element
> > > + * @mask: shifted mask defining the field's length and position
> > > + * @reg:  value of entire bitfield
> > > + *
> > > + * Returns the sign-extended field specified by @_mask from the
> > > + * bitfield passed in as @_reg by masking and shifting it down.
> > > + */
> > > +#define FIELD_GET_SIGNED(mask, reg)					\
> > > +	({								\
> > > +		__BF_FIELD_CHECK(mask, reg, 0U, "FIELD_GET_SIGNED: ");	\
> > > +		 ((__signed_scalar_typeof(mask))((long long)(reg) <<	\
> > > +		 __builtin_clzll(mask) >> (__builtin_clzll(mask) +	\
> > > +						__builtin_ctzll(mask))));\
> > > +	})  
> > 
> > IIRC clz is count-leading-zeros and ctz is count-trailing-zeros. Most of
> > the other FIELD things use __bf_shf() which is defined in terms of ffs -
> > 1 (which is another way of writing ctz).
> > 
> > So how about you start by redefining __bf_shf() in ctz, and then add
> > another helper for the clz and write the thing something like:
> > 
> > 	((long long)(reg) << __bf_clz(mask)) >> (__bf_clz(mask) + __bf_shf(mask));  
> 
> So...
> 
> I like the shorter form, but whatever we add in the bitfield.h - we'll
> have to support it.
> 
> For example, __bf_shf() wasn't intended to be used outsize of the
> header, thus double underscored. But there's over 100 external users
> now. And to make it worse, it's broken for GCC 14 and earlier:

For anyone who hasn't followed the gory details it isn't 'very broken'.
Basically __builtin_ffsll() doesn't always generate an 'integer constant
expression' from constant input so you can get a compile fail.

> https://lore.kernel.org/all/20260409-field-prep-fix-v1-1-f0e9ae64f63c@imgtec.com/
> 
> So needs to get fixed.
> 
> The bitfield.h has two __bf macros: __bf_shf() and __bf_cast_unsigned().
> They are thin wrappers,

__bf_cast_unsigned() isn't exactly thin.

	David

> but after all do something with the corresponding
> builtins output. The __bf_cls() would be a pure renaming. I'm OK with
> that, but some people don't:
> 
> https://lore.kernel.org/all/20260303182845.250bb2de@kernel.org/
> 
> That's why I didn't make FIELD_GET_SIGNED() implementation looking nicer.
> If you strongly prefer the shorter version, I can do that in v2.
>  
> > Also, since the order of the shifts is rather important, I think it
> > makes sense to add this extra pair of (), even when not strictly needed,
> > just to make it easier to read.  
> 
> Sure, will do.
> 


