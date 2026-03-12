Return-Path: <linux-rtc+bounces-6175-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGaKEsFzsmlbMwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6175-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Mar 2026 09:05:21 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CC826E93D
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Mar 2026 09:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9DD71303F459
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Mar 2026 08:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B78347FEA;
	Thu, 12 Mar 2026 08:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeOb9bJl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E2E2E718B
	for <linux-rtc@vger.kernel.org>; Thu, 12 Mar 2026 08:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773302586; cv=pass; b=A1seshan8kflDPy0ffAzjGFrx7C4wvHjubuFu+Mi9sbmtCSnU0T+bPWuRZEtflCWXnuThhyLzfwPKsbfoYVxXIXzr+jMkOaexPnqcm7GeMk/Z/8UT0JtilTYPrtaAP3HKLhMm+nUUkxYpxHBPsOw047O+ZJV0hbnzXbTGNCcSoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773302586; c=relaxed/simple;
	bh=cTzeAB37F6kJZZPNQk3PO+7uyQzPvuQGhnO4B+D7ZFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vk2L4F3wds0ZpXEMn+upoS64ibH6GBzx5Zc3XaLdyE4qIMqHFQ+L+D7er4auaMam9yxx0ZDYyhO0CwHdOEhcf56SWb5xFB4fkRIs60r4xAWjcaCJ/zUiQCnnVxIX+l5ARClzOfBvmBSw+UiSM7CW3IhhmESSxZtKtVZXIBGKcvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeOb9bJl; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so7482625e9.2
        for <linux-rtc@vger.kernel.org>; Thu, 12 Mar 2026 01:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773302583; cv=none;
        d=google.com; s=arc-20240605;
        b=HTD1pi4hYg1JQs+zdv9wzlg76ybtLvFqt2J/j/Bdr3Suv7yAG7xK0lle4htkq/1Gw7
         6CwX1Mu/M99mjTu7wLK2ZjmcAukpP8QbEWwghptSivdzLP545aWrFFlDSIfBEnvgs7sb
         29CZhbmKDiHyzTykfCiItrRUZtxjR7zvOyyyONGbq5aNLgFX7R9enhSUSnUn0hNOQRLL
         DYzh79obk4q4mHzFtV3p7FywTtYyA50Tu0Yns2cdrP12qqc5oii5SdQQD26mlf5gUwJ3
         A59eeJ1xBGlpzYZMbB28wsWLI2H7AaGWm7OnXbSIymqCW9q9v3+i05F9adPNWeH38LTv
         qDIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BbjJ+SQCghaY61mjkEDxh0STs+H8xDE7U50HeqsZzCU=;
        fh=+vSP9x+gkDIs71GJ/YXFKIsSQ6tvELF9MQbx4RA8SGM=;
        b=Gt0CeU6NRAa2rcnHLch0nXL0ce8CqQxn8yw4/4feba/rDq8Opy/JLW1zvUyy++B1kk
         RXIHwB/mzwOIui8KFdToMqYvi87P2C/8Wsp1uOi2IU+a/T1HXfOgL2ydjdfCQejVKU7T
         Coh8x8tJZVWZl0Tsg521kfmJi9KuM7bcu0LUs3SiG84g0C9NKotS1VbBV0RWqg4TiByT
         P7BfQnyFgtTI9gKYWdPboE7wBrTJ5upsGIIBcg2HSd/DkqM9VBf8uHdJp0Ueva80nw45
         bE7obUExK3IAZQfdBzcoxEwNCmvkpUfRNk6YMJ6dAFarOC3dau30C59fb6xTBDTXNyhT
         6Cjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773302583; x=1773907383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbjJ+SQCghaY61mjkEDxh0STs+H8xDE7U50HeqsZzCU=;
        b=JeOb9bJl7R4Nw7fBOtqp42jO8+A23nm4z+KCV7CrJA1w8dvfd0sbGTtTtzUFCWxZ/j
         79zlX21vEln7wZpd4ukmmfdlYZ7Ql2m/M2PLyVo7cQammvkkP+WN3D/mJEsewzNZHaZm
         9ayg9+tBlT/6Wvvma/ey81v3MU0c0dlczjkxBCP4MNIMXKy5epu0wqj8NKkZf3B4FmEo
         xsvW8zgL+dP8JIkWaldZQpSKfC+1xKuq3f29lJymfwQmLJNsR6SIyTDLUArkHqLVSH+U
         T0TbW1OZ0Yl2mGYTISq/I6hN0aDxYUJxHUFUzqtqnlhDLoy7LBlxn3osgynLiIZgrh50
         wCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773302583; x=1773907383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BbjJ+SQCghaY61mjkEDxh0STs+H8xDE7U50HeqsZzCU=;
        b=enrT3dhVVp5JikHPQwanimV/Rkse8qZ0dhbqooAC4A4fTz5v0HRy6BgQiZEzM1TuAA
         HThecN4u7xexLCL2eO/nJwRxv4MqfuUug1wJ1KdiUy0zmFJh5TusD6S3ak/i3+jV2iuA
         oMf8McJi4e47iJr/J/HofpxtDpY6cp9US9L4psaWD7uULgFq5IkBYk19mLB4XmRN2xGB
         qXeTwqVY9UJmPQoGFQ/a3oi3euJwVhPozPUfIe4Z9DtaXBXgDOFNR01cL6etRwP0Gt/k
         i7PvoZhSuMV/gPfqm3lcolIoOXLHFkaBwmmZO048UlL91qUmFaqsDrg7nvftAI/Cs+OG
         aNHg==
