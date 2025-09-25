Return-Path: <linux-rtc+bounces-5026-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A23BA1A62
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Sep 2025 23:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B50A564A11
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Sep 2025 21:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517B5322766;
	Thu, 25 Sep 2025 21:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qj/IjYuX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDE6322536
	for <linux-rtc@vger.kernel.org>; Thu, 25 Sep 2025 21:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758836617; cv=none; b=GOOZYs6A1eZJAhKulIw+jpriuqxLD8OZHEFeLyeSYv/BIJkMeenapFAQXa+HsJ1YaOAoz4eX0LyFi3qbsvGVPjQeF2Yz2xoQ01IdYMG4dQVbMnJvKY2OZKymv6Dfc07bceKQZ9Hg1X6TiT/xJQixOHQCr6hKm/EpULvNoRTcQMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758836617; c=relaxed/simple;
	bh=TJ16OtksRGCK7Zaq7zAHkC37DGIRAMtba+MXYoDW2iA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=St4ryEdCtQIQwG3TKCey3o3YRf4S5DNLca9bgmn6YQvJ0Y245rOmukJNrfGhqaruzj0wFpsN7tmPBbYH+x+yvMG1yWsTB5pZg1QhhOz/i10UmfPQ50Z7DEd4GGMsjgN/5R+97QpWYx2NnuZ0g7RTk9swQZvfCYA/fG4739DhrH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qj/IjYuX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDFFC113CF
	for <linux-rtc@vger.kernel.org>; Thu, 25 Sep 2025 21:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758836616;
	bh=TJ16OtksRGCK7Zaq7zAHkC37DGIRAMtba+MXYoDW2iA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qj/IjYuXUiGKlzf5TAUDELCQ4fH0sHVxKdTQiF/ytNkHP8ruW9ZdAhJBHU6G5VCfo
	 KCTiXMBDASTfeCWjoxJnJjSzCRnPUGgYhe4HXYwE1uzbi04813xAhHe52jVQD1HcwJ
	 dFJ0sv1X0N2nGmgD53Ap5ubxt0cL5dmwk/tHOimXOmXY9O8VdnOMGaivjbcpIi4bpt
	 MooKv+ed4xAkgTGcH103MFqwOxApGqPAhVzCF8fGSoxnKD1mSZQ6l6S11RV1cY8M1q
	 Y6RaqX1n0bYxlpMZBInsUYufDEJ6GQtDUlIhoAli8BLK1qqItlF1tehKBXSWtEJ0p9
	 lcdSXkoH5gwEQ==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62fbc90e6f6so2221234a12.3
        for <linux-rtc@vger.kernel.org>; Thu, 25 Sep 2025 14:43:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVS2Q9GHt/2PppXnaHypNkp/Mdl2Bk8cvLDspExOjoE2epAlHxjRvirRLePYY1F8zBEGdAW3hF+Tw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2IOPkia5vOJO3aOrEGfL4A4to27gYT+muEcvhg6Ch3FzGlPaI
	2tGg2RD1UCMl0KjgQC5Aa7t2w/YPyMH2E0/D0fKoftGaIjkxr3sIyVL96pZE5uMjQrXfbk6uk9B
	icCwK/asF5SaSydWT39MJj/t52z9eXw==
X-Google-Smtp-Source: AGHT+IFmBy3JjHkNR0N57qjvw9kAWYt/wRLGZueKtaKvROWm4D/h/tqXxOmVgeAkz5iuD6R7VRhJ0fVUkEbgu7H38rw=
X-Received: by 2002:a05:6402:682:b0:62f:5424:7371 with SMTP id
 4fb4d7f45d1cf-6349f9cc038mr3172814a12.8.1758836615417; Thu, 25 Sep 2025
 14:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250827-macsmc-subdevs-v2-2-ce5e99d54c28@gmail.com> <20250829164057.GA976361-robh@kernel.org>
 <20250925204925.GA637503@robin.jannau.net>
