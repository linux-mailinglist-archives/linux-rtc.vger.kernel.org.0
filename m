Return-Path: <linux-rtc+bounces-4733-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61602B2CFD9
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Aug 2025 01:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08547188645D
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 23:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16495254864;
	Tue, 19 Aug 2025 23:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6jwqxZr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A7721ADDB;
	Tue, 19 Aug 2025 23:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755645767; cv=none; b=fD+oGFPGVy1noHcdfUHzi57IeYro4kOHrk20svFeHYT1DkH0WtevHZYkQTv+34/PbPZOrzTTZKXIISfr922r6L/uLl/W0PScVHDq9+Ag+K6wmMsKAwLQWgmxM1JdL474zeHE9x301aH/igQqbXrqWJcKOoZcTbcyHCH2DOtdZkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755645767; c=relaxed/simple;
	bh=9jkN28NHaaCVj6JDzv6Hw14M+7ThWCQNtbL0G3psptQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GqZGdCbOGG58l7fwDFyN9kw7u8h77UVeRo00KQw9lIm8Q20NQYYNc2TwX1X4sVjJjP1ihEygXxLFncj87mg4alYUVCXzEFkdgtYTC9L1DMh46XpzSkJsBpNZ0BRQSDzszvOa5WIpKybFy7ZDyMqinrzbTSfusATYv59N7rmkdlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6jwqxZr; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b113500aebso41323261cf.0;
        Tue, 19 Aug 2025 16:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755645765; x=1756250565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K422/Y/9yj8ALHij9Y1sYg9rSj8Y/+PMz3oGCIVOfdw=;
        b=K6jwqxZrjaNrV+uHBKktGJCBlWeVDkE9vuEcr4AwUleV0IRC06Ddr6HogdqXnfv4Jq
         ecxHsT0aiNhXzZVTREofbQUOJIo8L36pejQ6DKDMTapvc8zCqxZ+zIa0ZfsUYwoGTT0E
         RJVv9aomnQXn69zBeTpKwpHKKtk8jyEfthY9OMuyeSZMGA5y/BYOMwG1v4ma0UIjRIi2
         vvUW0pPxrLH+7itfGNyQzH43DWmzzwvsd85+nSf1g/Y8Uqa2SJzw4F/o9eGoJ8g/+ZjN
         1vuMDcr34y5RwRDNmoObPZI1UpVsZ4i6UoY3Ffqbgo35+QNNsFzrl4lzcq1YA1QH0/Ax
         58lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755645765; x=1756250565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K422/Y/9yj8ALHij9Y1sYg9rSj8Y/+PMz3oGCIVOfdw=;
        b=aNVp09vXH3PcIUpVBbKtRJydXpJFjHng/ZUJJ74Ag/kkpEeUjkL/VIald4lze+NGrY
         fbn8Qv8t1Y91TejNJQriKfSSdA0H1+PhjmKVWihjnSlrYS4mRjQ0b9aKNksLqKr7yYLB
         twTxmZSP8PAN78MJ/1niMwszmXjMd0jyuTrW4jE0f79ByPzqOI7fHUb3OZjr5ZH5KQFl
         jzctl027YeDX1e3FHYzHC6sjweXOxGBw3sY4HJ3KTRn2yYEXBE016uSlfxl05mYfxcW6
         NfVzJl39wrFzJngenrlYu+28szTmbFiJSZ3ijgcUkaxyl0/Drp2eIey3Ve0g/Iq4JiiZ
         w6Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUwcVvb2kU3H+RdRGbdGqeyzo8MZauNKpvOBxpjgKvROj507u5I6jmcmq/nkYUEUc+o+f3U/73KGawqfe0=@vger.kernel.org, AJvYcCWHhhxSDr8DEVTUxMoPILoL0J6c6OmhBRFm3z+8RGnQ0cMQf0lHg66H14ZwVshm7bRiEwvnXeSbZ+PMGjY=@vger.kernel.org, AJvYcCWi6Q92YMPLLKIQ3FIk+DXCwmaXWfbFDjJ/gjbqDYAzoJyqEOQQdKZFpR7fux2BuBf+azaih7HwM2p6e7eT@vger.kernel.org, AJvYcCXEogQ0mNVzVVUEm6QMhnRYVA9WwrZobbYHgLGA7kfaoMO4Fq0Ax0T1qPEB4S/qzOqcjwpPrP/mDt7l@vger.kernel.org, AJvYcCXirtnkJ0ImEVcv2YIKUgRRU+5ETRQm9l68d577PWDE0x+9xoxwvajhIQgdnXTin0TLNZ7fUgAKlf+x@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+8sDQ/Ba2YfemplplzHQfXCqfRtBdTqf+4KKynjMwnOMOnsIv
	z0h9ENDGB8b3DmG9g0PXwqhtmSyCxgXo+hPrVcu+qyYrr3jPF/zdhllAkWUSv0foOxsyPFqoLyk
	WHjedqm4W9B/i5VSF6ypwHPrcKwzc2Lc=
X-Gm-Gg: ASbGncty9S4gXksULV1q2YjFUfAu7LcPwuGtlM7JCiph/l6eAzkqWd/ts7Sg2tll3/Y
	C9rN05BbWplDcsQ75A4QOg+nmTZV3DQ0p5/w4dUUTJSr5Gwx8g1XpcnEQgR2yamSDm5vQMetVmy
	j9nr6kfTT0TJLXqDNwMefDX41vQLQuCSjdeun8qD7ukOB5XNcCki4kWVN0d1N8aoeZggqMTYg2q
	2zaw03MxNcP4WC5
