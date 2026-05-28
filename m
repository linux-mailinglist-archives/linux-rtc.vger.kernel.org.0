Return-Path: <linux-rtc+bounces-6586-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNIrL6YAGGrgYggAu9opvQ
	(envelope-from <linux-rtc+bounces-6586-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 10:45:26 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5585EEE17
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 10:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AACE33003729
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 08:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F80379C51;
	Thu, 28 May 2026 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinatta.cz header.i=@vinatta.cz header.b="Mk0NQ0aK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from vinatta.cz (vinatta.cz [37.205.8.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08ED30C34A;
	Thu, 28 May 2026 08:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.8.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957640; cv=none; b=jXCDDfZkoNAQHtEhrNajlzlN1dy7di35EwuWgMtM0/7/Tr866g7mwxUbAn2P2uuotO04ryvbmytuFF5tcdXT/w9YNKpPNAjiXssdDC5PgL1MQ7gxIPt1ndECjaglIFkxYXaWk3PdRWmnSIeE1r1QvB9kSo1EtDfl0LkL52/kXFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957640; c=relaxed/simple;
	bh=hbTxqBhmRzh5qEhtmmqSxMZrR1fcZVJBDnekfUYevmQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Cc:Subject:
	 References:In-Reply-To; b=LzmUopuv/GhWgvaWPWqcG+F4rvX9SKWuAqYQqLOfIp5rJeiFwJNSdnM1ImS8Dvsdw3DFDg0kUagY4gDCI2IYJSnIjWXUtUADr+yecQ+eoWIN7jW/us44KL3c3x5aoMVH7zfuC8K1mE4Rj7ccdSAk9AgnJZs8N6G2WuTL0lkraY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=vinatta.cz; dkim=pass (2048-bit key) header.d=vinatta.cz header.i=@vinatta.cz header.b=Mk0NQ0aK; arc=none smtp.client-ip=37.205.8.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinatta.cz
DKIM-Signature: a=rsa-sha256; bh=qgwa+0R+XFn6p6bqyj4g6FOJ3XZRc6X9G5oNCLDxasY=;
 c=relaxed/relaxed; d=vinatta.cz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@vinatta.cz; s=default; t=1779957617; v=1; x=1780389617;
 b=Mk0NQ0aKSh7SbxTr8wKXtLX+td5K82EuzmGtzBO3w384Xyt7Ds+1n6tk3ZwCMUbcOrSJuw8m
 +DloLdPVC3Hu2d6ht/pPovN/zBJqnfelbXx5SEecyeGUcLf5+n7AoDFuiLe2lKga7t02B1ac+yL
 9am6IjgF1zUcWOS4h91PwB1wnEB0y0A88AwAaO44UcGhKJbW4DmNUBgFSxk8YKtzwPaJCaxLRug
 moYFHrOZsE0+556cQh6GmrfR9eNZoXS47I1kfyk5alwQFgutqaTWY4oNKofFD++Seot+/a5oWxE
 i+p58yLzS8lHT1gZfjLe3WcMcVeXaS8rRkpFYa00rkHEg==
Received: by vinatta.cz (envelope-sender <karel@vinatta.cz>) with ESMTPS id
 dab5865d; Thu, 28 May 2026 10:40:17 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 May 2026 10:40:17 +0200
Message-Id: <DIU6BCZABXFD.1TVSGC0VM835C@matfyz.cz>
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>
From: "Karel Balej" <balejk@matfyz.cz>
Cc: "Matti Vaittinen" <mazziesaccount@gmail.com>, "Chanwoo Choi"
 <cw00.choi@samsung.com>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v1 3/3] rtc: Use named initializers for
 platform_device_id arrays
References: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
 <d14b9076b2c7703708bcc5cc35f339cd97fc10cd.1779950275.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <d14b9076b2c7703708bcc5cc35f339cd97fc10cd.1779950275.git.u.kleine-koenig@baylibre.com>
X-Spamd-Result: default: False [-1.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[vinatta.cz:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[matfyz.cz : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6586-lists,linux-rtc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,samsung.com,kernel.org,linaro.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[vinatta.cz:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balejk@matfyz.cz,linux-rtc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BD5585EEE17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Uwe Kleine-K=C3=B6nig (The Capable Hub), 2026-05-28T08:48:12+02:00:
> diff --git a/drivers/rtc/rtc-88pm886.c b/drivers/rtc/rtc-88pm886.c
> index 57e9b0a66eed..13aa3ae82239 100644
> --- a/drivers/rtc/rtc-88pm886.c
> +++ b/drivers/rtc/rtc-88pm886.c
> @@ -78,7 +78,7 @@ static int pm886_rtc_probe(struct platform_device *pdev=
)
>  }
> =20
>  static const struct platform_device_id pm886_rtc_id_table[] =3D {
> -	{ "88pm886-rtc", },
> +	{ .name =3D "88pm886-rtc" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, pm886_rtc_id_table);

Acked-by: Karel Balej <balejk@matfyz.cz> # for Marvell 88PM886

