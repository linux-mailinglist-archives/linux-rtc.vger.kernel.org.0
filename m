Return-Path: <linux-rtc+bounces-6725-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OOKOHUtJOmpl5QcAu9opvQ
	(envelope-from <linux-rtc+bounces-6725-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jun 2026 10:52:27 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3946B56E0
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jun 2026 10:52:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dr3CyVo9;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6725-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6725-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51E033045C86
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jun 2026 08:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F263CF1E0;
	Tue, 23 Jun 2026 08:51:39 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55F9340A52;
	Tue, 23 Jun 2026 08:51:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204699; cv=none; b=fvJYuzqXoIGJZLJWR37x5uvC/vUBqHQ2eluHt1qhOLz8Vx53gtSVYNhCt7Lm/CryfceDmKZaDZfAwVzFHBerY7rWep4n2ttBUs/mvJ2dD+hcPUj4h7XbBtZX/yO6/koTJYojHPr2dfswtq8R4/JbSN5lkdHXQpLuRiPi4XqGlMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204699; c=relaxed/simple;
	bh=zx6wkNEXy7nabLL5CN63qNZLUh17QaT/I/QukUuwlLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGQ8co/T5nCOLrNm4q1lJTUPKTFzRvuVirUZ0bBB+XZiYqGJy37lW0Hv930ovuekNOr5/OaCXQD1U7lgEJErAO8a5b6foCmAWyg+H3EMrzm4ICQZqIC2c1PMPDuC7uBeN4BLA/YF07EfiRLGosApUkeQpqiIVZP4aMqRtZ3saI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dr3CyVo9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C89B1F000E9;
	Tue, 23 Jun 2026 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782204698;
	bh=4gysAP1S+0hzuOBim35EG8H2R8ov/qExOI6IXgApNZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dr3CyVo9ouL9dLX/ZDOwZ2VhneLHcFdlzqrZ1e4a1sK6gxdq+rXJPjh3FGEwjhBw/
	 798fAAVVrAFuE5tEZqVlo03qf088GLr3fK7HcQYsMYgjXJHU2ofiiTCm/2e1iWIAbL
	 jpZoR3wA6bO03+mJHDBS54TgrLyslxij7rXmeRLnw4ZSxqUY6yxFgTLta6qTHKWyLH
	 zt41nbp15pqbFPiCTyo+SFx8E3Z5XqvUvQ6ppN1vNoGtcDHvfA+wqNU+sDEe9JlC+W
	 ridoUO7qyWlVMdv9ayeS9QzXecYhbwWyrEbtrht3DJ/qfUam96M7ZvLmR7jjCCrcuV
	 cxI9xDRkxngpQ==
Date: Tue, 23 Jun 2026 10:51:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: microchip,pic32mzda-wdt: Convert
 to DT schema
Message-ID: <20260623-small-roaring-bullfinch-b20baa@quoll>
References: <20260620172354.155565-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260620172354.155565-1-challauday369@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6725-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:challauday369@gmail.com,m:tsbogend@alpha.franken.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,quoll:mid,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E3946B56E0

On Sat, Jun 20, 2026 at 10:53:54PM +0530, Udaya Kiran Challa wrote:
> +    watchdog@1f800800 {
> +        compatible = "microchip,pic32mzda-wdt";
> +        reg = <0x1f800800 0x200>;
> +        clocks = <&rootclk REF2CLK>;
> +       };

Indentaion needs fixing.

With that:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