X-Forwarded-Encrypted: i=1; AJvYcCWt/rIX5J1+XrzLbG9oYg70MH5mZN6VmjKRwvbcoTYfSz6ljy6ULGSTpEWQxg/v1LfDums45999B24=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXPnI+1npVJctn5rP5JpXevw/hZYh8QVLv1P6JLliawvwCyTpK
	shzzotY4rLOj6mtqB5IS1bOmyMlmjQLRqAHt4PQta4PTVPUrhyqNp2VBwNIvm/+0HFcY78hOALJ
	bhSutjZzGyW31yBQmesdC/8jz57iB1Ag=
X-Gm-Gg: ATEYQzw3j/Q6JnkrZonAI+rKBsOqGubdt8B9JRFag/oqImEDUrnX3IEQ5Q3cSYs5+9K
	Ay6I7XzVN9j7EVycJKEZQwKjKqEF/1lJ+JmbgJHypdjF5xoEV4EaPcGJ2AE1hAHzjBRxtt7fAXf
	G0FEYsohThy1HZTgaX3TJjRfN7teQglsTPqaem9IGoAvOlZeBtoNOXZAyE+r7wVgwYQsC9dstG9
	DKNAFW3HCOaKLrTtjhSTwYoWkKvMML+1+REM3y6PhvWqEmYHRpIb4vRsWb0qIcP8urKNBYVqThV
	gt0B4o98
X-Received: by 2002:a05:600c:3551:b0:485:3f1c:d8a4 with SMTP id
 5b1f17b1804b1-4854b0d6c1amr95772455e9.9.1773302582414; Thu, 12 Mar 2026
 01:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306133351.31589-1-clamor95@gmail.com> <20260306133351.31589-3-clamor95@gmail.com>
 <20260307-smiling-coyote-of-economy-317afe@quoll> <CAPVz0n2QXSFnrkLPFVDbUjNAkp2_dTumeXh4EsB11ca0jHEC-g@mail.gmail.com>
 <20260311221115.GA775894-robh@kernel.org>
In-Reply-To: <20260311221115.GA775894-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 12 Mar 2026 10:02:51 +0200
X-Gm-Features: AaiRm50s9En6lGf1tMoouVyxB599AhlUh5nfjiGhsXtzzsxYNq4Fz7mN4wRsVQQ
Message-ID: <CAPVz0n3pFzWUV7g_AcigRDSQJP4Hr6Ya=M_Zi+538XczR4ahtQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-binding: pinctrl: pinctrl-max77620: convert to
 DT schema
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6175-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 06CC826E93D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D1=87=D1=82, 12 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 00:11 Rob =
Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Mar 07, 2026 at 03:30:21PM +0200, Svyatoslav Ryhel wrote:
> > =D1=81=D0=B1, 7 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 14:48 K=
rzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Fri, Mar 06, 2026 at 03:33:47PM +0200, Svyatoslav Ryhel wrote:
> > > > Convert pinctrl-max77620 devicetree bindings for the MAX77620 PMIC =
from
> > > > TXT to YAML format. This patch does not change any functionality; t=
he
> > > > bindings remain the same.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../pinctrl/maxim,max77620-pinctrl.yaml       |  97 +++++++++++++
> > > >  .../bindings/pinctrl/pinctrl-max77620.txt     | 127 --------------=
----
> > > >  2 files changed, 97 insertions(+), 127 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/maxim=
,max77620-pinctrl.yaml
> > > >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinct=
rl-max77620.txt
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/maxim,max776=
20-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-=
pinctrl.yaml
> > > > new file mode 100644
> > > > index 000000000000..7364a8bdd7d3
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinc=
trl.yaml
> > > > @@ -0,0 +1,97 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/pinctrl/maxim,max77620-pinctrl.=
yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Pinmux controller function for Maxim MAX77620 Power managem=
ent IC
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +description:
> > > > +  Device has 8 GPIO pins which can be configured as GPIO as well a=
s the
> > > > +  special IO functions.
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/pinctrl/pincfg-node.yaml
> > > > +  - $ref: /schemas/pinctrl/pinmux-node.yaml
> > > > +
> > > > +patternProperties:
> > > > +  "^(pin_gpio|gpio)[0-7_]+$":
> > >
> > > Underscores are not allowed in general, so pattern needs fixes. Does
> > > anything actually rely on this name? Is this ABI? I don't see old
> > > binding and driver using the name, thus this should be just ^pin-[0-7=
]$
> > > (+ is also not correct if you have max 8 gpios)
> > >
> >
> > Old txt schema uses pin_gpio[0-7] hence it is here, but greping trees
> > did not reveal use of pin_gpio so it may be dropped.
> >
> > No this is not ABI, name may be any. Including gpio0-1-2-3, gpio2-4
> > etc which is why + is there. or maybe you know better way to cover
> > those names?
> >
> > There are device trees which use gpio5_6 with the underscore
> > (tegra210-smaug.dts; tegra210-p2894.dtsi for example). Should the
> > schema account for those?
>
> Defining a specific pattern looks like an endorsement of the name. I
> would just do the minimum you need. Something like '^(pin|gpio).' unless
> you have a pinctrl-* property.
>

It does fit nicely. Thank you!

> Rob

