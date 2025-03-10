Return-Path: <linux-rtc+bounces-3445-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42796A58DD8
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Mar 2025 09:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02FF33AC774
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Mar 2025 08:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019402222A4;
	Mon, 10 Mar 2025 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ElBEvPr/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746342153D6
	for <linux-rtc@vger.kernel.org>; Mon, 10 Mar 2025 08:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741594633; cv=none; b=lqpnjZ7PaAwP+/eZF8Fjzl4YGtCZt76pydzB7jZAL1fjoC1dWV82TvFE34bcaCHFDjRvYiZeSPpCvxnmoFtuZa5HqZ6KIzJC3qCcDZ102W/p3I2gzacFC82wBgkzjXtrhVA/CYHN5AB19CqXCZpvr66z4b3uhUmUNU9olNva1FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741594633; c=relaxed/simple;
	bh=ajtTKpPOuwD8ouYXkz8A36B0kNdWX2gGS6ppiXisxGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyEF/sxTPfs/Ohejy9cli2QxaW88oUqmEghA2W123pka97DWsuh3qKP/FMQshWpybGW8tZToaZQ7t/TpC820k91atZor+HeeTlx1Aj9bmdrkd0Sczv/5ZwY4dAZnHW/N4LeFANIQP6DwNgVS0ljJkNcTl34nA+v2rNs753wRVYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ElBEvPr/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ajtT
	KpPOuwD8ouYXkz8A36B0kNdWX2gGS6ppiXisxGA=; b=ElBEvPr/sGAXiZEoS2rr
	sNpHG8FduedbNnJ26ZfH+Lp5ECEOlOzoMx8QVTHPNf0Ch9Lg2pMsDEs1H//rDxzh
	XrvRxuqpUYz1lncVEYoX6ZmWmeubRNahxjdiLv44/tplfiNowoGNglPnHtIOv30u
	Bsyl0cY90MrjPedhmCap/6P0gl4Ix+/I/Y1zN2k6zaIfQiMpfs9TmHz64HtVcMAt
	PQmwwC/sZv89vNu0yW34JzdmenJLsYjr0AR/oNNIvtRyL3Tr5SYbV26sCZnJCOUw
	2aKY0DXFRMaM3n18Zqr5zXSRfnV1Ul1dOoiJMquJa5S2LdpHSU1/5iu7m9WM/9aJ
	Ow==
Received: (qmail 391353 invoked from network); 10 Mar 2025 09:17:00 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2025 09:17:00 +0100
X-UD-Smtp-Session: l3s3148p1@T82WmPgv0KQtnPBl
Date: Mon, 10 Mar 2025 09:16:58 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: rzn1: implement one-second accuracy for alarms
Message-ID: <Z86f-tvJ42ui9Esv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
References: <20250305101038.9933-2-wsa+renesas@sang-engineering.com>
 <2025030522061502555577@mail.local>
 <Z8qYM2-LQPgIe2JE@shikoro>
 <20250307183817b7747a66@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pQaGs0Ax7ika6uLF"
Content-Disposition: inline
In-Reply-To: <20250307183817b7747a66@mail.local>


--pQaGs0Ax7ika6uLF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Yes, you followed the code correctly, I have a series that is removing
> RTC_UF that I didn't send yet.

Please CC me when you send this. I am interested.


--pQaGs0Ax7ika6uLF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfOn/YACgkQFA3kzBSg
Kbb/fg/8CkMc3D75OUlGQdkuFjaLXsCX+fkxAVVvPvbAhVf3HwQBrPxzLVbB5Fxl
PAEcu2DV5HPOsle5nfcSPOhKzSKHtsU8hgBS5RDoGm6TQX3mbVDLMzVRDLfp/keq
RVCO7y+RfwDayqMCfUILdK6kl3sJCxMVaY7AUbMoyMlp9nUBk6Jhcbv0u/7zFHI6
T0IC+GozzUCYTm1+iBwPu5MsZpb7pE1LtsKpIHJA19blDhqgEYcNIJtoKEyvklXq
NmUgMG3TKyAlycP5GBDd3sDEaG6imP3+tvgAYAMxudMs5SfMhCP2TVNuzvG4I6uh
SqXQbnZLbkiRgK5qlUZ9tDyDM3ApM7+bqaDBqYaf2Mb1CVD4AJpKA6QFCbdAzzPH
zQ2B/l2aKLc+M8aJoODtTfGVFWwybN5tc5pPrm13oqVk3PITe5lgSJxHjIuzF7OS
mvuoTzZHm+VneyDMitOUOUDA7jidDSk/ciH3MxvYsURrEwN+7Vj655ADcr8N32o0
R9lGeO/M8D0LsUe4jPPrONA+wxdLJ0aWec7PrK4pD+yubotowXDA1a5Qux6953+b
8qMwr61WPCrrFl4gN1Ivg8L+cNhjcTBH6fp+d7W9aYdhEC1Y0i0piAZRjMVfYud9
zJpXBEu1dYIYc5a+7WBz1yIcwA3zVTOm+TIJxQ5zvRMbML1c4Ig=
=jHoW
-----END PGP SIGNATURE-----

--pQaGs0Ax7ika6uLF--

