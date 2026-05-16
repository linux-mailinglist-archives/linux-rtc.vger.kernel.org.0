Return-Path: <linux-rtc+bounces-6534-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD+hC/vuCGriAQQAu9opvQ
	(envelope-from <linux-rtc+bounces-6534-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 17 May 2026 00:26:03 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BE355E162
	for <lists+linux-rtc@lfdr.de>; Sun, 17 May 2026 00:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 825E63012CF6
	for <lists+linux-rtc@lfdr.de>; Sat, 16 May 2026 22:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0B938D3E0;
	Sat, 16 May 2026 22:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGyv3taR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AAE35FF58;
	Sat, 16 May 2026 22:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778970359; cv=none; b=fxff+zGJe+W6INMddQWiWfgM5btgklt158lyIyBhTQN1vkrznyaUmrjwn+TTk4YNWEswey485CFOqfkO6JcvwWfhyra+dWuW6ErhLqYj+CP/g37JJxjAvUIAIQfoL0lQX+bveVfFIfWp8NjYs9pQ6zOYjiTdcEEgERGB9HkBPR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778970359; c=relaxed/simple;
	bh=5nuPSDXwXXI1QlcU8CMtcUqyC9vn/weJSX9GgChGGvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UepDJYEcErIt1xIpDoOXKPExi4J8WSvvdMPjB4YU2Qg3qT7Sqzr+aCoMC/YHH2fYFlcjdFRY6DCjjSidd6aIRDOsGcCmqYhwtIrCbjRDTqJZvLz5dg+Fv5lofzYNrvGrs0LBgDawqhh3KVSS3MxBu58c1XbEgXAOvvT/t2dheOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGyv3taR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4382DC19425;
	Sat, 16 May 2026 22:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778970359;
	bh=5nuPSDXwXXI1QlcU8CMtcUqyC9vn/weJSX9GgChGGvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bGyv3taRr2+TNdsQzb9eKRhOujnF19Fy5WDzL5XrdjELsZHjW4y7wtbe1/4iGbwVU
	 /Kv7gv2B8qNNQ7sjekIOKxKluW5Xng0VTOnyciymMpR94VViVd349pdUbyv0oFK4L/
	 bVs6ouljOkBYdSZOVh8RDZWSF9MZoIDJSUvCFh9GcMQA4rbMcm0IqQWNWtRYQ9pLy3
	 5gAoteO7XXYvUGdxLTspaQj9mXDffqL+5Rdv7Zt3GKQJV60pXou24DBdECulFu7oHp
	 twUQYCo1jMkRjVvTGlLgQFGgmP/ZFMgk2F/Iq5n39yXRndeyz2qlRnfG2c7YY1KkBM
	 pf6gEG2pEEGvA==
Date: Sat, 16 May 2026 23:25:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Sebastian Reichel <sre@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
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
Message-ID: <20260516-esquire-chitchat-0fffa597e2f3@spud>
References: <20260515-s2mu005-pmic-v6-0-1979106992d4@disroot.org>
 <20260515-s2mu005-pmic-v6-3-1979106992d4@disroot.org>
 <20260515-justly-recite-6028f4bfb24a@spud>
 <DIJK5FTQ5KWG.HOKZAOXHTGU7@disroot.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OXmzgMHNmty/qj6e"
Content-Disposition: inline
In-Reply-To: <DIJK5FTQ5KWG.HOKZAOXHTGU7@disroot.org>
X-Rspamd-Queue-Id: 99BE355E162
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6534-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Action: no action


--OXmzgMHNmty/qj6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 02:41:29AM +0530, Kaustabh Chakraborty wrote:
> On 2026-05-15 18:14 +01:00, Conor Dooley wrote:
> > On Fri, May 15, 2026 at 04:08:59PM +0530, Kaustabh Chakraborty wrote:
> >> Samsung's S2MU005 PMIC includes subdevices for a charger, an MUIC (Mic=
ro
> >> USB Interface Controller), and flash and RGB LED controllers.
> >>=20
> >> Add the compatible and documentation for the S2MU005 PMIC. Also, add an
> >> example for nodes for supported sub-devices, i.e. MUIC, flash LEDs, and
> >> RGB LEDs. Charger sub-device uses the node of the parent.
> >>=20
> >> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> >> ---
> >>  .../bindings/mfd/samsung,s2mu005-pmic.yaml         | 120 ++++++++++++=
+++++++++
> >>  1 file changed, 120 insertions(+)
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmi=
c.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
> >> new file mode 100644
> >> index 0000000000000..0e6afb7d2017b
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
> >> @@ -0,0 +1,120 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/mfd/samsung,s2mu005-pmic.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Samsung S2MU005 Power Management IC
> >> +
> >> +maintainers:
> >> +  - Kaustabh Chakraborty <kauschluss@disroot.org>
> >> +
> >> +description: |
> >> +  The S2MU005 is a companion power management IC which includes subde=
vices for
> >> +  a charger controller, an MUIC (Micro USB Interface Controller), and=
 flash and
> >> +  RGB LED controllers.
> >> +
> >> +allOf:
> >> +  - $ref: /schemas/power/supply/power-supply.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: samsung,s2mu005-pmic
> >> +
> >> +  flash:
> >> +    $ref: /schemas/leds/samsung,s2mu005-flash.yaml
> >> +    description:
> >> +      Child node describing flash LEDs.
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +  muic:
> >> +    $ref: /schemas/extcon/samsung,s2mu005-muic.yaml#
> >> +    description:
> >> +      Child node describing MUIC device.
> >> +
> >> +  multi-led:
> >> +    type: object
> >> +
> >> +    allOf:
> >> +      - $ref: /schemas/leds/leds-class-multicolor.yaml#
> >
> > Does this need to be an allOf when the other refs are not?
>=20
> It has it's own properties, that's the reason. This used to be it's own
> thing in dt-bindings/leds, but I was asked to move it here in prior
> reviews.

What do you mean by "its own properties"?

>=20
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        const: samsung,s2mu005-rgb
> >> +
> >> +    required:
> >> +      - compatible
> >> +
> >> +    unevaluatedProperties: false
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >
> > Move this above the child nodes please.
>=20
> But properties are sorted in lex order?

Typically the binding is sorted in the same order as properties go in
nodes. Common stuff like reg/clocks/interrupts therefore send up above
child nodes.

--OXmzgMHNmty/qj6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagju7QAKCRB4tDGHoIJi
0tjjAP0QsRcLbAtRF7Rn4i6Ab0p2bDEVzxlNA01dpuXvDbgO6wD8CJqmCw9C5IDb
CgukiLh67dRUC0V2lBjZP7sW7or87AQ=
=Qrl5
-----END PGP SIGNATURE-----

--OXmzgMHNmty/qj6e--

