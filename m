Return-Path: <linux-rtc+bounces-6849-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id laaTHdhPRWrC+QoAu9opvQ
	(envelope-from <linux-rtc+bounces-6849-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 19:35:20 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9FA6F062D
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 19:35:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=posteo.de header.s=2017 header.b=jLZaxhpB;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6849-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6849-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=posteo.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BC69300BD8C
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 17:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE54495517;
	Wed,  1 Jul 2026 17:34:39 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D09257824
	for <linux-rtc@vger.kernel.org>; Wed,  1 Jul 2026 17:34:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782927279; cv=none; b=Ok1CVDsH+TURqIm9gvajk9eCqS28tEcNoe6A1T4p65UAexlz6kYMyepwP7PD1g77718nuzl4VUoInYvkhgrLH/VcKb6nFfHQlJB6XWPF/ZNecrMrgKbMpmGY/tvBCeptqgmJfWqBPjrvrWaOB18vm5YA3zMVca/vRKydac7UNso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782927279; c=relaxed/simple;
	bh=eHGNBE2w8Y2zj+A2WcojaLqI1MnU7Rum4rNO8bnYQno=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jyfsUtM0za7MWRYCgEfvuMeRMGzWv2cJ2gqsqVuIweIZlPahxOpVHY0Kv9aqkZqAq3JBtqnjwklHf35h0aXaz2UKW6CCMQKoZ5zt0pkLUzvN3TMr0dCiaEP8np9pqLMmCrKtc7GZkPBhYbmv9Rdz55ozkoUE/76f18+F4zSb8Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=jLZaxhpB; arc=none smtp.client-ip=185.67.36.66
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 9C247240105
	for <linux-rtc@vger.kernel.org>; Wed,  1 Jul 2026 19:34:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1782927275; bh=sFnduIEfzTelI/qGOJcaAiSoi1cQ4sBh6Iidu4lwHVM=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=jLZaxhpBkB2C+nX53mkmVQQ1cLHk2n0MumxeYnYmF45PSydMvivtn3flsJuJ8yFAA
	 GVu/LP8uQy62Zy+fJQ60lM20kgiB7pxCmw3AqgSo3asDRS7s86j/XOOnoprqU+OQQE
	 2Xai7dCch2NHSHy+LW2sJODVuZJCFm6SIpe7NFjbAV6ilMhLH1466ytYGrTQa3DP+Q
	 X2KcFfPvx/PR1QQ2uzOMvmgbs+caVAhTZtqZCA6jFq/gFC7wRJxaezvFKw/Vfc0Vtz
	 bVWbd2rL9pUXWNIJlJDGNVBoiZAwbI6H+vUmc3F4gsdMip+vQPd3F8zIxtWnGZSsTZ
	 G0ZR7lXyVbbfw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gr6Zy27LVz9rxD;
	Wed,  1 Jul 2026 19:34:34 +0200 (CEST)
Message-ID: <c2b910e58bc523f2cb83df28400a675385ef65d2.camel@posteo.de>
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add sii,wakealarm-output-pin
 property for S35390A
From: Markus Probst <markus.probst@posteo.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <uwe@kleine-koenig.org>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth	
 <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 01 Jul 2026 17:34:35 +0000
In-Reply-To: <202607011506045358209c@mail.local>
References: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
	 <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
	 <202607011506045358209c@mail.local>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-/2u+iIun9SPxCmVGLVKh"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,kleine-koenig.org,lunn.ch,bootlin.com,gmail.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6849-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[markus.probst@posteo.de,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:uwe@kleine-koenig.org,m:andrew@lunn.ch,m:gregory.clement@bootlin.com,m:sebastian.hesselbarth@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:sebastianhesselbarth@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,posteo.de:dkim,posteo.de:email,posteo.de:mid,posteo.de:from_mime,bootlin.com:email,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB9FA6F062D


--=-/2u+iIun9SPxCmVGLVKh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-07-01 at 17:06 +0200, Alexandre Belloni wrote:
> On 30/06/2026 19:22:21+0000, Markus Probst wrote:
> > Synology NAS devices use the output pin for interrupt signal 1 to wake =
up
> > the system.
> >=20
> > Move devicetree bindings for sii,s35390a into its own file.
> > Add sii,wakealarm-output-pin property to enable the use of the output
> > pin for interrupt signal 1 for the wake alarm, which makes it possible =
to
> > set an wake alarm on Synology NAS devices.
> >=20
> > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > ---
> >  .../devicetree/bindings/rtc/sii,s35390a.yaml       | 54 ++++++++++++++=
++++++++
> >  .../devicetree/bindings/rtc/trivial-rtc.yaml       |  3 --
> >  MAINTAINERS                                        |  1 +
> >  include/dt-bindings/rtc/s35390a.h                  |  9 ++++
> >  4 files changed, 64 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml b/D=
ocumentation/devicetree/bindings/rtc/sii,s35390a.yaml
> > new file mode 100644
> > index 000000000000..31a578673870
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml
> > @@ -0,0 +1,54 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/rtc/sii,s35390a.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: S-35390A 2-WIRE REAL-TIME CLOCK
> > +
> > +maintainers:
> > +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> > +
> > +description:
> > +  The S-35390A is a CMOS 2-wire real-time clock IC which operates with=
 the
> > +  very low current consumption in the wide range of operation voltage.
> > +
> > +allOf:
> > +  - $ref: rtc.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: sii,s35390a
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  sii,wakealarm-output-pin:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [1, 2]
> > +    description: |
> > +      The output pin to wake up the system.
> > +      Default will use the output pin for interrupt signal 2.
> > +        <S35390A_OUTPUT_PIN_INT1> : Output pin for interrupt signal 1
> > +        <S35390A_OUTPUT_PIN_INT2> : Output pin for interrupt signal 2
> > +
>=20
> Ideally, we'd get a proper pinctrl driver part for this because what
> happens if you want interrupts on both pin or clock output on both pins
> or any combination of interrupts and clocks?
>=20
Yes.

Thanks
- Markus Probst




--=-/2u+iIun9SPxCmVGLVKh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmpFT6IbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSS/EP/0InCbRWpPfmdYxplz+y
bKjJSHRM3BwQuvuXPYfYS5+tMDRqz4uvEY8hZg64argZ409I7EKKqqD7oX6Cczk2
kYW8fOI0Cskw8CqB299LPx0KwrI7iwW9tSoKK4NGOlYX11Cjq2OJSqnE2Ft+fpy7
Fz0ji9bvl3RAyUCamxbWJTRrdtIMiW2Y6PhHFBVoE4FWLIDBTkuV4MftrkUOWt2S
1o2jgOiOG1vqzOvg5INJOoDC5LoPagqqkBXxxTutMvz5qHJRUun7VXecZ2bVi7It
7cm9rTtv0iUNke5jTsLPzOAhk8GkPNlIK0Bt21eM/Q5Xfo3pyz5ATCo8+7l83SGe
5sEyB8jOYG4xTg1d55sndZZUG36z2Z+Jtfr8h+lT+P4q6oz2RMbeAeHeQZ8SgzSA
G0R1qtvysseC61tvLbnCd06VKPIilTVgyLMPR7jXwwu7QOieoJz2mM5HgWXyguoO
DnbifMSazYmqcIGm7oGiK06wYJ3/tG7j1kxQ2I2wEOr5wPzMkW5ehsR+t3tBDWXr
DdSW+iFL56mzzTy+Nq+tbOfw8UzWR4dYXIbE0Wg77Lv/570yYPPnomOA5SBrZzag
U+MfPCtxGLxADbH8hZPcF+KaqLg+tRW5a2BcLFI83gCuBlYUkGdlPLmA5OCqG6O3
WhhPPl0fGrF7P8YX0aIMahbw
=ITFG
-----END PGP SIGNATURE-----

--=-/2u+iIun9SPxCmVGLVKh--

