Return-Path: <linux-rtc+bounces-2462-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3430A9BD4C4
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Nov 2024 19:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9748B283C2D
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Nov 2024 18:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61461E882C;
	Tue,  5 Nov 2024 18:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDzknkNi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A854E188703;
	Tue,  5 Nov 2024 18:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730831871; cv=none; b=RNcr8Dgqt9ZY/abi/5gbFuVGml9c77Ko/hPzqmw7mJmP3Okt/99pYv8jLrSMEulhUaJuL1/IGL5CI3AQKQIFwzruP7v7yorX/883dTsNW5hEyr8jnK0812AJ4W7Ornir2/ox304qc24zFugq2WOftx300LOloV45+u5st2EQS20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730831871; c=relaxed/simple;
	bh=W3QBAev3hXK8eM532TDH1kmmBvt7KGhrn8xsk9iVzVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6NDvn9Wm2BH20mHm1Vou08ksnyPwR72gtiA5H3Z+sAFr/yFDH7sBbVV0X8972N0bW60s9A21hMFYpqrbWhHG94Q3sf+JA5ste7O2CNjP2/JI2ZDEu23PWCo/NaocvKNypF14kiSXQP7eG19XvtY/134xuqSC1+LATB3+JTtwK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDzknkNi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67722C4CECF;
	Tue,  5 Nov 2024 18:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730831871;
	bh=W3QBAev3hXK8eM532TDH1kmmBvt7KGhrn8xsk9iVzVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDzknkNiNEOEfoLPTd6mu7J9wr3y/LRzX+1QFmL/NfLNX8sip7f65qR/om4VE3He5
	 MHHNF7Kv+00lnr0wxwe6vJwX8sIL60XxRNNXXtmCirurfsd/bWlS1zIggfsMcRcNv6
	 uy+KKmvBCBSvdUyY8eCyJn7rdKw3VkLdd8SzvlFu4HpoucMcS/pXSTxemPzEtkayGM
	 f0XHtVw2bUsVmthvQ3UJnamY2zkhVX+wUcsfvCf2hQ3AcJ0G+XEilbofpa5C7glNFq
	 +RYIGxXy0cNVdgWWQDOktHzaHjqzSTPNzfz02oy3XcgOEVhABnaWzniGkRRq3JGqMU
	 mSQlz4khpIa1Q==
Date: Tue, 5 Nov 2024 18:37:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] dt-bindings: rtc: mpfs-rtc: remove Lewis from
 maintainers
Message-ID: <20241105-boned-presuming-dec2b8b0da47@spud>
References: <20241015-surcharge-caucasian-095d1fd2fa27@wendy>
 <20241104-immodest-finishing-354430b8e386@spud>
 <202411042055393b9cf4be@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aNhBK/A8u2gHdejT"
Content-Disposition: inline
In-Reply-To: <202411042055393b9cf4be@mail.local>


--aNhBK/A8u2gHdejT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2024 at 09:55:39PM +0100, Alexandre Belloni wrote:
> On 04/11/2024 19:06:08+0000, Conor Dooley wrote:
> > On Tue, Oct 15, 2024 at 07:52:05AM +0100, Conor Dooley wrote:
> > > Lewis hasn't worked at Microchip for a while, and IIRC never actually
> > > worked on the RTC in the first place. Remove him from the maintainers
> > > list in the binding, leaving Daire.
> > >=20
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > Noticed him in the CC list of your resend, figured it was worth remov=
ing
> > > him.
> >=20
> > Could you pick this up Alexandre? I've got no contact info for Lewis, so
> > I doubt you'll see an ack from him...
>=20
> I will, I'm super late on the RTC patch queue.

Cool, thanks.

--aNhBK/A8u2gHdejT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZypl+wAKCRB4tDGHoIJi
0jqRAQCWam0slrqjLsuLwnxzyjrk39WsiuTsc0DQeZu2i6BNRAD/ejLc8o+ylQ25
utRVtpygEdpp4tSWD2ZcAoUe2xRgDQE=
=MdtU
-----END PGP SIGNATURE-----

--aNhBK/A8u2gHdejT--

