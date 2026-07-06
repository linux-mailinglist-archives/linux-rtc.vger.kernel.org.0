Return-Path: <linux-rtc+bounces-6946-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kl24FNLwS2qEdQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6946-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:15:46 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3997145F1
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:15:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="PsPJA/kJ";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6946-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6946-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0AB8308FBC3
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 17:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24717414A18;
	Mon,  6 Jul 2026 17:58:48 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058EA31CA4E;
	Mon,  6 Jul 2026 17:58:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360728; cv=none; b=DTdUPotWJfMQbGUX9wNmwvz389RCiaJa576vBs5TEIsFURr3MrZBLClL6w+3C2eoiIj4JLNciG/Tenkz9pK0GqBY6l8qcdwXx7bP3VhfcYASZPWFraNgIlvWO7NC/ec8gmqF+eVpK3Ij2dR+lo4s36Xps5ykWqrhpR/0TR3Prw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360728; c=relaxed/simple;
	bh=+QNYWOwLzSisrGfPptUUz5tYb1gffbFIB+9Ed+1UpiE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G+9SOemlSscsgHWNdJX+ZmODcX/3KC9dSw+mAaE/AWYDyig/LIp+jC/CZvJBETC15oaVEed0v1NKnhuO2HLSFBzRs93dVdFjqxzm+f/cICY2KsoPygN2t6XMxh+lrGa994+ck5AtHWtUv8hY8rUaXAUTngYU7+Hl8hONKdMdTko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsPJA/kJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7964C1F000E9;
	Mon,  6 Jul 2026 17:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360726;
	bh=k6Aw+gFjaAU3z/n2LrEx1uR/UmC+dfOeVr236BcZI0w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PsPJA/kJ4GvsxvrNxbcJZcnvpGlixN4Nh1mpjOxCbljQvUAG55iUz0IdubNnI0Ah8
	 aOKYKKJ9gZhXqitr5v+SCU5reVXAQBK1zc9x8SQbvjJx7RQKgsqgtOnw6UPv2b7KNl
	 v8u+U4QTQcfMjvQKugiLONrF09dU6FZrYM4/9wf2vTJFHpElceR04xtMPG8oh5P5WT
	 8IBLTDoUE3vE1ZX2lZ3OGv+ozPxCYa9YWnq2ik0xweBBA+p35zEnlxwmdHaIbohmmb
	 hWRpsjkb3qXJGR5qeNp66W7SlfHlG5t692m3WwAFbuXwImy3B1x9oTDOlEnqg1oKQj
	 e10z9vS6z2aRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H
 and RZ/N2H support
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: conor+dt@kernel.org, linux-rtc@vger.kernel.org, wsa+renesas@sang-engineering.com, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706175138.12587-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175138.12587-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 17:58:46 +0000
Message-Id: <20260706175846.7964C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-6946-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:conor+dt@kernel.org,m:linux-rtc@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:prabhakarcsengg@gmail.com,m:conor@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,renesas.com:email,sashiko.dev:url,smtp.kernel.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F3997145F1

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The RZ/T2H RTC variant adds a 1Hz clock output capability but th=
e binding schema fails to document and require the `#clock-cells` property.
--

commit 521c08a40b8b1ac0b30dec5219ca0271639457ef
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and RZ/N2H support

This commit adds compatible strings for the RTC block found on the Renesas
RZ/T2H and RZ/N2H SoCs. It also updates the binding schema to require the
additional clock inputs used by these variants.

> diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml =
b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> --- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
[ ... ]
> @@ -54,6 +58,23 @@ required:
>    - clock-names
>    - power-domains
> =20
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a09g077-rtc
> +              - renesas,r9a09g087-rtc
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2

[Severity: Medium]
The commit message mentions that the RZ/T2H RTC variant supports a 1Hz clock
output signal on the RTCAT1HZ pin. Since this introduces a clock provider
capability, shouldn't the #clock-cells property be documented and required
here with an appropriate const constraint?

Without documenting this property, adding #clock-cells to an RTC node using
the renesas,r9a09g077-rtc compatible string will cause device trees to fail
dt_binding_check validation due to the unevaluatedProperties: false constra=
int.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706175138.1258=
7-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1

