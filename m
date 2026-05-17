Return-Path: <linux-rtc+bounces-6535-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNbbLTO+CWqkngQAu9opvQ
	(envelope-from <linux-rtc+bounces-6535-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 17 May 2026 15:10:11 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 365635611B8
	for <lists+linux-rtc@lfdr.de>; Sun, 17 May 2026 15:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC34930067AD
	for <lists+linux-rtc@lfdr.de>; Sun, 17 May 2026 13:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5854C38CFFE;
	Sun, 17 May 2026 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="S38s4N/3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B29274B5F;
	Sun, 17 May 2026 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779023405; cv=none; b=AL3hYA7EPWqNmMm2sk64GSy1NhnZe3LustAGKqUu8u2g1zzVOMz6ROlWa7ntk8ABNyHMKjDCiCmLrA74lMON5K7J0QQ6NcWMOijOumYCQJbK48jttD2xWjukVj/Lu/z9rqH+7noLs08WLo12DSC33dcFlwWxaADvxyFgvY3B2Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779023405; c=relaxed/simple;
	bh=VmZO8wUns6Rzp7QhfWBpX9OW3ArS21uLigpWw23RVe0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=rqgnPmNUVunzPPD6m/WtJ4hmJwa4Qf1akVyMd6N/IQgRLPLnZC+imuSeSqhCwvKO2yG3+LrGSpXJM3OFvChkH3ZfFW+sT3JFTLKQDPal1rZtuevrLZdSiRkFQd4HW+f4XVF+WAehgkjGnVDW6gao6t18YlPIcOB7csX+pwSWDO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=S38s4N/3; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AF548270F3;
	Sun, 17 May 2026 15:09:52 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iz7bdltAi84y; Sun, 17 May 2026 15:09:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1779023391; bh=VmZO8wUns6Rzp7QhfWBpX9OW3ArS21uLigpWw23RVe0=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To;
	b=S38s4N/3j/FiziIop4tsq8NahUewcH98fRM7YKQifUrAWbDncqY8LWkCTRCMS9UkI
	 rpGjuV6ZjZ+5DJWl++KMcRG114tis08jxDUBOVxqqZIdy2IKEDddBiaxZM0uCadrE7
	 HPVpyotSRXNTvouCqX51foNX17f8gXA65NemsiKM5MWGWMwfdX/5r6KGZI9kk1MTK1
	 VR7w6C9N28B6bCaOnhSuCguWzs2BP+cJLTDNuiidp99hi4+UZpWzFj18L/O+cF+AkJ
	 fWeCm2tIA9IFEEe8y7mK14ZjZsvR7kPTwr2vREd/jjvesnMF66Tt2ICMHbcLOFr9sw
	 iLIx2voOesDAw==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 17 May 2026 18:39:37 +0530
Message-Id: <DIKZ5L2HC2CV.YL3MZUJQ2EV6@disroot.org>
To: "Conor Dooley" <conor@kernel.org>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "MyungJoo Ham"
 <myungjoo.ham@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Sebastian Reichel" <sre@kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Nam Tran" <trannamatk@gmail.com>,
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>,
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v6 03/11] dt-bindings: mfd: add documentation for
 S2MU005 PMIC
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
References: <20260515-s2mu005-pmic-v6-0-1979106992d4@disroot.org>
 <20260515-s2mu005-pmic-v6-3-1979106992d4@disroot.org>
 <20260515-justly-recite-6028f4bfb24a@spud>
 <DIJK5FTQ5KWG.HOKZAOXHTGU7@disroot.org>
 <20260516-esquire-chitchat-0fffa597e2f3@spud>
In-Reply-To: <20260516-esquire-chitchat-0fffa597e2f3@spud>
X-Rspamd-Queue-Id: 365635611B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6535-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[disroot.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,disroot.org:email,disroot.org:mid,disroot.org:dkim]
X-Rspamd-Action: no action

