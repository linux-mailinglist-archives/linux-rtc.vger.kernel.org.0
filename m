Return-Path: <linux-rtc+bounces-5464-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1AAC89C34
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Nov 2025 13:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6958B4E3AA3
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Nov 2025 12:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D2A325707;
	Wed, 26 Nov 2025 12:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="POhy+iy1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A2155326
	for <linux-rtc@vger.kernel.org>; Wed, 26 Nov 2025 12:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764160196; cv=none; b=QuwYdEawOsflAWnxjVBqKHgBO9eDlvOYL4WIxmbr+DP0E6OB105oaLBOESgZa8u8U+OxkaUcggg56wfo0XtGLyVTV2fxvW5fL/sD92hAa/NONkdtx4f3qaneEnaGM8DMq6knKeXRJ9s9W3U5GkLqfZNxGQ5eGttQyV3IAWgmMRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764160196; c=relaxed/simple;
	bh=bQwTEmXLZtBYbJIHQB1fvCQ564+9NYLXnwEpMuxsr1Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SsrsI334VpMv8CC2oAI+WR+Y/NDZ/24sheL+2gASOW/ORCRK0d6aeyW7CHxe8/MS/idGD/722+8AtUPQ9k8/F7Oi6PEAvcP2f2PgPc4kNL27AG/hXZWk2qE7Nlfnd+/r/tYYjxPUfletSTAsPHqFk8iwains5djZR/4PCgdRFKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=POhy+iy1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so3873419f8f.2
        for <linux-rtc@vger.kernel.org>; Wed, 26 Nov 2025 04:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764160193; x=1764764993; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bQwTEmXLZtBYbJIHQB1fvCQ564+9NYLXnwEpMuxsr1Y=;
        b=POhy+iy1YJOQoTgxlgr6OnFQL0JpoU4L3dKRJJzK62kmfA6IJj0C9bNXiEQcbNG3Ln
         433rrGwHz7r44ZwEDCNl2rqSaQJhppWcnU9+EH8xJESgzueGGVuTdWRe1Uboouw5XZEq
         MXa/QjfYBuVSDjxEvLRkUCtL8CSdYtW5uEVWFg6QOEpyr3+g8F+aDs268Zvl6iQgr//t
         4mzp0n/bzd1KaPxZJ8oiWef3xKAAXYgphaOfQcPHr+TJCFE72N0q9kfAN9XxdpQm9nTw
         9X+1eewg7LTTMAVsnVx0G4vpI58XKBQJSvS5LmWe3I/Js6HQsLjT+I1zTeOrx1i4NNd9
         ellA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764160193; x=1764764993;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bQwTEmXLZtBYbJIHQB1fvCQ564+9NYLXnwEpMuxsr1Y=;
        b=I2TPVcNJ1Wy4beISO67DnsQGeqrm94gP57GChA2voOI3V9KUCnkdCLW6dzM7zLOSwf
         hHRktJbObs5k3tXusCYZqzDAovD/j71NMfOyrvge8mP7d6/k13XszVCAGR1ELYDxkAf1
         QmPGfejJ12W/JLh/8pCyCWmdCgh0sUwqeK0GyVk8+Wr630epyZpe6rotw+J2+WU2+dcB
         IqqKvUJPnnUc31NHnxJcnA1dtrEkNap3d32kfPikd8g5cNzfPLVw+t04erThJfe5pKhg
         439F+4G/tXIvVecCPKA9yWl0GnKgQ9C00RXk5bBAinZfXF/e5ls4IS+GPKa2l/sq84fH
         V3Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXMygDFfvKI+0GXfNG0b5+hue/scoFCLc2np1DEw68KVh+uh4P0yeEtDNsJnufV83gOebnmwJvh6qQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb2CBiQ7EmitxuvlHF7TM+1yQqF5NII9j9VaGXmTs3ythGMKB+
	rK6lba+MObGOK/5cGyXQ96dg0qI4GnEu2x1NZwTzsB+Yq/VyUC1zLNb1U1M/7dvydwQ=
