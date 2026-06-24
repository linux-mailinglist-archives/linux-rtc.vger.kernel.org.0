Return-Path: <linux-rtc+bounces-6737-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dyX8OL8KPGpujAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6737-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 18:50:07 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 764536C017C
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 18:50:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gXuoHKe4;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6737-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6737-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 467313016005
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 16:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10B033BBD9;
	Wed, 24 Jun 2026 16:48:41 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05F433A03A;
	Wed, 24 Jun 2026 16:48:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782319721; cv=none; b=Gr+2CfIt0gdGQIVNquy5k7OTT7n9idfhb5ESm2ZbPw2fYVEZLa5yBF8MENj9m4Zotts9F/hOuQkRG8sIlOH+J4vkO8MCfs+yn+11wTI0MoxbanzyOQQ6FQT7R9RyB31KEjXx/9tgYEhopLVuSxwZqjPkn/yeux04MQF9wj5F/aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782319721; c=relaxed/simple;
	bh=r8SUQcCp3oOUGeXzp1ud6Kg1CzU0/PkvrDS3xpYQuSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSa5PMtzJw8BEn3JbfuZ0A7xijKQBaerIk4Upy5KhoYmiLXhY0YcW1LUZsuNtkn2wCZGQ+986atVo3thcu5vsVUs98xsImfX/Fz2qW25bJd2MRTHTu+cUOCn7RXpNtbo887WuUQZmKU3Dce2fnyL/dLvLy86AlJNINFLGsZ6fnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXuoHKe4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09641F000E9;
	Wed, 24 Jun 2026 16:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782319720;
	bh=B16ZfGRW2FDD4EalRw6jbRvtQww1cSDj03208KZHuAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gXuoHKe4o9cHfmCPOeJIPd1HCF7c1/UjlzpQL7H5m4AZNo2rIZuqTHGtvNX/IroLs
	 oxS96QhkGJLEImOSPlzezHJV30pvDhWBfEsCRXXN0g4DSbmTdnN6tU08pUXCOBI4+2
	 BuZyUPAgpe93gslNOdfPPuR9CSeoaz55eIxjMG0DsxaUlyhTZvC1lq3ZTEXToz2nvA
	 ajfLPg0DlEiGQI/cxOqNPOHzTBHdFsRursT+Tg3gpEx/MSevawtbMP7HFmewelIa+F
	 3KdE84bWJHlgWiY2AXuF+7B09pIucISZBNZsz+eb8Q/c3WBLOCA4wNnvNLwV1ZPoGq
	 IOnbiqJwShVag==
Date: Wed, 24 Jun 2026 17:48:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, skhan@linuxfoundation.org,
	me@brighamcampbell.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: dt-bindings: microchip,pic32mzda-sqi: Convert to DT
 schema
Message-ID: <20260624-charter-footless-9752837b15f3@spud>
References: <20260624061329.130468-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kJnnb0MVSAAFGHi3"
Content-Disposition: inline
In-Reply-To: <20260624061329.130468-1-challauday369@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6737-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:challauday369@gmail.com,m:tsbogend@alpha.franken.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,spud:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 764536C017C


--kJnnb0MVSAAFGHi3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 24, 2026 at 11:43:29AM +0530, Udaya Kiran Challa wrote:

> +  clocks:
> +    maxItems: 2

Please make this an items list too (and drop the maxItems while you're
doing so).
pw-bot: changes-requested

> +
> +  clock-names:
> +    items:
> +      - const: spi_ck
> +      - const: reg_ck

> +examples:
> +  - |
> +    #include <dt-bindings/clock/microchip,pic32-clock.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    sqi1: spi@1f8e2000 {

And remove the unused label here.

Thanks,
Conor.

> +        compatible = "microchip,pic32mzda-sqi";
> +        reg = <0x1f8e2000 0x200>;
> +        interrupts = <169 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&rootclk REF2CLK>, <&rootclk PB5CLK>;
> +        clock-names = "spi_ck", "reg_ck";
> +    };

--kJnnb0MVSAAFGHi3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajwKZAAKCRB4tDGHoIJi
0lbZAQDKDnqx+ZFA3ZbN+nQW+roXEoYvmzMt1ukqFJxMyQdgzgEAh0lyj2De4ZOH
mSzxJOJN3m7u5GZrxUqJi8l+vd/bGAQ=
=ElHG
-----END PGP SIGNATURE-----

--kJnnb0MVSAAFGHi3--

