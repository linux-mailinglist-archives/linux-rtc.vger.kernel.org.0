Return-Path: <linux-rtc+bounces-2168-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C8399A6B3
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 16:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCC451F23325
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 14:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BFB12E1E0;
	Fri, 11 Oct 2024 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQi8qIMV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC1579DC7;
	Fri, 11 Oct 2024 14:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728657928; cv=none; b=HMp8rIhaxtBMMj3us34FIKobukvrv7AdZKx5eqZu3HqclZo6TtEYbCiEcTScqhs+FOqztSk6b52TkBv/OVp8HdO7zpv1i/mEsyqKqE673dcISzQVcTT5mj5/EQ+tgY5JUpBEHOJYpUIcY3FJYg+ZINL8K6RigzX2wqlGnDzmM3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728657928; c=relaxed/simple;
	bh=Kf4RmL1eFhHWtgVhMXLKXNDA5oA9mv9BqxY/AcsVGn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqRFbg/lvHYMrjbYpQfwe1UhZt/4uhJJeDfU7u5NjRcmKPHLgzd70d69+67YGfGjxOVqrbYsHV9rr35fPkn5q0Zg78Rchgy+Sx1CFVCEEiGKwgNQOdCNYkXYERET/2sHDa2InrUYus7PGE4U5xxvKiHuhHsHDrTjXk+6HoL+Hl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQi8qIMV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC743C4CEC7;
	Fri, 11 Oct 2024 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728657927;
	bh=Kf4RmL1eFhHWtgVhMXLKXNDA5oA9mv9BqxY/AcsVGn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iQi8qIMVeBiovHvQ+lETOWc0aXFbi3B/6GxeNyl+tY3KHSXC0CLkq1zmOshRhfq6H
	 UTol437DZ1SKckikehWUE8dkBeubSxDiMHEeI3sS3CfvbL6S6D+6HvI/el8L40rz1j
	 58Jsfh/QB6xDOSrRWGGRv57zR5/jRtTUFv+L4Rt2Gjs15KmaThmUM4FTHPIhVGy5D9
	 hp8eQ27/aBuyQM55W7fFk9HiAqMQiLelCnWAD41fqO74Ur6B67F6UWU5lo/iQoCHMf
	 wqTOU5vwF93PK+InJIYSOOgCTOhH+Fvq6w7vq0Vm3IMZw+7b0CjSvu6QX0wKwGRAIl
	 knzc2utoDUSkg==
Date: Fri, 11 Oct 2024 15:45:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Conor.Dooley@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Daire.McNamara@microchip.com,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: mpfs-rtc: remove Lewis from maintainers
Message-ID: <20241011-prominent-strode-37ed00b909c6@spud>
References: <20241011-boozy-blinking-f76d3891dacd@wendy>
 <c565f64b-9d5b-4dee-945d-44be9762282e@microchip.com>
 <202410111230367324262a@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S1WjI273VcJPVlbn"
Content-Disposition: inline
In-Reply-To: <202410111230367324262a@mail.local>


--S1WjI273VcJPVlbn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 02:30:36PM +0200, Alexandre Belloni wrote:
> Hello,
>=20
> On 11/10/2024 11:00:40+0000, Conor.Dooley@microchip.com wrote:
> > On 11/10/2024 11:39, Conor Dooley wrote:
> > > Lewis hasn't worked at Microchip for a while, and IIRC never actually
> > > worked on the RTC in the first place. Remove him from the maintainers
> > > list in the binding, leaving Daire.
> > >=20
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > Noticed him in the CC list of your rename, figured it was worth remov=
ing
> > > him, even though I don't /think/ our mail system will create bounce s=
pam
> > > in this case.
> >=20
>=20
> I never received this patch and lore seems to agree with me:
>=20
> https://lore.kernel.org/all/c565f64b-9d5b-4dee-945d-44be9762282e@microchi=
p.com/
>=20
> [parent not found: <20241011-boozy-blinking-f76d3891dacd@wendy>]
>=20
> Can you resend?

Sure. And I figured out what happened - I ran the command to send using
my kernel.org address from the corporate network, where it cannot be
used. It delivered the mail to microchip.com addresses though, for some
reason I don't quite understand, which is why I was able to reply to it.

--S1WjI273VcJPVlbn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZwk6AwAKCRB4tDGHoIJi
0q6CAP4jVD7UDP/knnHAx80v4iwjG8ZZd1dV58TqfR+ij0T2egD/QNCJ+X+q69O2
f932G8c1Q2+4XDYyTDv4B4k2bmo0VAk=
=x2nR
-----END PGP SIGNATURE-----

--S1WjI273VcJPVlbn--

