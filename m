Return-Path: <linux-rtc+bounces-5077-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FBFBCA4A9
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Oct 2025 19:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B41A19E756A
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Oct 2025 17:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4144D1F5437;
	Thu,  9 Oct 2025 17:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJzfYGeo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11934238C36;
	Thu,  9 Oct 2025 17:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760029208; cv=none; b=WXzZ8psWQl3kKg6VoHymRJyWgNwe16DQ90RgZbislZTDgqFWgXTmurZJ7E+K5RHM35BTP0RjmNW81IRZzkr9MW6XRIJk0tw1qzRyhj/fRFsX6+snoF2OARzR0BV1N5QDd8MRvK9Lfmy6OcFcEXMF26R/BBP60ERHf6YpsmzxoxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760029208; c=relaxed/simple;
	bh=G2CHGNI+49BOtqb9h/iVnnZjZjggEWpvGWFs/g9H2dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAuMjlGmXIMmr0o/WU9jb/k7IPkbYyJVDIytKqzuvm/fADBwTt6MNSxSKMuR0S0O8bQqb/Rh4Vi1s9FhgDKNyr09HtPcjrPpCzWpX5GqngdqLhnKHb9c6cTxFkADIyK6cDPTiccUPOPo6cRk9zNJ0TxD1DNl31YiEkVi2KPu2Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJzfYGeo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD078C4CEE7;
	Thu,  9 Oct 2025 17:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760029207;
	bh=G2CHGNI+49BOtqb9h/iVnnZjZjggEWpvGWFs/g9H2dM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FJzfYGeo1lUXeRWrzwL9uHrSvoIrxfzPBsE0W7TdedIRCOQF3BNsU1Ee2PgUmCTMC
	 Fn80iXbaSzX+MlMknrHHAca2DVSdwZ8pdqLWmCb6zJRK1erkB5FQL369norei96RI4
	 RgoID1pScvvb6h9ejuslgTXEoTEHpmNKHXFL7IbcU1u7EZFup/zt4zwJcEEqIcc0hg
	 eAhdUsw2uNRpNqgtZKNAchpHOnsoDOxzNmEv9ijeDLqNnj/rtO5jZNbnuWwsi306JF
	 8aYqYD/bQU4+QiQVNblrWalz9wcOQU9BKV8x+TEgGeUh+N6GCio/7fuTEiYi0nEI32
	 BEFk5KMowSN+w==
Date: Thu, 9 Oct 2025 18:00:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Pankit Garg <pankit.garg@nxp.com>,
	Vikash Bansal <vikash.bansal@nxp.com>,
	Priyanka Jain <priyanka.jain@nxp.com>,
	Shashank Rebbapragada <shashank.rebbapragada@nxp.com>
Subject: Re: [EXT] Re: [PATCH v4 1/2] dt-bindings: rtc: Add pcf85053 support
Message-ID: <20251009-shrank-caucus-5f42afa398fa@spud>
References: <20250923113441.555284-1-lakshay.piplani@nxp.com>
 <20250923-capitol-easter-d0154d967522@spud>
 <AS4PR04MB93620F7CAD21F745B95FAF1CFBEEA@AS4PR04MB9362.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uFXH1ifJjfs5WzZx"
Content-Disposition: inline
In-Reply-To: <AS4PR04MB93620F7CAD21F745B95FAF1CFBEEA@AS4PR04MB9362.eurprd04.prod.outlook.com>


