Return-Path: <linux-rtc+bounces-6966-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4bYzAOy1U2pCeAMAu9opvQ
	(envelope-from <linux-rtc+bounces-6966-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Jul 2026 17:42:36 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9015974539F
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Jul 2026 17:42:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cUr+5aKt;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6966-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6966-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84647300A11D
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Jul 2026 15:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10ECE340409;
	Sun, 12 Jul 2026 15:42:32 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740CC309DDB
	for <linux-rtc@vger.kernel.org>; Sun, 12 Jul 2026 15:42:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870951; cv=pass; b=sACaTbPZq5I+OSe2x8vW3Rtm4Cw4reGJTSlTysR8Wtp/0K83ZE6nDDZ0mEsmjbGRj4eEGCSWXY7tbdbyBAPabOzdaOB1RX5Ad39qD0WxEvq1sUGy/qtX7Aau8/SUiGpOph7HaGKzJC4fAHuDqQuCC408W2SRfQkJy3Ioj1sew8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870951; c=relaxed/simple;
	bh=gSc879GHO7OM65polMl8z6uADAnwPXUOGNB/VtrXRjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nm7adUeVqGViDectsb38CImnTWOjIYOVFEVudogqOadFRfyvlgtUjGF5XXyBDDcriQZ38r/zCYCSYvImXnaPzPPssI8Uhro5M4xRALB9cC4Peyq1/uNQNMgqOgL72BDexHDUsFPmTf2+PHbGzw0IXUtxyVz1+/Nu6yBjmqQdKUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUr+5aKt; arc=pass smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cae1a3a744so15899825ad.3
        for <linux-rtc@vger.kernel.org>; Sun, 12 Jul 2026 08:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783870950; cv=none;
        d=google.com; s=arc-20260327;
        b=IGjReTa6eP/WKBW6CH7a+kw8LipM0Ycco+01IiNHmrPVM+bEFybj1Hve0r8vomRWFQ
         IosuMTMZvltkB7P82eOw9VCHM20c8/RUj4SmJ46nhZj+2VOZOp3c0gYkjL8mNzuoGml9
         gAxD/EmY+2hugEs2+CcmDZR7UEc6mge86FldoMOz7xYPhjz/ZwJsc7dshmzK05mJowha
         q8R5Yta+l10nsGJRPhsYr33AF4VVv9LX/X3Sid+jbT6dCGrkiMI0meDC1wKTaS3gXEZP
         vDtDC8RRN9fUAc7Vpk8DjQNMta09roZlI+g8w9wglJM2aW62hYWS8XSnboyR/O3ny4Fy
         xQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Wbo1q8mEUKrWsXK/f5GIgIPFSibN2PA5ipDDYRbQQeY=;
        fh=2X+WfIDkXXt2rgaZfafKy213kIPGaDkUW2bX1yC5MmY=;
        b=U7+0O2BxNAAmlRIlFm2UnyiEY8ees4PdC7+6Wjt07MjBpvtirR+XmOYpfgOH5W719k
         OYgt0mvA0XFnBzrkxu9cXnSMQHyaMuQHENXi2QyW9Jkrr6HfeBmf9ORzp3heQK3jOMaW
         BtIzhwBJf4bB73SSdcUsZjQvrpeRgs0wY7enfSs9fmPx5u/k/StjBikVcgY8+Cvq7kgk
         jW7KvE555wzf+zctnk1u8oXNWSfxdVEYow6Bw5fj0E7UkT83zHiWbz3JqBqAtM1COX/3
         AV0JhbeBUb5SJp5WF0cgOhYKWK7LoHAoJECPoh4nqSoa89CtRvdFcaRXRec/2j4JUbWr
         7dag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783870950; x=1784475750; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wbo1q8mEUKrWsXK/f5GIgIPFSibN2PA5ipDDYRbQQeY=;
        b=cUr+5aKtwfW8UxLR3Nl4MNT7sLEw/E6Gw9OYI9Ph6lGw+MJbO8ghWMKEnPUiDwplca
         R9U986zCWFpNCmbAOmZPifBV0PdZATCI5ZEUpraoLmBjOEv8yCQTRj5BbnRJdrICMdRd
         rbJMt5OhZCcyda4jv48CIsYjN7eCk2yl+t+i8cgw5ckkk9wxbY9z376spcqRkgHlC9vN
         4/fWDdYhkTogYZbAjwfJV8eSxsqMavmKTn3uaPtwsV+hOUr3mD7Q2tpn97U4c2DeTtgi
         Tevkxeag8lmBJVm60jpjzpDZogB2wvRxM5uzdh5IlKpIeg4MPHutLmrcx5JMJ0vMFX0H
         ssHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870950; x=1784475750;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wbo1q8mEUKrWsXK/f5GIgIPFSibN2PA5ipDDYRbQQeY=;
        b=T95ePSui6tjhwuW26bfKiDyHRSK5BNwA9PjcHF+ZdqnwoPkrzuyD29xgKGXqGbM9on
         QBetRvQfzWMixlybOTe67vZqJLDsPrx0LZCBLHlax1C26jvHCkCzBVB3rOvAEW2CqY7l
         jOTFaCyD/u1PW0iJYXJWoqUM6MyerWwg/r+eHerS0AGaNuM3Jxh9JH93oW6I5r1Mp3R0
         7BOHW3Cs6/Bk97ce3IR9gVeR1Mc26qtrs8STB3KYasZF+YtwpriqdiKgmqrAfC6B7b7f
         e7acr09Yf3u5fEkTAp8UnFkhM34zY91KRjS44ApcTdYxnLGt5sL8wiGt8XSwmxn5LJs1
         KhWA==
X-Forwarded-Encrypted: i=1; AHgh+RqeHruirUuq47X/z5r+8n1N1LbDjqDZNv+mwjEDlCQYtwjOZRy3gB8ug/VrTe1WmA8TMw6YtdR8fbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpA6XWLsCdh7Z9BEsWqI5rRjFW+MBHjMCq+NuU/jJ9gTYXVCA6
	IY/tMEfFisM8eOdlRyWvtbtlYUKHrIII4bWxNUUzRR4MqZuf28ESXuprmXdgraiRLhBUlLq3FMW
	CiheV4MfA0KGfZufB0KpvhKUxvWiemiM=
X-Gm-Gg: AfdE7cmf9uhnK8VwU5dZHPAVKUmvsBXaJmIzeA3vcraJkVYpsBEXgmh1hgLCRZun1nb
	7TtVS1D52eXPJ9bEclpwfth5HW9uf/cYIP0WXQ7IX00z4JTBhrGRp3PXXIBfWMJbtzGANXZTSPM
	wnAnujkx3hK4wA5jI8q0Unub8mo5lQhJPedirzlHdiYX3cVcZtZXelmUCvKe7w8saWNk3Ac8zFF
	Tk+w3gBZaYF1c7r/Le8xqJ7j6XSe05eheFERb0Ve3vEzXaYGSQF1IeQa884F/Qv1sxdk7bmpJQM
	QoR2G3kbl6DbkvGcELDP41+sTyqLan8=
X-Received: by 2002:a17:903:28c:b0:2ca:6eca:492f with SMTP id
 d9443c01a7336-2ce9e9b9e78mr56293415ad.14.1783870949569; Sun, 12 Jul 2026
 08:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <27fb93d0e61704d495e3adf4ed614edac1642267.1782909323.git.mazziesaccount@gmail.com>
 <CAMRc=MccLRKb8ZjChcR7WK3TqV3=waSnKX=UX9LR=5hOT=_tsg@mail.gmail.com>
In-Reply-To: <CAMRc=MccLRKb8ZjChcR7WK3TqV3=waSnKX=UX9LR=5hOT=_tsg@mail.gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Sun, 12 Jul 2026 18:42:17 +0300
X-Gm-Features: AVVi8Cc6tt66W5dgLObqCo-hlb2IRsmOzx4mUkw5K5KParLVQP-uA6p1X9UaJlM
Message-ID: <CANhJrGM9ciyBfgGWBwOM3kNmcXGSq4QVM6a6Js+wtbr9ANtSJA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:matti.vaittinen@fi.rohmeurope.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6966-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9015974539F

pe 3.7.2026 klo 16.11 Bartosz Golaszewski (brgl@kernel.org) kirjoitti:
>
> On Wed, 1 Jul 2026 14:43:25 +0200, Matti Vaittinen
> <matti.vaittinen@linux.dev> said:
> > From: Matti Vaittinen <mazziesaccount@gmail.com>
> >
> > The ROHM BD73800 PMIC has 4 pins (named GPIO1, CLKOUT, FAULT_B and
> > EXTEN_OUT) which might have been set to operate as a GPI or GPO when OTP
> > (One Time Programmable memory) is written at device manufacturing.
> > Support the GPI/GPO use-case via GPIO framework.
> >
> > The default OTP for these pins is to not use any of them as GPI or GPO.
> > (The GPIO1 defaults as an ADC input regardless the naming). Hence the
> > driver assumes none of these pins is a GPI/GPO unless explicitly pointed
> > as GPI or GPO via device tree.
> >
> > Furthermore, pin's direction can't be changed after OTP configuration is
> > done. Also the default drive type for a GPO (CMOS / Open Drain) is set
> > by the OTP configuration. The BD73800 has a set of undocumented test
> > registers which should allow changing the drive type. Access to the test
> > register area or the test registers aren't documented and so this driver
> > does not support configuring the drive type even though it might be
> > doable.
> >
> > Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> > ---

Thanks for the review! I appreciate it!

> > +static int bd73800_gpio_get_pins(struct bd73800_gpio *g)
> > +{
> > +     static const char * const properties[] = {"rohm,pin-gpio1",
> > +             "rohm,pin-clkout", "rohm,pin-fault-b", "rohm,pin-exten"};
> > +     const char *val;
> > +     int i, ret;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(properties); i++) {
> > +             ret = fwnode_property_read_string(dev_fwnode(g->dev->parent),
>
> It would be cleaner with device_property_read_string(g->dev->parent, ...)

True.


> > +
> > +static int gpo_bd73800_probe(struct platform_device *pdev)
> > +{
> > +     struct bd73800_gpio *g;
>
> May I suggest a slightly more descriptive name for driver data? Maybe at the
> very least... "data"? :)

Ok.

> > +     struct device *parent, *dev;
> > +     int ret;
> > +
> > +     /*
> > +      * Bind devm lifetime to this platform device => use dev for devm.
> > +      * also the prints should originate from this device.
> > +      */
>
> Why would you need to comment on it though? It's very much the standard
> approach, isn't it?

Sure. I might have had this comment combined with the one below. Idea
has probably been to explain why we use both this device and the
parent. Can't bind lifetime to parent while needing it for regmap and
dt. Well, I agree that this device's comment is really not required.
I'll keep the comment about parent while removing this. Thanks.

> > +     dev = &pdev->dev;
> > +     /* The device-tree and regmap come from MFD => use parent for that */
> > +     parent = dev->parent;
> > +
> > +     g = devm_kzalloc(dev, sizeof(*g), GFP_KERNEL);
> > +     if (!g)
> > +             return -ENOMEM;
> > +
> > +     g->chip = bd73800gpio_chip;
> > +     g->chip.base = -1;
> > +     g->chip.parent = parent;
> > +     g->regmap = dev_get_regmap(parent, NULL);
> > +     g->dev = dev;
> > +
> > +     ret = bd73800_gpio_get_pins(g);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!g->num_pins) {
> > +             /*
> > +              * The BD73800 may or may not have pins allocated for GPIO
> > +              * depending on the OTP used at manufacturing. Free the memory
> > +              * and go out if there is no pins as then we have nothing to do
> > +              */
> > +             dev_dbg(dev, "no GPIO pins\n");
> > +             devm_kfree(dev, g);
>
> No need for that, because...
>
> > +             return 0;
>
> ... this will still leave a bound device in the system, I'm not sure we want
> it? The correct error code in this case is -ENODEV.

I am a bit uncertain. This isn't really an error. It should be very
much Ok to configure the support for PMICs with GPIOs to be compiled -
and also very much Ok to have a PMIC with no GPIOs. Returning an error
doesn't feel right. Furthermore, I am afraid that returning an error
might hurt the system start-up? Do you see some really problematic
consequences if we return Ok without registering the GPIOs. I'd assume
that wastes some bytes but I don't see other really severe
consequences.

As noted when sending - I am mostly offline during July so my replies
may arrive a bit late and next version is unlikely to be sent before
August.

Yours,
    -- Matti

-- 

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));

