Return-Path: <linux-rtc+bounces-3368-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B041A4B9B7
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 09:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 190C41890030
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 08:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA208B667;
	Mon,  3 Mar 2025 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n9G/kfvZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496571EFFA4
	for <linux-rtc@vger.kernel.org>; Mon,  3 Mar 2025 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991554; cv=none; b=ujOn4l0FB1Z+86Q/GVBBuODQ4w6ZYNknWSraED5uhfiUVQPPKeADQwjTTE6CJKjdUsJBA1u3DUP6PPTzzRPhlociilSpDP5v01EYkktJ1SzeKYHmUseL6Dy4kVLxfPCy2+7bDLilecexwTaFYvI+/p6NmtHMjVMW5gitQoORB+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991554; c=relaxed/simple;
	bh=fg7ScFrpAhGYL1bOoOF2peNB6lfD3/GoDR0u+tz557k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H7VwNC/Y3hhMPRMhqhv8W/3A0CFHJ2+r4mjB7x9++L7VyZkx8xpj4UJK4iwrYNC3rts2BeVGIhPYUllisTEAkWQhWNE5svTRnBisn6P0LY7I44dDlqPW0TQivNlzVtj5cGNnNYt6oYI3S/5zRF2+QzO2/MIfv06cvorLuNEm7Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n9G/kfvZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4399a1eada3so37996495e9.2
        for <linux-rtc@vger.kernel.org>; Mon, 03 Mar 2025 00:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991549; x=1741596349; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fg7ScFrpAhGYL1bOoOF2peNB6lfD3/GoDR0u+tz557k=;
        b=n9G/kfvZUuKXK3EZX64mpWhqdmN1j1OYK7oiCsE7ihLQRsDnyozQ04T9ROLlGD9gDp
         9gOcM4O7GEvACnhyhEmPDjaSQqtoXIb/tC5+QuLCwAgCnv/OuBrtNScqjQ4SfmDJNK26
         p4Gxgchd8L1bznzd/tG74wBYnUYvsKsCOVpajZu7vJ3IQSP68JOf25yzIQqnqCTZBn+A
         Sh0yQKtxZpeRsbC5sLI2WXBwc8EN3RNM9O01Azh7yv3/Z8vqu0HnQ0yh5/GF8JisQOcK
         4vte0r9AUXsHvAMeZksLp3eKByPYT2Xjq/pZ2jKCX/fANxSVdPTmh+p2OMwkEBRRqZfc
         7pSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991549; x=1741596349;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fg7ScFrpAhGYL1bOoOF2peNB6lfD3/GoDR0u+tz557k=;
        b=kOH5WwRymNHar7Cw3blIp6TWrn8oUoMG8byiGnOJuHqilKc00tb/0mHMoz/pxL+MXn
         70kZ1eVLyRHczCR6XbnN/GHRLsZmyl+KyG0A6j0vnsOsu/cphzzQHai5Wx0gxKRIzAFP
         pSnuW+PsqbEQMzcXH4E+Kj4BdSnk/NnjbnfM4FUPa/yMoYalMJb+lPeV5P8+LJGvEaqA
         DPtAoNdODCzkIYQ+3i+G+ntEEtWtfrP39x9rEGmCEqBBpeJv3jNUzVJlSTv9tGZXycqh
         gqx0cIywOZyDCnc3Dy3cB8VA3NWq7E5zUZ6IKTioQtKycqWge5oONV4wCP0b4dfA4H8J
         zkMA==
X-Forwarded-Encrypted: i=1; AJvYcCXfM/fg2q0ZuTomo0RN7I4P4OCXAejDX/imSKBN8JpZJ1PXNNfSPRE1QH2vo9s0hwyamKNTg1Z2HBs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6BFiUureOLUT0UpZyiLhdgy15nwsvL1aYUxNGtcEjfYmyCn/Y
	GjI68SJGu1fXTyGr++b5QUMWbtOxyS8xXmrdq8Em+08eoTxjKeTXSTbwOkM1e6A=