--uFXH1ifJjfs5WzZx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2025 at 08:13:49AM +0000, Lakshay Piplani wrote:
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Wednesday, September 24, 2025 12:28 AM
> > To: Lakshay Piplani <lakshay.piplani@nxp.com>
> > Cc: alexandre.belloni@bootlin.com; linux-rtc@vger.kernel.org; linux-
> > kernel@vger.kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> > conor+dt@kernel.org; devicetree@vger.kernel.org; Pankit Garg
> > <pankit.garg@nxp.com>; Vikash Bansal <vikash.bansal@nxp.com>; Priyanka
> > Jain <priyanka.jain@nxp.com>; Shashank Rebbapragada
> > <shashank.rebbapragada@nxp.com>
> > Subject: [EXT] Re: [PATCH v4 1/2] dt-bindings: rtc: Add pcf85053 support
> >=20
> > On Tue, Sep 23, 2025 at 05:04:40PM +0530, Lakshay Piplani wrote:
> > > Add device tree bindings for NXP PCF85053 RTC chip.
> > >
> > > Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
> > > Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> > > ---
> > > V3 -> V4: Add dedicated nxp,pcf85053.yaml.
> > >           Remove entry from trivial-rtc.yaml.
> > > V2 -> V3: Moved MAINTAINERS file changes to the driver patch
> > > V1 -> V2: Handled dt-bindings by trivial-rtc.yaml
> > >
> > >  .../devicetree/bindings/rtc/nxp,pcf85053.yaml | 128
> > > ++++++++++++++++++
> > >  1 file changed, 128 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
> > > b/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
> > > new file mode 100644
> > > index 000000000000..6b1c97358486
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
> > > @@ -0,0 +1,128 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) # Copyright
> > > +2025 NXP %YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/rtc/nxp,pcf85053.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: NXP PCF85053 Real Time Clock
> > > +
> > > +maintainers:
> > > +  - Pankit Garg <pankit.garg@nxp.com>
> > > +  - Lakshay Piplani <lakshay.piplani@nxp.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - nxp,pcf85053
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  nxp,interface:
> > > +    $ref: /schemas/types.yaml#/definitions/string
> > > +    enum: [ primary, secondary ]
> > > +    description: |
> > > +      Identifies this host's logical role in a multi-host topology f=
or the
> > > +      PCF85053 RTC. The device exposes a "TWO" ownership bit in the =
CTRL
> > > +      register that gates which host may write time/alarm registers.
> > > +        - "primary": Designated host that *may* claim write ownershi=
p (set
> > > +          CTRL.TWO=3D1) **if** write-access is explicitly requested.
> > > +        - "secondary": Peer host that writes only when CTRL.TWO=3D0 =
(default).
> > > +
> > > +  nxp,write-access:
> > > +    type: boolean
> > > +    description: |
> > > +      Request the driver to claim write ownership at probe time by s=
etting
> > > +      CTRL.TWO=3D1. This property is only valid when nxp,interface=
=3D"primary".
> > > +      The driver will not modify any other CTRL bits (HF/DM/etc.) an=
d will
> > not
> > > +      clear any status/interrupt flags at probe.
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - nxp,interface
> > > +
> > > +additionalProperties: false
> > > +
> > > +# Schema constraints matching driver:
> > > +# 1) If nxp,write-access is present, nxp,interface must be "primary".
> > > +#    Rationale: only the primary may claim ownership; driver will set
> > TWO=3D1.
> > > +# 2) If nxp,interface is "secondary", nxp,write-access must not be p=
resent.
> > > +#    Rationale: secondary never claims ownership and cannot write
> > CTRL/ST/alarm.
> > > +#
> > > +# Practical effect:
> > > +# - Primary without 'nxp,write-access'; primary is read only; second=
ary
> > may
> > > +#   write time registers.
> > > +# - Primary with 'nxp,write-access'; primary owns writes, secondary =
is read
> > only.
> > > +allOf:
> > > +  - $ref: rtc.yaml#
> > > +  - oneOf:
> > > +      # Case 1: primary with write-access
> > > +      - required: [ "nxp,write-access" ]
> > > +        properties:
> > > +          nxp,interface:
> > > +            const: primary
> > > +
> > > +      # Case 2: primary without write-access
> > > +      - properties:
> > > +          nxp,interface:
> > > +            const: primary
> > > +        not:
> > > +          required: [ "nxp,write-access" ]
> >=20
> > Aren't case 1 and case 2 here redundant? All you need to do is block in=
terface
> > =3D=3D secondary when nxp,write-access is present, which your case
> > 3 should be able to be modified to do via
> >=20
> > if:
> >   properties:
> >     nxp,interface:
> >       const: secondary
> > then:
> >   properties:
> >    nxp,write-access: false
> >=20
> > I think your description for nxp,write-access gets the point across abo=
ut when
> > it can be used, and the additional commentary is not really helpful.
> >=20
> Thanks for reviewing the patch.
>=20
> We kept both cases: primary with write-access and primary without write-a=
ccess, because the hardware=20
> supports three different ways it can be used, and we want to show that cl=
early in the bindings:
> =20
> Primary with nxp,write-access: primary host can write to the device.
> Primary without nxp,write-access - primary host is read-only, and the sec=
ondary host can write.
> Secondary - default role, with write access; when no primary host is clai=
ming it.
> =20
> Even though both case 1 and 2 use nxp,interface =3D "primary", they behav=
e differently.
> Keeping both cases separate makes it easier to understand whether Primary=
 host can write or not.

