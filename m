Return-Path: <linux-rtc+bounces-3997-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BDDA9A9F0
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Apr 2025 12:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B0B316AFC3
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Apr 2025 10:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7EB1204C2E;
	Thu, 24 Apr 2025 10:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="JvSR2w7t"
X-Original-To: linux-rtc@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3525819F40B;
	Thu, 24 Apr 2025 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.234.176.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490022; cv=none; b=jVaVYHZ3HnconBmV/5pGamud2VpTLlk4nYhI5iDgol/LNO14hRlIbvhrNUwyX507PHT8aBYMZuVYuYBD7J3itwIiPyB3MF4DWJKtjtt3kQu8gc6TtPZRGPy6xZIUUjglLnXSW8M5NYXgHoFp6bAVtUkolJiywdCtn3Uc/EwaVKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490022; c=relaxed/simple;
	bh=iRBOvEPQp0xpjzARc+Ce2T9xzyhYnjAoFFTZIi+L7EY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cUqZJS/56ZkXfNEk5nYIqg9LW0W4vHbS5N9MTPwXz4h1h+Yoyx8exL+oGvQzGQ5lE7n3Dp0LjLu6OQEZSnjVAsx+tHv9p1Cco3v8t5JIAcbmz6h5PoEqKlsKGD0Ii4dv5rVO6F+EFNpuXJ5HzKwvdcuZ4fCh0ORC+yoc3HOFx1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=JvSR2w7t; arc=none smtp.client-ip=89.234.176.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1745489600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iRBOvEPQp0xpjzARc+Ce2T9xzyhYnjAoFFTZIi+L7EY=;
	b=JvSR2w7tExtylhEf/zsQNl60zLCBe9icAMA0eDkdcWJRUOih7tGcqxyTztFwWBYLyiBiHs
	hSCsSNGYRzR7zWzhyy/ziIZ7Vc1qn0nz3/ySepQwFoumCKnvkqgPKnu9KUZ/AecaB/CShI
	P/EOhu193xm4+esD8tWmtQrw/wR6nKA=
Message-ID: <0c86e52bdc0a130bcf5fe152c062c2c6c07418c8.camel@crapouillou.net>
Subject: Re: [PATCH 4/7] rtc: jz4740: drop unused module alias
From: Paul Cercueil <paul@crapouillou.net>
To: Johan Hovold <johan+linaro@kernel.org>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea	
 <claudiu.beznea@tuxon.dev>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Sebastian Reichel
 <sre@kernel.org>, linux-rtc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Thu, 24 Apr 2025 12:13:08 +0200
In-Reply-To: <20250423130318.31244-5-johan+linaro@kernel.org>
References: <20250423130318.31244-1-johan+linaro@kernel.org>
	 <20250423130318.31244-5-johan+linaro@kernel.org>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Johan,

Le mercredi 23 avril 2025 =C3=A0 15:03 +0200, Johan Hovold a =C3=A9crit=C2=
=A0:
> The driver only support OF probe so drop the unused platform module
> alias.
>=20
> Fixes: 24e1f2c9383e ("rtc: ingenic: Only support probing from
> devicetree")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/rtc/rtc-jz4740.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
> index 44bba356268c..11fce47be780 100644
> --- a/drivers/rtc/rtc-jz4740.c
> +++ b/drivers/rtc/rtc-jz4740.c
> @@ -437,4 +437,3 @@ module_platform_driver(jz4740_rtc_driver);
> =C2=A0MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_DESCRIPTION("RTC driver for the JZ4740 SoC\n");
> -MODULE_ALIAS("platform:jz4740-rtc");

