Return-Path: <linux-rtc+bounces-6539-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFGxD7bfCmqR8wQAu9opvQ
	(envelope-from <linux-rtc+bounces-6539-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 11:45:26 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC663569FAE
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 11:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F97E3004595
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 09:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F82315D33;
	Mon, 18 May 2026 09:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPoXYC2h"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03011C5F1B;
	Mon, 18 May 2026 09:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097522; cv=none; b=URg+7/nbxDv81Oa0J3O1S+fqpN2P5fTBXVsesETyXcvZTn03UZ32GMytx1WTU3tQgRC9ElxCBgcwDo7HH+OFxpwVfEtSvc//ZcvyW+ssKDerU+0EekhgjC9T3wgAiM0OVFAZ/6BKAzJHMo5sUJ8ylQBnK4GucFnbCeEYfHhbdcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097522; c=relaxed/simple;
	bh=ekbdShwcIxczhnsKIWa5bcQgD9P1oaKt+Qc+Ga35PGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fs3N63NmnQIUrdl53qinBK/RohMjIiXx2pIY8w22DJAuQOhRiPFt89iacBrbLuObeJ2hV9LpKS1q7G1yg4BU3PJ/0DquGrjUWX40SKQGZMVWX5mc/33R/yUKs2wdPLgZ/y5ZX64g2ip73a6ugiSadW7mvDPQHoThIzntQyH/fhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPoXYC2h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45244C2BCB7;
	Mon, 18 May 2026 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779097522;
	bh=ekbdShwcIxczhnsKIWa5bcQgD9P1oaKt+Qc+Ga35PGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kPoXYC2hN7yFXRGj+mmaf5+EWHtMyUlMGer2z8EUGdgB+G6SggudlVIi5YY/a3f6A
	 9pdMlZ6t7c+1Au4btqsOP2AcCYj5JdOlsOK4F9ukUEfM1Wxro7eTjVe1Z+wZl07ART
	 Xe8kIVMzB/bZqairmvVTuC+qBVqfFTxnhNRiRA1lFvZsxyHJOHw4bu1ze1R2P1ylzt
	 mLma86T5QAw4cK3568/VtvPzxeBuo93VSsfzmd6tdJb+xiw1dyf6THKXh9g2HBkaVf
	 Lrzt/pKdBHrk8LftQiEXmuBKgsFjVJ8Nj1Ym067Q+7eYHiejLOaFV/6n3Xnptdovjh
	 mb0rSoWG5ODvg==
Date: Mon, 18 May 2026 10:45:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Sebastian Reichel <sre@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Nam Tran <trannamatk@gmail.com>,
	=?utf-8?B?xYF1a2FzeiBMZWJpZWR6acWEc2tp?= <kernel@lvkasz.us>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 03/11] dt-bindings: mfd: add documentation for S2MU005
 PMIC
Message-ID: <20260518-succulent-plethora-2dba60fad426@spud>
References: <20260515-s2mu005-pmic-v6-0-1979106992d4@disroot.org>
 <20260515-s2mu005-pmic-v6-3-1979106992d4@disroot.org>
 <20260515-justly-recite-6028f4bfb24a@spud>
 <DIJK5FTQ5KWG.HOKZAOXHTGU7@disroot.org>
 <20260516-esquire-chitchat-0fffa597e2f3@spud>
 <DIKZ5L2HC2CV.YL3MZUJQ2EV6@disroot.org>
 <20260517-corrode-tuesday-a598ca734b38@spud>
 <d2f4cb7d-5c3e-4b9a-86ca-04262cbb9775@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5969qpGlZ4GaGWK4"
Content-Disposition: inline
In-Reply-To: <d2f4cb7d-5c3e-4b9a-86ca-04262cbb9775@kernel.org>
X-Rspamd-Queue-Id: AC663569FAE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6539-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[disroot.org,kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--5969qpGlZ4GaGWK4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 09:15:11AM +0200, Krzysztof Kozlowski wrote:
> On 17/05/2026 22:52, Conor Dooley wrote:
> > On Sun, May 17, 2026 at 06:39:37PM +0530, Kaustabh Chakraborty wrote:
> >>>>>>> +
> >>>>>> +    properties:
> >>>>>> +      compatible:
> >>>>>> +        const: samsung,s2mu005-rgb
> >>>>>> +
> >>>>>> +    required:
> >>>>>> +      - compatible
> >>>>>> +
> >>>>>> +    unevaluatedProperties: false
> >>>>>> +
> >>>>>> +  reg:
> >>>>>> +    maxItems: 1
> >>>>>
> >>>>> Move this above the child nodes please.
> >>>>
> >>>> But properties are sorted in lex order?
> >>>
> >>> Typically the binding is sorted in the same order as properties go in
> >>> nodes. Common stuff like reg/clocks/interrupts therefore send up above
> >>> child nodes.
> >>
> >> So, do I change this? For one, I don't see the same being followed in
> >> other schemas of samsung in the same dir (not that I'm trying to pose =
it
> >> as an argument against your suggestion), and this was reviewed by
> >> Krzysztof and is adderssed in v7.
> >=20
> > If Krzysztof doesn't care, then I won't ask you to change it.
>=20
> This builds on top of bindings for previous Samsung PMIC devices, so
> that's why it keeps the compatibles for children, I guess. No one
> complained about this at v1-v2 reviews, so when I joined reviewing in v3
> I did not, either.
>=20
> I don't think the compatible should be here, but I also don't want to
> stall that patchset. I understand that it is inconsistent review from my
> side, because other similar patchsets receive comment to drop the
> compatible. But I don't think we will be fair asking to drop the
> compatible now, when we did not ask for that in the early versions at all.


I think you misunderstood, we were talking about the ordering of the
properties in the binding file being alphanumerical, rather than the
more typical approach of approximately following the order of
dts-coding-style.

--5969qpGlZ4GaGWK4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagrfqwAKCRB4tDGHoIJi
0isLAPoC+2ifH81uWfXMtAlvAAtTQaUV7X6qh6Nc+Z94/owFvwD/exMi5AYart1x
BVUZIUTuLRbJ1/eK5g8MJY+2kZ7vjAo=
=wtO+
-----END PGP SIGNATURE-----

--5969qpGlZ4GaGWK4--

