Return-Path: <linux-rtc+bounces-3948-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E90A88DD4
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Apr 2025 23:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AEDB3B3DD1
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Apr 2025 21:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896901EB1B5;
	Mon, 14 Apr 2025 21:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QjcMKmZ3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278541DB548
	for <linux-rtc@vger.kernel.org>; Mon, 14 Apr 2025 21:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744666495; cv=none; b=NrJbP6fjbH1nHfUD/Jud3iv5Ljwux0eIKM+KP4UdhbMY0i167eRj/0cY/xEEp5X62Rtm0EUjksocaI649D1D5KGA5aprDixvzU/kfu1ll3Qggs9D2Q6f5rcYKTbHmuoA0/x6Gw4cMg4UjEmEwy1MmwCGTP+BuAI8xx01zh7ysp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744666495; c=relaxed/simple;
	bh=crIMSumShIOAq9dEq0E0IScyY+k844YcG8x54zymQH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLkLn0AEI7gUWhPA2G7itej3ytyyee2k9TLjzrggU3a+9pZGEX04T73w15mgj46ojvkrqRuowDEUpvwmA3Zyx9T9HI3Qa2QedHPMGGnPrFkEPKHntqqRUJrS9Nrcnyy0iIxmhLzfLaovOWl3Kc8toWorwTAvZv+JG0l/VNCYJFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QjcMKmZ3; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so8401264a12.0
        for <linux-rtc@vger.kernel.org>; Mon, 14 Apr 2025 14:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744666491; x=1745271291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S7BZi7HnKfbbt9TH74oPDg7WDBebYy2OSaVokgDUUbg=;
        b=QjcMKmZ3sB+CZb8dglnfrWX5ZQt9MkpMzOmNXvQzJ6PzWyF6KDTYA8vdbR69dPchy+
         pLsUG2ZN3oVJy4AhTBytaoj7DSPbexDZ2QTHcppe/7l2L+NUKgUGlDWAKxLmzPojZYRK
         /6SMx8e1C+AKOzeDeVcOgU1k571O33HMZanv4DrzX1drHqiCQKkUbZ/VBH+cyZH5UtNU
         dUZC2zTLUHliRFmU2ZB2TqSVoL1GhATUbAzCBFJw/h6pgZ+pPneMIgQqTktWRP+e0HZu
         0g5674z0g4nWyPKe0LigJL88k4PtV8DuLN6WL1kVxANritEezi1GnAkM86JMT9WsjW4Z
         wz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744666491; x=1745271291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7BZi7HnKfbbt9TH74oPDg7WDBebYy2OSaVokgDUUbg=;
        b=NsKIxU/Bn0dK2XSu1MDYZvw1CUBxBzVv4JKwzMXWvDrZq9K8mFD8OHilkMtraCEsfj
         LvztBOFQYDh5mk/IlG80ykQ6erChEtTU67E/1O2xv58dWLMSuciiucJ5HTqj/M/v+XSq
         3EkUP2DRI8MPPZqUOOP4OnHqaT2JaZteO/m5GRhFDgJP4hPS+HWon2KaGRo2/Zvebsyl
         WDQ/na9iv8OEpmxkmUCphH8KKYyISN10/TwpEBOL1SBBkbaru03x1BTfen0H7/KVIK11
         ddTrxt8Iu+8EXW9/C0YvF7g28UHzHvMXhCYB4biUzzFbHH1sYR3U7oMT3h3DQoaogbUZ
         yxBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgzGZxgOQ8OCHO31tnk7NvadkxebW1hQa2I+Of2PqdsxZ1EzR7A+5DLtc3DvL4pFAZhNH2YeRBmkc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs45K5yAiQT0QFmqapGzt3KzKt9N8x87pBY+Fgq9DIT40XTK+j
	S5DoB16s6pLL0Md2p2Py9ZXqLq2XUhWqW8TL34o/TE+fJt/1HE6Scn0Z53vS9m8=
X-Gm-Gg: ASbGncvytKVci4Xw/qnORAUZtDSfvVxQnQiKNHQLTytrC1133f2k8qx9K/Nv/tL9ggk
	8opaQsSzDNue3/Rc1MU47nSMZV49gOinlxOdG4snjVBa35WzdXICnKtfHQhZHb4CtdLGkhIVc3V
	oGvwCHCP0yMFyVkAdHXU5l2VCynxph7zt1T1fdSf0/OBcDJMquBQGLm8ehzZC1PCejmbXsGOoY2
	pL2HUuolQJHZm8nv1pvXAD1k6dvk4R0AZX8e04KlUz/PAjqCd+dQfFW20+jTyu+M0rMqoTidugh
	44JhPDAg2gAzkWHL2+pReimIYMvrOhOQ6EP0TCscacLfqA==
X-Google-Smtp-Source: AGHT+IG/kDZsmoxinyBq4n/Im69g3ys9L3BT2wiv3DJKobRUo+Jzgfnpx2t+FVw18cLid5H4hJIEjA==
X-Received: by 2002:a05:6402:1ec9:b0:5f3:8171:a4e2 with SMTP id 4fb4d7f45d1cf-5f38171a75amr12298487a12.18.1744666491385;
        Mon, 14 Apr 2025 14:34:51 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f36f506425sm5554281a12.53.2025.04.14.14.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 14:34:50 -0700 (PDT)
