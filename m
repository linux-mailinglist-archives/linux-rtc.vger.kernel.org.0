Return-Path: <linux-rtc+bounces-2075-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB28098A64C
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Sep 2024 15:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F351283522
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Sep 2024 13:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D3319994F;
	Mon, 30 Sep 2024 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ohj+Snd7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E81191F82;
	Mon, 30 Sep 2024 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704405; cv=none; b=J7Y1PLwr1UptsnU05CASMckzvrO39PLdzJ5xrBINSuFnB7z9hEhYjte3flac5hLUQgPJa4NgTZxl9Yj1WlA5SmOWVdciHE6PuJRZU7vAEFA7xFQPFtzqJYIwSWhaPdMZEOsR2HTUiv8jspsBUse4MU8MCHzwCn64wOrRoR0FRrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704405; c=relaxed/simple;
	bh=IXrxPdiDBBp6ssz1JCCfL9zRQWsqO1wwKVPBmaF6ZYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtk0E7jBcuz1vrb6Iv6o2+bCrQseoyfk3xsJoHSwUx8jPnpgZeyQSUXPLAlf9TD2znlHRPwkbOlE0H1d/Il9PbibtDw03xNdpg8H9oiTNV4KHnVgXHCAbSpP0KsqpSdLaCOP/B+pfUgBUFM+bJjKTXQ9QcS0n+s3Dzs/hJ4a8+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ohj+Snd7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B84C4CEC7;
	Mon, 30 Sep 2024 13:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727704404;
	bh=IXrxPdiDBBp6ssz1JCCfL9zRQWsqO1wwKVPBmaF6ZYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ohj+Snd7h4yesSWd9wlTt/Mqpk0WSZ1nGIyIjq/7LguoF2Erz47ZFkzz2O4zkHBDm
	 ndPwp1ekiyNhi13CulSGDZWEPscoHpqVY2GfZWdON+SWh1mG+n+k0ZKJFL8KRiQVah
	 83+v4oQ79bv8/weV4yK3Me7MWU4DY9NFaTI+Rbxp/Im/C2QEwkFfFRPzKUIO6qv8le
	 KukkphHA1iDVp6ycqXKeqzF2Qys491nURBPwfj1DpSZzTyQdyvMssvN4AisR4LW4kz
	 sSUgT/gfm4pO9c3oji7OpbyfxexSWC97Zl4cO5b1Ze+V7HaoLhMX7XdVMX+aqzcQV3
	 mgaj2p5uKEwPw==
Date: Mon, 30 Sep 2024 14:53:20 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Lewis Hanly <lewis.hanly@microchip.com>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 13/20] dt-bindings: rtc: mfps-rtc: Add PIC64GX
 compatibility
Message-ID: <20240930-doormat-lint-23d97075c3e7@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-14-pierre-henry.moussay@microchip.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VxVqhbLE3N8gZUMS"
Content-Disposition: inline
In-Reply-To: <20240930095449.1813195-14-pierre-henry.moussay@microchip.com>


--VxVqhbLE3N8gZUMS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:42AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX is compatible with mfps-rtc without any additional feature
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--VxVqhbLE3N8gZUMS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqtUAAKCRB4tDGHoIJi
0vmkAQD5kOHYrVx+KIekpSxC6wDdy4CTTShoRXIxaJTyVg3LlgEAgEE+BlD+GC+E
4vYNjIRwh7JEqE2PkE/RatR6rmROVwM=
=jsis
-----END PGP SIGNATURE-----

--VxVqhbLE3N8gZUMS--