X-Gm-Gg: ASbGncur2+9ZcnoZcffB4VKB9Lk6C7n7Uvnmn4O4KEGKkUqocLril2i5LmNrDGtu4aR
	MH3zPkC0Sv7uCyhJ74d8QoFoJv3YC2WVJBoT8tnYAqifT2rOD7N6BZ79Z6cmaCvR+nvU5N/QCts
	3rEdUsD5hS8UTfqj0QirqDY+GV+vfeyVA064m/gII7E7cLqrUFVSAf1BWF2GRmZblNTXVdTYGYM
	pZUEx56ax+U+/XExJbj9mZuw3KsFVK/Phbsz80b5WQQemg063K2xkpcYOIqskBTby+MTzWfw264
	7KP7iDN9tDiexQikpi9piOhOCkd3GLex59BEK/LiLEfTX+Pt
X-Google-Smtp-Source: AGHT+IEQ5gIerplrLBCNz9iWi2EjC22riC6x2aUD9LPOL3RMv31foO6V/nmZEr2WkFVBKnwbDjXW6Q==
X-Received: by 2002:a05:600c:4e8b:b0:43a:b8ef:4dce with SMTP id 5b1f17b1804b1-43ba67041bamr112726745e9.11.1740991549553;
        Mon, 03 Mar 2025 00:45:49 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b736f75ebsm153130965e9.3.2025.03.03.00.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:45:49 -0800 (PST)
Message-ID: <4d0042850eb4d9898559b56505291c4e849d44c5.camel@linaro.org>
Subject: Re: [PATCH 00/18] a few rtc driver cleanups
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>,  Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Hans Ulli Kroll	
 <ulli.kroll@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet	 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  =?ISO-8859-1?Q?T=F3th_J=E1nos?=	
 <gomba007@gmail.com>, Dianlong Li <long17.cool@163.com>, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org
Date: Mon, 03 Mar 2025 08:45:47 +0000
In-Reply-To: <20250301203658839d5482@mail.local>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
	 <20250301203658839d5482@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Alexandre,

On Sat, 2025-03-01 at 21:36 +0100, Alexandre Belloni wrote:
> On 28/02/2025 14:07:13+0000, Andr=C3=A9 Draszik wrote:
> > Hi,
> >=20
> > While looking at RTC, I noticed that various drivers are keeping
> > pointers to data that they're not using themselves throughout their
> > lifetime.
> >=20
> > So I took the liberty to drop these pointers and this series is the
> > result.
> >=20
> > The last two patches also convert two drivers to using dev_err_probe(),
> > as I looked slightly closer into those two. They don't exactly fit the
> > general subject of removal of unneeded pointers, but I wanted to share
> > them anyway, since they're ready.
> >=20
> > All of this was compile-tested only.
> >=20
> > Cheers,
> > Andre'
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > Andr=C3=A9 Draszik (18):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: max77686: drop needless struct max7=
7686_rtc_info::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: s5m: drop needless struct s5m_rtc_i=
nfo::i2c member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: aspeed: drop needless struct aspeed=
_rtc::rtc_dev member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: ds2404: drop needless struct ds2404=
::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: ep93xx: drop needless struct ep93xx=
_rtc::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: ftrtc010: drop needless struct ftrt=
c010_rtc::rtc_dev member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: m48t86: drop needless struct m48t86=
_rtc_info::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: meson: drop needless struct meson_r=
tc::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: meson-vrtc: drop needless struct me=
son_vrtc_data::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: pl030: drop needless struct pl030_r=
tc::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: rx8581: drop needless struct rx8581=
::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: s35390a: drop needless struct s3539=
0a::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: sd2405al: drop needless struct sd24=
05al::rtc member
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: sd3078: drop needless struct sd3078=
::rtc member
>=20
> My main concern with this is that as soon as we introduce irq support,
> we are going to need the rtc pointer back in the struct. But I guess
> that most of them are old enough to say that nobody is interested in irq
> support.

Thanks for your thoughts Alexandre - I don't know the history of
these drivers and don't mind either way. I can drop those patches
that would require reintroducing if irq support is added in the
future. I think overall you're OK with keeping them, but please
let me know if I'm misunderstanding :-)

>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: rx8581: drop needless struct rx8581
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc: sd3078: drop needless struct sd3078
>=20
> I guess you could squash those two with the previous ones touching the
> respective drivers because you are the one removing the last remaining
> struct member.

Will do.

Cheers,
Andre'


