Return-Path: <linux-rtc+bounces-6224-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCLhA4UpuGlsZwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6224-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 17:02:13 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1514E29CF15
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 17:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 039B0301C8F2
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 16:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CAE3264DF;
	Mon, 16 Mar 2026 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="atadA64d"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0DE8248B;
	Mon, 16 Mar 2026 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676897; cv=none; b=uacrvc7dOIGX2i00UVfUQNIAeDJFBr0V6xQonJECg1REs2Q68WDc8qwuzZaCnDYhi4R2MXrsr3IllSlhIFqmHxzG1F1/G21PorCaMp/hZUw7FqbfiksGHgWRQI0FhdWLlYcsYEOQTfIVcHk1ZGAxfbosnmUk6eqngTWz2rbiXRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676897; c=relaxed/simple;
	bh=U7Vh2jIYFDPJ9+O/TNXJqPPkRJNejMkjL1llAicJQE0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lpvCVuQKuIH5ue3jXKJyaZjzVRDj9J4aTyvYVDBDaAb18acrQorWZZF3UKGWYhiaZjEMA/Mul7hQx7kidznRkCppi1iQvPIjjp8KLFUa5W1Uyo0AUNo9iebbc9YafGC5CHZIlku3dAsRH5PuKcFOPePolB61wvD+b5zvL7baPvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=atadA64d; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=dWWCo/O+pQjJJIUXRtm/J1Y1RBo9QKqpObu24MQlaGY=; b=atadA64dERkEQZdp6W+nmGUH/Z
	1D1lTQNh+oGmNntAdmswXaRHPGoum+O4ecFDk/RgR/KGMb14rHewPnxKCQJqB8kcOHL8W9Qz7ykZO
	Yk+WZQHBCd8+4sLEjhWF0klaRSCrbyJmXKzMG+jD1maBSr5aK0fgorZ5iFVVe1KTvqVEk+4tAr4bu
	+vOR/WdNAw31pw6MxJmQARISl1KSmdbDMmndrVXdTRsognlNrzdrKz7aEpngN+1asv6S7j1AdVbVu
	N35t8xgOudCsgtEHu9fm3mb9wf/4PPiT3Ghaetes9LDPdQ3wusvoJXQ1HsvGXMOH3MsTCBelKTqBy
	uP1kw4aA==;
Date: Mon, 16 Mar 2026 17:00:34 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mark Brown <broonie@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Ulf Hansson
 <ulf.hansson@linaro.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>, Saenz Julienne <nsaenz@kernel.org>, Lee
 Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Shree
 Ramamoorthy <s-ramamoorthy@ti.com>, Jerome Neanne
 <jerome.neanne@baylibre.com>, Paul Cercueil <paul@crapouillou.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Dmitry Osipenko
 <digetx@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Joseph Chen
 <chenjh@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, Zhang Qing
 <zhangqing@rock-chips.com>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?=
 <j.neuschaefer@gmx.net>, Lubomir Rintel <lkundrak@v3.sk>, Julien Panis
 <jpanis@baylibre.com>, Matti Vaittinen <mazziesaccount@gmail.com>,
 Alexander Kurz <akurz@blala.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 00/15] Convert power-controller to dt-schema and update
 various yaml file to referencing it
Message-ID: <20260316170034.31bee485@kemnade.info>
In-Reply-To: <f329f1b4-787e-4c8c-ba26-e419a047023b@sirena.org.uk>
References: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
	<f329f1b4-787e-4c8c-ba26-e419a047023b@sirena.org.uk>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kemnade.info,none];
	R_DKIM_ALLOW(-0.20)[kemnade.info:s=20220719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6224-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FREEMAIL_CC(0.00)[oss.nxp.com,kernel.org,linaro.org,broadcom.com,gmail.com,ti.com,baylibre.com,crapouillou.net,bootlin.com,sntech.de,rock-chips.com,collabora.com,gmx.net,v3.sk,blala.de,vger.kernel.org,lists.infradead.org,nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@kemnade.info,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kemnade.info:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,kemnade.info:dkim,kemnade.info:mid]
X-Rspamd-Queue-Id: 1514E29CF15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 16 Mar 2026 14:55:21 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Mon, Mar 16, 2026 at 10:47:35PM +0800, Peng Fan (OSS) wrote:
> > Convert power-controller.txt to dt-schema
> > Update various dt-bindings to use generic power-controller.yaml without
> > defining local property.  
> 
> Are there any dependencies here?  It doesn't look like it.  In general
> please don't send a single series covering multiple subsystems unless
> there are actual dependencies, it just makes it harder to figure out how
> to handle things.  Send a separate series to each subsystem instead.

It seems that everything depends on Patch 1.

Regards,
Andreas

