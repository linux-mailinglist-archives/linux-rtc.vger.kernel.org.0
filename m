Return-Path: <linux-rtc+bounces-5363-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7424C59D1F
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Nov 2025 20:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE7713B01A6
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Nov 2025 19:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AFC31B80D;
	Thu, 13 Nov 2025 19:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLJMUSLR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088F331B13F;
	Thu, 13 Nov 2025 19:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763062936; cv=none; b=kgMvBXjyoBNc+GDb5i4vag7YPWCbhZ3ZWEuztI8Xdvx4VTyhASwMpSBOEF23oKFIXYM4i2YaXH8P+HyFVQ1ep+TN7n1T9HbhrjMMjpRdpcE2Yz4e2JSFNPhESXGACZP14os6koU8e/xkzlXjTekfurb8Hw429N3kNIbsXsWB2u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763062936; c=relaxed/simple;
	bh=A9h68bjZ0tLdqAci8F7QKz1uPtFrIHkto3rjiX+qoIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEUMk4HAnvoQE6Akn6RH82ZrJiv8ewctY7X+3ghPbQ5Ti7RZCoUYyA8/YBe1RiqUq+soSZtKKhNx7t6tci7x+GJlE4gmcqenMiZUrl9Ma4EQOaoksZGT7dkufFYl4nOSgH+y8Pn0lClslby4B+GGN6rrPKr4jecAueZlouFkfxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLJMUSLR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42ED3C2BC86;
	Thu, 13 Nov 2025 19:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763062935;
	bh=A9h68bjZ0tLdqAci8F7QKz1uPtFrIHkto3rjiX+qoIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VLJMUSLRo0fCORi5M1NAxLYBhcgHwthyWr3NjY4nrJdDqSNuLB0MbrFX7ZLKbh0DR
	 8tJM8QXSnR6tlycratdza7Ap3mxBpuXwdYR3J6PLKw79ip2QMzEFdwhhwUqb1zsh+b
	 ZwzDiVT7dac2X9smP5rxybIctK1oLoqv6sfRjBWBwtt9+CGao5f4FPjphReq63CYAz
	 iJonxws/ICCXdSVMmH6X1/8FGnED8aOZfYAZ7yB2A0EVkxi3Pk5u6KHbQN/ceDv83Z
	 vjOc/RqbwZabOpGJZxhUXWfvhyeSw7Wxs3SP8VWnghF/Kge3IAT9+GQJSFvJOBWwH+
	 A5usn3ZXQ12pA==
Date: Thu, 13 Nov 2025 19:42:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	pankit.garg@nxp.com, vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com
Subject: Re: [PATCH v6 1/2] dt-bindings: rtc: Add pcf85053 support
Message-ID: <20251113-rival-flying-1b64332f04bd@spud>
References: <20251113054243.4045820-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bUpvfgMAMiJ9/B8z"
Content-Disposition: inline
In-Reply-To: <20251113054243.4045820-1-lakshay.piplani@nxp.com>


--bUpvfgMAMiJ9/B8z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 11:12:42AM +0530, Lakshay Piplani wrote:
> Add device tree bindings for NXP PCF85053 RTC chip.
>=20
> Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> ---
> V5 -> V6: - Dropped driver-specific commentary from property descriptions.
> 	  - Simplified and clarified descriptions for better readability.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--bUpvfgMAMiJ9/B8z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRY0kgAKCRB4tDGHoIJi
0gyCAQC+/xeKFEUF8rzmnVxGTsRPV7BxQIgprKmbuQAxBKLI+QEAyo1S1XkacxXs
ctbx3n/eqzEjLjBoAmcO/sXs95PvLwo=
=MXgw
-----END PGP SIGNATURE-----

--bUpvfgMAMiJ9/B8z--

