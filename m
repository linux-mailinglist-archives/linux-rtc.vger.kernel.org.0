Return-Path: <linux-rtc+bounces-3834-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 780E1A80F22
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 17:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E90B916B504
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 15:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24A61DD526;
	Tue,  8 Apr 2025 15:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SRG4MO3K"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C46A1DF252
	for <linux-rtc@vger.kernel.org>; Tue,  8 Apr 2025 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124422; cv=none; b=iD7exXwrgHYsVWOFOUMXQlgWSRHR/IsbFbnyZj8aUIG2V+UAKBEQZlNiv/TBV+dPB0DOQNgufIfsqlFFxYOURu8x51ld50DyHK9dTONLNnaRvnfpIUjL16aE6iKk7WAhHN7JzEzTs472cRjsk18gR8ROWFzDiZ9BZ7oWrFx9s+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124422; c=relaxed/simple;
	bh=LekaMcJBmwO0dBp6xUmNHy7AZGB9+z57rJom0JEmKrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNMx7GbsJ2KwP/WvWMV+QUq9sT1LL3PkjCgyDvma8IYxz+wwSVE5tYFz5lr/CuGjJTMoJtwX60uhzhr9OE/JbJFpSy4niwdlAsIFs6diKUPkP47cn/mhJSY8A04fVWeeSozTb/XaUhIqTimjKdNuhYMTvzctju/VUNpjP5za9Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SRG4MO3K; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Leka
	McJBmwO0dBp6xUmNHy7AZGB9+z57rJom0JEmKrU=; b=SRG4MO3KnBQHFa2DdePC
	5XnNDRNXJr2ByyTpY0wLXyhJF5xYfU+KhgM5F8fbtUK6w91rWt4E26rEu+eVFyre
	58ZfZs4WyFkikANJzTP2kfjcn+5TBR4N9dArX7nY95Svh42xkZXkCCe7sUUVGYVa
	xVVbh6vTYoFoVL5+tvNP28WkPxWPP2v/eNIZtngtexP+jiWpFQ0AbN9cEAYel+QG
	CFaDNYZKo0sKFDnJq4wsZqwgbTubS1eouyK4bw9jW7xWNBx/Wry0l1QbrAgLDVvm
	UukIaFdxl9w0uKU8xkzg1St7YsI4WYaQSkwA0/rz/rgoLSzqMmexcoG2Mvg17QGx
	Fg==
Received: (qmail 54653 invoked from network); 8 Apr 2025 17:00:15 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2025 17:00:15 +0200
X-UD-Smtp-Session: l3s3148p1@+CI1nEUyaNIujnsS
Date: Tue, 8 Apr 2025 17:00:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: rzn1: clear interrupts on remove
Message-ID: <Z_U5_rJJaDl4Bfia@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
References: <20250312100105.36767-2-wsa+renesas@sang-engineering.com>
 <20250408142636821de253@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xK5TWmjgZ3PdhLqE"
Content-Disposition: inline
In-Reply-To: <20250408142636821de253@mail.local>


--xK5TWmjgZ3PdhLqE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2025 at 04:26:36PM +0200, Alexandre Belloni wrote:
> On 12/03/2025 11:00:00+0100, Wolfram Sang wrote:
> > It is good practice to clear running interrupts before removing the
> > driver. This is not really a bugfix because on current systems RuntimePM
>=20
> This is not completely true, most of the drivers would leave the
> interrupt enabled after removing the driver because it can still
> power on a device.

Ah, okay. Good to know that scenario as well. Thanks.


--xK5TWmjgZ3PdhLqE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf1OfoACgkQFA3kzBSg
Kbahkg/+PbB0dGJkcLxZmDaCZOEZ2j11bYKieepKs8S1KN53rdcVBwV3ZsjKqAtg
BQO9EdHsoi2aNzUNzSP3CIIHPmZ4m9tELWzFDa/WGNjvuiV28fJcjiA7kjpUeNrN
QnsdvF2siGhe3Pa07czREOd/QGoCh88cqRItPdnWdJrwZTM8MnS2qOaccmE1fMCT
861tmby0mOTBQzRebLAfeeesxnmwGIhfL2svU64wnNqDu+ap+XZn/Z85wk/CWZJX
xw5826kwzPz1Q4ExddD5Ky7y2eBRH7ZeNrO4nfVgjE568v/VWV4X+HUTluDa278N
rCyCmLIuml5YWJPn+/Sa15LB3gxCymRZxdGJtHVVcoeYUtj49vfPZMsPLjw4HUNG
uEu5qTRssvttMaX8I9zeHYLl20PAHEs9ETP828/OGw5nKo+FWH9wfFC0U+XPo3Uw
VobNS6f1U7SzH2re1D9cECXkwzxtHeyTPE0lZkQDVjynFIqEPsSywssWVPaNotvl
9FRpxneweBVGdweyNjx/bThvQBcyYgVekprjlsU/BcuOlL1CwW2l1hmDsNSS7DKM
K8BD7VLO+T+5KULCm+ZPNp2lWhLl6lEcosGV0l22esjZr3UQ+QUxn99qw4b7Leo9
AoplSMyRBzbC3FmZHEOH4ZppmYefcZ6MLMdS8r+fwHolL2IVQXI=
=Ikax
-----END PGP SIGNATURE-----

--xK5TWmjgZ3PdhLqE--

