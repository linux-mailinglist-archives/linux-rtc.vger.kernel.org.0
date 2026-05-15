Return-Path: <linux-rtc+bounces-6518-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNP0HIBVB2p7zAIAu9opvQ
	(envelope-from <linux-rtc+bounces-6518-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 19:18:56 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CDC554CA1
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 19:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8DF98301F7F5
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 17:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C29F2F7F07;
	Fri, 15 May 2026 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bg4qjdF5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A8E2F7EFD;
	Fri, 15 May 2026 17:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778865292; cv=none; b=BL1LtRc4YBdxUY4lptuaZDobuSsl5BG0yx8A6OpL9g4ldftI6ranIghi2z08A3OsWTUes7nk5WrVUmwpVfBCRWL2cmPcq45P3jIYMShDKIxPeYUB7b2NzNLuEqcyFZ8N4nQ1sQ7KwvolI/0NIqjJzPElq/67W5HimAyQEDJ08WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778865292; c=relaxed/simple;
	bh=CtDfgDqnfSE+2T16bU11fTNtbRMQMBr75uetjnKvV+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krKPEMyZQOm0wlexaNz610lP1SwPFOQMiNRVdpjWcmdIV3aM8U+EmUhxlpBHL3yTeMqGqxsZdtLDvBjKBcWECATVtkdxNPsAIXgPHDLuOEqt/N1mrFLOntOYjRz970IpfgrZZ9Hnwjel0KLzyBPHpAPYfQ2wvRX1kAG1BvSjP+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bg4qjdF5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F6BC2BCB0;
	Fri, 15 May 2026 17:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778865291;
	bh=CtDfgDqnfSE+2T16bU11fTNtbRMQMBr75uetjnKvV+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bg4qjdF5ocEF5GUSFUJ33VvqKPCY0vB5UZkWQSJzTTWpwwUnPh/62U2qYQATBWNXx
	 IZBlUACG3Gh/ZcMuRouIZpdGthND4AjOKo45w889WFAPT8MeV/V14RhQkfTgEK1CBb
	 14MOMJSKtsZ3fLUW46BV6IPJOfE81xXvrzm5FmdRiqUaxGO77Odgw0SQ1ZPgZ09WGS
	 yJ34MhIA9Z5LzRgU3/mQa81lnOE/RnT+yof5qX+o4iT0s8X4nG5KsaSAw57daezUDJ
	 JOzkZ0+qW2E01yyXa0ud9PAantD5m7Ms/BuND21fnbn4a8Sc9Z1cybQsrmpEwV7jGd
	 BOQTJ3hraLQ2A==
Date: Fri, 15 May 2026 18:14:45 +0100
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
Message-ID: <20260515-justly-recite-6028f4bfb24a@spud>
References: <20260515-s2mu005-pmic-v6-0-1979106992d4@disroot.org>
 <20260515-s2mu005-pmic-v6-3-1979106992d4@disroot.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BicabgsLIYBYKY7x"
Content-Disposition: inline
In-Reply-To: <20260515-s2mu005-pmic-v6-3-1979106992d4@disroot.org>
X-Rspamd-Queue-Id: 13CDC554CA1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6518-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.1:email,devicetree.org:url,disroot.org:email]
X-Rspamd-Action: no action


--BicabgsLIYBYKY7x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 04:08:59PM +0530, Kaustabh Chakraborty wrote:
> Samsung's S2MU005 PMIC includes subdevices for a charger, an MUIC (Micro
> USB Interface Controller), and flash and RGB LED controllers.
>=20
> Add the compatible and documentation for the S2MU005 PMIC. Also, add an
> example for nodes for supported sub-devices, i.e. MUIC, flash LEDs, and
> RGB LEDs. Charger sub-device uses the node of the parent.
>=20
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/mfd/samsung,s2mu005-pmic.yaml         | 120 +++++++++++++++=
++++++
>  1 file changed, 120 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.y=
aml b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
> new file mode 100644
> index 0000000000000..0e6afb7d2017b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/samsung,s2mu005-pmic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S2MU005 Power Management IC
> +
> +maintainers:
> +  - Kaustabh Chakraborty <kauschluss@disroot.org>
> +
> +description: |
> +  The S2MU005 is a companion power management IC which includes subdevic=
es for
> +  a charger controller, an MUIC (Micro USB Interface Controller), and fl=
ash and
> +  RGB LED controllers.
> +
> +allOf:
> +  - $ref: /schemas/power/supply/power-supply.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s2mu005-pmic
> +
> +  flash:
> +    $ref: /schemas/leds/samsung,s2mu005-flash.yaml
> +    description:
> +      Child node describing flash LEDs.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  muic:
> +    $ref: /schemas/extcon/samsung,s2mu005-muic.yaml#
> +    description:
> +      Child node describing MUIC device.
> +
> +  multi-led:
> +    type: object
> +
> +    allOf:
> +      - $ref: /schemas/leds/leds-class-multicolor.yaml#

Does this need to be an allOf when the other refs are not?

> +
> +    properties:
> +      compatible:
> +        const: samsung,s2mu005-rgb
> +
> +    required:
> +      - compatible
> +
> +    unevaluatedProperties: false
> +
> +  reg:
> +    maxItems: 1

Move this above the child nodes please.

Otherwise, I think this looks good.

pw-bot: changes-requested

Thanks,
Conor.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        pmic@3d {
> +            compatible =3D "samsung,s2mu005-pmic";
> +            reg =3D <0x3d>;
> +            interrupt-parent =3D <&gpa2>;
> +            interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;
> +
> +            monitored-battery =3D <&battery>;
> +
> +            flash {
> +                compatible =3D "samsung,s2mu005-flash";
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                led@0 {
> +                    reg =3D <0>;
> +                    color =3D <LED_COLOR_ID_WHITE>;
> +                    function =3D LED_FUNCTION_FLASH;
> +                };
> +
> +                led@1 {
> +                    reg =3D <1>;
> +                    color =3D <LED_COLOR_ID_WHITE>;
> +                    function =3D LED_FUNCTION_FLASH;
> +                    function-enumerator =3D <1>;
> +                };
> +            };
> +
> +            muic {
> +                compatible =3D "samsung,s2mu005-muic";
> +
> +                connector {
> +                    compatible =3D "usb-b-connector";
> +                    label =3D "micro-USB";
> +                    type =3D "micro";
> +                };
> +
> +                port {
> +                    muic_to_usb: endpoint {
> +                        remote-endpoint =3D <&usb_to_muic>;
> +                    };
> +                };
> +            };
> +
> +            multi-led {
> +                compatible =3D "samsung,s2mu005-rgb";
> +                color =3D <LED_COLOR_ID_RGB>;
> +                function =3D LED_FUNCTION_INDICATOR;
> +                linux,default-trigger =3D "pattern";
> +            };
> +        };
> +    };
>=20
> --=20
> 2.53.0
>=20

--BicabgsLIYBYKY7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagdUhQAKCRB4tDGHoIJi
0n5rAP967mHX7SEKc4HenoyiF+90zXGlTKi1jFFe8mJ5Mu7VNgD9GcMBGU4IFdCj
uG66DaZrujqEElpBL/3tW71nwb4XvA8=
=9VUh
-----END PGP SIGNATURE-----

--BicabgsLIYBYKY7x--

