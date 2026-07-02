Return-Path: <linux-rtc+bounces-6878-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bDzWIABnRmosSwsAu9opvQ
	(envelope-from <linux-rtc+bounces-6878-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 15:26:24 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E03EA6F8533
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 15:26:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kyB1Hces;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6878-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6878-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF9BB308174F
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 13:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38974A2E3D;
	Thu,  2 Jul 2026 13:23:45 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14084A2E34
	for <linux-rtc@vger.kernel.org>; Thu,  2 Jul 2026 13:23:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782998625; cv=none; b=eQutotDtSy2wOSfESW/aCVtfdv9QT1XwIEVTudkiZewPCfw7rOKfPfiAx4q6ff0tokMnUlv/5JBRnDbV1kCaaJgQOfdplcBW6IhaWHEakR5hz8+Y78oxyEHsIzScc+K8oK1YZu5dhTY+cT+NhOarlkOglAOm1sUmhXGn9N2Qomo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782998625; c=relaxed/simple;
	bh=Ftfht9dESKSAPnwFSJWWBdA4NbYVeXe2TbeMTZhp/yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ME1NFVDIwWSuIN3NI4ekMXtB8gfkAkQbHwxrl9jkUVxXEDXr0djy9mX6BI/GU8IF+rUaA9UNbJ3K8V65Cmy/t5s+Orv83G7+UvnCl0oEVv6Qmr4HBKaDe61I4gv1hBr7l1ttPWYPW2SQLmb1dFUS1jA2mZvy/dlTi+VswGumZSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kyB1Hces; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D621F00ACF
	for <linux-rtc@vger.kernel.org>; Thu,  2 Jul 2026 13:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782998624;
	bh=Ftfht9dESKSAPnwFSJWWBdA4NbYVeXe2TbeMTZhp/yw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=kyB1Hces0wWh7ITVH83tofR1cvz9azT2RIgKhMZiUHOLi76dxMGG4pz4f4qxpNFFl
	 YW+ZD1uKlxOMP03k5feVx2bhrvLpKyiPOl3rkc6UXDAGAmZ8AKsVtnS96fvY+ZeKq3
	 9BBZnsysjR5jMg8Vxsr/LsUJ0mkMwOTFsqN60/IB0ELV95lgjUAfrytOd60+Ubhl97
	 axTfYyy6qBtwXCaxQKpIIIcFlytA7UJhzTfo0xVlYDFFoo6HxiKR2rgfOXj+HODlE7
	 SnVjsX0vfhO99nYiUtak/RjJCwtQxjmaYcpnCU8Wq0VoFU+VaLpDW7Z8ZI41yqfXqS
	 SMkdtLYVGmo8w==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39b1eb7bd9bso17416731fa.2
        for <linux-rtc@vger.kernel.org>; Thu, 02 Jul 2026 06:23:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoXbZUKSRQiUmasaa98c/YCVr/0udOSr0NylTDW/1qBu+JU4r2KAIPsL1h2g4r+OyABQS05s4+sRrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzglkKRa2MbneJYy2PCQfKRLuTYp7UirmtAkoUIkOJAjCRtxoYX
	9UoofcwwU72LL3sZaxeI0g1/N1sZ+ZEMWUJTKhaETLbNjwWWUMILO6B22jstc3OyOlSpf1u+RIX
	qfLuU40b/cOEE78zESwIigWiK5Mw0Qr8=
X-Received: by 2002:a2e:ad13:0:b0:393:a31a:ab3c with SMTP id
 38308e7fff4ca-39b34044d9cmr12431061fa.25.1782998622933; Thu, 02 Jul 2026
 06:23:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com> <20260702-a733-rtc-v3-1-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-1-eb2580374de6@baylibre.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 2 Jul 2026 21:23:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v66YUmQNwRG_WtL_2NQTOyLFQD8=q0bZ+Gs_-aKQ4FhsDg@mail.gmail.com>
X-Gm-Features: AVVi8CdgR5HOst5qEMn_2lQsiwLdv5IzTcHwmWkZLAYWxm6nynDQErb8y43I3bQ
Message-ID: <CAGb2v66YUmQNwRG_WtL_2NQTOyLFQD8=q0bZ+Gs_-aKQ4FhsDg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: rtc: sun6i: no clock-output-names on h616/r329
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6878-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pigmoral.tech,bootlin.com,kernel.org,gmail.com,sholland.org,baylibre.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:jbrunet@baylibre.com,m:junhui.liu@pigmoral.tech,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mripard@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:sashiko-bot@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wens@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-rtc@vger.kernel.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[wens@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E03EA6F8533

On Thu, Jul 2, 2026 at 4:10=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> On h616 and r329 chips, clock output names are never defined through DT a=
nd
> are not meant to be. Just disallow the property for those chips.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: http://lore.kernel.org/r/20260629125305.0DF981F000E9@smtp.kernel.=
org
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