X-Gm-Gg: ASbGnctVLlkzDByI8mqIjYXjNfQXkgJCwhyPzANbx2zax805W8FDhGK/eLXCVawduR1
	lwlbp0eVulq6AeKHtlgG1CwlOE0Or31E1HN9GqtkhRg1RQ+R2gXyIVNj/FDfn9Nek9DrP7RCBYf
	n8a+w3EEDm1y/F6Ey9mVOwo3m0h1GBZAIzfHCBBc/UdJlr+KNcogk3sH4NKCMDR2bC1e+3Vftj+
	Zrfjel2jkOOQP/uRc+qEskNzDBXON5WztWH4c8DDvdFOxzjiORYTH/DD1g8lTID/3HhA++ADHqQ
	wSgxfQ6RC3w3YR+1708dachGPQW3/HncNW1MW23r99RLi4iDA8XNEinrANNvUfe3FLRjj9ubWdn
	cJ3TRE0etmCXe2FEo9j/dLcNnOEpdn+/ybRNPkuFBcLZCI/aoMmQTURwTFfeV4WEltJtbS8+Ss7
	x3geZ5AdpArWGQH/sx
X-Google-Smtp-Source: AGHT+IH0cSJo4Vlyr8Buk/DzCr1knoZZ+PmWD5VF6J1/HFBNtYH/a6qqjCDXW/RS7ARE0kpo9HhB3A==
X-Received: by 2002:a5d:584d:0:b0:429:d391:642d with SMTP id ffacd0b85a97d-42cc1ac9a9fmr19770309f8f.5.1764160193279;
        Wed, 26 Nov 2025 04:29:53 -0800 (PST)
Received: from draszik.lan ([212.129.87.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb8ff3sm42694154f8f.29.2025.11.26.04.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:29:52 -0800 (PST)
Message-ID: <ac62fdeb7e436ccf1df00904fd53826778f4593a.camel@linaro.org>
Subject: Re: [PATCH v2 0/3] Samsung mfd/rtc driver alarm IRQ simplification
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni	
 <alexandre.belloni@bootlin.com>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, Juan Yescas	 <jyescas@google.com>, Douglas
 Anderson <dianders@chromium.org>, 	kernel-team@android.com, Kaustabh
 Chakraborty <kauschluss@disroot.org>, 	linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, 	linux-rtc@vger.kernel.org
Date: Wed, 26 Nov 2025 12:30:08 +0000
In-Reply-To: <20251126112935.GA3070764@google.com>
References: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
	 <20251126112935.GA3070764@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Lee,

On Wed, 2025-11-26 at 11:29 +0000, Lee Jones wrote:
> On Thu, 20 Nov 2025, Andr=C3=A9 Draszik wrote:
>=20
> > Hi,
> >=20
> > With the attached patches the Samsung s5m RTC driver is simplified a
> > little bit with regards to alarm IRQ acquisition.
> >=20
> > The end result is that instead of having a list of IRQ numbers for each
> > variant (and a BUILD_BUG_ON() to ensure consistency), the RTC driver
> > queries the 'alarm' platform resource from the parent (mfd cell).
> >=20
> > Additionally, we can drop a now-useless field from runtime data,
> > reducing memory consumption slightly.
> >=20
> > The attached patches must be applied in-order as patch 2 without 1 will
> > fail at runtime, and patch 3 without 2 will fail at build time. I would
> > expect them all to go via the MFD tree. Alternatively, they could be
> > applied individually to the respective kernel trees during multiple
> > kernel release cycles, but that seems a needless complication and
> > delay.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > Changes in v2:
> > - rebase on top of https://lore.kernel.org/r/20251114-s2mpg10-chained-i=
rq-v1-1-34ddfa49c4cd@linaro.org
> > - return struct regmap_irq_chip_data * in sec_irq_init() (Lee)
> > - collect tags
> > - Link to v1: https://lore.kernel.org/r/20251114-s5m-alarm-v1-0-c9b3beb=
ae65f@linaro.org
> >=20
> > ---
> > Andr=C3=A9 Draszik (3):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfd: sec: add rtc alarm IRQ as platform =
device resource
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: s5m: query platform device IRQ reso=
urce for alarm IRQ
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfd: sec: drop now unused struct sec_pmi=
c_dev::irq_data
> >=20
> > =C2=A0drivers/mfd/sec-common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 45 ++++++++++++++++++++--------
> > =C2=A0drivers/mfd/sec-core.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0drivers/mfd/sec-irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 63 ++++++++++++++++++----------------------
> > =C2=A0drivers/rtc/rtc-s5m.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 21 +++++---------
> > =C2=A0include/linux/mfd/samsung/core.h |=C2=A0 1 -
> > =C2=A05 files changed, 71 insertions(+), 61 deletions(-)
>=20
> The MFD parts look okay to me.
>=20
> Once we have the RTC Ack, I'll merge this and send out a PR.

Thanks Lee. Alexandre kindly acked v1 in
https://lore.kernel.org/all/2025111415582194c6ee16@mail.local/
and there was no change to the RTC part in v2 hence I collected it
already.

So should be good to go?

Cheers,
Andre'


