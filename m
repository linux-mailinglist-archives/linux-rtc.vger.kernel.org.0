Return-Path: <linux-rtc+bounces-6330-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LNVC1Ht3WmulAkAu9opvQ
	(envelope-from <linux-rtc+bounces-6330-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 09:31:29 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F033F6A5B
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 09:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A95623026594
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 07:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343C437DEAD;
	Tue, 14 Apr 2026 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="WlSb8mJB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84D8370D62;
	Tue, 14 Apr 2026 07:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151538; cv=none; b=Eotk2z/gLHNEjMnkjaRs+fb78zH9nfZwPar4KOLfNXBhwnB23R/nUyH+VzXjUhXQ7BQeKZJqE3tgFIopndllJT+jbwZm7k/bZK3RxopmDinn2etD4cUh2iRpYAC5nhnMFG3H8kVFmVj+rFETXDn90FcamhZgmOW+HQBpPFCG9Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151538; c=relaxed/simple;
	bh=K6l5bmd1+0GzCu/0w8RgYpx8yym1hNAtokH6NiQwEM8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=NMwI1iLmRa2Oe2geD5vZbgd5FXnIGAcpExn1BigqNJBKehV45MvJ+Hl32euFXJ2+dgNcq6acsjlyOoIRij/Mak0rgrePlEHlTlTeLzWDUhlzWaGe3LjyXmXMCSriufqa6TjVUZRjsrRh0Xq97GzPZCLToZ2UsLzgirh6Wr3xxAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=WlSb8mJB; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 784CF26F4F;
	Tue, 14 Apr 2026 09:25:35 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQzWUVyRxP8u; Tue, 14 Apr 2026 09:25:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776151534; bh=K6l5bmd1+0GzCu/0w8RgYpx8yym1hNAtokH6NiQwEM8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=WlSb8mJBT9fy/c/Cggy/1Ikrh/ZmnJ+BWZaZ7/QNIBwrHplRuZSQBCVZFsr0xESOo
	 fpfmTlz/eoIGFaeK3bJP2XLqGhFDhdXaYoVYocBgycUWeKdraiWvDKo/vIBoHwQPkl
	 EuaH0Lisp6eeQ+MLiFnK0let06wePJOLSrlA7SjsFVxUqsDb/RKiRT+LiXApAg0BHI
	 FO6Pjn/PytoOvaAnjODO0wq+5ZFyfEsrdCSO1Jow9ngw0ulwm9HTEJngn4iQzTZgf9
	 7oOXgiYZxkjuK3cK2L4ZQ13NIAyxniItOqAist7M0LFMq3eKr5beiAwcjCeXtFXt90
	 fLl903j8TrShw==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 12:55:20 +0530
Message-Id: <DHSP6002AS56.3T6V08Y1VRG7X@disroot.org>
Subject: Re: [PATCH v4 08/13] mfd: sec: resolve PMIC revision in S2MU005
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>, "Lee Jones"
 <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "MyungJoo Ham" <myungjoo.ham@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>, "Sebastian Reichel"
 <sre@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Nam Tran"
 <trannamatk@gmail.com>, =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?=
 <kernel@lvkasz.us>
Cc: <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
References: <20260414-s2mu005-pmic-v4-0-7fe7480577e6@disroot.org>
 <20260414-s2mu005-pmic-v4-8-7fe7480577e6@disroot.org>
In-Reply-To: <20260414-s2mu005-pmic-v4-8-7fe7480577e6@disroot.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6330-lists,linux-rtc=lfdr.de];
	FREEMAIL_TO(0.00)[disroot.org,kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[disroot.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C7F033F6A5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-14 12:03 +05:30, Kaustabh Chakraborty wrote:
> In devices other than S2MPG1X, the revision can be retrieved from the
> first register of the PMIC regmap. In S2MU005 however, the location is
> in offset 0x73. Introduce a switch-case block to allow selecting the
> REG_ID register.
>
> S2MU005 also has a field mask for the revision. Apply it using
> FIELD_GET() and get the extracted value.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/mfd/sec-common.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> index 883e6d0aa3f06..43215605191e4 100644
> --- a/drivers/mfd/sec-common.c
> +++ b/drivers/mfd/sec-common.c
> @@ -16,6 +16,7 @@
>  #include <linux/mfd/samsung/irq.h>
>  #include <linux/mfd/samsung/s2mps11.h>
>  #include <linux/mfd/samsung/s2mps13.h>
> +#include <linux/mfd/samsung/s2mu005.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/pm.h>
> @@ -119,20 +120,27 @@ static const struct mfd_cell s2mu005_devs[] =3D {
> =20
>  static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)
>  {
> -	unsigned int val;
> +	unsigned int reg, mask, val;
> =20
> -	/* For s2mpg1x, the revision is in a different regmap */
>  	switch (sec_pmic->device_type) {
>  	case S2MPG10:
>  	case S2MPG11:
> +		/* For s2mpg1x, the revision is in a different regmap */
>  		return;
> -	default:
> +	case S2MU005:
> +		reg =3D S2MU005_REG_ID;
> +		mask =3D S2MU005_ID_MASK;
>  		break;
> +	default:
> +		/* For other device types, REG_ID is always the first register. */
> +		reg =3D S2MPS11_REG_ID;
> +		mask =3D ~0;
>  	}
> =20
> -	/* For each device type, the REG_ID is always the first register */
> -	if (!regmap_read(sec_pmic->regmap_pmic, S2MPS11_REG_ID, &val))
> +	if (!regmap_read(sec_pmic->regmap_pmic, reg, &val)) {
> +		val =3D FIELD_GET(S2MU005_ID_MASK, val);

Bug here! FIELD_GET(mask, val) should've been used.

>  		dev_dbg(sec_pmic->dev, "Revision: 0x%x\n", val);
> +	}
>  }
> =20
>  static void sec_pmic_configure(struct sec_pmic_dev *sec_pmic)


