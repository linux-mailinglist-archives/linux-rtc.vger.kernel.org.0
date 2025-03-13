Return-Path: <linux-rtc+bounces-3479-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5A6A5F254
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Mar 2025 12:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C0663BE143
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Mar 2025 11:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E032661A0;
	Thu, 13 Mar 2025 11:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="L0hloW59"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C96E265618
	for <linux-rtc@vger.kernel.org>; Thu, 13 Mar 2025 11:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741865369; cv=none; b=jTf2wL2/qZp3Xy7XlNtrWVqZ79sAX7z3y9NU6k2QIrI575BIk2M13Xgv0Rne6MpbFxaas3/yU8bVPZ6U8hxu8++FK0kmQbuCrkBq941lI2va8q3Y1WppuO1al/8F9ug9aKBiAEEriIXqbwazZY8XJ+1CvkYtd/GYsMDVb81Wh8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741865369; c=relaxed/simple;
	bh=MGUtEw5urHC7X6ip2aosmPLjXiGu86dQGn5fUk7vJ4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QD84snxAL2lRanYaVII1+GRIT2jNupksYPPftY0KwOrHfhA42JGyL6//vboZYVDlg2J5riuyBI2VBFCKj19+BUkGtM6v7Cvuq7wgLQXOZI9SKQPVlHQbxDTvnoJPiw2TU11BOvQJFiyZrg0hNW4/Urd0nQPRkjcliY+xeUAW9hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=L0hloW59; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=D7DF
	vmNLysh9Nv9Y83NP5pi5yTZ69dnE86jveurgivo=; b=L0hloW596bN9RaV6bLhq
	Nneoh/B9miPDrqm3JXCjaMXyJHfCv3PESNXEEE+HyhaMtv5/dYRVQxeoNH0jARwo
	lsZ6V2krPpq3+sB+dfJUBbEMs8H2Q/m9FI/RSdA+s/8gtw35ZM0K6Ks4i0XyfL+x
	NDk863yhIYbkw3PMx6WMSFVTldYO3GTemzhTnh0F3OYIzDfGad2WGh1o2SdsolEd
	sS7g1wGuXxpCwxDzMIjrxPDoHPCTYYMHeYQIME4NA/SCJg61E/cxwz60/tjBLREq
	p0/KWAob0LDNFoty7U6BbXHtvLXTUjXpDEmOiyhdZdgqC7mTl80emsAHCKKIlH3w
	HQ==
Received: (qmail 1595055 invoked from network); 13 Mar 2025 12:29:22 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Mar 2025 12:29:22 +0100
X-UD-Smtp-Session: l3s3148p1@IUwlojcwmo4gAwDPXyTHAJp038nK7dx+
Date: Thu, 13 Mar 2025 12:29:21 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] rtc: rzn1: support input frequencies other than
 32768Hz
Message-ID: <Z9LBkftPH5w7do6j@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
References: <20250313102546.27335-1-wsa+renesas@sang-engineering.com>
 <20250313102546.27335-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gu60bkU84sahAluW"
Content-Disposition: inline
In-Reply-To: <20250313102546.27335-4-wsa+renesas@sang-engineering.com>


--Gu60bkU84sahAluW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		if (rate != 32768)
> +			use_scmp = RZN1_RTC_CTL0_SLSB_SCMP;
> +	}
> +
> +	if (use_scmp) {
> +		writel(rate - 1, rtc->base + RZN1_RTC_SCMP);

We need to stop the RTC before writing to this register and setting the
RZN1_RTC_CTL0_SLSB_SCMP bit. I will include this in the next version.
Does not affect the big picture for these changes, though.


--Gu60bkU84sahAluW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfSwY4ACgkQFA3kzBSg
KbagPQ/+K761nkSCX94ojDB67Tt+45SrLtsXQQPvBG9NFGESeif5+93bvygsUBxg
pBjWUWXZhSGK5uDluSfmudnzBbQQndFj33TA5YMSbnlN5kLFg6evxb9zgam5zcYE
b/1MRrj5aPjVOQ7gLST2KjcJ+83smgla6LPpU1r/weGLOLqfr21obWv1qegBErFA
RA643tWAHEqpa2x/sTA3Lwx1k5Rq5oURtXfMGRZHKpsDmv74jwNkHPGJnzyox6iM
KH2t38gcfHGhrAd+WrPOljBwlbjgIAl1AuTf+jo0YNqo1PB/HkcqEoHUTm/woaBR
+9yH3ItipuICH6v6r6fqBVpb5JuO3bX1mGa8zQZG3z7bSwEXmXoRPpxYTU8WsOT9
QkQY85q44tsLJVYGIAEIr8wM5LVkvDrKgI10kIplUq9Pl4AgHgKYRDGKTlODbKPe
53cHSCOfdMDgNE6dw/bK9GVR7aHfNbB26IQHJKPjHQjOztks2IjTUBPzMGx+YAcm
BP2OXmcEnlFhQSHgA9NcxBNZZx3vS5RTA731eA/ITlXlooC4Y7lVTy6I2tjKFr5N
CBvOlxXSRbfMQeterc3xhW6moiyj24E0FpvWvPImT8VJtshTXd2z81oubOFrYp8N
iJ496z1pC2CzLbqq9FC88joVzpayOL4N9UdZQ7qc8gbiBk4k6TE=
=p8a8
-----END PGP SIGNATURE-----

--Gu60bkU84sahAluW--

