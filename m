Return-Path: <linux-rtc+bounces-5893-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNXgBmc+d2mMdQEAu9opvQ
	(envelope-from <linux-rtc+bounces-5893-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 11:13:59 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAE886830
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 11:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 111963003376
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 10:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B5F32ED50;
	Mon, 26 Jan 2026 10:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elnDSJUZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB8E32E72B
	for <linux-rtc@vger.kernel.org>; Mon, 26 Jan 2026 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422434; cv=pass; b=Ca4S9noO0u/nLCrNujGw/Z9t+txzk82WwB8nIyXAiBuwNg6hkvR8b8Q7VNM3i+DvUMDzDIrJUxQYG7HC2B4hZcB2pvyIfuUCU8pkqDf0TD8pFNWvYZ3gyjyEaVPgeI0JZFIuYYfgGYqZFSwwY+oL0dqcAjlRGObpEHJaAcvozVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422434; c=relaxed/simple;
	bh=wy+avasr22mgfIucIYeDtvO+JIZdj7VULkHTn3GuJCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U60zlt1+G/5JNU+WwS0qsxDbJvlAUnr5G2eLbgKGl1045K5PHbaBvieFPESc7jfM5RUj35BdZVlwOYqV8tPBM2AyFeJZcWKdlZyCbqMMPHFYhScw0jIjHv2fiei8sZOZAzxhvIxUhJLmFoJMwsBDLIMDRHBT+BciY85DZhe1UMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elnDSJUZ; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so4456399f8f.2
        for <linux-rtc@vger.kernel.org>; Mon, 26 Jan 2026 02:13:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769422431; cv=none;
        d=google.com; s=arc-20240605;
        b=QNRXA3epmfC3ZKpmmJv4FoA7ArsFnbXGfNzIKj3OL4RMdXRNJPBmHDbbmL+3sokRtP
         SNgY13vMzOhtFzyPBX9efseIwDiEU4L6Zyg2zt0gdq4f+91yNQYd7CvB9f9qpQta9FWy
         ExtJhYSXumXdPkEGRr3DqFMmWP6/0g8kT71YWpBdPhbpj4bZmvfqonqIwjKWnbFzmwPo
         iqjHKoVyoYqe5s3T2m4ktguuVbtCgHdH5u3SMQ1yLlj8eTTOZxbNPNBEIX7xv6GKDwii
         YYYjZqdRTdM//+DITpNbR0XrOFQhwwvOWoWBAjUXyemd0/5oO9wfu3CZGj8j1rTf7gjH
         bcdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/9dTPcMDWhfJ1rIvjDmwY/itS6IYJkkuuHjxU9ulEjk=;
        fh=JPuKta2+Xq0oeQz6o+XnFCSOsqIhK409cRS/zwGfrEc=;
        b=iSNk/FyCCkLHsdv14n6voG15+d7VSiErWZH17igMDTpBcBvvOwfo+2Y8An5qd7LdKp
         4Gi77/Irja8R0XrrvugLbCT0nRMFXrpSLosXZpwThwZlgTkkodBIQGpY6bGP61Ua1IUR
         cKFI6VhmHzClFRyzzRG/zIhaGAdTrlIne0lLsQU+gxIDq/vVoH1j14T2H+O8zVYGV2Q3
         Erv2o95mHEeqias4Zo8MNCNF7o3tePtBvFzM4ZYLRpdVR5jvEHasSsnO7iV5r3LzHIu3
         d3UgV2rUdwFJadlhmNAj5R6eOGgKxaPWZ8kEcGSWLllZ0Tp+lYeIxP9UC9j4X3sghsd4
         fCMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769422431; x=1770027231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9dTPcMDWhfJ1rIvjDmwY/itS6IYJkkuuHjxU9ulEjk=;
        b=elnDSJUZbStbMHWx0dcASZueczLi03SuEJsFL7IWU8wcbnx3DTXbep8uw9YePkzG2a
         MuTQuJRp/opoXbEc0fjd7uRRwemI0apD/kQ8c0wMbhLFwNAl3QHaQWkRhCuYsWR/Xb3p
         aP9cV+le9oVbyg+/15e3VGrLhAQTu2syytcHTQZDHblerrvvYDDdTadSDkScRiZK+FpT
         6j0+uLvSRF6LiCa0AdzaS0s/fRZyF0mMfjv0l6b+i2yZ2+GV5ADc6nxa9nYTAd0NT1ob
         Ho5mTEI/Eb6UPZPt/8nmr9avjBraCnrEeoInuVfPXtgeJOzB5zIK1IkAaebXI3vry6hh
         0J4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422431; x=1770027231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/9dTPcMDWhfJ1rIvjDmwY/itS6IYJkkuuHjxU9ulEjk=;
        b=FoEu4nCQM4vLd0XpEOjLIILQiPRffGpKNj979sF+n1tYjMwxp2BBHbqG5tgXwHGr0J
         bGEo1UPyhxYs0vZkhOoo7bAjEUqK7c9u4E4PKIncx2ixhDh2FJJMsWoDAphFMZTYBPpD
         L+KvRMdrxSBq4gj5dBKwmi393TTwfMDhuixvf+HRyS8L+0XMF7QlsTTy1fpI7D1xa9ab
         yDA9QtTEzQLsA7HtOEK0i62druSpGyxPjH5+cgb1VlMsLgHGWE5TbdjMNz3wDPGxCSH3
         na3M6jntQF6VEi8Lv5yjTTKN8eouQ0U1QI6r98Ou+pdpz31QuA7lUx7jaxqGQJdFYagb
         yZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbcB4263QPS3MMjGRWSoi+VwDT2iXi4/0694e9ItqL7XN9KyRlNjUQBeXo96XIiASAqjPhnMxZsV4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6F06TXrLW0CuvvRMytsavg7B4alxEZFAF3JiuvyCujILyW0t5
	wxNS9ABopznE0wMrreUPMg0AtbuaLUzRF4hIFe3VJeqGh7EHvu+A4bemA1QtHmLot9ZJZVINRa8
	noc+vlgFM2kdZu3gsArClaHVb25adzUU=
X-Gm-Gg: AZuq6aLtNkhvS7BE1sOjE2s0GDOG0cl5UHAb+HtCuW7Tr/VnplMFtLfLTzBJgmxwG3O
	eUaECW0eA7pwfx/0TLV8fTKvtDpz7FDmvob+UuPbZR2ERd06YTPEIl2UC5+lbxB8pMdLd7AdETC
	0kfIlQNrrrilbX+MyYatKXJiqRMAO7qgk3wMd5V5mO2ANLqAsV/MBFi5+dm7+2PfKFC04TBdarp
	WIOqisnu989A5k6llGA8jDZr/mlpSIHmQur2xqoU+xP5QJfkHar3b+jykrZ++M9Z8jOLIOc
X-Received: by 2002:a05:6000:3109:b0:435:a464:f468 with SMTP id
 ffacd0b85a97d-435ca1b0a8amr6471509f8f.47.1769422431344; Mon, 26 Jan 2026
 02:13:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125134302.45958-1-clamor95@gmail.com> <20260125134302.45958-3-clamor95@gmail.com>
 <aXc9n_gc7TEFvNA8@smile.fi.intel.com>
In-Reply-To: <aXc9n_gc7TEFvNA8@smile.fi.intel.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 26 Jan 2026 12:13:39 +0200
X-Gm-Features: AZwV_QgQiSXyGE1Y1qrMc2HU_ThQY8l_CasgZEnx0m0QabZgNO42haOxvzkombQ
Message-ID: <CAPVz0n0MM6OcjOWnNBaGk=6eYcb09P0XBFDn+MYHtXXcgkcvQQ@mail.gmail.com>
Subject: Re: [PATCH v1 02/10] regulator: cpcap-regulator: add support for Mot regulators
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5893-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,bootlin.com,atomide.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AEAE886830
X-Rspamd-Action: no action

=D0=BF=D0=BD, 26 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 12:10 Andy=
 Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Jan 25, 2026 at 03:42:54PM +0200, Svyatoslav Ryhel wrote:
> > Add support for regulator set used in Motorola Mot board, used as a bas=
e
> > for Atrix 4G and Droid X2 smartphones.
>
> ...
>
> > +static const unsigned int sw_mot_val_tbl[] =3D  { 600000, 612500, 6250=
00,
> > +                                             637500, 650000, 662500,
> > +                                             675000, 687500, 700000,
> > +                                             712500, 725000, 737500,
> > +                                             750000, 762500, 775000,
> > +                                             787500, 800000, 812500,
> > +                                             825000, 837500, 850000,
> > +                                             862500, 875000, 887500,
> > +                                             900000, 912500, 925000,
> > +                                             937500, 950000, 962500,
> > +                                             975000, 987500, 1000000,
> > +                                             1012500, 1025000, 1037500=
,
> > +                                             1050000, 1062500, 1075000=
,
> > +                                             1087500, 1100000, 1112500=
,
> > +                                             1125000, 1137500, 1150000=
,
> > +                                             1162500, 1175000, 1187500=
,
> > +                                             1200000, 1212500, 1225000=
,
> > +                                             1237500, 1250000, 1262500=
,
> > +                                             1275000, 1287500, 1300000=
,
> > +                                             1312500, 1325000, 1337500=
,
> > +                                             1350000, 1362500, 1375000=
,
> > +                                             1387500, 1400000, 1412500=
,
> > +                                             1425000, 1437500, 1450000=
,
> > +                                             1462500, 1475000, };
>
> What a style! (Yeah, I see it's being used elsewhere here...)
>

I have just made it in same way the other tables present in here.

> ...
>
> > +     CPCAP_REG(VAUDIO, CPCAP_REG_VAUDIOC, CPCAP_REG_ASSIGN4,
> > +               CPCAP_BIT_VAUDIO_SEL, vaudio_val_tbl,
> > +               0x16, 0x1, 0x5, 0, 0),
>
> > +     { /* sentinel */ },
>
> No trailing comma for sentinel.
>

noted

> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

