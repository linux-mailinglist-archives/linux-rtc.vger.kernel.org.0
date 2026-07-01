Return-Path: <linux-rtc+bounces-6805-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sxr+A4PERGpW0goAu9opvQ
	(envelope-from <linux-rtc+bounces-6805-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 09:40:51 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2406EAC27
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 09:40:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=h6dXafSU;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6805-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6805-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B03EB312A97F
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 07:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08723BBFD6;
	Wed,  1 Jul 2026 07:35:29 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764543BB12A;
	Wed,  1 Jul 2026 07:35:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782891329; cv=none; b=G7ZN/Y4ypbXqNy/Xhj8ZTNo+IHgL4fHUzTppaZ7oUSPdtjx1YbtLKJtLY3VXZacnmOCeQhPXmqdpoQucf9GGvHUwVPuy+6u5XebtN8bgkKphc+5ceHVj8buKSRuPBE+8yuBFLjMA/wjR4iTaf7B3+F1Ji1qKc3Rpt/Iqh96IR9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782891329; c=relaxed/simple;
	bh=aZI7U+7BKjZ+n1K9QeKPUeY9SHGVXloJko2JcFomq+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KULmUvPXY8umYN11vTh6T0SPibXcrXsxX4tZd+hnQp6GM8A2yih65EYCY0d6I8IKrcm3bvCsje1n5KMNv10UGX1HsxFRhK4v0YqDovxVXYz2QFBH0NEIKE4cnsD55O61FKZlUj6Gd/mMNcLuMJ6VrY2tWo4dbP3LTeOTjIr/MMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6dXafSU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ACC11F00A3A;
	Wed,  1 Jul 2026 07:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782891326;
	bh=PWZJoeJoNohkFigQwsvNlPCMXb9v9+Knd2dj3qEQhCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h6dXafSUTFStFuOmQ9Hlh8cWTlu/uF8OU2bnz0hnFaE4kQ0BcAsdvY+1s6751nMc9
	 7LtVFV7eDmbyqrN2lxVQpefZsDQxlNjGB6RQI0aLNt+bxt7rHApl9XJRP/VLixDSpe
	 YpKdRW8XTGReHDQmywiVDtKebmgNtEh4pQpWw4edbxan8nx/2VBpEK+1VDc/RDgcMI
	 RuReQhGJRkXvorgYbnezB5fUr/vwb1CtZtEDQQq1d8R73SLaf1v2u98vb6C4sSWKEs
	 lqksyGJHJZDhQEOwurGU9/7VSZg0t9R2Qma7tWBg5A6qscjF3zRaKTeq49H1oHW75O
	 ppjneriYIgHpA==
Date: Wed, 1 Jul 2026 09:35:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add sii,wakealarm-output-pin
 property for S35390A
Message-ID: <20260701-bronze-jaguar-of-perfection-028bac@quoll>
References: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
 <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:uwe@kleine-koenig.org,m:andrew@lunn.ch,m:gregory.clement@bootlin.com,m:sebastian.hesselbarth@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:sebastianhesselbarth@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6805-lists,linux-rtc=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,kleine-koenig.org,lunn.ch,gmail.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,quoll:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,posteo.de:email,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C2406EAC27

On Tue, Jun 30, 2026 at 07:22:21PM +0000, Markus Probst wrote:
> Synology NAS devices use the output pin for interrupt signal 1 to wake up
> the system.
> 
> Move devicetree bindings for sii,s35390a into its own file.
> Add sii,wakealarm-output-pin property to enable the use of the output
> pin for interrupt signal 1 for the wake alarm, which makes it possible to
> set an wake alarm on Synology NAS devices.
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  .../devicetree/bindings/rtc/sii,s35390a.yaml       | 54 ++++++++++++++++++++++
>  .../devicetree/bindings/rtc/trivial-rtc.yaml       |  3 --
>  MAINTAINERS                                        |  1 +
>  include/dt-bindings/rtc/s35390a.h                  |  9 ++++
>  4 files changed, 64 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml b/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml
> new file mode 100644
> index 000000000000..31a578673870
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/sii,s35390a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: S-35390A 2-WIRE REAL-TIME CLOCK
> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>

This should be someone caring about this hardware.

> +
> +description:
> +  The S-35390A is a CMOS 2-wire real-time clock IC which operates with the
> +  very low current consumption in the wide range of operation voltage.
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    const: sii,s35390a
> +
> +  reg:
> +    maxItems: 1
> +
> +  sii,wakealarm-output-pin:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2]
> +    description: |
> +      The output pin to wake up the system.
> +      Default will use the output pin for interrupt signal 2.
> +        <S35390A_OUTPUT_PIN_INT1> : Output pin for interrupt signal 1
> +        <S35390A_OUTPUT_PIN_INT2> : Output pin for interrupt signal 2

Does that mean device generates the interrupts?

Best regards,
Krzysztof


