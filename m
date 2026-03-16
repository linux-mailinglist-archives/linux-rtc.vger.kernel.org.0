Return-Path: <linux-rtc+bounces-6227-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGWAInVDuGmLbAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6227-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 18:52:53 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9E829E930
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 18:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27A7A302EE90
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 17:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9733396E9;
	Mon, 16 Mar 2026 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRBXa2ov"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDEC301004;
	Mon, 16 Mar 2026 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773683236; cv=none; b=PZNMVJOWRJd8c2tfbzb2fQc3L+iaenpYOSPVlkjNFqGqOgf5yDJxELEPWnsw7D0aYVOvSdtp3Us6RCuSaDlrsiJtjZadxUVSdBrraY0Qgk030WklKuwrlZDIDA/xe3kKhar095cHT+ANMa7aEkCi3T8W+XEAzQxETz3zcjfRL1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773683236; c=relaxed/simple;
	bh=dnDuwXGZ1btx0I9ScP/HNHG9vbVZo5zMOWlpux0W4WY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKYnYDcaw+SDrnUf28nY8aLKqQ0nsaGcIvwVDOQSsoomeslzFZOdPvvXuqQVvkCwhH+3Wa4izg2Xwyd9JVZwCEh+qG3GbvvPQC9CMAbq8J9Gu0pR/W9EjVC3nIGQ+EUxEpU7sJUel/xeWW+IzTS3C9ZPeroKJWiEqvrlR5y0+84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRBXa2ov; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69BFCC19421;
	Mon, 16 Mar 2026 17:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683236;
	bh=dnDuwXGZ1btx0I9ScP/HNHG9vbVZo5zMOWlpux0W4WY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sRBXa2ovvjPnWmoWwcUZlUb/RfNIKCBxJYUgGqWYE+olH5e/05xmKOMn3PMn3Bxq8
	 Sm0RPOKtJgrFA4Nkna/SfM63GmGOjUcqhNOYPE5XT8hDbTrlYcVkWZ5EzY+jprOrRV
	 l4Viqa7XAxFuU+rATnPUZYB48xFh6rMSI83W27iHNJjWLHREjypaENdzy/QzPBAdK3
	 qOABTEsGsrgj3ajoNm0Gg6WLlNHu9IvYa+UNT73TeY7utnqPEN+vZG0sDR9BaOi8QA
	 0XJU1kq/TxMTtEfK9n13gvkI74v1W4TiIWlCMY0nyY+YEx6zNL3h/lJ3umTM3hkX5Y
	 cEen2C1izEUvA==
Date: Mon, 16 Mar 2026 17:47:06 +0000
From: Mark Brown <broonie@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Jerome Neanne <jerome.neanne@baylibre.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Joseph Chen <chenjh@rock-chips.com>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Lubomir Rintel <lkundrak@v3.sk>, Julien Panis <jpanis@baylibre.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Alexander Kurz <akurz@blala.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 04/15] dt-bindings: regulator: act8x: Use generic
 power-controller schema
Message-ID: <fd6b7103-2a72-4cae-8e92-44ee9586a953@sirena.org.uk>
References: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
 <20260316-power-controller-v1-4-92c80e5e1744@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xItI8zXtmIATo4FR"
Content-Disposition: inline
In-Reply-To: <20260316-power-controller-v1-4-92c80e5e1744@nxp.com>
X-Cookie: Excellent day to have a rotten day.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6227-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,broadcom.com,gmail.com,ti.com,baylibre.com,crapouillou.net,bootlin.com,sntech.de,rock-chips.com,collabora.com,kemnade.info,gmx.net,v3.sk,blala.de,vger.kernel.org,lists.infradead.org,nxp.com];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 2B9E829E930
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--xItI8zXtmIATo4FR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 10:47:39PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Convert the binding to use the generic power-controller schema instead by
> referencing power-controller.yaml and removing the local
> `system-power-controller` property definition.

Acked-by: Mark Brown <broonie@kernel.org>

--xItI8zXtmIATo4FR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm4QhoACgkQJNaLcl1U
h9ACOQf+JqpHS2vvWDBGmTprNgfkrZ9Q44lgSNbWZMnktfJE13q21QKHK5kSnDrO
X40ZRgtewonmiGVIcifBtNjgoqkmY98pJvPnhgJjgP3fmBlFL/WCxYwUjF/JQCkg
LrlVyB6IdKDWWAmUUVULvowVdo1TyiYZ2dlrvVwjGuMZJDgRFAz85fobiqkW9hIb
5Z6Wdof4lcERkIE0dsbXctCTU4GJTupsC6duor8XTKC+wIL9sx02un+kINcyGwnP
FwEkgvpfw9H/r9/jBuxTEQh7QcJPvlx36Ub2mFuBlF3OCJApRlm+j+vz9btoTkX4
XZN3mowbqzv9xO9cSelYbJCV/FMs2Q==
=SWwQ
-----END PGP SIGNATURE-----

--xItI8zXtmIATo4FR--

