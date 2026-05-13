Return-Path: <linux-rtc+bounces-6496-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA/nGFS8BGrmNQIAu9opvQ
	(envelope-from <linux-rtc+bounces-6496-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 13 May 2026 20:00:52 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7A5387EF
	for <lists+linux-rtc@lfdr.de>; Wed, 13 May 2026 20:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE1EE30005A1
	for <lists+linux-rtc@lfdr.de>; Wed, 13 May 2026 17:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6291C4E376A;
	Wed, 13 May 2026 17:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlC3tomm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5240A4DD6C8;
	Wed, 13 May 2026 17:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778694992; cv=none; b=qfSbDMN+U3Ih0cQKRBu+QFFrqeXzwXHUTrTg5y2m6i3liI2VKRUf5itajOpE2V9e22i2txlD/8kypE3zCXlK05q5puJ1Twzy5+DkbUlJFTC9IlSmUk2WQutsj2qJHas6jwQywjem0oPE9nOcfDEhWzD0kFXvQWJjFEt6qW7yggw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778694992; c=relaxed/simple;
	bh=R9lC2749pYg3wxcS/LuhtOmsNwsluS2P+2LMmHtrIR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kIYbVfeaPJwG9qFuoS2DmpI3z/CRjR3U5rqE6v+jnnsPTh55mDzFNaflXxaYJjxPKvTjJAn0j/rcUbJ0hNB4hDFZ1otpZH3QyTGjxwc4OC9DoCQGsHzdwC4DrREEQDNoF/uKtpv8dbapahVqXIoGmTk6D0+zYXLBq8WEBy6FVP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlC3tomm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0E0C19425;
	Wed, 13 May 2026 17:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778694991;
	bh=R9lC2749pYg3wxcS/LuhtOmsNwsluS2P+2LMmHtrIR8=;
	h=From:To:Cc:Subject:Date:From;
	b=UlC3tommUgk81x0Vz8nrqtYtM4ybnYofCqYJtBQsZeexEqJGaUFagb63Mnw/vWeGt
	 8u3FLGRtZv/5jlmh5wtEPfZNk0uu/EQpgaNaniYd9K6hQWoKbssO/7+oDYm1CQTiP/
	 IMSFx61clUQX0f3ciqykpAi9nADakFW/+8skkg0YGWRcVXOWiEpd+uKMQqfDQDTk7x
	 Y6gmb7/aPvFhX6q2Oc1rb/WsQGOehKMqRr1kMXCwggJwbVdgPt2N3zo+KD0hekXUMB
	 JzjnYEWaP+DTs9mMv7nE9WyH4/28jfkPUxftMPxoa+GK13ywBMNIr0eWlQ4XDu4bsx
	 XJrWO9benvIpw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	stable@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] rtc: mpfs: fix counter upload completion condition
Date: Wed, 13 May 2026 18:55:55 +0100
Message-ID: <20260513-panhandle-ashy-70c6abf84d59@spud>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=iFFJRLWAlC3iNYSd01SHBiZHfPiSVbTpLx9DxnbFIe8=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFksu7VnrLR5eyTIO+zdkgeqk5U3v5rbMH1bzeXfa+39d v2JYNkb31HKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJsMQw/BXSvV5VH6rmJp+S n2A6lSu3o/idyu4te/n7/KfxiQW2JDMyTFnvYXohcvGtqYYLmW9rnubvrjBxLcy09BGO5lkruOA yIwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 59A7A5387EF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6496-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Action: no action

From: Conor Dooley <conor.dooley@microchip.com>

The condition that needs to be checked for upload completion is the
UPLOAD bit in the completion register going low. The original iterations
of this driver used a do-while and this was converted to a
read_poll_timeout() during upstreaming without the condition being
inverted as it should have been.

I suspect that this went unnoticed until now because a) the first read
was done when the bit was still set, immediately completing the
read_poll_timeout() and b) because the RTC doesn't hold time when power
is removed from the SoC reducing its utility (I for one keep it
disabled). If my first suspicion was true when the driver was
upstreamed, it's not true any longer though, hence the detection of the
problem.

Fixes: 0b31d703598dc ("rtc: Add driver for Microchip PolarFire SoC")
CC: stable@vger.kernel.org
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Valentina.FernandezAlanis@microchip.com
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: linux-riscv@lists.infradead.org
CC: linux-rtc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/rtc/rtc-mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
index 6aa3eae575d2a..ece6de4a6adbd 100644
--- a/drivers/rtc/rtc-mpfs.c
+++ b/drivers/rtc/rtc-mpfs.c
@@ -112,7 +112,7 @@ static int mpfs_rtc_settime(struct device *dev, struct rtc_time *tm)
 	ctrl |= CONTROL_UPLOAD_BIT;
 	writel(ctrl, rtcdev->base + CONTROL_REG);
 
-	ret = read_poll_timeout(readl, prog, prog & CONTROL_UPLOAD_BIT, 0, UPLOAD_TIMEOUT_US,
+	ret = read_poll_timeout(readl, prog, !(prog & CONTROL_UPLOAD_BIT), 0, UPLOAD_TIMEOUT_US,
 				false, rtcdev->base + CONTROL_REG);
 	if (ret) {
 		dev_err(dev, "timed out uploading time to rtc");
-- 
2.53.0


