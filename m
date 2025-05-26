Return-Path: <linux-rtc+bounces-4158-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CA8AC3D7D
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 11:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 074517A7BD2
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 09:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48431F4261;
	Mon, 26 May 2025 09:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MtyMRMuu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A891F3BB5
	for <linux-rtc@vger.kernel.org>; Mon, 26 May 2025 09:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748253506; cv=none; b=ckwDwr0eMrw+sWIbdcn/jnyb16Bwn62z9/u8sRQSQ+U/4rfwNNNKJcrMhKnzrEhOeDqI5kGipwWdlgMqOmPb9J+t/JZVh5JK4TdtlRqSDuZnE165eRl82yK7Tk/8U0EDrCVxXPTnlMbGgovtDFRUuQMvVbTbmAJvzDTaTlMTmhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748253506; c=relaxed/simple;
	bh=w/UcW3ffnJcbXkGUdIlDCTcs2usQzbw7huy5QIj0wAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AezzxDLxMMHr9mSVvrYgmB7QALo+IlLJGHMinTqZkWTn5G0CYeTk4ICYoQRKxwS2xsLoNblsfN4M2fmp0OrTwehfyxAEkJ9DKeaWz3m7dj2Q49Zic2T3DzIc2ROJ2mtqFw2MlJR9jtVQ/qZDvzhqrIz19rDsymXHpGwXMqYJMTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MtyMRMuu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=nXISK4vFAiaTLe
	P1I8MCwM1JGpgTWZUIP25+lB5Ykdg=; b=MtyMRMuuTEDeVy5zf6V52uRv5L1q5J
	KyBZWSyMJ7sAQQUwjjNtqNDuasEvCJBylgD4sdFHwEqfk+DHqy5FSQ5F8QNEKuYk
	BvkuIPM7UVxBn8WjgJtLuERLDPB4UHwpTIJR3foVGYipEoFBRlEMkJpW4cThT8Pi
	0IyDOfxjsq3kmwbuqL2GN4s9vE8Y3E46wgeKVFHtfu1YK2WtcP2gz+GgIZAQHUu1
	6kR82HDUyUg14KOhOFy/xL4sHnHAlm7qBY8mW9fb/iTUSd1Lq5Bh0rjXPMZVHR2N
	3RowPa+w6XkJeMtS5ejghgzL0aslwLv89lnUeTua4hEWdGFc4xT/v74g==
Received: (qmail 769142 invoked from network); 26 May 2025 11:58:16 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 May 2025 11:58:16 +0200
X-UD-Smtp-Session: l3s3148p1@kuiX/AY2RkhtKPCv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-rtc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 0/3] rtc: rzn1: support XTAL clk and SCMP method
Date: Mon, 26 May 2025 11:58:01 +0200
Message-ID: <20250526095801.35781-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far, the code and the binding for the RZ/N1D RTC assumed an input
clock of 32768Hz, so it was not explicitly described. It makes sense to
do this, though. For one reason, clocks with other frequencies might be
used. This RTC supports that via the SCMP counting method. The other
reason is, upcoming SoCs may have only the SCMP method described, so we
need to use it there later.

This series lets the driver handle the optional "xtal" clock and switch
to the SCMP method if suitable. It has been tested on a Renesas RZ/N1D
board with hacked devicetree values.

A branch with updated DTs can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/n1d/enablement

Looking forward to comments!

Changes since v2:
* don't modify the rtc_ops struct, but have two distinct ones which can
  now be const again (Thanks Miquel, I like it better, too)
* added tag from Miquel (Thanks again)


Wolfram Sang (3):
  dt-bindings: rtc: rzn1: add optional second clock
  rtc: rzn1: Disable controller before initialization
  rtc: rzn1: support input frequencies other than 32768Hz

 .../bindings/rtc/renesas,rzn1-rtc.yaml        |  8 ++-
 drivers/rtc/rtc-rzn1.c                        | 66 +++++++++++++++----
 2 files changed, 61 insertions(+), 13 deletions(-)

-- 
2.47.2