Date: Mon, 14 Apr 2025 23:34:48 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Eddie Huang <eddie.huang@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/5] rtc: mt6397: Remove start time parameters
Message-ID: <vpf4apahhpovhrqje4i647nldszen2pglbm5fdmar7bsyg7uao@3ymuod45ftlj>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
 <20250411133609a1295543@mail.local>
 <202504111339359e840246@mail.local>
 <968001f7-96d1-4ad5-8c36-28cac5dc30f1@collabora.com>
 <97cfeafe-7044-4f06-b2e6-e4a158419473@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xgxword5effrvsfi"
Content-Disposition: inline
In-Reply-To: <97cfeafe-7044-4f06-b2e6-e4a158419473@baylibre.com>


--xgxword5effrvsfi
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/5] rtc: mt6397: Remove start time parameters
MIME-Version: 1.0

Hello Alex,

On Mon, Apr 14, 2025 at 03:56:11PM +0200, Alexandre Mergnat wrote:
> On 14/04/2025 13:09, AngeloGioacchino Del Regno wrote:
> > Il 11/04/25 15:39, Alexandre Belloni ha scritto:
> > > On 11/04/2025 15:36:12+0200, Alexandre Belloni wrote:
> > > > On 11/04/2025 14:35:57+0200, Alexandre Mergnat wrote:
> > > > > diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> > > > > index 692c00ff544b2..d47626d47602f 100644
> > > > > --- a/drivers/rtc/rtc-mt6397.c
> > > > > +++ b/drivers/rtc/rtc-mt6397.c
> > > > > @@ -291,8 +291,6 @@ static int mtk_rtc_probe(struct platform_devi=
ce *pdev)
> > > > > =A0=A0=A0=A0=A0 rtc->rtc_dev->ops =3D &mtk_rtc_ops;
> > > > > =A0=A0=A0=A0=A0 rtc->rtc_dev->range_min =3D RTC_TIMESTAMP_BEGIN_1=
900;
> > > > > =A0=A0=A0=A0=A0 rtc->rtc_dev->range_max =3D mktime64(2027, 12, 31=
, 23, 59, 59);
> > > > > -=A0=A0=A0 rtc->rtc_dev->start_secs =3D mktime64(1968, 1, 2, 0, 0=
, 0);
> > > > > -=A0=A0=A0 rtc->rtc_dev->set_start_time =3D true;
> > > >=20
> > > > This is going to break the time for people upgrading their kernel, =
you
> > > > are unfortunately stuck with this.
> > >=20
> > > To be clear, the breakage will happen when upgrading the kernel but n=
ot
> > > the device tree with 5/5
> >
> > Yes, you're stuck with this. Devicetree has to be retrocompatible.
> >=20
> > Besides, this start_secs is what gets used by default, and the start-ye=
ar
> > devicetree property should take precedence and effectively override the
> > start_secs default.
> >=20
> > Just keep it there.... :-)

It would work to keep setting start_secs but allow overwriting that
value in the device tree. But see below.
=20
> When you boot your board for the first time, is the date January 2nd 1968=
 ?
> If not, that mean it is used as a finetune offset year.
> IMHO, mktime64(1968, 1, 2, 0, 0, 0) is a workaround for the rtc framework
> issue we try to solve in this serie because start_secs is negative (1968 <
> 1970). Now framework handle the negative value properly, even if you keep
> mktime64(1968, 1, 2, 0, 0, 0) , the device time will change. I prefer to
> notify you.  :)

I don't understand everything you wrote here, but as far as I see it,
rtc_time64_to_tm() not being able to handle dates before 1970 is the
main issue here. This is of course only relevant, because your hardware
occasionally contains such a date. The technically right fix is to
extend rtc_time64_to_tm() to work for dates >=3D 1900-01-01. (An
alternative would be to assume that a hardware read returning a date
before 1970 is invalid. If you refuse to write dates before 1970 that
should give a consistent behaviour. But the original approach is the
nicer one.)

> TBH, it's hard to follow the logic, so I've a question:
> If I push in my V4 a framework fix that drivers using year < 1970 will ne=
ed
> to have a new start_secs or start-year value to stay aligned with there
> previous value, do you will accept it ?

Doesn't the need to shift the start year simply goes away once
rtc_time64_to_tm() is fixed for negative time values?

So I would expect that going forward with just patches #1 and #2 should
result in a fixed driver regarding the breakage you're seeing. (I'm
unsure about patch #3, I'll address that in a reply to the respective
mail.)

Best regards
Uwe

--xgxword5effrvsfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmf9f3UACgkQj4D7WH0S
/k6kAwgAn7QiSrVS5Jy5qEwJYxUOj7XozPsN8Zq0zgKKYBqm8IWz+mS1nyNSrfl5
oZQooSYT9XLLkgxOZJjHUV47P8G3ClP+nR+PvatZa7ukJTHU32GEOWNEtAd1NZ6k
EbH7z1BFqU+zXbNp4lCwS4bXpp0JH3j4r727u/UD5rg1yrO7HACF+VoNUYKpcKuw
aEVAFy51VngHisOufxAY3JYnQMtwhLN03t1UpwWrm/dhcukyWsBQGgJHs3cQMK0r
JJhVftzvihK98K3vv94fjlc8tr51LJIl8HVqMSZkVp/C9QwkaFHUy9bV9UGWqhQO
wBdR79PYhwox2zLOU50JR6euQ/yhFw==
=Kl2H
-----END PGP SIGNATURE-----

--xgxword5effrvsfi--

