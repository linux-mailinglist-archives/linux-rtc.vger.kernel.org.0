Return-Path: <linux-rtc+bounces-5919-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UP40DsA7fWkpRAIAu9opvQ
	(envelope-from <linux-rtc+bounces-5919-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 00:16:16 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C92BF562
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Jan 2026 00:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BE5A3005A86
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Jan 2026 23:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16ABC36827A;
	Fri, 30 Jan 2026 23:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BYuIaqhf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7A530F55E
	for <linux-rtc@vger.kernel.org>; Fri, 30 Jan 2026 23:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769814972; cv=none; b=I+rsAtRtrrNOLzvW+bbPgodpId6szDhFNYTeLYKlgtgNW6bh0lPwG7zk6/B3k8w8MtfSRULC0HNb3PCGu5FAWm5aaTwDBmWbx+6subBnlw/5YtSnhmfSar8LmK2N9PDyP2UQ+GAo5ghiyz3zCgiijaKCclIVlMDO3sadls6LhOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769814972; c=relaxed/simple;
	bh=CAbY1gnMT0plgUZ2DE5GC7jxp8aLZzGqzpE6qqOefpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZnwm2xiwOCS8gtD64uUz7VmqRqTXP09XeZMlvkNTrldr8Y7EgjHlHVd8mZtuSzsp4FDMFL9ycjKsz6BN0xc2QTajcaRF8PMt+4Ard1G0bC7zWTpPHCBgW+VCGWLv2twmW+GrH4NjDOiBhaMY44FYHF5vZbZMfs1KNvQ786WnAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BYuIaqhf; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 502F01A2B4A;
	Fri, 30 Jan 2026 23:16:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 219FA6075A;
	Fri, 30 Jan 2026 23:16:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 986EF119A88BC;
	Sat, 31 Jan 2026 00:16:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769814969; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Me5t3oMpBIRHDRfRlViZ2cqwz0+5i9feSrjR1VEupBU=;
	b=BYuIaqhfydpI0kaoVlioVKLRFM4+8kGH6/typH1N3YXxEnqT8jphm3G7b1HoyfYlmnXJDc
	G5keo34nRPb6SwNmvu0iofnRgCFCvC+bCPeCZlEcFys/gwFveTSEmoJLnRqpTcmr5IoXGM
	O+aHkPUDUjL7q7TLrPXL/jLkNPWQEVz+vybUvhvJmE69OOLWl83aXDyGCvfWf9H8y2z3qS
	QIcpQe0aYnOdghg+qKTdpNSipLDo7vRhW+7uM/yTo8YEOUUGKDFBj4cj4c6rgUXduRxXKp
	NeAA8m6xkZhctsDAXHrtDSJVvAlZ6ux3Zy8se2u6eBfmFCgxeTp3B2kO6qC7lw==
Date: Sat, 31 Jan 2026 00:16:05 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH v3 0/3] RTC: Add Loongson-2K0300 support
Message-ID: <176981478048.2227007.7038485759891970167.b4-ty@bootlin.com>
References: <cover.1768616276.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1768616276.git.zhoubinbin@loongson.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5919-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org,loongson.cn];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[loongson.cn,kernel.org,xen0n.name,lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:url,bootlin.com:mid]
X-Rspamd-Queue-Id: D1C92BF562
X-Rspamd-Action: no action

On Sat, 17 Jan 2026 10:26:47 +0800, Binbin Zhou wrote:
> This patch set introduces the Loongson-2K0300 RTC, which has a similar
> hardware design to the Loongson-1B, but without the alarm feature.
> 
> Thanks.
> Binbin
> 
> ==========
> V3:
> - Add Reviewed-by tag from Huacai, thanks.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: rtc: loongson: Correct Loongson-1C interrupts property
      https://git.kernel.org/abelloni/c/da9934a6583a
[2/3] dt-bindings: rtc: loongson: Document Loongson-2K0300 compatible
      https://git.kernel.org/abelloni/c/5d4899d4859f
[3/3] rtc: loongson: Add Loongson-2K0300 support
      https://git.kernel.org/abelloni/c/770a54accf80

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

