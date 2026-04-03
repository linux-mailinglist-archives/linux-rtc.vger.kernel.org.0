Return-Path: <linux-rtc+bounces-6286-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA3bOHnUz2kQ1AYAu9opvQ
	(envelope-from <linux-rtc+bounces-6286-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 03 Apr 2026 16:53:45 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7D2395668
	for <lists+linux-rtc@lfdr.de>; Fri, 03 Apr 2026 16:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FB5E3015136
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Apr 2026 14:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0C13C5540;
	Fri,  3 Apr 2026 14:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TalprS8E"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4E73C554E;
	Fri,  3 Apr 2026 14:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228023; cv=none; b=XjS1i93e7E18Ux7XXS4zarLW/odur4Dyh2yz0IBaTH9v2TUCgdVtCRDrM3Y4J/ezlbweZzM2Gmyd+Itew8UIljMsKWpw9jqwxPRAeWDgXYkedyJwsjwg34yRa2FzJ/sHUNl+avZF8AmFzlY5Kw5CoIS8v1IAh0cJCtsUQgAYvSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228023; c=relaxed/simple;
	bh=ne70ucsZwaszEpPz21eEwyg9qhaY3KQE8B3fi/F6ero=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThZ9lWyjBH66O314NLTWE+EyENDbMEIHis5am2MwSfcNyPu+uFUWqTPnVAPj1+ajfq8dpoj1algLuzfPdkwZk/S6I/tADVJBDzW7Inp7beKTw/S5mBJTfbbtCIUQFEWJpZt1RlqczvA2AvvXoLIex+l6+HVZ9GeUbS3I56LRK40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TalprS8E; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0D54A1A3120;
	Fri,  3 Apr 2026 14:53:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D55D6603C1;
	Fri,  3 Apr 2026 14:53:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A26710450008;
	Fri,  3 Apr 2026 16:53:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775228016; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KWvfunppyIOvyGREm1xxzLD+klThqSaXmNASBIweIZU=;
	b=TalprS8EMCX1+Y62VESHZ3Ux69z+51F0COOk7t4e7pOL1qSxmTgSZNcJleEZfeDEcnuLsC
	z51ekYC2GVCVr2mauP3cMIkV1xHyInx8xQ0QVQp2Q/WpNdo6HwvfHy18SdKtIfNUraKHhq
	gf1AVqyci3T0QF868NZaFm9zYnvQk3Q2YeBP64kvOhIcijrsd/P2MpdJdcZMDlJPYmxKzT
	tiCEAyGtFyc6osXe6EBLDqqXstWqZlGmbLPjpUseS6/acAknGu1ZRXREDdwWQib1Bkf6zm
	i0mod5Vd6QmKekJFQ5B4bwzfEPuUhz2qbGB2afai+cQVH9LBqhK6qLQUB7wQoQ==
Date: Fri, 3 Apr 2026 16:53:28 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH v3 1/5] dt-bindings: rtc: sc2731: Add compatible
 for SC2730
Message-ID: <177522795589.1505278.15029729729753708134.b4-ty@b4>
References: <20260329-sc27xx-mfd-cells-v3-1-9158dee41f74@abscue.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260329-sc27xx-mfd-cells-v3-1-9158dee41f74@abscue.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6286-lists,linux-rtc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linux.alibaba.com,abscue.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:url]
X-Rspamd-Queue-Id: 9E7D2395668
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 29 Mar 2026 09:27:45 +0200, Otto Pflüger wrote:
> The RTC block found in the SC2730 PMIC is compatible with the one found
> in the SC2731 PMIC.

Applied, thanks!

[1/5] dt-bindings: rtc: sc2731: Add compatible for SC2730
      https://git.kernel.org/abelloni/c/b2b0dcaa28d2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

