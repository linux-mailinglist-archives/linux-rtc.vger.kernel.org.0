Return-Path: <linux-rtc+bounces-6848-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Uu8TJThLRWrg+AoAu9opvQ
	(envelope-from <linux-rtc+bounces-6848-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 19:15:36 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C286F0415
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 19:15:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=posteo.de header.s=2017 header.b=ZXVNBLCW;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6848-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6848-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=posteo.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB412301BCFA
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 17:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432D3386C1C;
	Wed,  1 Jul 2026 17:09:03 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849C63793CE
	for <linux-rtc@vger.kernel.org>; Wed,  1 Jul 2026 17:09:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925743; cv=none; b=AJ9aJ0z9+RVms1R3Pi9m0b8IqEx75hcr50lJGsOkv/c/ry+r3R6ei/XkxRY6uDGkPJG3efj5WhAJdIVGIE9dDmQR9124vOkFQTAaICkszq8UFHw7sdgE7lqs7CJTsFd9bpa+a5I14JSwSfhxOqEV+VzOyyWGibTsI/WT3jqTWPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925743; c=relaxed/simple;
	bh=KeqIksPkf1S9u6PJ/z83GgnBLHjifhdxyoIseGrykwg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=StGr8maYz+QdAy9zZjpP3umt2W47uiFID0S5POMqPZ05ovy5AIZSFQ0eCPSS/gXU37ht4mIUhTxo8jOMDV0zSARPn7FoDrpr31lZ5MY4nYiswz1YokP65F8eB+OYMkipQ7CHsMzZxZ3oZ+jm2CAsk7dCtcLGdVQ+Z81Ge5OH87I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=ZXVNBLCW; arc=none smtp.client-ip=185.67.36.66
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id AA83E240104
	for <linux-rtc@vger.kernel.org>; Wed,  1 Jul 2026 19:08:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1782925739; bh=4PWNFl6ZQByziaVhB18vyfYMIONrw43O1wXv6AV4AJI=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=ZXVNBLCWMy3t4/CaP7U0StQrTQ62R+/4rkV7cwtzwQ+lgmZtB5CPrDUhZ+4WEGRTH
	 e/RieupFb5+zExVdJuJeIIBsEk89/vNgdhaah/7dgMQnUOU7auAXpyU78wTlOYgh9a
	 cY3MZrhKyXmq112N9m5ZCSKyYksWGKMKyXBHQQAPF7iFGcHw0QKng0LJcjXxQASGSv
	 wOGPeiEYr1RbTFhejDTYQh7nv3TRMVLw5AUxGnZ/xqjxrzonCzpRvQ3JymFjUqqny5
	 kw3B57GteqYwL6cC7SpSiauRRhaqUub2TnbYiNmCkNq/td+9l+NROGnwxYnIbgTnjB
	 qeVohwwEwg3zQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gr61P69jzz9rxM;
	Wed,  1 Jul 2026 19:08:57 +0200 (CEST)
Message-ID: <74b32ed0a700e3900c0f34d730b2b5b69eb2ca19.camel@posteo.de>
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add sii,wakealarm-output-pin
 property for S35390A
From: Markus Probst <markus.probst@posteo.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?=
	 <uwe@kleine-koenig.org>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
	 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
	 <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 01 Jul 2026 17:08:59 +0000
In-Reply-To: <20260701164821b7492eac@mail.local>
References: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
	 <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
	 <20260701-bronze-jaguar-of-perfection-028bac@quoll>
	 <45e8157be53c3d8827fcccece7f706968bc056d3.camel@posteo.de>
	 <7de66163-369e-4118-af51-6913b565fa4b@kernel.org>
	 <d06dd0726aa3795ae99df5fa8a9c05d6e2001efd.camel@posteo.de>
	 <20260701164821b7492eac@mail.local>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-QMgkZ3jnmlt4sJFDDbT9"
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
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,kleine-koenig.org,lunn.ch,bootlin.com,gmail.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6848-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[markus.probst@posteo.de,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:uwe@kleine-koenig.org,m:andrew@lunn.ch,m:gregory.clement@bootlin.com,m:sebastian.hesselbarth@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:sebastianhesselbarth@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4C286F0415


--=-QMgkZ3jnmlt4sJFDDbT9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-07-01 at 18:48 +0200, Alexandre Belloni wrote:
> On 01/07/2026 16:43:07+0000, Markus Probst wrote:
> > On Wed, 2026-07-01 at 17:14 +0200, Krzysztof Kozlowski wrote:
> > > On 01/07/2026 15:25, Markus Probst wrote:
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > > >=20
> > > > > This should be someone caring about this hardware.
> > > > He does have the majority of commits on this driver (excluding merg=
e
> > > > commits and commits not exclusive to this driver), although most of
> > > > them are pretty tiny.
> > > >=20
> > > > Who would you suggest instead?
> > >=20
> > > Someone adding features for this driver, maybe driver maintainers. Bu=
t
> > > if Alexandre is fine, you can leave him.
> > >=20
> > > > >=20
> > > > > > +
> > > > > > +description:
> > > > > > +  The S-35390A is a CMOS 2-wire real-time clock IC which opera=
tes with the
> > > > > > +  very low current consumption in the wide range of operation =
voltage.
> > > > > > +
> > > > > > +allOf:
> > > > > > +  - $ref: rtc.yaml#
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    const: sii,s35390a
> > > > > > +
> > > > > > +  reg:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  sii,wakealarm-output-pin:
> > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > +    enum: [1, 2]
> > > > > > +    description: |
> > > > > > +      The output pin to wake up the system.
> > > > > > +      Default will use the output pin for interrupt signal 2.
> > > > > > +        <S35390A_OUTPUT_PIN_INT1> : Output pin for interrupt s=
ignal 1
> > > > > > +        <S35390A_OUTPUT_PIN_INT2> : Output pin for interrupt s=
ignal 2
> > > > >=20
> > > > > Does that mean device generates the interrupts?
> > > > Yes.
> > > >=20
> > >=20
> > >=20
> > > Then I think you miss interrupts property.
> > From what I can tell the line is used to generate a system wakeup
> > event.
> >=20
> > There would be no obvious benefit of connecting it to an interrupt
> > controller, so this property would be obsolete?
> >=20
>=20
> Then you need proper wakeup-source support
Wouldn't that break existing devicetrees?

The current driver allows to wake up the system, even without
having=C2=A0wakeup-source set.

As an example: arch/arm/boot/dts/marvell/kirkwood-ts219.dtsi

Thanks
- Markus Probst

>=20
>=20

--=-QMgkZ3jnmlt4sJFDDbT9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmpFSaEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSq/oQAI/3MjA8ZT7kUcnfTCD3
U1Usgjef9N4VmZAXdwcBaCBCNeZMz877e4BDi/Hmuelpwd+xdKJfnhmBz2mtYf0Z
MJdICoVnztQlRWs0eS79ZwuyWNKjI/p9OIfvSZHKOHUHMfs4FIo73TkQP8T1WYtW
g1Zs5nXDniGeVGPutSYQD6Ji/JTh7iY6wXr1oBf9p4ZH5ff0ibHz4hj+6ILt8RJO
3a1Pg/62AYUgs3WJHNJx52nudk0PmR0MCleiRWr0BQE+2PMAgl7m4Fxo0e23wejs
faAp2dDgu1KY4xHls+7WYLiulf+dBPYccURhTyinOPZep2yuXbO1kMT0H+Xtp7MA
I+y3pPIc7sjOEcYwiIv5n7PuRoW5Fcpcv0EDfCc9aDC8fcfPQj1LWUNatreJ38vt
ZOFntozKWWkr/pFgfGcQCJrwg2mW/5Ifp3rH0B0YKjPIAkeFIXkj+dKgMek7n02z
2wlBS/94T2BXBQlWP7vRv+g3++BIEFruIOAQKGHCi7Bw4UtS1qbhNDImBtlGeVtr
PxOm1lhzh5R8zFm2M/zGoaaU6xaXp387n7W+1BOnC+nJhL4Mwn2HkpD30AtDuWm5
XUu30EdMAj5rJnB9y70rbXXKG9S/ioLg6+OdZ+CwGIxM7dLVlZGthUX5sKR3IEx8
g2PP+n0rJOEfSblcwGqLnHVs
=MVyr
-----END PGP SIGNATURE-----

--=-QMgkZ3jnmlt4sJFDDbT9--

