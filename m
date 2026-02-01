Return-Path: <linux-rtc+bounces-5931-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK04B8H7fmk3hwIAu9opvQ
	(envelope-from <linux-rtc+bounces-5931-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 01 Feb 2026 08:07:45 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA07C513A
	for <lists+linux-rtc@lfdr.de>; Sun, 01 Feb 2026 08:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F179F301227C
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Feb 2026 07:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECCD52E54BD;
	Sun,  1 Feb 2026 07:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIY8ZJP3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78462E11C5
	for <linux-rtc@vger.kernel.org>; Sun,  1 Feb 2026 07:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769929643; cv=pass; b=cvklgbEJnlZgqlXNQXnYfVppw7sHE7o0qQlUS05OfrV19iJT1qbVCPKO5O9nca/J79qUfL7SIOqdiXXu20SBnr27f3fRZTIgJMLIgzUOHEeZLXANLX2D8L+UjZDY/Ld5nzSJL5koHHpHGhGef9jSqz6LjY+Y7VGBKQTqrLdwlG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769929643; c=relaxed/simple;
	bh=m43UbkmbLBc3R/MOJSbzoCwEFQ3lxNZqdfln+hRLhHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0BgWjmpYzJTy+7MUFFmP3zYV2816O8YVKhyrg1DfIDFo5sTOAch2VyCQzrMM8LcOPghUHwJh9/J+EatUy7PxsTWbPqKycT7EcKo5jt9esVJ0wHExxK+vUKyKO0nkx/6qU9xzkCFfvBHSltaV7b2W2wBZlil3MqPvbPJa4JasYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIY8ZJP3; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4807068eacbso28369805e9.2
        for <linux-rtc@vger.kernel.org>; Sat, 31 Jan 2026 23:07:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769929639; cv=none;
        d=google.com; s=arc-20240605;
        b=idG2x3MSV7IKPhpo3XCjzquKfq67zLKT7x8t1w2vjy7RmIcP6nBTikoNLUP+4nf2IQ
         tP1dVfgRFyWQWPCEGSYUvMbohNrzl9J2fxyR8fM62cpqHVB1EqjjPnuIZ9pw1zzTGYC0
         GpIldaByjwa3ny6cShp/nOPseXJE+rpnVrIUINyBhzdjWUojz+kLiCj4fz+Vy3CdMBRs
         CNloEH3EBwbxIt9/VsL8q8aXm0LpGloYDHLuHMfaIXko97T+IsKhsOuvcjzjstvgBYjJ
         8uDBkCk9v6jPbZZkiYHKo8lmid6ROqw5JBGG4xtgy9b9vcGeNdzJ88W7PX2ztauFqKVa
         d8aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VgA1XtNopgDhPd28c1FlWpyjNQUNZlwtx4L9F82W03M=;
        fh=feVSUJkYw4Dpr99nqTj5NLwTSS7y/k/lyYokizgUcec=;
        b=OiAwzMTBxddEDZCB0orHYn38qa2RObjVEvqfTJWpasRErLqdksHdY25O/NIheyAxU+
         nIK4bYE3lpA22JLpzyn5qnvaXsIDlD24oCo3Xn0YqZSCElRioJIDBElBy80l7CG83kwf
         yowdPtd436Od/KxeKRZDR006sX3BbbSi/7IrBHZj0RXoDlmYn7ZeqH3pfJMFg2SXPZVv
         zLyAuNFSQV9DRYJ6dx2Qh5POv7abidDp4FKQoYKcxqXAlcNc/664Nyh45bYHmAEujKsk
         7Q0Vv4bDokehalCWWCLtKnfRUTSqjU9Ve+PjvcB01GSbLpVooAks+AYLL04z2XJ/gTDr
         uHkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769929639; x=1770534439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgA1XtNopgDhPd28c1FlWpyjNQUNZlwtx4L9F82W03M=;
        b=jIY8ZJP3nRcpBxAvG6e4g5y/0jzG2yQja7zNQQwx0ztOh3n4P49jiYL9GbTx11wHjD
         hbS0CAjHHYArQfTGirQGaM1u6uNbwpcv7QK0M/Onoq7aQBcS01uHg46DLIVPiRd5oY8u
         1q1UPrgCB9TwrMJ12g73KCeA0d57kCCi6wVONFCAnkHGzYYWF11m8BogQDZGrj4Udn5P
         o9m8EY3WyadvMbmsRKnRC0X6VO72Es9JRQNIxim/MRb/3v91ZTssIO3WD2igXDg6sWP8
         sXGtjy+Oyx7SfzY+Q4pCHPjCqdHkmxBsJndOJQvTagzfa2DQwyBGxnr0eNVC/4UHXSJB
         s+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769929639; x=1770534439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VgA1XtNopgDhPd28c1FlWpyjNQUNZlwtx4L9F82W03M=;
        b=SjJEmr2BQ3Tv2BhdLGiqD9UumdasPatE+9FhP4CD3nnJnibXfWGgw+WDWq5boDtGY/
         7dzQZW2b1069hpHV37r84qpPBms99z2EE02BnyxGG68YJk/co6s5ldGIQlslU8kfhzBf
         fz0mBZJIXU8PR5h2rf/07ruUyq/8x7yLjRUUv4r7bGEHhfqZ4LXGwhoV6hlMdwpWCKuT
         RxeklS4NL+8gkclzNvHqdQridUf5k0UYKwceZgmbbpBZ2VGx4UvzJxCX66hBjrLsZFTh
         mONIrfGnDqts0fpMHYNnBIPuSTZ+WUBexi0niicNwoGnnWOoZO8AzULhAmrmNc2tcPtd
         fb0w==
X-Forwarded-Encrypted: i=1; AJvYcCW1uv5ZNyc2pVJQBhXpBQ/zb2sovjcysr0hPjcpOyGVyiwfvSO7ZzXulv14Fq2X3LuO2wzSBim8Rug=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKzaWW0Ncr7pPdiN8ZKgmKjPlUtnL19JGmY+W3qRLH79vk8aDx
	nFY57aqcTK69/hPx0H0bl46y5vw/z0gzTwX16AWjETEfK9TDBRTgLU1/WgJoDGBgcLgrg+gKdSg
	vCDP9AW8+2rxboj+lFBb1NZQrlpXUsyg=
X-Gm-Gg: AZuq6aIODXzaylmFuXwFLFCa2Ic/9QGquekkeFdZYDOlwYbHCoTX8fNidkfwO4zQzjW
	ynm9WwMavpoothfEEnNQRucsp0h0g/p53hFSAHsmQVzUENNSMiRjnQfFW5ZPYkAwdlG3yVUck3N
	1XhiJLMaO0Lmeans30weAS/TbbEzidZvY8qQYcswB7u/fiIxmT4xnd85rvrnB/CfjORZS+SoD2d
	Jz9p4/OKOaVwsA3SdlexwZffgCiSoVjr/Th7stWJSh2VNFDFDGb4a3unI2LQTafNs4E/sw2
X-Received: by 2002:a05:600c:6092:b0:47a:7fdd:2906 with SMTP id
 5b1f17b1804b1-482db45441fmr96523965e9.12.1769929638889; Sat, 31 Jan 2026
 23:07:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125134302.45958-1-clamor95@gmail.com> <20260125134302.45958-8-clamor95@gmail.com>
 <8bd89524-dfc3-43b0-b0f2-cdb1cd51e1ac@baylibre.com>
In-Reply-To: <8bd89524-dfc3-43b0-b0f2-cdb1cd51e1ac@baylibre.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 1 Feb 2026 09:07:07 +0200
X-Gm-Features: AZwV_QgiEH1CnR4Y5eJqYT3-6LdT1ghmK5ngGD3UdwSwjKt6ss6U4z-A2BxtD6Q
Message-ID: <CAPVz0n25ukBJ6=hmmR9nd4MBoPkHaHQ+ZHMXYxghYZdkB28_sg@mail.gmail.com>
Subject: Re: [PATCH v1 07/10] dt-bindings: input: cpcap-pwrbutton: convert to schema
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Dixit Parmar <dixitparmar19@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5931-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,analog.com,gmail.com,bootlin.com,atomide.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,mail.gmail.com:mid,baylibre.com:email]
X-Rspamd-Queue-Id: 7CA07C513A
X-Rspamd-Action: no action

