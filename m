Return-Path: <linux-rtc+bounces-6799-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PGSwKJUZRGoZogoAu9opvQ
	(envelope-from <linux-rtc+bounces-6799-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 21:31:33 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0EE6E797D
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 21:31:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=V6wBAcSx;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6799-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6799-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73B333009B12
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 19:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0740344CF37;
	Tue, 30 Jun 2026 19:30:33 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E299A202F71;
	Tue, 30 Jun 2026 19:30:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782847832; cv=none; b=bB+4ihwdYhnrlrU3s1FiXMJhXMfUleKuWieovxrDnjzmub+qIqVxaeSSfqp67aG6aP6n4UqPXbMFCZ2Fn5UQR8VKGEzWp6tcJ8EgEfOPiajyOcdI9qNk7YxveeHEG1tMjVsXcgcbk+iGjb/H+zRXAhriPDvqI+lxk+XSZZhU6Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782847832; c=relaxed/simple;
	bh=pVwxjc4k12YI/GvQufu+3Nu5mliK1CVmuGrEGYCs7lI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ecbHgXKYX2mUNnL+NJi/OKzksCmiPTSPgUvg3yBhMTYWx6rYAIyAZETqiC47rgFhDfzhWXrwU6mLJ07BaTWfXrFR/NbQG+SXUFuLu27UsJJn8aq8EUitjy+8C/pw3ckIfznell5G5Bxf3VrkuDyRAwgrh55dcTjztO4fYikdl8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6wBAcSx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471AB1F00A3A;
	Tue, 30 Jun 2026 19:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782847831;
	bh=APVqnV/9U1mbZyK4JxBintbbRuaK/ninax4qiLIaDaM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V6wBAcSxMjCcQUTpV0+1RF78g7e0dRSINMd/QmYE39/6yWWNhzRZD0bGiRTmzXsmQ
	 rha7rcG0/vLdScyJil9M7LS4dUtnFi8IqWtg4HROorYZtTeeYr/8fu3x062PhPW7jq
	 6HJ/mNDzh8J3iWVvUqpcRFQn0rPOCq2NTNwQcT4r77LVr4kaNa0iapFXq0OA2zK3ED
	 B1foSSlWjissIAePqgCiVfgtCmc+VuMO4qgWfx7Zv4bnX6wc+youiMe+f0cSS6+w7/
	 YfLBcKIePvgWLW4tQELwdX81HtFbcYx77fgEv55tMrz1Swvy/VsmXl+WEzQLW6JyPe
	 7h0SvAjr8xTFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add sii,wakealarm-output-pin
 property for S35390A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
References: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
 <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 19:30:30 +0000
Message-Id: <20260630193031.471AB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-6799-lists,linux-rtc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,lists.linux.dev:replyto,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sashiko.dev:url,smtp.kernel.org:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:alexandre.belloni@bootlin.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B0EE6E797D

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly extracted `sii,s35390a.yaml` binding omits the `interrupt=
s` property definition, causing device trees that wire the RTC's interrupt =
to fail schema validation.
--

commit da1782a5913222ef5662be378a08ff2b2b0c13fa
Author: Markus Probst <markus.probst@posteo.de>

dt-bindings: rtc: Add sii,wakealarm-output-pin property for S35390A

Synology NAS devices use the output pin for interrupt signal 1 to wake up
the system. This commit moves the devicetree bindings for sii,s35390a into
its own file and adds the sii,wakealarm-output-pin property to configure
the alarm.

> diff --git a/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml b/Doc=
umentation/devicetree/bindings/rtc/sii,s35390a.yaml
> new file mode 100644
> index 0000000000000..31a5786738700
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml
[ ... ]
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    const: sii,s35390a
> +
> +  reg:
> +    maxItems: 1

[Severity: Low]
Does moving this binding out of trivial-rtc.yaml and setting
unevaluatedProperties to false without defining the interrupts property
break schema validation for existing device trees?

Previously, the interrupts property was allowed when the compatible string
resided in trivial-rtc.yaml. Without an interrupts property definition here,
device trees that wire the RTC's interrupt will fail dt_binding_check.

Should the interrupts property be explicitly added to this properties block?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-rtc_s35390=
a_int1-v1-0-1b2239e16be2@posteo.de?part=3D1