In-Reply-To: <20250925204925.GA637503@robin.jannau.net>
From: Rob Herring <robh@kernel.org>
Date: Thu, 25 Sep 2025 16:43:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK-9n3_H6vS80bZuZiSPi9UNuMzHEPFL_EzYTeyNS1cYg@mail.gmail.com>
X-Gm-Features: AS18NWBo7dNaKxAu5ak_ciYzqjTskfLTXRAexsnPq6bwBMAHQaTN43F9iZdY5xc
Message-ID: <CAL_JsqK-9n3_H6vS80bZuZiSPi9UNuMzHEPFL_EzYTeyNS1cYg@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
To: Janne Grunau <j@jannau.net>
Cc: James Calligeros <jcalligeros99@gmail.com>, Sven Peter <sven@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 3:49=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
>
> On Fri, Aug 29, 2025 at 11:40:57AM -0500, Rob Herring wrote:
> > On Wed, Aug 27, 2025 at 09:22:36PM +1000, James Calligeros wrote:
> > > Apple Silicon devices integrate a vast array of sensors, monitoring
> > > current, power, temperature, and voltage across almost every part of
> > > the system. The sensors themselves are all connected to the System
> > > Management Controller (SMC). The SMC firmware exposes the data
> > > reported by these sensors via its standard FourCC-based key-value
> > > API. The SMC is also responsible for monitoring and controlling any
> > > fans connected to the system, exposing them in the same way.
> > >
> > > For reasons known only to Apple, each device exposes its sensors with
> > > an almost totally unique set of keys. This is true even for devices
> > > which share an SoC. An M1 Mac mini, for example, will report its core
> > > temperatures on different keys to an M1 MacBook Pro. Worse still, the
> > > SMC does not provide a way to enumerate the available keys at runtime=
,
> > > nor do the keys follow any sort of reasonable or consistent naming
> > > rules that could be used to deduce their purpose. We must therefore
> > > know which keys are present on any given device, and which function
> > > they serve, ahead of time.
> > >
> > > Add a schema so that we can describe the available sensors for a give=
n
> > > Apple Silicon device in the Devicetree.
> > >
> > > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > > ---
> > >  .../bindings/hwmon/apple,smc-hwmon.yaml  | 132 +++++++++++++++++++++=
++++
> > >  .../bindings/mfd/apple,smc.yaml          |  36 +++++++
> > >  MAINTAINERS                              |   1 +
> > >  3 files changed, 169 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.=
yaml b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..08cc4f55f3a41ca8b3b42=
8088f96240266fa42e8
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
> > > @@ -0,0 +1,132 @@
> >
> > This should be something like this:
> >
> > "^current-[A-Za-z0-9]{4}$":
> >   $ref: "#/$defs/sensor"
> >   unevaluatedProperties: false
> >
> > With the $defs/sensor being:
> >
> > $defs:
> >   sensor:
> >     type: object
> >
> >     properties:
> >       apple,key-id:
> >         $ref: /schemas/types.yaml#/definitions/string
> >         pattern: "^[A-Za-z0-9]{4}$"
> >         description:
> >           The SMC FourCC key of the desired sensor. Must match the
> >           node's suffix.
> >
> >       label:
> >         description: Human-readable name for the sensor
> >
> >     required:
> >       - apple,key-id
> >       - label
> >
> > Though in general, 'label' should never be required being just for huma=
n
> > convenience.
>
> That does not sound as it would be compatible with skipping nodes in the
> driver if the node misses label. The driver could of course fall back
> to create a hwmon sensors without labels.

The driver absolutely should.

> I looks to me it would be a
> stretch to call the presence of the labels human convenience.

Then it is an abuse of 'label". "label" is supposed to be literally
that. Matching a sticker on a port of a device.

If you need to associate a sensor with some other piece of h/w, then
that should be via a phandle or something.

Rob