Just explain it properly in the property description, creating
if/then/else stuff with additional commentary like this makes it more,
rather than less, confusing.

>=20
> > > +
> > > +      # Case 3: secondary (must not have write-access)
> > > +      - properties:
> > > +          nxp,interface:
> > > +            const: secondary
> > > +        not:
> > > +          required: [ "nxp,write-access" ]
> > > +
> > > +examples:
> > > +  # Single host example.
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +    i2c {
> > > +      #address-cells =3D <1>;
> > > +      #size-cells =3D <0>;
> > > +
> > > +      rtc@6f {
> > > +        compatible =3D "nxp,pcf85053";
> > > +        reg =3D <0x6f>;
> > > +        nxp,interface =3D "primary";
> > > +        nxp,write-access;
> > > +        interrupt-parent =3D <&gpio2>;
> > > +        interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> > > +      };
> > > +    };
> > > +
> > > +  # Dual-host example: one primary that claims writes; one secondary=
 that
> > never claims writes.
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +    i2c0 {
> > > +      #address-cells =3D <1>;
> > > +      #size-cells =3D <0>;
> > > +
> > > +      rtc@6f {
> > > +        compatible =3D "nxp,pcf85053";
> > > +        reg =3D <0x6f>;
> > > +        nxp,interface =3D "primary";
> > > +        nxp,write-access;
> > > +        interrupt-parent =3D <&gpio2>;
> > > +        interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> > > +      };
> > > +    };
> > > +
> > > +    i2c1 {
> > > +      #address-cells =3D <1>;
> > > +      #size-cells =3D <0>;
> > > +
> > > +      rtc@6f {
> > > +        compatible =3D "nxp,pcf85053";
> > > +        reg =3D <0x6f>;
> > > +        nxp,interface =3D "secondary";
> >=20
> > Maybe a silly question, but if you have a system that wants to have two=
 pairs
> > of RTCs, how would you determine which primary a secondary belongs to? I
> > notice you have no link between these devices in dt so I am curious. Wo=
uld it
> > be better to eschew nxp,interface and have a phandle from the secondary=
 to
> > the primary?
> >=20
> > I don't know anything about your use case or features, so maybe knowing=
 the
> > relationship just is not relevant at all, or it can be determined at ru=
ntime.
>=20
> This device can connect to two independent hosts via separate I=B2C buses=
=2E=20
> Each host sees the same hardware instance through its own I=B2C address. =
The nxp,interface
> property simply declares the host's role, so the driver knows whether to =
attempt write
> access or not.

That doesn't really answer what I was looking for. Is knowing the
relationships either unimportant or determinable at runtime?

--uFXH1ifJjfs5WzZx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOfqEgAKCRB4tDGHoIJi
0mjNAQDq8Pdw76mfMNfCTNPxMpI1vwvookQyG3ccXWw3hOVD2AEAukE2ldBTq/hc
1jUjb99ZcKKPdr3Qq4xCklgsCua24gE=
=qeTP
-----END PGP SIGNATURE-----

--uFXH1ifJjfs5WzZx--

