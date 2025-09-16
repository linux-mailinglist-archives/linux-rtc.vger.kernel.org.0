Return-Path: <linux-rtc+bounces-4911-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A36B1B59585
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Sep 2025 13:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 338F81B20E38
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Sep 2025 11:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96FC306D5F;
	Tue, 16 Sep 2025 11:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNad3RKY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B945823FC49;
	Tue, 16 Sep 2025 11:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758023463; cv=none; b=GpVe51IMkJWwXhDi3oJiyBZoRILYho7UAed4I8Ev4HaAvLh3lujg5e17n2vH86+yASbHAv3Yk614puAW0DY1laItTaGyMKe1Tm4Pqa+pkOfyRt7LfJxfC3aR+sYpRx3Ik7JpEqqjzI4an+XGCz1pQoa0uYAiKkE5m1UVd4PzEIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758023463; c=relaxed/simple;
	bh=O9kG38pgi0D/E0EHSpH0PQiWWgf3wcmCdMWQGXzMU7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNY9tN5Vkr8uIxIUHJFAE+6WNleZfvJBbfuvkiNlNE2L2Kvvl6w3puki2ynyLCZ6q8O75b2DL8Yu9GOZA7AM09/fj8eo1bPJNOGPHUtG2pQduk26tcXKVJPmSdk7y4y3+xLRhB1WXLKPlWwzz2LqTUuGxvMcaut6V/K1DqM9qE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNad3RKY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F20C4CEEB;
	Tue, 16 Sep 2025 11:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758023463;
	bh=O9kG38pgi0D/E0EHSpH0PQiWWgf3wcmCdMWQGXzMU7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNad3RKYUNxDWVNVggn8mkMBbzsSSHdr8HOOSsGLVY58B3KHr5YS3dLj8I0vphP+a
	 rgqq1ZjQLWRFd46s7QHqK5IimfxD9xVsev36qnb6c/tA8hQmQwWWrgk1FLavTJpEaB
	 PTa9OU9P3icuBmAJ+RzL1nDBxkCEXKv2becKF5A90bUMX1oo9i2m/nI1uW32VPOywC
	 fKELvj+jwfexhjZLjkMkraO7Tp+Ql3wz1/a1zR7ZKf4geHkIhbPmixJ5Z77sp0GOGW
	 WxW6pHCSF9Ahvjc68x7wqvTBbxVE/mVFUB4bKWrzkRi0KUMGshGdwC5FWhqox5p7gc
	 cCFZWkDN4KzYg==
Date: Tue, 16 Sep 2025 12:50:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, lgirdwood@gmail.com,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Message-ID: <c8bcfff9-9d2a-426d-9df8-100efd2af64f@sirena.org.uk>
References: <20250825172057.163883-1-elder@riscstar.com>
 <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
 <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
 <7aba368e-709b-49b0-b62c-f2f8250c8628@sirena.org.uk>
 <20250916084229.GG1637058@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CsiSrB0XCw5iECYx"
Content-Disposition: inline
In-Reply-To: <20250916084229.GG1637058@google.com>
X-Cookie: The people rule.


--CsiSrB0XCw5iECYx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 16, 2025 at 09:42:29AM +0100, Lee Jones wrote:
> On Thu, 11 Sep 2025, Mark Brown wrote:
> > On Thu, Sep 11, 2025 at 11:36:41AM -0500, Alex Elder wrote:

> > > How should these two patches be merged?  Mark has reviewed the
> > > regulator patch 3 and Alexandre has acked the RTC patch 4.

> > We'd both have been expecting them to go via MFD.

> Why?  I don't see any dependencies between them (usually a shared MFD
> header-file).  If there are no deps, it should be taken through its own
> repo, no?

I used to just apply things but at some point Linus complained about
cases where the MFD ended up not getting merged (missing the merge
window or whatever) so I've been treating them like they had an actual
dependency.

--CsiSrB0XCw5iECYx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjJTx8ACgkQJNaLcl1U
h9BVtAf/Vdh8eegOI/zDdzbexE8BWvzGsLLj34YbPnkG9avqAWDdyOGlUm7qZ7dD
gB+EXJIgXSb/6TaCBjLAgBNzsLI1B4V90Se36dcaypQXvhfZaVE6a/ASWlkIMsse
sJN80MRTL3ycen6usUT19d43eP0GSoXOolHECjE6iZ7lGoijBNvNJf4RTIRzAEKY
tl5AsUWUcGeNXhMvANijktnE4+kZOq/bqe6CY/qrBuSi4Ftv6gSzFwoZ0RP+GhnZ
nDh9KEbF1AR00hzX+JnjeDDRyQupVDgf+XbJl/9hFIG4glOsERztZ6LmB77twMIF
rIInm45SJIFTn6x7WaD9kMxf4Gkhww==
=B/MB
-----END PGP SIGNATURE-----

--CsiSrB0XCw5iECYx--

