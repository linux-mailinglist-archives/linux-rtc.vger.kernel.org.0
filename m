Return-Path: <linux-rtc+bounces-4066-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25098AAFCD1
	for <lists+linux-rtc@lfdr.de>; Thu,  8 May 2025 16:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BF94981E37
	for <lists+linux-rtc@lfdr.de>; Thu,  8 May 2025 14:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89CF26D4CB;
	Thu,  8 May 2025 14:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUJXg9+E"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43B4AD2C;
	Thu,  8 May 2025 14:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714243; cv=none; b=r1ZZxh1kHs0lE6oTge8kfkAbSGM/Yy2u3NaThu4jNZS3X0XB0FqnGxHzy4kEYOp8PjPN+Ha+L3+lHt/CzRJl1ZX6Gpuux0Y61hS8Ux5Q7l5iDoVsnfRTC5Z+H4J6Nrfw9vZkjzF2VVRHu9348juBVzJ8fYGglMt/OE3ZZHLFTug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714243; c=relaxed/simple;
	bh=aN9hg80J1XGlnHHGqshUqcMmNZK3k/Pr16f86dpLGK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q61+dz5HDpnwdMQumVtUAvIhAG2utjs0r8ZRz4cmxqI4UOUYCdTeJsYEnwVlBfCSJys7aLF1qJnM5aGUzT9at2ykDwFaAEU5OJBF6HZ+L1ZQjCT56pDkI9/84Q1y2dhEzuaNB1X3Z5tV3zymN2kkuj4QZkWT3l+wsshGHMKwJYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUJXg9+E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E47C4CEE7;
	Thu,  8 May 2025 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746714243;
	bh=aN9hg80J1XGlnHHGqshUqcMmNZK3k/Pr16f86dpLGK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUJXg9+E4dDFp8Ia6fnrdDPwaid09PHVx9VhhTGoa9kTcDPn1mJMalx2ChucYoPuI
	 mDB2uc5Lga36fK1QudOd2YpuI3kaV+zTs9Xn92+EYqmvj5MfQ7nW5Pr4ZW8PGLbv9Q
	 +1Vv/1tUEesHWVpmDIuiS41gedt8QD+kGvJicTS2N/5laRtCzbdIF+iSM1gOS570EW
	 7w0aSMotAUpuxuAujLvxLqBXp1Bz8vCiAvbucLYFsgVsvGszokCYtrRxFYajwDAZpE
	 KL5fs11fKvVUxoye0CShpWcfRowD8r6AUswpuswhwmW5FyITlLQdO9833GppvBEvqW
	 hKT10YiBehINA==
Date: Thu, 8 May 2025 15:23:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Pankit Garg <pankit.garg@nxp.com>
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	Vikash Bansal <vikash.bansal@nxp.com>,
	Priyanka Jain <priyanka.jain@nxp.com>,
	Daniel Aguirre <daniel.aguirre@nxp.com>,
	Shashank Rebbapragada <shashank.rebbapragada@nxp.com>,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [EXT] Re: [PATCH v3 1/2] dt-bindings: rtc: Add pcf85053a support
Message-ID: <20250508-goal-harmonics-e8c286f74954@spud>
References: <20250507072618.153960-1-pankit.garg@nxp.com>
 <20250507-zap-dyslexia-924cfd1b6ec9@spud>
 <AM0PR04MB6515B27367279C935A295379E78BA@AM0PR04MB6515.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Gw17r1zC+sZ3XFtH"
Content-Disposition: inline
In-Reply-To: <AM0PR04MB6515B27367279C935A295379E78BA@AM0PR04MB6515.eurprd04.prod.outlook.com>


--Gw17r1zC+sZ3XFtH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2025 at 05:21:47AM +0000, Pankit Garg wrote:
>=20
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Wednesday, May 7, 2025 7:53 PM
> > To: Pankit Garg <pankit.garg@nxp.com>
> > Cc: linux-rtc@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org; conor+dt@kernel.org; robh@kernel.org;
> > alexandre.belloni@bootlin.com; Vikash Bansal <vikash.bansal@nxp.com>;
> > Priyanka Jain <priyanka.jain@nxp.com>; Daniel Aguirre
> > <daniel.aguirre@nxp.com>; Shashank Rebbapragada
> > <shashank.rebbapragada@nxp.com>; Aman Kumar Pandey
> > <aman.kumarpandey@nxp.com>
> > Subject: [EXT] Re: [PATCH v3 1/2] dt-bindings: rtc: Add pcf85053a suppo=
rt
> >=20
> > On Wed, May 07, 2025 at 12:56:17PM +0530, Pankit Garg wrote:
> > > Add device tree bindings for NXP PCF85053a RTC chip.
> > >
> > > Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
> > > ---
> > > V2 -> V3: Moved MAINTAINERS file changes to the driver patch
> > > V1 -> V2: Handled dt-bindings by trivial-rtc.yaml
> >=20
> > You forgot to add my ack.
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Yes, I forgot. I will add it in v4. Let me wait for more review/comments =
for couple of days.

And if you don't get comments, don't resend just for that, the
maintainer will gather the tag.

--Gw17r1zC+sZ3XFtH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBy+egAKCRB4tDGHoIJi
0gqPAQDe/4q/UyeP6dPWUPYthLWIvzfWSvgf4jTICXhQMmrOPAD/QVUS/o+OO7Xz
FSM2vXiZMzuEZl2D5bhHzxlHikieMAs=
=O+lW
-----END PGP SIGNATURE-----

--Gw17r1zC+sZ3XFtH--

