Return-Path: <linux-rtc+bounces-6617-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGKbNqOjHmq3IwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6617-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 11:34:27 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF4062BA33
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 11:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB86430356DD
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 09:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987083CDBAA;
	Tue,  2 Jun 2026 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNrP10ut"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D693C8C75;
	Tue,  2 Jun 2026 09:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391772; cv=none; b=fNpuU3p2z7hq7fKc8J92Z50b1vdcwCEcXsTYV/9futcEFwwcIx8IvXNbMjy8bIWdsrhdkq5uNDIT7xGUxK/54iPwq/Eh+itwkeKMV4c2SKwA7nU6ImXXg8abkGC187YpZRRTOtHMKryWWtGlEHIEB0GIa2VKK1PfKEPEKjVtdGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391772; c=relaxed/simple;
	bh=A7SImd4o2fER31n0dIMnWc6Bq/UDFpwvfvraQ0AODm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVNGXTXZSjTnAsuOvZtgmplcbf9H4hPOcWecw31MH4WdmAoNU2Mjb6QpFbKT0paLSKAcBdtlYGy5X8j2DTEV9YquawY9ftbq4KCTDIIPxYCbGKl/St80cgEV09am8dyrwccxFyypP2/QoRBkZFDGQDUEFZV3xSUgA97LlnK6iIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNrP10ut; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769191F00893;
	Tue,  2 Jun 2026 09:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780391771;
	bh=lH5knxgbqX8/3lsdm5nj+uNvYVsYtKLfkK4ffYsxzK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GNrP10utxVtWXLzXcio7C2JL9/NrdSxZvzDuIOA3uSC0Ty+8VpWHqaNFng1NMziOX
	 3mc6LBWe/F77mrn1g95sXRCZV/ZP4VKmhC8f3LL8Bu61L+EsyHPZUIljWnyphEfxNO
	 kGxYxNnFjrSm+IdcnZN7iL1EO9hdgQp2QjzpzebF+M8NmUpABTcsd0b4sCCjfY3d2K
	 NfbQKGBYn5lipbgrf7W3zdokvhRDUQSKpiFs+jOrkWw2WV3z1DFe9DF4y9bJVtYq7j
	 eF1UyYiyCdujLNueVtJBOxhVPVkaUrB7lO94PHHAQQWUNwN4xYsMwdZZhoGHRMH9f4
	 DHjeWny4inQuQ==
Date: Tue, 2 Jun 2026 10:16:07 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] rtc: mpfs: fix counter upload completion condition
Message-ID: <20260602-buddy-lumber-2be20af90924@spud>
References: <20260513-panhandle-ashy-70c6abf84d59@spud>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3s4pjNosPPIt5FlC"
Content-Disposition: inline
In-Reply-To: <20260513-panhandle-ashy-70c6abf84d59@spud>
X-Rspamd-Queue-Id: 5EF4062BA33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6617-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:email,microchip.com:email,infradead.org:email]
X-Rspamd-Action: no action


--3s4pjNosPPIt5FlC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Alexandrew,

On Wed, May 13, 2026 at 06:55:55PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> The condition that needs to be checked for upload completion is the
> UPLOAD bit in the completion register going low. The original iterations
> of this driver used a do-while and this was converted to a
> read_poll_timeout() during upstreaming without the condition being
> inverted as it should have been.
>=20
> I suspect that this went unnoticed until now because a) the first read
> was done when the bit was still set, immediately completing the
> read_poll_timeout() and b) because the RTC doesn't hold time when power
> is removed from the SoC reducing its utility (I for one keep it
> disabled). If my first suspicion was true when the driver was
> upstreamed, it's not true any longer though, hence the detection of the
> problem.
>=20
> Fixes: 0b31d703598dc ("rtc: Add driver for Microchip PolarFire SoC")
> CC: stable@vger.kernel.org
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Any chance this could be applied as 7.1 fixes material?

Apologies if I missed an application mail somewhere,
Conor.

> ---
> CC: Valentina.FernandezAlanis@microchip.com
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> CC: linux-riscv@lists.infradead.org
> CC: linux-rtc@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  drivers/rtc/rtc-mpfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
> index 6aa3eae575d2a..ece6de4a6adbd 100644
> --- a/drivers/rtc/rtc-mpfs.c
> +++ b/drivers/rtc/rtc-mpfs.c
> @@ -112,7 +112,7 @@ static int mpfs_rtc_settime(struct device *dev, struc=
t rtc_time *tm)
>  	ctrl |=3D CONTROL_UPLOAD_BIT;
>  	writel(ctrl, rtcdev->base + CONTROL_REG);
> =20
> -	ret =3D read_poll_timeout(readl, prog, prog & CONTROL_UPLOAD_BIT, 0, UP=
LOAD_TIMEOUT_US,
> +	ret =3D read_poll_timeout(readl, prog, !(prog & CONTROL_UPLOAD_BIT), 0,=
 UPLOAD_TIMEOUT_US,
>  				false, rtcdev->base + CONTROL_REG);
>  	if (ret) {
>  		dev_err(dev, "timed out uploading time to rtc");
> --=20
> 2.53.0
>=20

--3s4pjNosPPIt5FlC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah6fVwAKCRB4tDGHoIJi
0v7oAQCz1CCZBWpyWPNGEqYZ863RGC7Cs4/nJxTSqZo+lbBpjgD/S0fCwGvik9ow
UdXAUzjUecYvu2M9n+kHvZgLi3/dbA4=
=Buf5
-----END PGP SIGNATURE-----

--3s4pjNosPPIt5FlC--

