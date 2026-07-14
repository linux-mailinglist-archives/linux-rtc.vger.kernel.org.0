Return-Path: <linux-rtc+bounces-6974-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JWHnOWJEVmoP2gAAu9opvQ
	(envelope-from <linux-rtc+bounces-6974-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jul 2026 16:14:58 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 788A7755A0F
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jul 2026 16:14:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=n3fmb1WB;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6974-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6974-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E097C3008D78
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jul 2026 14:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD1D3F412D;
	Tue, 14 Jul 2026 14:14:54 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DD3353A73
	for <linux-rtc@vger.kernel.org>; Tue, 14 Jul 2026 14:14:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038494; cv=pass; b=Pyty0LM2NrWQIDmPAKp2erfRqCeZrwT0KOIPrJfbXevv3SwBsfoBNMk5KWTlq70hIdGtdIsx3+WiYGZjKB864yiJWzpaK9Mv5dZMA6KYpPae3SwFoCbFoPWKFC1R5qLxzpIpPUX5KB86WPSzFYc7+KIktzhN9DMnzFQYW+h9NcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038494; c=relaxed/simple;
	bh=ZwonBpzAXy48ag2d1XJdBAdRbfwE5+nc6HaosOT+7aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K6gByBkJZ3hG8ZeNRGwRpKo+xvgSohxHHPnH9NQ4J9ozdHqtTZo3WbytmLD4m0wTJvgbw70Fu67JFCQUWCjHdMe7lPnkksi1ZsrnpM+9DjxyEuMSknXzKkIPLqI3Gts/HHfVAd1zW2TfCmnYnxoZFjvGGcmQgujQt6jxNrNf980=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3fmb1WB; arc=pass smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc61541f8cso13709275ad.0
        for <linux-rtc@vger.kernel.org>; Tue, 14 Jul 2026 07:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784038492; cv=none;
        d=google.com; s=arc-20260327;
        b=UtRuwsa6SyA+OZg0XX1CkKlLZHE+QbJ6Mpv9bMpTpjECpmnllUjmm7JPAaHVHbrSda
         /eSU/xCpt+fmiZ0luJrcN3xgNpAdSlOKlS8jiINCsMm4h1sn6rSUEYIgXuVAaCyDKk5O
         5KiFYdDnR8zEOlNsZeiGEh8d5rQ4st7/IoKGJ3pY/NJzaEPa9TNEyaa4boikq28xgXUT
         sEOW21hTKAMPju5dNkwoLjrQod6+8GUGm4rLPfFnnTwHvGMygoF3nFKcucywLxtJDGRG
         +nD7lwK6fLDt0yglt/G6DNbyQ0t78DGHKLTXXb+V/RcTQsIaMMSX6vtsT2QfwCEaMLCR
         sRng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iffoRGhgdfjVMgG8fR7bEUfZMRX8TGqnupkWqKC4uSM=;
        fh=S7z6fy1GtYFEeaieav8ZAQGACBUCfEAgE1Lf5nUMkts=;
        b=r61G9FMWLrn7lyplfcUEmK4f0Q2V3+7zoWfMhC8Qh6s4Kl5ojoh6zneVH07LZsmoic
         7kQHAcZvzSGywJ2p98Ny7HE+Jia7k1QGuMhJ/7NOupCNdZ+gRtmzJn655tjgSq4Qah3J
         FbfCLDy1ypW/NEOjHY1/5zRkpN2l8xn33VKaK8G7VfHG9BeiUlK5Ex1ECwhDxkC9Yc/D
         HDr5BWZ5GAtmtcx0N5WTmPuP3CzEB744WT+33iMWCuIN1vFtO/nTPvDQpgRSWy2QTKX6
         Xs69nW6qF0SVtJ/1mPC0mXAGIvE0AcADsXtfDkCxjezwZidqjWY+saGCY4FctyNjssSK
         btkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784038492; x=1784643292; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iffoRGhgdfjVMgG8fR7bEUfZMRX8TGqnupkWqKC4uSM=;
        b=n3fmb1WBAJCg4vV0D5XcPaUu6YHriNnCtoyKEAUqSzbqntD5+2H7HycTAihki87qAq
         A++r/tR2LNn2SRYsZZPtut9Gy/l3dehlmI7H+Yfrsleb1AX4DoQL/5ASWfPUkspQaHJU
         E9XDinFNQ4tpanqZejXcUOWfuxnD5/561GNvOhCJY5wbBV1jsTKmYNnSKBOwVperbkfy
         FNnIoyZgiZzG7j5HITRVJvNPiZYmTCJxZLAxEW937ivAOW0+JdZS25Z5GE9c15ypp8Eh
         Eic1dbqPf+gA1bqdxNp0KMzNAODmHNuHvq+zPO5o9IMcNr1DkM6uicQiPar5KSlx4e/U
         MuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784038492; x=1784643292;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iffoRGhgdfjVMgG8fR7bEUfZMRX8TGqnupkWqKC4uSM=;
        b=dP5JXTvuYkV1+t/x1gkAsYe+8br1Qfpixxee4zed28mr2jitT9lC4++6iAQemZnqyL
         mUIBZqkRq73vrz91bgxbGTbzW75eq2zOxd/l2zcRtSK8tzdSyYeQ6gsMPnXQCVh9Vkm0
         +Tn5vAxUOUamSddoChRr00aKQvKiLvYl22ij9MylGERXKbC0tl2er1EEqQMpjXtk23Cr
         izSeSCVjlOLFi/zP3uwJFYfY06rhlhZjjeSj187u/QDowPp9FzuD0uDFE56gjGny1+GE
         HPAomBx9PZ6bSPTu6w5C5q/9W6xNFv47/diwzb+Nid/0SmT9nuxtJ82neyuGHUn8YDgl
         yoSA==
X-Forwarded-Encrypted: i=1; AHgh+RrR9sxNYhaG38d9Yhw72LR8i39P4NQisQUMbbkUA9laHAm5MRr9MmbndN5Bwq/4dOmB44MMp8qKUT0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6TNAKiQGEuukFBxtp25oSXq6v82cNOZdXXf51ucbflNFmUU5f
	u72XUQ49/X3XWzvzLatr+kKWmQhun7Y8CpzgwinseocKsKtvKJnVGB9Z9skVVjpfq0lhdP+St2H
	/WlXgX3hbKRI12/32pUd9gKXDHLj0abk=
X-Gm-Gg: AfdE7ckIZunDMlhx58ce15PwZAHyCXwsL1xAo10oFgLZfp5QzphusrHCP1zRyuLpBk1
	l6u1pStUiDkmiP2G4iOpu+9k5oyuj5oUXdLcgVKxAETlJ3BI0KKdj8ZWv8VtkH+RmXfMPzKnU1o
	boXiPXDReozmBv0ZDzahVPg2OtziDUaKOt+HUyFpnU5PWk1RYvRLDwJcl0eB5T7UrRdjMDFsAzL
	llRsdEvc8Tz/WIlhfN8QlbWoUsLQgb3b6aSqx7wHG92HQLP665YmEubW1Qgxz5SRr2p7GorEqPK
	HbSNT5JkogWxSwaU9cLm1oa/ke0K0C94OpAjMeD3tg==
X-Received: by 2002:a17:902:cf0b:b0:2c0:d94f:50c7 with SMTP id
 d9443c01a7336-2ce82879e0cmr178464175ad.7.1784038492000; Tue, 14 Jul 2026
 07:14:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <27fb93d0e61704d495e3adf4ed614edac1642267.1782909323.git.mazziesaccount@gmail.com>
 <CAMRc=MccLRKb8ZjChcR7WK3TqV3=waSnKX=UX9LR=5hOT=_tsg@mail.gmail.com>
 <CANhJrGM9ciyBfgGWBwOM3kNmcXGSq4QVM6a6Js+wtbr9ANtSJA@mail.gmail.com> <CAMRc=MedLP3XBqoUv_zUr5gxBVc+gqwY3ozAyXagBhc_70Kykw@mail.gmail.com>
In-Reply-To: <CAMRc=MedLP3XBqoUv_zUr5gxBVc+gqwY3ozAyXagBhc_70Kykw@mail.gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Tue, 14 Jul 2026 17:14:37 +0300
X-Gm-Features: AUfX_mwsVtiEKTfAVEpGQxTiufDOYn-DdkejDZRKfFW-BwMpqRjZhGNLCiRQJ_8
Message-ID: <CANhJrGOZQTG6j9AFse3+p_Yp=BweAUD3SQc5QV394hO-PQegvQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:matti.vaittinen@fi.rohmeurope.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6974-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mazziesaccount@gmail.com,linux-rtc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mazziesaccount@gmail.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,gmail.com,baylibre.com,redhat.com,bootlin.com,vger.kernel.org,fi.rohmeurope.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 788A7755A0F

ma 13.7.2026 klo 11.16 Bartosz Golaszewski (brgl@kernel.org) kirjoitti:
>
> On Sun, 12 Jul 2026 17:42:17 +0200, Matti Vaittinen
> <mazziesaccount@gmail.com> said:
> > pe 3.7.2026 klo 16.11 Bartosz Golaszewski (brgl@kernel.org) kirjoitti:
> >> > +
> >> > +     if (!g->num_pins) {
> >> > +             /*
> >> > +              * The BD73800 may or may not have pins allocated for GPIO
> >> > +              * depending on the OTP used at manufacturing. Free the memory
> >> > +              * and go out if there is no pins as then we have nothing to do
> >> > +              */
> >> > +             dev_dbg(dev, "no GPIO pins\n");
> >> > +             devm_kfree(dev, g);
> >>
> >> No need for that, because...
> >>
> >> > +             return 0;
> >>
> >> ... this will still leave a bound device in the system, I'm not sure we want
> >> it? The correct error code in this case is -ENODEV.
> >
> > I am a bit uncertain. This isn't really an error. It should be very
> > much Ok to configure the support for PMICs with GPIOs to be compiled -
> > and also very much Ok to have a PMIC with no GPIOs. Returning an error
> > doesn't feel right. Furthermore, I am afraid that returning an error
> > might hurt the system start-up? Do you see some really problematic
> > consequences if we return Ok without registering the GPIOs. I'd assume
> > that wastes some bytes but I don't see other really severe
> > consequences.
>
> But -ENODEV/-ENXIO error codes are meant to do exactly that - tell the driver
> core to assume this device legitimately cannot be enabled on this system. There
> will be no error splat in the kernel log and the probe will not be deferred.

Oh, thanks for the explanation. I didn't know this. The -ENODEV not
causing error splat makes sense. The fact that -ENXIO does that too is
quite surptizing to me. I thought the -ENXIO is used to indicate
unexpected failure in bus communication.

I'll go with -ENODEV in the next version.

Yours,
    -- Matti

-- 

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));

