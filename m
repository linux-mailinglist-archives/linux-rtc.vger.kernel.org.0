Return-Path: <linux-rtc+bounces-3812-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21148A7DBCF
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 13:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72D863A9D1D
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 11:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D52723AE79;
	Mon,  7 Apr 2025 11:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MAiDXL25"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BE0235C03
	for <linux-rtc@vger.kernel.org>; Mon,  7 Apr 2025 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023866; cv=none; b=ngnBaSortwRve1UrYZ8mQCVz6xK6aDUtHfU1iW2j+h8Fr+mLmSM4Q6nLS8Q+l2DtcdVnEogMjITJFQEYLYuTzgsWYM3Mvnh/T9fBdPKydNgrDPMyQKrKj/LOL+DVx5RUDHIFH7khiiCxrgYAwk6TObj5uh67Ar2KjIit6H4lcyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023866; c=relaxed/simple;
	bh=vPMacaXyS5RgOarFCrFya7CXDPzYxrmSCGIk7I3/RlA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VLEERw98GkFxJ455B0u7ppJ37xaCyQ8RXF9dprhoUuK2t4tx49BRUD+LXuRtCNzoP7FjFznfr4a99tttJ+UXPC/BLficC61ZhnC/z/uQvIbYDedkVZX0reK/DxyFzP5ppt5nmMCdVCkAYI9jFdAS54QrpRo8Akh9Seli6ufQOT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MAiDXL25; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso38867095e9.1
        for <linux-rtc@vger.kernel.org>; Mon, 07 Apr 2025 04:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744023861; x=1744628661; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bjNP63G+fAyAyGQb7WUecVf9CDYMikWqHRq+/UjXZxI=;
        b=MAiDXL251S5WQDA+rh0txJ7+K+1M4uYzBDuOyg+IXEnYVn8AJaWFWILk2UyiiRRlzf
         lhSBpN+9g3cVuRJlIHjnrrmPIrZ/p5XZL0q9DgLyntFrIqGtw8FIXR1T5EA+t42mwQuA
         k/k5BaaA8hjJ5vM+9+hQ53Qvf3nIH3WqOFI0NCHObKCzNWhwJQu0+nbgfZALruuxrmFM
         ZgHPRa1xJpJXBLIc4bAGSMw8w80Kqzja48PnCKGoRE95pHvAmWHJNBJSxbGpVZVodgV/
         1h8iEZCg2IcTD1PliedDxrwMSQ81CdxGJEXtwXf0b6WImLT1nYcPl+1Fo/0kbsY+Rvfw
         w3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744023861; x=1744628661;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bjNP63G+fAyAyGQb7WUecVf9CDYMikWqHRq+/UjXZxI=;
        b=mdCNzW/ZHr1R6blMOBYvhKGJXKeR/vahpzfX4eM1khhNaau9GJ9fx9SK2+BcDmtDAX
         PolbhaOKZpjcdO9+egEONW54mJvvDHgDMR0c+sADJP/EcsNRJ+LBgSgoRw8+JpJ8XZCf
         Od8zoEdaBOjGTcv30Dm7DyT5D1/ChnEesJ9oubQk234bzqjwQIZ4nZCc+4HjCVMFIUNV
         9zT+lYP8NIHZxxUD4bhQRw+gWqLtjnLPZj8LkO1YixP+jkbQwIJCz2hQw0DSqMzIF8wL
         5BELblYaPDUHNyE3fJ6IK1h2H18f505G/qdOmiiIgsX1Otwg7wawNB/2mL8haBMDRjnr
         39mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBDOfxJnY7f1mddVh/AbadrYqARq+F4BpxKEVPAOGPmbkMI6F8JzZA1QOnTBl6rkiXksgyBs4uTLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqOE1mq981epQYLtbQwIp+cQme2mCh9bKUZ4KQdDAvL/pGF11u
	hB7UW1bz/EjYsJ2JdMF3tGSdP8uHsQ+Vak4rxhq8XtnWDrSmB8JLTDxJ/fd30OE=
X-Gm-Gg: ASbGnctiaM7p/NgucssquDo6Cu0m91RqCKnQUFlJ2nYizOsJ23W3zXaNEDGk3YyuxZU
	J2kMv7EmkP4Uc5EmpuAltOA0Wnm3zPfYnMi5rR5usBPSlQnyu0KLB7oWHpOSouxSD12DT1s7USs
	PrCxXfbI1nCkwe+K8D9/g9qscZEwtETxBlkDlp1nMNHc/wICUuua6YnB3GdyUmfrww4JcakeRQM
	9RMkazY/gkwvUyOSIQ80BWuRO979GLT66/fdgwGeeSTFc6qqD59GUZ0rwZjo/KO0H6aofWF00p/
	PcR/D096MGNsT5i4PPNlw32zqiR4OpvVlPtGty5hej8ERerDhQ==
X-Google-Smtp-Source: AGHT+IE98q/exAYcbXtaZDbUrx+IuA1N3tIoGfV9NOXz2xzrCG0lt2xc3oN4y/3w/IH6VurA5lmsRg==
X-Received: by 2002:a05:6000:430c:b0:391:47d8:de2d with SMTP id ffacd0b85a97d-39cba93382fmr10043977f8f.23.1744023861560;
        Mon, 07 Apr 2025 04:04:21 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795205sm130230235e9.30.2025.04.07.04.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 04:04:21 -0700 (PDT)
Message-ID: <819718d731bc1496a75ebd0a4076d88273b21229.camel@linaro.org>
Subject: Re: [PATCH v3 25/32] rtc: s5m: cache value of
 platform_get_device_id() during probe
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Mon, 07 Apr 2025 12:04:19 +0100
In-Reply-To: <b68110b8-fd16-454f-9b59-a89c028ff92d@kernel.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250403-s2mpg10-v3-25-b542b3505e68@linaro.org>
	 <b68110b8-fd16-454f-9b59-a89c028ff92d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-04-06 at 20:29 +0200, Krzysztof Kozlowski wrote:
> On 03/04/2025 10:59, Andr=C3=A9 Draszik wrote:
> > platform_get_device_id() is called mulitple times during probe. This
> > makes the code harder to read than necessary.
> >=20
> > Just get the ID once, which also trims the lengths of the lines
> > involved.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0drivers/rtc/rtc-s5m.c | 8 +++++---
> > =C2=A01 file changed, 5 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
> > index db5c9b641277213aa1371776c63e2eda3f223465..53c76b0e4253a9ba225c3c7=
23d35d9182d071607 100644
> > --- a/drivers/rtc/rtc-s5m.c
> > +++ b/drivers/rtc/rtc-s5m.c
> > @@ -637,6 +637,8 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info=
 *info)
> > =C2=A0static int s5m_rtc_probe(struct platform_device *pdev)
> > =C2=A0{
> > =C2=A0	struct sec_pmic_dev *s5m87xx =3D dev_get_drvdata(pdev->dev.paren=
t);
> > +	const struct platform_device_id	* const id =3D
> > +		platform_get_device_id(pdev);
>=20
>=20
> If doing this, why not storing here driver data, so the enum type?

Good point, thanks Krzysztof

Cheers,
Andr=C3=A9