On 2026-05-16 23:25 +01:00, Conor Dooley wrote:
> On Sat, May 16, 2026 at 02:41:29AM +0530, Kaustabh Chakraborty wrote:
>> On 2026-05-15 18:14 +01:00, Conor Dooley wrote:
>> > On Fri, May 15, 2026 at 04:08:59PM +0530, Kaustabh Chakraborty wrote:
>> >> Samsung's S2MU005 PMIC includes subdevices for a charger, an MUIC (Mi=
cro
>> >> USB Interface Controller), and flash and RGB LED controllers.
>> >>=20
>> >> Add the compatible and documentation for the S2MU005 PMIC. Also, add =
an
>> >> example for nodes for supported sub-devices, i.e. MUIC, flash LEDs, a=
nd
>> >> RGB LEDs. Charger sub-device uses the node of the parent.
>> >>=20
>> >> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> >> ---
>> >>  .../bindings/mfd/samsung,s2mu005-pmic.yaml         | 120 +++++++++++=
++++++++++
>> >>  1 file changed, 120 insertions(+)
>> >>=20
>> >> diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pm=
ic.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
>> >> new file mode 100644
>> >> index 0000000000000..0e6afb7d2017b
>> >> --- /dev/null
>> >> +++ b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
>> >> @@ -0,0 +1,120 @@
>> >> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> >> +%YAML 1.2
>> >> +---
>> >> +$id: http://devicetree.org/schemas/mfd/samsung,s2mu005-pmic.yaml#
>> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> >> +
>> >> +title: Samsung S2MU005 Power Management IC
>> >> +
>> >> +maintainers:
>> >> +  - Kaustabh Chakraborty <kauschluss@disroot.org>
>> >> +
>> >> +description: |
>> >> +  The S2MU005 is a companion power management IC which includes subd=
evices for
>> >> +  a charger controller, an MUIC (Micro USB Interface Controller), an=
d flash and
>> >> +  RGB LED controllers.
>> >> +
>> >> +allOf:
>> >> +  - $ref: /schemas/power/supply/power-supply.yaml#
>> >> +
>> >> +properties:
>> >> +  compatible:
>> >> +    const: samsung,s2mu005-pmic
>> >> +
>> >> +  flash:
>> >> +    $ref: /schemas/leds/samsung,s2mu005-flash.yaml
>> >> +    description:
>> >> +      Child node describing flash LEDs.
>> >> +
>> >> +  interrupts:
>> >> +    maxItems: 1
>> >> +
>> >> +  muic:
>> >> +    $ref: /schemas/extcon/samsung,s2mu005-muic.yaml#
>> >> +    description:
>> >> +      Child node describing MUIC device.
>> >> +
>> >> +  multi-led:
>> >> +    type: object
>> >> +
>> >> +    allOf:
>> >> +      - $ref: /schemas/leds/leds-class-multicolor.yaml#
>> >
>> > Does this need to be an allOf when the other refs are not?
>>=20
>> It has it's own properties, that's the reason. This used to be it's own
>> thing in dt-bindings/leds, but I was asked to move it here in prior
>> reviews.
>
> What do you mean by "its own properties"?

I mean, the other schemas (muic, flash) are in their own file, with
compatible, and other properties too.

This one, inherits properties from leds-class-multicolor, AND has a
"compatible" property with it, which is not defined in
leds-class-multicolor. Now if you ask why does the compatible exist,
that's something Krzysztof suggested in previous revisions.

And, Krzysztof had also reviewed this patch, and (similar to the prev
patch) I've missed the trailers, which have been addressed in v7 now.

>>=20
>> >> +
>> >> +    properties:
>> >> +      compatible:
>> >> +        const: samsung,s2mu005-rgb
>> >> +
>> >> +    required:
>> >> +      - compatible
>> >> +
>> >> +    unevaluatedProperties: false
>> >> +
>> >> +  reg:
>> >> +    maxItems: 1
>> >
>> > Move this above the child nodes please.
>>=20
>> But properties are sorted in lex order?
>
> Typically the binding is sorted in the same order as properties go in
> nodes. Common stuff like reg/clocks/interrupts therefore send up above
> child nodes.

So, do I change this? For one, I don't see the same being followed in
other schemas of samsung in the same dir (not that I'm trying to pose it
as an argument against your suggestion), and this was reviewed by
Krzysztof and is adderssed in v7.

