Return-Path: <linux-rtc+bounces-6727-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fW0zCvikOmobCggAu9opvQ
	(envelope-from <linux-rtc+bounces-6727-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jun 2026 17:23:36 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C476B8449
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jun 2026 17:23:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Hki6YJhi;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6727-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6727-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A1AB303B5BC
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jun 2026 15:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09AA3D891C;
	Tue, 23 Jun 2026 15:23:33 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59FD3D8901
	for <linux-rtc@vger.kernel.org>; Tue, 23 Jun 2026 15:23:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782228213; cv=none; b=E/iBbg2BREkd4d6306NxEAsjShiTcqh9Z6z4DL9YSxsI0xzWw8lgxR2neAlGBDHGrE3hYnTKxFhZPE620ge4kZMslSfbUde91I4bxr2fzgbdyva/RfgGoYVr6ftR6rfEunEgizInbMsS6itELQk2VFN6N0FZvW1fjTZKwssscUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782228213; c=relaxed/simple;
	bh=4p9ogReYCHAd+egcOA36NoDqlwt3YUJ5zaJ9i2O5URQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J3mcwrrnpbfi0WooHtBsQgS3Vcv6A5emrf0RW+7ClLI5r393ZPUpi65MpkwT8zTU9vc9ulwF+O8svtOarlHA12vAocm7dbMVNWng1sWOWVx35lMexg06m6P1H1tJTKV9s/mOtBaIdY3CuG+AWwyypjLxzV3Dncj3h07li6WueeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hki6YJhi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F511F00AC4
	for <linux-rtc@vger.kernel.org>; Tue, 23 Jun 2026 15:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782228212;
	bh=KTQndh5EWhkqDmZmwB0OKhZyQvnI7PXjv9A+hnMrJew=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Hki6YJhi28GASZHqwwCkhhXl3skcmPrBO9cxVQXJyt0GTu8NZ3ld1tHZV5uAcHFrH
	 PBW1IT/3SPjJIdgE2Abt3y4ywURZuNjtb3VwUBL1SEspfjUbA0nXXQqEg1Ip4ZBqh0
	 VTmcZdEqRm9JiqF6perVrk8acOQwPQD/FfluKIP7zylSA5m/8Rl6cgztYYOVAntNbG
	 VlZeBMLZzRhgCGFx6SbhVvCcy1Enre6GVOSAgVTiAJmwfYpTT4gGBxf+2aUAjMftL3
	 BOJhy1bkUBgq9V7aoF/qhk3JiEY4wrGGEYhWW/xa9KFgXm/2jkYd3eB/CZ6LL1+jBY
	 Fm13Neg9+4MZQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-396775c2720so54156421fa.2
        for <linux-rtc@vger.kernel.org>; Tue, 23 Jun 2026 08:23:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8uE2/GUTrMq+Sjiard29HsK5p2P69qx03f5sIDOmrZHRHeGV3ZHIxKPpX51Dr1sPsIIQzlugIB0SM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfUOR7MWlqIE2VIbcStfNzimlt3ZFk3qc8QSmD7Vr8doFjwhTi
	ZA1S1qtpkjGWCelGZ95bY4BvA/YOOHisvbdKcqwaDqhQy0yr4jah5rRFcFu+urNYofUS4AhZao7
	uhBPTUI1Eof3iKjYDxi187YLS1+2Fci4=
X-Received: by 2002:a05:6512:4388:b0:5a8:86a8:2e09 with SMTP id
 2adb3069b0e04-5ae3616553amr944685e87.7.1782228210964; Tue, 23 Jun 2026
 08:23:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
 <20260121-a733-rtc-v1-7-d359437f23a7@pigmoral.tech> <CAGb2v64euL+QNXiJdTn0JygYLXg0WoguPSprKT4sKGZGVZbwug@mail.gmail.com>
 <1jv7bjd6wi.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jv7bjd6wi.fsf@starbuckisacylon.baylibre.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 23 Jun 2026 23:23:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v67eqHz3LxyLwk2_+RR_ucc8hxBLfk=iLcSN3hdsnsmPXQ@mail.gmail.com>
X-Gm-Features: AVVi8Cd45Q12_JEAbrGeRNR4K9bnBVwQtAKYrj4bVtPHJ3Sm3pX_iR5U5sy4IUU
Message-ID: <CAGb2v67eqHz3LxyLwk2_+RR_ucc8hxBLfk=iLcSN3hdsnsmPXQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] clk: sunxi-ng: Add Allwinner A733 RTC CCU support
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6727-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbrunet@baylibre.com,m:junhui.liu@pigmoral.tech,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mripard@kernel.org,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:andre.przywara@arm.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[wens@kernel.org,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[pigmoral.tech,baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-rtc@vger.kernel.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,baylibre.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79C476B8449

On Tue, Jun 16, 2026 at 1:56=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> On sam. 28 mars 2026 at 22:41, Chen-Yu Tsai <wens@kernel.org> wrote:
>
> > On Wed, Jan 21, 2026 at 7:04=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral=
.tech> wrote:
> >>
> >> Add support for the internal CCU found in the RTC module of the Allwin=
ner
> >> A733 SoC. While the basic 16MHz (IOSC) and 32kHz logic remains compati=
ble
> >> with older SoCs like the sun6i, the A733 introduces several new featur=
es.
> >>
> >> The A733 RTC CCU supports choosing one of three external crystal
> >> frequencies: 19.2MHz, 24MHz, and 26MHz. It features hardware detection
> >> logic to automatically identify the frequency used on the board and
> >> exports this DCXO signal as the "hosc" clock.
> >>
> >> Furthermore, the driver implements logic to derive a 32kHz reference
> >> from the HOSC. This is achieved through a muxed clock path using fixed
> >> pre-dividers to normalize the different crystal frequencies to ~32kHz.
> >
> > Have you tested whether the actually normalizes the frequency, i.e.
> > selects a different divider based on the DCXO frequency? Otherwise
> > we're just lying about the frequency.
> >
> >> This path reuses the same hardware mux registers as the HOSC clock.
> >>
> >> Additionally, this CCU provides several gate clocks for specific
> >> peripherals, including SerDes, HDMI, and UFS. The driver is implemente=
d
> >> as an auxiliary driver to be bound to the sun6i-rtc driver.
> >>
> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> >> ---
>
> [...]
>
> >> +};
> >> +
> >> +static const struct clk_parent_data hosc_parents[] =3D {
> >> +       { .fw_name =3D "osc24M" },
> >> +       { .fw_name =3D "osc19M" },
> >> +       { .fw_name =3D "osc26M" },
> >> +       { .fw_name =3D "osc24M" },
> >> +};
> >
> > As mentioned in my reply to the binding, this is wrong. There is only
> > one input.
> >
> > The most you can do is check the rate of the parent clock against the
> > detected one, and _scream_ that the DT is wrong. And maybe override
> > the reported frequency.
> >
> > If you want to do the latter, you could add a new fixed rate gated
> > clock type to our library. You would fill in the rate before the
> > clocks get registered. I probably wouldn't go that far. We want people
> > to have correct hardware descriptions.
> >
> > Funnily enough Allwinner's BSP actually implements a fixed rate gate
> > for the next 24M-to-32k divider clock.
>
> What about implementing the register bellow as a read-only (and
> non-cached) divider using the factors provided by Junhui ? That would be
> an accurate description of the HW I think.
>
> The oscillator gets set in DT and if the output reported past the
> divider is not 32728Hz, you know you've got a problem (bad DT or HW gone
> bad)
>
> With a fixed-rate gate, you may actually end up lying about what
> actually happen, if the HW does not behave as expected.
>
> Do you prefer a fixed-rate gate still or should I try the RO divider
> approach ?

I think either one would work. The RO divider is probably more accurate.

Sorry for the late reply.


ChenYu

