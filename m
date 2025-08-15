Return-Path: <linux-rtc+bounces-4703-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60418B287D8
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Aug 2025 23:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6496017E4AC
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Aug 2025 21:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3CA2C08A8;
	Fri, 15 Aug 2025 21:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeVh3YIB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017BF2BE623;
	Fri, 15 Aug 2025 21:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755293800; cv=none; b=kxVxOhm7bHyjVaq0KOvtDrQ0vOlcE0kEao8MHOfzIDwFvPHzG5Bi70lrjVCxBOo6DiIXQGbDA1WjDxD3QIxOF8rWG0C4jB2SSycFy6RJJHeDk7fnu9D2xWgTgAf99tiI/LClfIj5KsGzx/Se2Np1/OgAXNupj5a4rhmxIgKmE9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755293800; c=relaxed/simple;
	bh=6BNhWrgb46K2BcPeMibABt0hCBRBy4UQHIkL40DBYlM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JHAVfEDetXlFHnej8/Esp+CBhTMaY9yakFkeduIl1UhbaJYp1idL9pJRwgv0W5T+sOFZ2qWrbVPcy35Gex8oemtX0R+VLbD54uZkxSxCmX47Mgrhzf5WxAGsLw9m9nnghnWr8dHnlszViDE3KGrkJMFneBqj/rdpeTQ4nVDw7mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeVh3YIB; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-619998ac812so232927a12.1;
        Fri, 15 Aug 2025 14:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755293796; x=1755898596; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=znB6OfSmgiQgkNBDu248ncGoeWin88JYU8iYW48f+KI=;
        b=UeVh3YIBzBJWRzYBr5rxe1SLPurVB8CSEmAdJ185vi6byk//NgD+JJ/9cV1ADIpog8
         dWGKrQL8+on59jqdABs/ZV6iTOJfPRuhvd526vvyv9ENveJV01/Reue9nRNJ3piM7zs1
         SrMB/02ZYDJI8wBTvou41RPOKRhZC6Sykc/+3/YzKHsh8ar1cXt/zvzQuhqC7qsfOqZV
         rhHxPWs9hw4HmKkQyFjeMsK8h8KzkY8/cpkDPvamWdt9e+QUYxGLFaRZN6tQeQbj1po6
         lrNNy0H4+6BFq57JPuPVe6xaQfnTlcxOtYH+7IZGSsXsEm684RHhU7F/YGNyLmKOz+5z
         J2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755293796; x=1755898596;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=znB6OfSmgiQgkNBDu248ncGoeWin88JYU8iYW48f+KI=;
        b=iItryksy8cK7ZfMKEOv4JAH8IszQYCHxkzYuOkApWheSnIZRHdeokNFkcZ+DGziEpk
         Wwa8l6lqJVqlQXp6iB1FC7QFiidjMhFsmVICBl+HuhjXE71EEwNNvzAKBCVBOIO+m2np
         uFCsgI9BqYnkPYGp0MgTZlH1eG2mup6FSap67TpImeo/WoBIIW3Dj5XPowxw1YgYD2JQ
         6+qef4z6/oN0nftcvy+n0AJtpMgVDBlYiE2zkmTuPKwNbWsHRVDRsSfp9JQZGR9oLpz+
         wNQ+o2E7DHxR7k3wgrTYZrTIBAqed/Dgf7VdPS5aaTzsKSwuEtY1aq5tTmXd6U3ytuyK
         q+Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWtYcbZb/bA6n/oQ5dNybeoCLoGlUF5Vmrnd5zHNEzh1FDFLQzfrBTcqyyKYY+DP+wIGYqPiG2Enlp/IZc=@vger.kernel.org, AJvYcCX0o2xtDJiBiZaA4IwIldztfQOqJY8tekYra2NpmsuNH4qpYXwrBXV//BqqVn14/xzbVMI2Op2ZGCUO@vger.kernel.org
X-Gm-Message-State: AOJu0YzebIfX/cF50aj7XK9U6b5yOG5ZKFViwPekKlpPFd1wY9Tj8bO3
	rrHv2vjtLfK4YRL8F6C9Ocwggtz1jE04CpPmoZk5Xy3NAjPlKlQxjzyaIQgR4Q==