X-Google-Smtp-Source: AGHT+IHJre8AvfYFwM+tKjlP1D/tcobYVeLPY4jalmq308RktLJB1oePkAuJ7BQTBO7wQ2idbBiWEq+aIlj4VxZBRRo=
X-Received: by 2002:a05:622a:304:b0:4b2:8ac4:ef61 with SMTP id
 d75a77b69052e-4b291c0a095mr9690251cf.68.1755645765106; Tue, 19 Aug 2025
 16:22:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-2-57df6c3e5f19@gmail.com> <20250819201537.GA1223169-robh@kernel.org>
In-Reply-To: <20250819201537.GA1223169-robh@kernel.org>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 20 Aug 2025 09:22:26 +1000
X-Gm-Features: Ac12FXy5USWNvk81C09AV_y_m0PHlKCGlBXsRbqwyr8NREPpK7i0eE4MCUv2BBE
Message-ID: <CAHgNfTw+wetmZzvPgkANpmSD4b6k0785QZLpBVD9FMqNDnq2EQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: hwmon: add Apple System Management
 Controller hwmon schema
To: Rob Herring <robh@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Wed, Aug 20, 2025 at 6:15=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Aug 19, 2025 at 09:47:54PM +1000, James Calligeros wrote:
> > Apple Silicon devices integrate a vast array of sensors, monitoring
> > current, power, temperature, and voltage across almost every part of
> > the system. The sensors themselves are all connected to the System
> > Management Controller (SMC). The SMC firmware exposes the data
> > reported by these sensors via its standard FourCC-based key-value
> > API. The SMC is also responsible for monitoring and controlling any
> > fans connected to the system, exposing them in the same way.
> >
> > For reasons known only to Apple, each device exposes its sensors with
> > an almost totally unique set of keys. This is true even for devices
> > which share an SoC. An M1 Mac mini, for example, will report its core
> > temperatures on different keys to an M1 MacBook Pro. Worse still, the
> > SMC does not provide a way to enumerate the available keys at runtime,
> > nor do the keys follow any sort of reasonable or consistent naming
> > rules that could be used to deduce their purpose. We must therefore
> > know which keys are present on any given device, and which function
> > they serve, ahead of time.
>
> I'm confused because you say this, but then the .dtsi files are common.

The SMC exposes dozens of sensors, and figuring out which one is which
when all we have to go by are cryptic FourCCs is proving very time consumin=
g.
This is made worse by the fact that even sensors which you'd think should
be consistent across devices with a given SoC are often not. For example,
the M1 Mac mini exposes the application core temperature sensors on differe=
nt
keys to the M1 MacBook Pro. We have only included the minimal subset of
sensors/fans that we know are common to most devices to validate our approa=
ch
with and make the driver itself useful.

> > +    patternProperties:
> > +      "^fan-[A-Za-z0-9]{4}":
> > +        type: object
> > +        additionalProperties: false
> > +        required:
> > +          - apple,key-id
> > +        properties:
> > +          apple,key-id:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            pattern: "^[A-Za-z0-9]{4}"
> > +            description: The SMC FourCC key of the desired fan. This i=
s the
> > +              main key, which reports the fan's current speed. Sould m=
atch
>
> typo
>
> > +              the node's suffix, but doesn't have to.
>
> Why can't we require that they match? (Other than we can't express that
> in schema?)

I made this optional mostly because these subnode names are inconsequential=
.
It's the apple,key-id property that matters. If it makes more sense
to say that the node name and property 'must' match instead of 'should' the=
n
there's no reason we can't do that. Another option is to just have a
numbered sequence, e.g. fan-01, temperature-01, etc.

> > +          apple,fan-minimum:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            pattern: "^[A-Za-z0-9]{4}"
> > +            description: The minimum speed the current fan can run at
>
> This is not the speed, but the identifier key to retrieve the min speed,
> right? That's not clear. It's a bit odd that everything is a key id, but
> one property has that in the name and the others don't. I don't have any
> better suggestion though...

Would it make sense to append '-key' to all of the optional fan properties
to make this clearer?

> > +          apple,fan-maximum:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            pattern: "^[A-Za-z0-9]{4}"
> > +            description: The maximum speed the current fan can run at
> > +          apple,fan-target:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            pattern: "^[A-Za-z0-9]{4}"
> > +            description: Writeable endpoint for setting desired fan sp=
eed
> > +          apple,fan-mode:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            pattern: "^[A-Za-z0-9]{4}"
> > +            description: Writeable endpoint to enable/disable manual f=
an
> > +              control
> > +          label:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            description: Human-readable name for the sensor
>
> Surely more than apple,key-id is required? How would it be useful with
> only that? You can know how many fans you have, but have no info or
> control over them?

The key specified in apple,key-id is the fan's current speed, which is the
only key strictly required to enumerate the presence of a fan in the system=
.
All of the other keys are optional information that are only really useful
when implementing manual fan control, which is itself optional as the platf=
orm
really expects the SMC firmware to have control over fan speeds at all time=
s.

> Rob

Regards,

James

