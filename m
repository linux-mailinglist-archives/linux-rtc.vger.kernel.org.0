Return-Path: <linux-rtc+bounces-1870-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE7696B68E
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Sep 2024 11:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6951C285D24
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Sep 2024 09:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649251CF5DC;
	Wed,  4 Sep 2024 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Q8FF0q3T"
X-Original-To: linux-rtc@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B631CDA0A;
	Wed,  4 Sep 2024 09:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725441908; cv=none; b=GFZ6OWYpSmMxxkwbaG04VMaJ9VYs47OBUfxLnDR1qbZVX+3UuKcJQrBchiCYG0wJIyXnMFQr4A3UMD2cGoGW13C7jh12cZRhayTZI+9egcDIAx920j/U9FxNpGxrlTC9dHzjERFFNhb0KxmgFk2Ts+yhEaU7UzLGTTSaAkfWFLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725441908; c=relaxed/simple;
	bh=xKWQ04VFPvAAt7omya/i1jZhJAiunLJS81ofGulNJFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AhKCfv71bWDsfWalJ+B/imLJKGOIwIPXsCFPOQK7xxc7aoJFnYnjbZFKrdfkreWYx3vpbgaPFtiEhDz/5agl0vmZKKcSqktwMF4poXUyC+9IBwe+p+GKrKkococvbR5ReVt2MoQ98F+XzhAVJHfwDp2tjexpJpktyYfXIRfAI4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Q8FF0q3T; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=23vxBjkpGpq9LNmrKHPd6qsEoTUnSRILY6cL7IaACKI=; b=Q8FF0q3TdSMGURQ0RxaNpfgSUd
	c6+fo7jwy1pUpN6tuk0mM8yZCZr4WGjRVlZZlSzApFuKDjbOMXCsDqoJsralJ39xvo9NFbkIV2WzG
	JZY/J15D5N6bKEwmWccVTRq1Q62sbPhRgzkzgdNoFe+wCWrzk1lNezNUc9ls+eHZ0Wfx2dH6UjE+o
	OI0HEE4wkF8GAkaBLFtg3fBptm9pQbadFZ3Q3duU/lXd9anrEcLae0AhVgh/5nRlxEDNYQE9swgM+
	ouVqeoMm0YSGxKZ+E/pgY4YPhNoSpQrL4ZyQQ+gollfqWr7fBl/V5YCir8llwTE0L0VPjtaCZHmDy
	TWEvdVQQ==;
Received: from i5e860d0f.versanet.de ([94.134.13.15] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1slmG4-0006q3-GI; Wed, 04 Sep 2024 11:25:00 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: conor+dt@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	Karthikeyan Krishnasamy <karthikeyan@linumiz.com>,
	alexandre.belloni@bootlin.com
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/8] Add support Relfor Saib board which is based on Rockchip RV1109 SoC
Date: Wed,  4 Sep 2024 11:24:58 +0200
Message-ID: <172544170317.2587256.1675013741817340842.b4-ty@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903105245.715899-1-karthikeyan@linumiz.com>
References: <20240903105245.715899-1-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 3 Sep 2024 16:22:37 +0530, Karthikeyan Krishnasamy wrote:
> Rockchip RV1109 is compatible with Rockchip RV1126.
> In this series, adding required missing peripheral in
> RV1126 and its pin mux.
> 
> Relfor Saib board is equipped with 1GB of RAM and 4GB of eMMC
> Pheripherals like Bluetooth 4.2, Wifi 5G, audio-codec,
> ir transmitter and receiver, etc
> 
> [...]

Applied, thanks!

[1/8] ARM: dts: rockchip: Add i2c3 node for RV1126
      commit: 15db79e0bdcb883f0d7a678fe8701a270467a339
[2/8] ARM: dts: rockchip: Add i2s0 node for RV1126
      commit: 212cda94739b1644e38ef4f588bb580c12feb9a7
[3/8] ARM: dts: rockchip: Add pwm node for RV1126
      commit: 898eb75f443eaf6cb46facf52fc337fbdbdca079


This means I applied a part of your series and you don't need to
resubmit the patches mentioned above in a next submission.


I re-sorted some properties and nodes according the alphabetical
sorting we use. Please see 

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/dts-coding-style.rst

for the details.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