X-Gm-Gg: ASbGncvKalyEE16UAAkuFiDVqGpFfv4mGQHVATr3pCyPtn19MCFC5pAFMueo7N0L9IS
	kpL/bDhWsTBc2Sh1R99lsK3YnMlrkrWTHmvPsSZt7PvJSi0dIJCAdPTXXQJgLJsZpgFxz4gHXJv
	70OueExUhNBCRDELCYeXJRT05vEkno5Erjffwu6+7irM1g+TLKXUCKrUXAeuV3kJh/AtpV5/7JP
	d603W28TxlG+d1/eBM8bDeyKPfrzjkTRN/Zh4M3pP3ToRN8FWRHTXpo6m0jDjTYgRHJXr5tugSf
	CDeJubBnvMC+GxSd2BgZReLQJWmMefLFzonmB5ghO+k0mYaAlBlBlseG3AnnC9g3pVxX05RfBwc
	8LC4mx8aSRzKUKLkpW1TZfUNuWdDcvJu6q2vr0ChTYQ==
X-Google-Smtp-Source: AGHT+IEapIHw7oqPtglN47JWdiu+NaUwB1uhKNeLct2ng9HJc09BM8QKbWtTg0IrOuDL8WrPyRQ62w==
X-Received: by 2002:a05:6402:518c:b0:612:dfdd:46fc with SMTP id 4fb4d7f45d1cf-618b053af72mr2860516a12.11.1755293795935;
        Fri, 15 Aug 2025 14:36:35 -0700 (PDT)
Received: from giga-mm-2.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618af9da4bdsm2156450a12.17.2025.08.15.14.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 14:36:35 -0700 (PDT)
Message-ID: <ba6fba79de06543dc3adc09eabbfdaa6a5eeacb4.camel@gmail.com>
Subject: Re: [PATCH] rtc: pcf85063: hide an unused variable
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>, Alexandre Belloni	
 <alexandre.belloni@bootlin.com>, Antoni Pokusinski <apokusinski01@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Lukas Stockmann <lukas.stockmann@siemens.com>, Maud Spierings
 <maudspierings@gocontroll.com>, Oleksij Rempel	 <o.rempel@pengutronix.de>,
 linux-rtc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Fri, 15 Aug 2025 23:36:46 +0200
In-Reply-To: <20250725090709.2505113-1-arnd@kernel.org>
References: <20250725090709.2505113-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-07-25 at 11:07 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The newly introduced configuration is only used by code that is
> inside of an #ifdef block, cauing a warning when that block is
> disabled by the configuration is still there:
>=20
> drivers/rtc/rtc-pcf85063.c:566:37: error: 'config_rv8063' defined but not=
 used [-Werror=3Dunused-const-variable=3D]
>=20
> Add the same #ifdef here.
>=20
> Fixes: a3c7f7e16ea8 ("rtc: pcf85063: add support for RV8063")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/rtc/rtc-pcf85063.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
> index d9b67b959d18..41e4a5a16574 100644
> --- a/drivers/rtc/rtc-pcf85063.c
> +++ b/drivers/rtc/rtc-pcf85063.c
> @@ -563,6 +563,7 @@ static const struct pcf85063_config config_rv8263 =3D=
 {
> =C2=A0	.force_cap_7000 =3D 1,
> =C2=A0};
> =C2=A0
> +#if IS_ENABLED(CONFIG_SPI_MASTER)
> =C2=A0static const struct pcf85063_config config_rv8063 =3D {
> =C2=A0	.regmap =3D {
> =C2=A0		.reg_bits =3D 8,
> @@ -574,6 +575,7 @@ static const struct pcf85063_config config_rv8063 =3D=
 {
> =C2=A0	.has_alarms =3D 1,
> =C2=A0	.force_cap_7000 =3D 1,
> =C2=A0};
> +#endif
> =C2=A0
> =C2=A0static int pcf85063_probe(struct device *dev, struct regmap *regmap=
, int irq,
> =C2=A0			=C2=A0 const struct pcf85063_config *config)

--=20
Alexander Sverdlin.