=D1=81=D0=B1, 31 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 22:02 Davi=
d Lechner <dlechner@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 1/25/26 7:42 AM, Svyatoslav Ryhel wrote:
> > Convert power button devicetree bindings for the Motorola CPCAP MFD fro=
m
> > TXT to YAML format. This patch does not change any functionality; the
> > bindings remain the same.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/input/cpcap-pwrbutton.txt        | 20 ------------
> >  .../input/motorola,cpcap-pwrbutton.yaml       | 32 +++++++++++++++++++
> >  2 files changed, 32 insertions(+), 20 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbu=
tton.txt
> >  create mode 100644 Documentation/devicetree/bindings/input/motorola,cp=
cap-pwrbutton.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.tx=
t b/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
> > deleted file mode 100644
> > index 0dd0076daf71..000000000000
> > --- a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -Motorola CPCAP on key
> > -
> > -This module is part of the CPCAP. For more details about the whole
> > -chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
> > -
> > -This module provides a simple power button event via an Interrupt.
> > -
> > -Required properties:
> > -- compatible: should be one of the following
> > -   - "motorola,cpcap-pwrbutton"
> > -- interrupts: irq specifier for CPCAP's ON IRQ
> > -
> > -Example:
> > -
> > -&cpcap {
> > -     cpcap_pwrbutton: pwrbutton {
> > -             compatible =3D "motorola,cpcap-pwrbutton";
> > -             interrupts =3D <23 IRQ_TYPE_NONE>;
> > -     };
> > -};
> > diff --git a/Documentation/devicetree/bindings/input/motorola,cpcap-pwr=
button.yaml b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbut=
ton.yaml
> > new file mode 100644
> > index 000000000000..643f6b2b1f13
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.=
yaml
> > @@ -0,0 +1,32 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/motorola,cpcap-pwrbutton.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Motorola CPCAP PMIC power key
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description:
> > +  This module is part of the Motorola CPCAP MFD device. For more detai=
ls
> > +  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. The
> > +  power key is represented as a sub-node of the PMIC node on the devic=
e
> > +  tree.
> > +
> > +properties:
> > +  compatible:
> > +    const: motorola,cpcap-pwrbutton
> > +
> > +  interrupts:
> > +    minItems: 1
>
> Should this be maxItems: 1?
>
> > +    description: CPCAP's ON interrupt
>
> Or I suppose:
>
>   items:
>     - description: ...
>

Both options are perfectly fine for me, and I lean towards using
"items: desc" but I would like to hear what schema maintainers would
say, which layout is preferred in this case.

>
> > +
> > +required:
> > +  - compatible
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
>
> example: ...
>
> > +...
>

