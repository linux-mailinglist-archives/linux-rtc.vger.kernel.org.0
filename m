Return-Path: <linux-rtc+bounces-6222-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC9mGDkbuGlYZAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6222-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 16:01:13 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B70DD29BE97
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 16:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3674E302BDC4
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 14:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8976230506A;
	Mon, 16 Mar 2026 14:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJh/lLK9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F5C3033E2;
	Mon, 16 Mar 2026 14:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672931; cv=none; b=t4IcgSt9vjBTx8rwGf/s8Y8GHOVGATVK82v09vOckdsAu+gbE/yQupeAnurcnOmbCWM57MxCQNKpWB0/JetD6IF8Vu6ecqhh01l6Z/ZV3mBg0bPFvSHhmFcjWfyQvgr7JVsMdBNeOuD5YXHs/mytflcfMOzLD2LaBfvh/oRpgqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672931; c=relaxed/simple;
	bh=DXurX+rXkNtKMNetYL42Wscz0IskX62tenc5ozVeitA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChSAbI7lS5M9OTZ2AsAd0sslJl6crikD53YTu6yHahj9wzmNZ00039vK0Uy4KbvohOT+GvdfmqY9BBPUu9h5eHZOS1hJ7waPM5mQlg0PdtDiYGJzc+NJAPrh8dFmN64LbBWQvZF6xdEEnT7O5BWezwg21ghz7bugUxDrkp18AI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJh/lLK9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AFCC19421;
	Mon, 16 Mar 2026 14:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773672931;
	bh=DXurX+rXkNtKMNetYL42Wscz0IskX62tenc5ozVeitA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJh/lLK9mQ4+tJsi/be7GN9483oLhqrwmr5gGA9yIxTr0zTqxRzRW53VKiDpS+znu
	 al1TPbiDEz7JLE3AqeSgHGq+ej/dN8cj1DdY/c7ah90EdaS1H6plBc+IN475XdaAdc
	 FfhBGf86zLMwlyannK/mE47+UFYTRd3UoHk/blPQ3d9PQct/l4lX12amujsz3xjfHG
	 6iqb4GGddwKFjL8zG/CdLEYRoTS8ftWzk6C82uxjtslnVFRGMoPijQQ3UenQwxxqg+
	 Fk4g+LelXVOHJGKC4jq20cV9YoUQOjywQrRyBudWaukf1rZdBBhlbNiCf1V0+qCDcd
	 ypRksCHLMX91A==
Date: Mon, 16 Mar 2026 14:55:21 +0000
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
Subject: Re: [PATCH 00/15] Convert power-controller to dt-schema and update
 various yaml file to referencing it
Message-ID: <f329f1b4-787e-4c8c-ba26-e419a047023b@sirena.org.uk>
References: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q5D3dN9fM9+vUHgs"
Content-Disposition: inline
In-Reply-To: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
X-Cookie: Not a flying toy.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6222-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: B70DD29BE97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--q5D3dN9fM9+vUHgs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 16, 2026 at 10:47:35PM +0800, Peng Fan (OSS) wrote:
> Convert power-controller.txt to dt-schema
> Update various dt-bindings to use generic power-controller.yaml without
> defining local property.

Are there any dependencies here?  It doesn't look like it.  In general
please don't send a single series covering multiple subsystems unless
there are actual dependencies, it just makes it harder to figure out how
to handle things.  Send a separate series to each subsystem instead.

--q5D3dN9fM9+vUHgs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm4GdgACgkQJNaLcl1U
h9CnKwf/Y45O1xRPr9mTmI28M1CvW30zJp5xoDJXzVFZW6jtEjIuA8mFy+dOgIj+
PkIOw9oNhVPJcUpY4vl8XJBEZDdEDPMwSOdMexgMsCCCeJBF1/2fEHkxI1xyTRlP
19Nh8e23AD9Qpm+0/Hjn/iDwpuYXhqRLxqw17yeReb8HyXAvnVcoLQAsonOHewce
imvplZGb9vkqG8UivYBCq/7Ar+eVs6vZGg2IEm5kn4EkVWj9xZDFMeP8G8RhbqnM
oNHrFPTft2T52cuebigvOum9pbm4WmO5U8BqTDHLldZRD0qfvdKSn1hGumXDnVfh
2O2qPvCp7KP1+oQbqttXJjEuIyoNLg==
=wZgr
-----END PGP SIGNATURE-----

--q5D3dN9fM9+vUHgs--

